unit ImprimirRelatorioFormUn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, osCustomEditFrm, Menus, ImgList, DB, ActnList, osActionList,
  Buttons, ExtCtrls, osUtils, DBClient, osClientDataset, StdCtrls, Mask,
  wwdbedit, Wwdotdot, Wwdbcomb, osComboFilter, osSQLQuery, ppReport,
  ppComm, ppRelatv, ppProd, ppClass, osCustomSearchFrm, ppMemo, TypInfo,
  printers, ppTypes, PsRBExport_Main, PsRBExport_Excel;

type
  TImprimirRelatorioForm = class(TosCustomEditForm)
    osClientDataset1: TosClientDataset;
    Report: TppReport;
    FilterDataSet: TosClientDataset;
    ComboFilter: TosComboFilter;
    procedure ReportPreviewFormCreate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure ImprimirRelatorioComFiltro(idRelatorio: integer);
    function findComponentUserName(name: String): TComponent;

    { Private declarations }
  public
    function Edit(const KeyFields: string; const KeyValues: Variant): boolean; override;
  end;

var
  ImprimirRelatorioForm: TImprimirRelatorioForm;

implementation

uses osReportUtils, SQLMainData, osFrm, ParametroSistemaDataUn,
  acCustomReportUn;

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
  templateName, FilterName: string;
  srchForm: TCustomSearchForm;
  config: TConfigImpressao;
  sql: string;
begin
  config.orientation := -1;
  config.larguraPapel := -1;
  config.alturaPapel := -1;
  config.margemSuperior := -1;
  config.margemInferior := -1;
  config.margemEsquerda := -1;
  config.margemDireita := -1;
  //buscar informa��es no cat�logo de relat�rios
  qry := MainData.GetQuery;
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
                    ' R.Orientation ' +
                    ' FROM Relatorio R ' +
                    ' LEFT JOIN XFilterDef F ' +
                    '   ON F.IDXFilterDef=R.IDXFilterDef ' +
                    ' JOIN RB_ITEM RB' +
                    '   ON RB.ITEM_ID = R.ITEM_ID ' +
                    ' WHERE IdRelatorio=' + IntToStr(idRelatorio);
    qry.Open;
    templateName := qry.FieldByName('TemplateName').AsString;
    FilterName := qry.FieldByName('NomeFiltro').AsString;
    config.nomeImpressora := ParametroSistemaData.getNomeImpressoraClasse(qry.FieldByName('ClasseImpressora').AsString);
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
  finally
    MainData.FreeQuery(qry);
  end;
  stream := TMemoryStream.Create;
  getTemplateByName(TemplateName, stream);

  if FilterName <> '' then
  begin
    //if pra testar os esquemas e p�
    if true then
    begin
      ComboFilter.FilterDefName := FilterName;
      ComboFilter.GetViews();
      sql := ComboFilter.ExecuteFilter();
      replaceReportSQL(report, stream, sql);
    end
    else
    begin
      srchForm := TCustomSearchForm.Create(application);

      with srchForm do
      begin
        FilterDefName := filterName;
        srchForm.DataProvider := MainData.prvFilter;
        Execute('',3,toRetornarQuery);
        replaceReportSQL(report, stream, sqlResult.GetText);
        free;
      end;
    end;
//    with ComboFilter do
//    begin
//      ClearViews;
//      FilterDefName := FilterName;
//      GetViews;
//      replaceReportSQL(report, stream, getSQLFilter(dummy));
//    end;
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

  report.Print;
end;

procedure TImprimirRelatorioForm.ReportPreviewFormCreate(Sender: TObject);
begin
  inherited;
  report.PreviewForm.WindowState := wsMaximized;
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
end;

initialization
  OSRegisterClass(TImprimirRelatorioForm);

end.
