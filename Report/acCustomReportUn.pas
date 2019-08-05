unit acCustomReportUn;

interface

uses
  SysUtils, Classes, ppComm, ppRelatv, ppProd, ppClass, ppReport, DB,
  DBClient, osClientDataset, osComboFilter, FMTBcd, Provider, SQLMainData,
  osCustomDataSetProvider, osSQLDataSetProvider, SqlExpr, osSQLDataSet,
  ppModule, raCodMod, ppMemo, ppVar, ppBands, ppStrtch, ppSubRpt, ppCtrls,
  ppPrnabl, ppCache, ppDB, ppDBPipe, ppTypes, Forms, ppViewr, daSQl,
  daDataModule, daQueryDataView, TypInfo, Printers, osSQLQuery,
  ppPDFDevice, ppPrintr, ppParameter, ppArchiv, System.Zlib;

type
  TTipoAdendo = (taWHERE, taORDER);

  TConfigImpressao = record
    nomeImpressora: string;
    preview: boolean;
    orientation: integer; //1=retrato 2=paisagem
    larguraPapel: double;
    alturaPapel: double;
    margemSuperior: double;
    margemInferior: double;
    margemEsquerda: double;
    margemDireita: double;
    tipoSaida: string;
  end;

  TAdendo = record
    tipo: TTipoAdendo;
    Pipeline: String;
    sentenca: String;
  end;



  TAdendos = class
    private
      items: array of TAdendo;
    public
      procedure add(tipo: TTipoAdendo; Pipeline: String; sentenca: String);
      function find(tipo: TTipoAdendo; pipeline: String): string;
      procedure clear;
  end;

  TReportFormat = (rfAcrobat, rfArchive, rfBitmap, rfMetafile, rfExcel,
                   rfGIF, rfHTML, rfJPEG, rfPrinter, rfReportText, rfRTF,
                   rfText, rfWindowsMetafile, rfXHTML, rfPDF, rfPDFStream);

  TacCustomReport = class(TDataModule)
    FilterDatasource: TDataSource;
    FilterDataset: TosClientDataset;
    Report: TppReport;
    procedure DataModuleCreate(Sender: TObject);
    procedure ReportPreviewFormCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  protected
    FPrintToFile: boolean;
    FTextFileName: string;
    FDeviceType: string;

    FForcePrintWithoutDialog: Boolean;
    FForcePreview: Boolean;

    FPDFStream: TMemoryStream;
    FPDFDevice: TppPDFDevice;
    FPrintToStream: Boolean;
  private
    function replaceId(str: string; id: integer): string;
    function getPaperName(printerName: String): String;

    procedure setForcePrintWithoutDialog(Value: Boolean);
    procedure setForcePreview(Value: Boolean);
  protected
    beforePrint: TNotifyEvent;
    adendos: TAdendos;

    function getTemplate(id: integer; stream: TMemoryStream;
      var config: TConfigImpressao): boolean; virtual;
    procedure linkEvents; virtual;
    function casosEspeciais(valorOriginal: string): string; virtual;
    procedure ajustarAdendos; virtual;
    function replaceParamId(str: string; id: integer): string; virtual;
  public
    RecursoOrigem: String;
    procedure replaceReportSQLAddWhere(report: TppReport;
      template: TMemoryStream; id:integer);
    property forcePrintWithoutDialog: Boolean read FForcePrintWithoutDialog
      write setForcePrintWithoutDialog;
    property forcePreview: Boolean read FForcePreview write setForcePreview;
    property PDFStream: TMemoryStream read FPDFStream write FPDFStream;
    property PrintToStream: Boolean read FPrintToStream write FPrintToStream;
    procedure Print(const PID: integer); overload; virtual;
    procedure Print(PID, reportId: integer); overload; virtual;
    function getPipeline(name: String): TppDataPipeline;
    function findComponentUserName(name: String): TComponent;
    procedure SetOutputFile(FileName: string; Format: TReportFormat = rfPrinter);
  end;

  TReportClass = class of TacCustomReport;

var
  acCustomReport: TacCustomReport;

const
  TSTela = 'T';
  TSPDF = 'P';
  TSTexto = 'X';


implementation

uses acCustomSQLMainDataUn, osReportUtils, acCustomRelatorioDataUn, Dialogs,
  acCustomParametroSistemaDataUn, osErrorHandler;

{$R *.dfm}

procedure TacCustomReport.linkEvents;
begin
//
end;

procedure TacCustomReport.Print(PID, reportId: integer);
begin
  Print(PID);
end;

{-------------------------------------------------------------------------
ESTE MÉTODO PRECISA URGENTE DE UMA REFACTORING TOTAL
- para piorar esta lógica está duplicada em: TImprimirRelatorioForm.ImprimirRelatorioComFiltro
    não é bem duplicada, mas com certeza podemos juntar boa parte da lógica
--------------------------------------------------------------------------}
procedure TacCustomReport.Print(const PID: integer);
var
  stream: TMemoryStream;
  idTemplate: integer;
  updateContadorImpressao : TosSQLQuery;
  encontrou: boolean;
  showCancelDialog: boolean;
  config: TConfigImpressao;
  extensao: string;
  nomePapel: string;
begin
  //armazenar configurações do report para restaurar depois
  showCancelDialog := report.ShowCancelDialog;

  config.orientation := -1;
  config.larguraPapel := -1;
  config.alturaPapel := -1;
  config.margemSuperior := -1;
  config.margemInferior := -1;
  config.margemEsquerda := -1;
  config.margemDireita := -1;
  config.tipoSaida := TSTela;
  beforePrint := Report.BeforePrint;
  stream := TMemoryStream.Create;
  config.preview := true;
  try
    encontrou := false;
    if acCustomRelatorioData.isChangeable(ClassName) then
    begin
      idTemplate := acCustomRelatorioData.getTemplateConfigForUser(ClassName, config);
      if idTemplate <> -1 then
      begin
        if getTemplateByID(idTemplate, stream) then
          if stream.Size<>0 then
          begin
            encontrou := true;
          end;
      end;
    end;
    //chance da classe buscar seu template
    if (not encontrou) and (self.RecursoOrigem = 'Aprovação Resultados') then
    begin
      encontrou := getTemplateLaudoRascunho(ClassName, stream, config);
      if acCustomParametroSistemaData <> nil then
        config.nomeImpressora := acCustomParametroSistemaData.getNomeImpressoraClasse('LASER');
    end;
    if not(encontrou) then
    begin
      encontrou := getTemplate(PID, stream, config);
    end;
    if not(encontrou) then
    begin
      getTemplateByName(ClassName, stream);
      if acCustomParametroSistemaData <> nil then
        config.nomeImpressora := acCustomParametroSistemaData.getNomeImpressoraClasse('LASER');
      if stream.size<>0 then
        encontrou := true;
    end;
    if encontrou then
    begin
      ajustarAdendos;
      replaceReportSQLAddWhere(report, stream, PID);
    end
    else
    begin
      HError.Clear;
      HError.Add('Relatório não encontrado ou parametrizado');
      HError.Check;
    end;

    if config.tipoSaida <> TSTela then
    begin
      if config.tipoSaida = TSPDF then extensao := 'pdf';
      if config.tipoSaida = TSTexto then extensao := 'txt';
      if FTextFileName = '' then

      if not PromptForFileName(FTextFileName, '*.' + extensao, extensao, '', '', true) then
        Exit;

      if config.tipoSaida = TSPDF then
        SetOutputFile(FTextFileName, rfAcrobat);

      if config.tipoSaida = TSTexto then
        SetOutputFile(FTextFileName, rfText);
    end;

    report.BeforePrint := beforePrint;
    linkEvents;

    if (config.tipoSaida <> TSTexto) then
    begin
      if FPrintToFile then
      begin
        if FPDFDevice = nil then
        begin
          FPDFDevice := TppPDFDevice.Create(Self);
        end;
        FPDFDevice.FileName := FTextFileName;
        FPDFDevice.Publisher := Report.Publisher;
        Report.PDFSettings.UseJPEGCompression := False;
        FPDFDevice.PDFSettings := Report.PDFSettings;
      end
      else if FPrintToStream then
      begin
        if FPDFDevice = nil then
        begin
          FPDFDevice := TppPDFDevice.Create(Self);
        end;
        if FPDFStream <> nil then
        begin
          FreeAndNil(FPDFStream);
        end;
        FPDFStream := TMemoryStream.Create;

        FPDFDevice.PDFSettings := Report.PDFSettings;
        FPDFDevice.OutputStream := FPDFStream;
        FPDFDevice.Publisher := Report.Publisher;
      end
      else if (config.preview) then
      begin
        report.DeviceType := 'Screen';
      end
      else
      begin
        report.ShowPrintDialog := false;
        report.DeviceType := 'Printer';
      end;
    end;

    if not FPrintToFile then
    begin
      if config.nomeImpressora<>'' then
        report.PrinterSetup.PrinterName := config.nomeImpressora;
      if config.orientation = 1 then
        report.PrinterSetup.Orientation := poPortrait;
      if config.orientation = 2 then
        report.PrinterSetup.Orientation := poLandscape;
    end;

    Report.Units := utMillimeters;

    if config.nomeImpressora <> '' then
    begin
      nomePapel := getPaperName(config.nomeImpressora);
      if nomePapel <> '' then
        report.PrinterSetup.PaperName := nomePapel;
    end;
    if (config.alturaPapel <> -1) OR (config.larguraPapel <> -1) then
    begin
      if config.alturaPapel <> -1 then
        Report.PrinterSetup.PaperHeight := config.alturaPapel
      else
        Report.PrinterSetup.PaperHeight := Report.PrinterSetup.PaperHeight;
      if config.larguraPapel <> -1 then
        Report.PrinterSetup.PaperWidth := config.larguraPapel
      else
        Report.PrinterSetup.PaperWidth := Report.PrinterSetup.PaperWidth;
    end;
    if config.margemInferior <> -1 then
      Report.PrinterSetup.MarginBottom := config.margemInferior;
    if config.margemEsquerda <> -1 then
      Report.PrinterSetup.MarginLeft := config.margemEsquerda;
    if config.margemDireita <> -1 then
      Report.PrinterSetup.MarginRight := config.margemDireita;
    if config.margemSuperior <> -1 then
      Report.PrinterSetup.MarginTop := config.margemSuperior;

    //restaurar as configurações antes de imprimir
    report.ShowCancelDialog := showCancelDialog;

    if forcePrintWithoutDialog then
    begin
      report.ShowCancelDialog := false;
      report.ShowPrintDialog := false;
      report.DeviceType := 'Printer';
    end;

    if forcePreview then
    begin
      report.ShowCancelDialog := true;
      report.ShowPrintDialog := true;
      report.DeviceType := 'Screen';
    end;

    if (PrintToStream or FPrintToFile) and (config.tipoSaida <> TSTexto) then
    begin
      Report.InitializeParameters;
      Report.PrintToDevices;
    end
    else
      Report.Print;
    updateContadorImpressao := MainData.GetQuery;
    try
      updateContadorImpressao.SQL.Text := 'UPDATE rb_item '+
                              ' SET FREQUENCIAUSO = FREQUENCIAUSO+1, '+
                              ' DATAULTIMAIMPRESSAO = '
                              + QuotedStr(FormatDateTime('dd.mm.yyyy', MainData.GetServerDatetime)) +
                              ' WHERE ITEM_ID = ' + IntToStr(idTemplate);
      updateContadorImpressao.ExecSQL;
    finally
      acCustomSQLMainData.FreeQuery(updateContadorImpressao);
    end;
  finally
    FreeAndNil(stream);
  end;
end;

procedure TacCustomReport.DataModuleCreate(Sender: TObject);
begin
  adendos := TAdendos.Create;
  FPrintToFile := False;
  forcePrintWithoutDialog := false;
  forcePreview := false;
end;

function TacCustomReport.getPipeline(name: String): TppDataPipeline;
var
  lDataModule: TdaDataModule;
  liIndex, i: Integer;
  lDataView: TdaDataView;
  nomePipeline: String;
begin
  lDataModule := daGetDataModule(Report.MainReport);

  if (lDataModule <> nil) then
  begin
    liIndex := 0;

    while liIndex < lDatamodule.DataViewCount do
    begin
      lDataView := lDataModule.DataViews[liIndex];
      for i := 0 to lDataView.DataPipelineCount-1 do
      begin
        nomePipeline := tiraNumerosDoFinal(lDataView.DataPipelines[i].Name) ;
        if upperCase(name)=upperCase(nomePipeline) then
        begin
          result := lDataView.DataPipelines[i];
          Exit;
        end;
      end;
      inc(liindex);
    end;
  end;
  result := nil;
end;

procedure TacCustomReport.replaceReportSQLAddWhere(report: TppReport; template: TMemoryStream;
  id: integer);
var
  aSQL: TDaSQL;
  lDataModule: TdaDataModule;
  liIndex, i, iCriteria: Integer;
  lDataView: TdaDataView;
  nomePipeline: String;
  sent, sentOrder: string;
begin
  if template.Size <> 0 then
    report.Template.LoadFromStream(template);

  lDataModule := daGetDataModule(Report.MainReport);

  if (lDataModule <> nil) then
    begin
      liIndex := 0;

      while liIndex < lDatamodule.DataViewCount do
      begin
        lDataView := lDataModule.DataViews[liIndex];
        for i := 0 to lDataView.DataPipelineCount-1 do
        begin
          nomePipeline := tiraNumerosDoFinal(lDataView.DataPipelines[i].Name) ;
          sent := adendos.find(taWHERE, nomePipeline);
          sentOrder := adendos.find(taORDER, nomePipeline);

          aSQL := TdaQueryDataView(lDataView).SQL;

          if asql.EditSQLAsText then
          begin
            asql.SQLText.Text := replaceParamId(asql.SQLText.Text, id);
          end
          else
          begin
            for iCriteria := 1 to aSQL.CriteriaCount do
            begin
              if aSQL.Criteria[iCriteria-1].Value = '-1' then
                aSQL.Criteria[iCriteria-1].Value := IntToStr(id)
              else
              begin
                if aSQL.Criteria[iCriteria-1].Value <> casosEspeciais(aSQL.Criteria[iCriteria-1].Value) then
                  aSQL.Criteria[iCriteria-1].Value := casosEspeciais(aSQL.Criteria[iCriteria-1].Value);
              end
            end;
          end;

          if sent<>'' then
          begin
            asql.EditSQLAsText := True;
            asql.SQLText.Add(replaceId(sent, id));
            asql.SQLText.Add(sentOrder);
          end;
        end;
        inc(liindex);
      end;
    end;
end;

function TacCustomReport.replaceId(str: string; id:integer): string;
begin
  result := StringReplace(str,'\id',IntToStr(id),[rfReplaceAll, rfIgnoreCase]);
end;

function TacCustomReport.replaceParamId(str: string; id:integer): string;
begin
  result := StringReplace(str,'-1',IntToStr(id),[rfReplaceAll, rfIgnoreCase]);
end;

{ TAdendos }

procedure TAdendos.add(tipo: TTipoAdendo; Pipeline, sentenca: String);
begin
  SetLength(items, length(items)+1);
  items[length(items)-1].tipo := tipo;
  items[length(items)-1].Pipeline := Pipeline;
  items[length(items)-1].sentenca := sentenca;
end;


procedure TAdendos.clear;
begin
  SetLength(items, 0);
end;

function TAdendos.find(tipo: TTipoAdendo; pipeline: String): string;
var
  i: integer;
begin
  result := '';
  for i := low(items) to high(items) do
  begin
    if (items[i].tipo=tipo) AND (UpperCase(items[i].Pipeline)=UpperCase(pipeline)) then
      result := items[i].sentenca;
  end;
end;

procedure TacCustomReport.ajustarAdendos;
begin
end;

function TacCustomReport.getTemplate(id: integer; stream: TMemoryStream;
  var config: TConfigImpressao): boolean;
begin
  result := false;
end;

function TacCustomReport.findComponentUserName(name: String): TComponent;
var
  i: integer;
  PropInfo: PPropInfo;
begin
  result := nil;
  for i := 0 to ComponentCount-1 do
  begin
    PropInfo := GetPropInfo(components[i], 'userName');
    if Assigned(propInfo) then
      if UpperCase(GetStrProp(Components[i], 'userName'))  = UpperCase(name)then
        result := Components[i];
  end;
end;


procedure TacCustomReport.SetOutputFile(FileName: string; Format: TReportFormat);
begin
  with Report do
  begin
    FPrintToFile := True;
    FTextFileName := FileName;
    TextFileName := FileName;
    case Format of
      rfPDF:
        DeviceType := dtPDF;
      rfAcrobat:
        DeviceType := 'PDF';

      rfArchive:
        begin
          AllowPrintToArchive := True;
          ArchiveFileName := FileName;
          DeviceType := 'ArchiveFile';
        end;

      rfBitmap:
        DeviceType := 'Bitmap File';

      rfMetafile:
        DeviceType := 'Enhanced Metafile';

      rfExcel:
        DeviceType := 'Excel Document';

      rfGIF:
        DeviceType := 'GIF Image File';

      rfHTML:
        DeviceType := 'HTML Document';

      rfJPEG:
        DeviceType := 'JPEG Image File';

      rfPrinter:
        DeviceType := 'Printer';

      rfReportText:
        DeviceType := 'ReportTextFile';

      rfRTF:
        DeviceType := 'RTF Document';

      rfText:
        DeviceType := 'TextFile';

      rfWindowsMetafile:
        DeviceType := 'Windows Metafile';

      rfXHTML:
        DeviceType := 'XHTML Document';
      else
        DeviceType := 'Screen';
    end; // case
  end;
  FDeviceType := Report.DeviceType;
end;


function TacCustomReport.casosEspeciais(valorOriginal: string): string;
begin
  result := valorOriginal;
end;

procedure TacCustomReport.ReportPreviewFormCreate(Sender: TObject);
begin
  report.PreviewForm.WindowState := wsMaximized;
  TppViewer(report.Previewform.Viewer).ZoomSetting := zs100Percent
end;

function TacCustomReport.getPaperName(printerName: String): String;
var lPrinter: TppPrinter;
begin
  lPrinter := TppPrinter.Create;
  lPrinter.PrinterName := printerName;

  Result := lPrinter.PrinterSetup.PaperName;

  lPrinter.Free;

end;

procedure TacCustomReport.setForcePreview(Value: Boolean);
begin
  FForcePreview := Value;
  if FForcePreview then
    FForcePrintWithoutDialog := False;
end;

procedure TacCustomReport.setForcePrintWithoutDialog(Value: Boolean);
begin
  FForcePrintWithoutDialog := Value;
  if FForcePrintWithoutDialog then
    FForcePreview := False;
end;

procedure TacCustomReport.DataModuleDestroy(Sender: TObject);
begin
  FreeAndNil(adendos);
end;

end.



