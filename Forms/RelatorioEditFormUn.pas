unit RelatorioEditFormUn;

interface

uses
  osCustomEditFrm, DB, DBClient, osClientDataset, StdCtrls, Mask,
  DBCtrls, Menus, ImgList, Controls, Classes,
  ComCtrls, ToolWin, Buttons, ExtCtrls, ActnList, osActionList,
  wwdbdatetimepicker, wwdbedit, Wwdotdot, Wwdbcomb, osComboSearch, osLogin,
  ppComm, ppRelatv, ppProd, ppClass, ppReport, osComboFilter,
  acCustomSQLMainDataUn;

type

  TRelatorioEditForm = class(TosCustomEditForm)
    RelatorioClientDataSet: TosClientDataset;
    PageControl: TPageControl;
    PrincipalTabSheet: TTabSheet;
    ConfiguracoesTabSheet: TTabSheet;
    VersaoTabSheet: TTabSheet;
    Label3: TLabel;
    TipoRelatorioCombo: TDBLookupComboBox;
    Label1: TLabel;
    TituloEdit: TDBEdit;
    Label4: TLabel;
    DescricaoMemo: TDBMemo;
    Label5: TLabel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    ImpressoraCombo: TwwDBComboBox;
    Label8: TLabel;
    CompativelAPartirDaVersaoEdit: TDBEdit;
    Label9: TLabel;
    CompativelAteVersaoEdit: TDBEdit;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DataAlteracaoTimePicker: TwwDBDateTimePicker;
    UsuarioAlteracaoEdit: TDBEdit;
    ArquivoOrigemEdit: TDBEdit;
    TipoRelatorioLookupDataSource: TDataSource;
    NomeRelatorioCombo: TosComboSearch;
    RelatorioClientDataSetTemplate: TWideStringField;
    RelatorioClientDataSetNomeUsuario: TWideStringField;
    Report: TppReport;
    RelatorioClientDataSetIDRELATORIO: TIntegerField;
    RelatorioClientDataSetTITULO: TWideStringField;
    RelatorioClientDataSetDESCRICAO: TWideMemoField;
    RelatorioClientDataSetCLASSEIMPRESSORA: TWideStringField;
    RelatorioClientDataSetCOMPATIVELAPARTIRDAVERSAO: TWideStringField;
    RelatorioClientDataSetCOMPATIVELATEVERSAO: TWideStringField;
    RelatorioClientDataSetDATAIMPORTACAO: TSQLTimeStampField;
    RelatorioClientDataSetARQUIVOORIGEM: TWideStringField;
    RelatorioClientDataSetIDUSUARIOIMPORTACAO: TIntegerField;
    RelatorioClientDataSetITEM_ID: TIntegerField;
    RelatorioClientDataSetIDXFILTERDEF: TIntegerField;
    osComboSearch1: TosComboSearch;
    RelatorioClientDataSetNomeFiltro: TWideStringField;
    ComboFilter: TosComboFilter;
    FilterDataset: TosClientDataset;
    FilterDatasource: TDataSource;
    RelatorioClientDataSetIDTIPORELATORIO: TIntegerField;
    RelatorioClientDataSetCLASSERELATORIO: TWideStringField;
    Label7: TLabel;
    ClasseCombo: TwwDBComboBox;
    RelatorioClientDataSetNomeTipoRelatorio: TWideStringField;

    procedure RelatorioClientDataSetBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure RelatorioClientDataSetNewRecord(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure ImprimirActionExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ReportPreviewFormCreate(Sender: TObject);

  private

  public

  end;

var
  RelatorioEditForm: TRelatorioEditForm;

implementation

uses RelatorioDataUn, osUtils, RelatorioLookupDataUn, SQLMainData, osFrm, Dialogs,
  osReportUtils, FilterDefDataUn;

{$R *.DFM}

procedure TRelatorioEditForm.RelatorioClientDataSetBeforePost(DataSet: TDataSet);
begin
  inherited;
  RelatorioData.Validate(DataSet);
end;

procedure TRelatorioEditForm.FormShow(Sender: TObject);
begin
  inherited;
  MainData.RefreshTable(tnTipoRelatorio);
  PageControl.ActivePageIndex := 0;
  ImprimirAction.Enabled := true;
end;

procedure TRelatorioEditForm.RelatorioClientDataSetNewRecord(
  DataSet: TDataSet);
var
  infoUsuario: TLoginUsuario;
begin
  inherited;
  infoUsuario := TLoginUsuario.create;
  infoUsuario.getInfoUsuarioLogadoSistema;
  RelatorioClientDataSetIDUSUARIOIMPORTACAO.Value := infoUsuario.IDUsuario;
  RelatorioClientDataSetNomeUsuario.Value := infoUsuario.Nome;
  RelatorioClientDataSetDATAIMPORTACAO.AsDateTime := MainData.GetServerDatetime;
end;

procedure TRelatorioEditForm.FormCreate(Sender: TObject);
begin
  inherited;
  Operacoes := operacoes + [oImprimir];
end;

procedure TRelatorioEditForm.ImprimirActionExecute(Sender: TObject);
var
  stream: TMemoryStream;
  dummy: integer;
begin
  inherited;
  stream := TMemoryStream.Create;
  getTemplateByName(RelatorioClientDataSetTemplate.Value, stream);

  if RelatorioClientDataSetNOMEFILTRO.Value <> '' then
  begin
    with ComboFilter do
    begin
      ClearViews;
      FilterDefName := RelatorioClientDataSetNOMEFILTRO.Value;
      GetViews;
      ExecuteFilter();
      //if ItemIndex <> -1 then
        //FilterAction.Execute;
      replaceReportSQL(report, stream, getSQLFilter(dummy));
    end;
  end
  else
    Report.Template.LoadFromStream(stream);


  report.Print;
end;

procedure TRelatorioEditForm.Button1Click(Sender: TObject);
begin
  inherited;
  ImprimirAction.Execute;
end;

procedure TRelatorioEditForm.ReportPreviewFormCreate(Sender: TObject);
begin
  inherited;
//
end;

initialization
  OSRegisterClass(TRelatorioEditForm);

end.
