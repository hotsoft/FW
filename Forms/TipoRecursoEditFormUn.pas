unit TipoRecursoEditFormUn;

interface

uses
  osCustomEditFrm, DB, DBClient, osClientDataset, StdCtrls, Mask,
  DBCtrls, Menus, ImgList, Controls, Classes, ActnList, osActionList,
  ComCtrls, ToolWin, Buttons, ExtCtrls, acCustomSQLMainDataUn;

type

  TTipoRecursoEditForm = class(TosCustomEditForm)
    DominioClientDataSet: TosClientDataset;
    Label2: TLabel;
    DescricaoEdit: TDBEdit;
    DominioClientDataSetIDTIPORECURSO: TIntegerField;
    DominioClientDataSetDESCRICAO: TWideStringField;

    procedure DominioClientDataSetBeforePost(DataSet: TDataSet);
    procedure DominioClientDataSetAfterApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);

  private

  public

  end;

var
  TipoRecursoEditForm: TTipoRecursoEditForm;

implementation

uses TipoRecursoDataUn, osUtils, SQLMainData;

{$R *.DFM}

procedure TTipoRecursoEditForm.DominioClientDataSetBeforePost(DataSet: TDataSet);
begin
  inherited;
  TipoRecursoData.Validate(DataSet);
end;

procedure TTipoRecursoEditForm.DominioClientDataSetAfterApplyUpdates(
  Sender: TObject; var OwnerData: OleVariant);
begin
  inherited;
  if TClientDataSet(Sender).UpdateStatus in [usModified, usInserted, usDeleted] then
    MainData.UpdateVersion(tnTipoRecurso);

end;

initialization
  OSRegisterClass(TTipoRecursoEditForm);

end.
