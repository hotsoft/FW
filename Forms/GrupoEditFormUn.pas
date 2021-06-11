unit GrupoEditFormUn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  osCUSTOMEDITFRM, Wwintl, Db, DBClient, osClientDataset, ActnList,
  StdCtrls, Mask, DBCtrls, Grids, DBGrids, ComCtrls,
  wwdbedit, Wwdotdot, Wwdbcomb, Menus, ImgList,
  osActionList, ToolWin, Buttons, ExtCtrls, osComboSearch, Wwdbigrd,
  Wwdbgrid, osUtils, Variants, CheckLst, osDBDualTree, acCustomSQLMainDataUn;

type
  TRefInt = class(TObject)
  private
    FValue: integer;
  public
    constructor Create(const AValue: integer);
    property Value: integer read FValue write FValue;
  end;

  TGrupoEditForm = class(TosCustomEditForm)
    TestarAction: TAction;
    Label1: TLabel;
    DescricaoEdit: TDBEdit;
    Label2: TLabel;
    NomeEdit: TDBEdit;
    PageControl: TPageControl;
    ParticipantesTabSheet: TTabSheet;
    TabSheet1: TTabSheet;
    clbAcao: TCheckListBox;
    Splitter1: TSplitter;
    ParticipantesDualTree: TosDBDualTree;
    GrupoDataSet: TosClientDataset;
    GrupoDataSetIDGRUPO: TIntegerField;
    GrupoDataSetNOME: TWideStringField;
    GrupoDataSetDESCRICAO: TWideStringField;
    GrupoDataSetGrupoUsuarioDataSet: TDataSetField;
    GrupoUsuarioClientDataSet: TosClientDataset;
    GrupoUsuarioClientDataSetIDGRUPOUSUARIO: TIntegerField;
    GrupoUsuarioClientDataSetIDGRUPO: TIntegerField;
    GrupoUsuarioClientDataSetIDUSUARIO: TIntegerField;
    UsuarioClientDataSet: TosClientDataset;
    UsuarioClientDataSetIDUSUARIO: TIntegerField;
    UsuarioClientDataSetNOME: TWideStringField;
    GrupoDataSetDireitoUsoDataSet: TDataSetField;
    DireitoUsoClientDataSet: TosClientDataset;
    DireitoUsoClientDataSetIDGRUPO: TIntegerField;
    DireitoUsoClientDataSetIDRECURSO: TIntegerField;
    DireitoUsoClientDataSetDireitoUsoAcaoDataSet: TDataSetField;
    DireitoUsoAcaoClientDataSet: TosClientDataset;
    DireitoUsoAcaoClientDataSetIDDIREITOUSO: TIntegerField;
    DireitoUsoAcaoClientDataSetIDGRUPO: TIntegerField;
    DireitoUsoAcaoClientDataSetIDRECURSO: TIntegerField;
    DireitoUsoAcaoClientDataSetIDACAO: TIntegerField;
    RecursoClientDataSet: TosClientDataset;
    AcaoClientDataSet: TosClientDataset;
    AcaoClientDataSetIDACAO: TIntegerField;
    AcaoClientDataSetNOME: TWideStringField;
    DireitoUsoDualTree: TosDBDualTree;
    RecursoClientDataSetIDRECURSO: TIntegerField;
    RecursoClientDataSetNOMERECURSO: TWideStringField;
    RecursoClientDataSetNOMEDOMINIO: TWideStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DireitoUsoDualTreeNodeSelect(LeafSelected: Boolean);
    procedure clbAcaoClickCheck(Sender: TObject);
    procedure DireitoUsoClientDataSetNewRecord(DataSet: TDataSet);
    procedure GrupoDataSetBeforePost(DataSet: TDataSet);
    procedure GrupoDataSetAfterApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
  private
    function LocateAction(IDAction: integer): boolean;
    procedure ClearActions;
    procedure LoadActions;
    procedure CreateActions;
    procedure SaveAction(IDAction: integer; Checked: boolean);
  public
    { Public declarations }
  end;

var
  GrupoEditForm: TGrupoEditForm;

implementation

uses GrupoDataUn, AdministracaoLookupDataUn, SQLMainData;

{$R *.DFM}

procedure TGrupoEditForm.clbAcaoClickCheck(Sender: TObject);
begin
  inherited;
  SaveAction(
      (clbAcao.Items.Objects[clbAcao.ItemIndex] as TRefInt).Value,
      clbAcao.Checked[clbAcao.ItemIndex]);
end;

procedure TGrupoEditForm.ClearActions;
var
  i: integer;
begin
  for i := 0 to clbAcao.Count - 1 do
    clbAcao.Items.Objects[i].Free;
  clbAcao.Clear;
end;

procedure TGrupoEditForm.CreateActions;
var
  i: integer;
begin
  AcaoClientDataSet.Params[0].Value := DireitoUsoClientDataSetIDRecurso.Value;
  AcaoClientDataSet.Active := True;
  AcaoClientDataSet.First;
  for i := 0 to AcaoClientDataSet.RecordCount - 1 do
  begin
    DireitoUsoAcaoClientDataSet.Append;
    DireitoUsoAcaoClientDataSetIDAcao.Value := AcaoClientDataSetIDAcao.Value;
    DireitoUsoAcaoClientDataSet.Post;

    AcaoClientDataSet.Next;
  end;
  AcaoClientDataSet.Active := False;
end;

procedure TGrupoEditForm.DireitoUsoClientDataSetNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  CreateActions;
end;

procedure TGrupoEditForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  RecursoClientDataSet.Active := False;
  UsuarioClientDataSet.Active := False;

  inherited;
end;

procedure TGrupoEditForm.FormShow(Sender: TObject);
begin
  inherited;
  PageControl.ActivePage := ParticipantesTabSheet;
  ClearActions;

  UsuarioClientDataSet.Active := True;
  ParticipantesDualTree.Load;

  RecursoClientDataSet.Active := True;
  DireitoUsoDualTree.Load;
end;

procedure TGrupoEditForm.LoadActions;
var
  i,
  IDAcao: integer;
begin
  ClearActions;

  AcaoClientDataSet.Params[0].Value := DireitoUsoClientDataSetIDRecurso.Value;
  AcaoClientDataSet.Active := True;
  for i := 0 to AcaoClientDataSet.RecordCount - 1 do
  begin
    IDAcao := AcaoClientDataSetIDAcao.Value;
    clbAcao.AddItem(AcaoClientDataSetNome.Value, TRefInt.Create(IDAcao));
    clbAcao.Checked[i] := LocateAction(IDAcao);
    AcaoClientDataSet.Next;
  end;
  AcaoClientDataSet.Active := False;
end;

function TGrupoEditForm.LocateAction(IDAction: integer): boolean;
begin
  Result := DireitoUsoAcaoClientDataSet.Locate('IDAcao', VarArrayOf([IDAction]), []);
end;

procedure TGrupoEditForm.DireitoUsoDualTreeNodeSelect(LeafSelected: Boolean);
begin
  inherited;
  if LeafSelected then
    LoadActions
  else
    ClearActions;
end;

procedure TGrupoEditForm.SaveAction(IDAction: integer; Checked: boolean);
begin
  if LocateAction(IDAction) then
  begin
    if not Checked then
      DireitoUsoAcaoClientDataSet.Delete;
  end
  else
    if Checked then
    begin
      DireitoUsoAcaoClientDataSet.Append;
      DireitoUsoAcaoClientDataSetIDAcao.Value := IDAction;
      DireitoUsoAcaoClientDataSet.Post;
    end;
end;


constructor TRefInt.Create(const AValue: integer);
begin
  FValue := AValue;
end;

procedure TGrupoEditForm.GrupoDataSetBeforePost(DataSet: TDataSet);
begin
  inherited;
  GrupoData.Validate(DataSet);
end;

procedure TGrupoEditForm.GrupoDataSetAfterApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin
  inherited;
  if TClientDataSet(Sender).UpdateStatus in [usModified, usInserted, usDeleted] then
    MainData.UpdateVersion(tnGrupo);

end;

initialization
  OSRegisterClass(TGrupoEditForm);

end.
