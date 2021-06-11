unit PesquisaLogFormUn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, osFrm, StdCtrls, Menus, ImgList, ActnList, osActionList,
  ComCtrls, ExtCtrls, acCollapsePanel, Wwdbcomb, Mask, wwdbedit, Wwdotdot,
  osComboSearch, osUtils, Grids, Wwdbigrd, Wwdbgrid, MPeriodo,
  DB, DBClient, osClientDataset;

type
  TPesquisaLogForm = class(TosForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    EnviarresultadosporMail1: TMenuItem;
    LimparLog1: TMenuItem;
    ImprimirResultados1: TMenuItem;
    pnlFltro: TCollapsePanel;
    Button4: TButton;
    Panel1: TPanel;
    wwDBGrid1: TwwDBGrid;
    chkUsuario: TCheckBox;
    cboUsuario: TosComboSearch;
    chkClasse: TCheckBox;
    cboClasses: TwwDBComboBox;
    chkEvento: TCheckBox;
    cboTipos: TwwDBComboBox;
    chkTexto: TCheckBox;
    edtTextoBusca: TEdit;
    chkPeriodo: TCheckBox;
    cdsLogs: TosClientDataset;
    cdsLogsIDLOG: TIntegerField;
    cdsLogsIDREGISTRO: TIntegerField;
    cdsLogsIDUSUARIO: TIntegerField;
    cdsLogsDATAHORA: TSQLTimeStampField;
    cdsLogsCLASSE: TIntegerField;
    cdsLogsTIPO: TIntegerField;
    cdsLogsDESCRICAO: TBlobField;
    dsLogs: TDataSource;
    cdsLogsEvento: TWideStringField;
    FramePeriodo: TFramePeriodo;
    cdsLogsUsuario: TWideStringField;
    procedure cboClassesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkUsuarioClick(Sender: TObject);
    procedure chkClasseClick(Sender: TObject);
    procedure chkEventoClick(Sender: TObject);
    procedure chkTextoClick(Sender: TObject);
    procedure chkPeriodoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure cdsLogsCalcFields(DataSet: TDataSet);
    procedure wwDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    dmLogs: Tlogger;
  public
    { Public declarations }
  end;

var
  PesquisaLogForm: TPesquisaLogForm;

implementation

uses LogCodes, AdministracaoLookupDataUn, ShowEventoLogFormUn;


{$R *.dfm}

procedure TPesquisaLogForm.cboClassesChange(Sender: TObject);
begin
  inherited;
  cboTipos.Items.Assign(logger.getLogTiposList(strToInt(cboClasses.Value)));
end;

procedure TPesquisaLogForm.FormShow(Sender: TObject);
begin
  inherited;
  cboClasses.Items.Assign(logger.getLogClassList);
end;

procedure TPesquisaLogForm.chkUsuarioClick(Sender: TObject);
begin
  inherited;
  cboUsuario.Enabled := (sender as TCheckBox).Checked;
end;

procedure TPesquisaLogForm.chkClasseClick(Sender: TObject);
begin
  inherited;
  cboClasses.Enabled := (sender as TCheckBox).Checked;
end;

procedure TPesquisaLogForm.chkEventoClick(Sender: TObject);
begin
  inherited;
  cboTipos.Enabled := (sender as TCheckBox).Checked;
end;

procedure TPesquisaLogForm.chkTextoClick(Sender: TObject);
begin
  inherited;
  edtTextoBusca.Enabled := (sender as TCheckBox).Checked;
end;

procedure TPesquisaLogForm.chkPeriodoClick(Sender: TObject);
begin
  inherited;
  FramePeriodo.setHabilitado(chkPeriodo.Checked);
end;

procedure TPesquisaLogForm.FormCreate(Sender: TObject);
begin
  inherited;
  dmLogs := Tlogger.Create(nil);
  cdsLogs.DataProvider := dmLogs.MasterProvider;
  cdsLogs.CreateDataSet;
  pnlFltro.collapsed := false;
end;

procedure TPesquisaLogForm.Button4Click(Sender: TObject);
var
  where: string;
begin
  inherited;
  pnlFltro.collapsed := true;
  where := '';
  cdsLogs.close;

  //período
  if chkPeriodo.Checked then
  begin
    if FramePeriodo.dtpDe.Checked then
      where := where + ' AND CAST(DataHora AS DATE) >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', FramePeriodo.dtpDe.Date));
    if FramePeriodo.dtpAte.Checked then
      where := where + ' AND CAST(DataHora AS DATE) <=  ' + QuotedStr(FormatDateTime('mm/dd/yyyy', FramePeriodo.dtpAte.Date));
  end;
  //usuario
  if chkUsuario.Checked then
    where := where + ' AND IdUsuario = ' + IntToStr(cboUsuario.ReturnedValue);
  //classe
  if chkClasse.Checked then
    where := where + ' AND classe = ' + cboClasses.Value;

  //tipo
  if chkEvento.Checked then
    where := where + ' AND tipo = ' + cboTipos.Value;

  dmLogs.MasterDataSet.CommandText :=
     ' SELECT           ' +
     '   IDLog,         ' +
     '   IDRegistro,    ' +
     '   IDUsuario,     ' +
     '   DataHora,      ' +
     '   Classe,        ' +
     '   Tipo,          ' +
     '   Descricao      ' +
     ' FROM             ' +
     '   Log            ' +
     ' WHERE 1 = 1      ' + where;

  cdsLogs.Open;
end;

procedure TPesquisaLogForm.cdsLogsCalcFields(DataSet: TDataSet);
begin
  inherited;
  cdsLogsEvento.Value := logTitulosClasses[cdsLogsCLASSE.value] + ' - ' +
    logTitulosTipos[cdsLogsCLASSE.value][cdsLogsTIPO.value];
  cdsLogsUsuario.Value := AdministracaoLookupData.UsuarioClientDataSet.
    Lookup('idUsuario', cdsLogsIDUSUARIO.Value, 'nome');
end;

procedure TPesquisaLogForm.wwDBGrid1DblClick(Sender: TObject);
begin
  inherited;
  TShowEventoLogForm.execute(cdsLogsUsuario.Value, cdsLogsDATAHORA.AsDateTime,
    cdsLogsEvento.Value, cdsLogsDESCRICAO.Value);
end;

initialization
  OSRegisterClass(TPesquisaLogForm);

end.
