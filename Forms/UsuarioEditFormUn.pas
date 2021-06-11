unit UsuarioEditFormUn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  osCUSTOMEDITFRM, Wwintl, Db, DBClient, osClientDataset, ActnList,
  StdCtrls, Mask, DBCtrls, Grids, DBGrids, ComCtrls,
  wwdbedit, Wwdotdot, Wwdbcomb, Menus, ImgList,
  osActionList, ToolWin, Buttons, ExtCtrls, osComboSearch, osUtils, Variants,
  osDBDualTree, SQLMainData, osComboFilter, acCustomSQLMainDataUn;

type
  TUsuarioEditForm = class(TosCustomEditForm)
    TestarAction: TAction;
    Label1: TLabel;
    NomeEdit: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    ApelidoEdit: TDBEdit;
    MudarSenhaButton: TButton;
    DesativarUsuarioButton: TButton;
    UsuarioClientDataSet: TosClientDataset;
    NomeCargoCombo: TosComboSearch;
    GrupoClientDataSet: TosClientDataset;
    GrupoClientDataSetIDGRUPO: TIntegerField;
    GrupoClientDataSetNOME: TWideStringField;
    UsuarioClientDataSetIDUSUARIO: TIntegerField;
    UsuarioClientDataSetNOME: TWideStringField;
    UsuarioClientDataSetIDCARGO: TIntegerField;
    UsuarioClientDataSetAPELIDO: TWideStringField;
    UsuarioClientDataSetSENHA: TWideStringField;
    UsuarioClientDataSetSTATUS: TWideStringField;
    UsuarioClientDataSetNomeCargo: TWideStringField;
    UsuarioClientDataSetGrupoUsuarioDataSet: TDataSetField;
    GrupoUsuarioClientDataSet: TosClientDataset;
    GrupoUsuarioClientDataSetIDGRUPOUSUARIO: TIntegerField;
    GrupoUsuarioClientDataSetIDGRUPO: TIntegerField;
    GrupoUsuarioClientDataSetIDUSUARIO: TIntegerField;
    DualTree: TosDBDualTree;
    procedure MudarSenhaButtonClick(Sender: TObject);
    procedure DesativarUsuarioButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UsuarioClientDataSetBeforePost(DataSet: TDataSet);
    procedure UsuarioClientDataSetAfterInsert(DataSet: TDataSet);
    procedure UsuarioClientDataSetAfterApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
  private
    procedure EnableControlsByUserState;
  public

  end;

var
  UsuarioEditForm: TUsuarioEditForm;

implementation

uses UsuarioDataUn, MudarSenhaFormUn, AdministracaoLookupDataUn, osMD5,
  RelatorioDataUn;

{$R *.DFM}

procedure TUsuarioEditForm.MudarSenhaButtonClick(Sender: TObject);
var
  Oldpassword : string;
  Newpassword : string;
begin
  inherited;
  Oldpassword := UsuarioClientDataSetSENHA.Value;
  Newpassword := TMudarSenhaForm.Execute (Oldpassword);

  if Oldpassword <> Newpassword then
  begin
    UsuarioClientDataSet.Edit;
    UsuarioClientDataSetSENHA.Value := Newpassword;
    UsuarioClientDataSet.Post;
  end;
end;

procedure TUsuarioEditForm.DesativarUsuarioButtonClick(Sender: TObject);
begin
  inherited;
  if UsuarioClientDataSetSTATUS.Value = 'X' then
  begin
    UsuarioClientDataSet.Edit;
    UsuarioClientDataSetSTATUS.Value := '';
    UsuarioClientDataSet.Post;
    EnableControlsByUserState;
  end
  else if MessageDlg('Você quer realmente desativar o usuário ' +
      UsuarioClientDataSetNOME.Value + '?' , mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    UsuarioClientDataSet.Edit;
    UsuarioClientDataSetSTATUS.Value := 'X';
    UsuarioClientDataSet.Post;
    EnableControlsByUserState;
  end;
end;

procedure TUsuarioEditForm.FormShow(Sender: TObject);
var
  viewMode: boolean;
begin
  inherited;
  EnableControlsByUserState;

  GrupoClientDataSet.Open;
  DualTree.Load;

  MainData.RefreshTable(tnCargo);

  viewMode := FormMode=fmView;
  DesativarUsuarioButton.Enabled := not viewMode;
  MudarSenhaButton.Enabled := not viewMode;
end;

procedure TUsuarioEditForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GrupoClientDataSet.Close;
  inherited;
end;

procedure TUsuarioEditForm.EnableControlsByUserState;
var
  UserActive: boolean;
begin
  UserActive := UsuarioClientDataSetSTATUS.Value <> 'X';

  if UserActive then
    DesativarUsuarioButton.Caption := 'Desativar'
  else
    DesativarUsuarioButton.Caption := 'Ativar';

  MudarSenhaButton.Enabled := UserActive;
  ApelidoEdit.Enabled := UserActive;
  NomeEdit.Enabled := UserActive;
end;

procedure TUsuarioEditForm.UsuarioClientDataSetBeforePost(DataSet: TDataSet);
begin
  inherited;
  UsuarioData.Validate(DataSet);
end;

procedure TUsuarioEditForm.UsuarioClientDataSetAfterInsert(DataSet: TDataSet);
begin
  inherited;
  UsuarioClientDataSetSTATUS.Value := 'A'; // Cria o Usuário com status = Ativo
end;

procedure TUsuarioEditForm.UsuarioClientDataSetAfterApplyUpdates(
  Sender: TObject; var OwnerData: OleVariant);
begin
  inherited;
  if TClientDataSet(Sender).UpdateStatus in [usModified, usInserted, usDeleted] then
    MainData.UpdateVersion(tnUsuario);
end;

initialization
  OSRegisterClass(TUsuarioEditForm);

end.
