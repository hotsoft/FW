unit ImprimirRelatorioFormUn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, osCustomEditFrm, Menus, ImgList, DB, ActnList, osActionList, SQLMainData,
  Buttons, ExtCtrls, osUtils, DBClient, osClientDataset, StdCtrls, Mask,
  wwdbedit, Wwdotdot, Wwdbcomb, osComboFilter, osSQLQuery, ppReport,
  ppComm, ppRelatv, ppProd, ppClass, osCustomSearchFrm, ppMemo, TypInfo,
  printers, ppTypes, ppDB, ppParameter, System.Actions;

type
  TImprimirRelatorioForm = class(TosCustomEditForm)
    osClientDataset1: TosClientDataset;
    Report: TppReport;
    FilterDataSet: TosClientDataset;
    ComboFilter: TosComboFilter;
    procedure ReportPreviewFormCreate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  protected
    procedure ImprimirRelatorioComFiltro(idRelatorio: integer);
    function findComponentUserName(name: String): TComponent;
    procedure ImprimirTemplate(templateName: string);
    procedure afterLoadStream; virtual;
    function findPipeline(name: string): TppDataPipeline;
  public
    function Edit(const KeyFields: string; const KeyValues: Variant): boolean; override;
  end;

var
  ImprimirRelatorioForm: TImprimirRelatorioForm;

implementation

uses osReportUtils, acCustomSQLMainDataUn, osFrm, acCustomParametroSistemaDataUn,
  acCustomReportUn, ReportUn;

{$R *.dfm}

{ TImprimirRelatorioForm }

function TImprimirRelatorioForm.Edit(const KeyFields: string;
  const KeyValues: Variant): boolean;
begin
  ImprimirRelatorioComFiltro(KeyValues);
  result := true;
end;

procedure TImprimirRelatorioForm.ImprimirRelatorioComFiltro(idRelatorio: integer);
var
  stream: TMemoryStream;
  qry: TosSQLQuery;
  updateContadorImpressao : TosSQLQuery;
  templateName, FilterName: string;
  srchForm: TCustomSearchForm;
  config: TConfigImpressao;
  extensao: string;
  FTextFileName: string;
  where, order: string; 
begin
  config.orientation := -1;
  config.larguraPapel := -1;
  config.alturaPapel := -1;
  config.margemSuperior := -1;
  config.margemInferior := -1;
  config.margemEsquerda := -1;
  config.margemDireita := -1;
  config.tipoSaida := 'T';
  FTextFileName := '';
  
  //buscar informações no catálogo de relatórios
  qry := acCustomSQLMainData.GetQuery;
  try
    qry.sql.Text := 'SELECT ' +
                    ' RB.Name as TemplateName, '+
                    ' F.Name as NomeFiltro, ' +
                    ' R.ClasseImpressora, ' +
                    ' R.MargemSuperior, ' +
                    ' R.MargemInferior, ' +
                    ' R.MargemEsquerda, ' +
                    ' R.MargemDireita, ' +
                    ' R.AlturaPapel, ' +
                    ' R.LarguraPapel, ' +
                    ' R.Orientation, R.tipoSaida ' +
                    ' FROM Relatorio R ' +
                    ' LEFT JOIN XFilterDef F ' +
                    '   ON F.IDXFilterDef=R.IDXFilterDef ' +
                    ' JOIN RB_ITEM RB' +
                    '   ON RB.ITEM_ID = R.ITEM_ID ' +
                    ' WHERE IdRelatorio=' + IntToStr(idRelatorio);
    qry.Open;
    templateName := qry.FieldByName('TemplateName').AsString;
    FilterName := qry.FieldByName('NomeFiltro').AsString;
    config.nomeImpressora := acCustomParametroSistemaData.getNomeImpressoraClasse(qry.FieldByName('ClasseImpressora').AsString);
    if not qry.fieldByName('orientation').IsNull then
      config.orientation := qry.fieldByName('orientation').AsInteger;
    if not qry.fieldByName('larguraPapel').IsNull then
      config.larguraPapel := qry.fieldByName('larguraPapel').AsInteger;
    if not qry.fieldByName('alturaPapel').IsNull then
      config.alturaPapel := qry.fieldByName('alturaPapel').AsInteger;
    if not qry.fieldByName('margemSuperior').IsNull then
      config.margemSuperior := qry.fieldByName('margemSuperior').AsInteger;
    if not qry.fieldByName('margemInferior').IsNull then
      config.margemInferior := qry.fieldByName('margemInferior').AsInteger;
    if not qry.fieldByName('margemEsquerda').IsNull then
      config.margemEsquerda := qry.fieldByName('margemEsquerda').AsInteger;
    if not qry.fieldByName('margemDireita').IsNull then
      config.margemDireita := qry.fieldByName('margemDireita').AsInteger;
    if not qry.fieldByName('tipoSaida').IsNull then
      config.tipoSaida := qry.fieldByName('tipoSaida').AsString;
  finally
    acCustomSQLMainData.FreeQuery(qry);
  end;
  stream := TMemoryStream.Create;
  getTemplateByName(TemplateName, stream);

  if FilterName <> '' then
  begin
    ComboFilter.ClearViews;
    ComboFilter.FilterDefName := FilterName;
    ComboFilter.GetViews();

    srchForm := TCustomSearchForm.Create(application);
    with srchForm do
    begin
      FilterDefName := filterName;
      srchForm.DataProvider := acCustomSQLMainData.prvFilter;
      Execute('',3,toRetornarQuery);
      where := GetExpressions;
      order := getOrder;

      if ConsultaCombo.GetExprList(ConsultaCombo.Items.IndexOf(ConsultaCombo.Text)).Text <> '' then
      begin
        if where = '' then
          where := ConsultaCombo.GetExprList(ConsultaCombo.Items.IndexOf(ConsultaCombo.Text)).Text
        else
          where := where + ' AND ' +
            ConsultaCombo.GetExprList(ConsultaCombo.Items.IndexOf(ConsultaCombo.Text)).Text;

      end;
      replaceReportSQLAddParam(report, stream, sqlResult.Text, Trim(where), Trim(order));
      free;
    end;
  end
  else
    Report.Template.LoadFromStream(stream);


  report.Units := utMillimeters;
  if config.nomeImpressora<>'' then
    report.PrinterSetup.PrinterName :=
      config.nomeImpressora;
  if config.orientation = 1 then
    report.PrinterSetup.Orientation := poPortrait;
  if config.orientation = 2 then
    report.PrinterSetup.Orientation := poLandscape;

  if config.alturaPapel <> -1 then
    Report.PrinterSetup.PaperHeight := config.alturaPapel;
  if config.larguraPapel <> -1 then
    Report.PrinterSetup.PaperWidth := config.larguraPapel;
  if config.margemInferior <> -1 then
    Report.PrinterSetup.MarginBottom := config.margemInferior;
  if config.margemEsquerda <> -1 then
    Report.PrinterSetup.MarginLeft := config.margemEsquerda;
  if config.margemDireita <> -1 then
    Report.PrinterSetup.MarginRight := config.margemDireita;
  if config.margemSuperior <> -1 then
    Report.PrinterSetup.MarginTop := config.margemSuperior;

  if config.tipoSaida <> TSTela then
  begin
    if config.tipoSaida = TSPDF then extensao := 'pdf';
    if config.tipoSaida = TSTexto then extensao := 'txt';
    if FTextFileName = '' then
      if not PromptForFileName(FTextFileName, '*.' + extensao, extensao,
        '', '', true) then
        exit;

    report.AllowPrintToFile := True;
    report.TextFileName := FTextFileName;
    report.ShowPrintDialog := false;

    if config.tipoSaida = TSPDF then
      report.DeviceType := 'PDF';

    if config.tipoSaida = TSTexto then
      report.DeviceType := 'TextFile';
  end;

   updateContadorImpressao := MainData.GetQuery;
  try
    updateContadorImpressao.SQL.Text := 'UPDATE rb_item '+
                            ' SET FREQUENCIAUSO = FREQUENCIAUSO+1, '+
                            ' DATAULTIMAIMPRESSAO = '
                            + QuotedStr(FormatDateTime('dd.mm.yyyy', MainData.GetServerDatetime)) +
                            ' WHERE ITEM_ID = ' + IntToStr(getTemplateIDByName(TemplateName));
    updateContadorImpressao.ExecSQL;
  finally
    acCustomSQLMainData.FreeQuery(updateContadorImpressao);
  end;

  report.Print;

end;

procedure TImprimirRelatorioForm.ImprimirTemplate(templateName: string);
var
  stream: TMemoryStream;
begin
  //buscar informações no catálogo de relatórios
  stream := TMemoryStream.Create;
  getTemplateByName(TemplateName, stream);
  Report.Template.LoadFromStream(stream);
  afterLoadStream;
  report.Print;
end;

function TImprimirRelatorioForm.findPipeline(name: string): TppDataPipeline;
var
  i,j: integer;
begin
  result := nil;
  for i := 1 to ComponentCount-1 do
  begin
    if (Components[i] is TdaDataView) then
    begin
      for j := 0 to TdaDataView(Components[i]).DataPipelineCount-1 do
        if upperCase(name)=UpperCase(TdaDataView(Components[i]).DataPipelines[j].UserName) then
          result := TdaDataView(Components[i]).DataPipelines[j];
    end;
  end;
end;


procedure TImprimirRelatorioForm.ReportPreviewFormCreate(Sender: TObject);
begin
  inherited;
  report.PreviewFormSettings.ZoomSetting := zs100Percent;
  report.PreviewFormSettings.WindowState := wsMaximized;
end;

function TImprimirRelatorioForm.findComponentUserName(name: String): TComponent;
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

procedure TImprimirRelatorioForm.FormCreate(Sender: TObject);
begin
  inherited;
  Operacoes := Operacoes-[oInserir,oExcluir,oVisualizar];
  filterDataSet.dataProvider := acCustomSQLMainData.prvFilter;
end;

procedure TImprimirRelatorioForm.afterLoadStream;
begin
//
end;

initialization
  OSRegisterClass(TImprimirRelatorioForm);

end.
