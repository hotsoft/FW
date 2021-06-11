unit CargoEditFormUn;

interface

uses
  osCustomEditFrm, DB, DBClient, osClientDataset, StdCtrls, Mask,
  DBCtrls, Menus, ImgList, Controls, Classes, ActnList, osActionList,
  ComCtrls, ToolWin, Buttons, ExtCtrls, wwdbedit, Wwdotdot, Wwdbcomb, acCustomSQLMainDataUn;

type

  TCargoEditForm = class(TosCustomEditForm)
    CargoClientDataSet: TosClientDataset;
    Label2: TLabel;
    NomeEdit: TDBEdit;
    CargoClientDataSetIDCARGO: TIntegerField;
    CargoClientDataSetNOME: TWideStringField;
    CargoClientDataSetAREAATUACAO: TWideStringField;
    Label1: TLabel;
    AreaAtuacaoComboBox: TwwDBComboBox;

    procedure CargoClientDataSetBeforePost(DataSet: TDataSet);
    procedure CargoClientDataSetAfterApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CargoEditForm: TCargoEditForm;

implementation

uses CargoDataUn, osUtils, SQLMainData;

{$R *.DFM}

procedure TCargoEditForm.CargoClientDataSetBeforePost(DataSet: TDataSet);
begin
  inherited;
  CargoData.Validate(DataSet);
end;

procedure TCargoEditForm.CargoClientDataSetAfterApplyUpdates(
  Sender: TObject; var OwnerData: OleVariant);
begin
  inherited;
  if TClientDataSet(Sender).UpdateStatus in [usModified, usInserted, usDeleted] then
    MainData.UpdateVersion(tnCargo);

end;

initialization
  OSRegisterClass(TCargoEditForm);

end.
