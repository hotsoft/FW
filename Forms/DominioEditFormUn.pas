unit DominioEditFormUn;

interface

uses
  osCustomEditFrm, DB, DBClient, osClientDataset, StdCtrls, Mask,
  DBCtrls, Menus, ImgList, Controls, Classes, ActnList, osActionList,
  ComCtrls, ToolWin, Buttons, ExtCtrls, wwdbedit, Wwdbspin, Dialogs,
  acCustomSQLMainDataUn;

type

  TDominioEditForm = class(TosCustomEditForm)
    DominioClientDataSet: TosClientDataset;
    Label2: TLabel;
    DescricaoEdit: TDBEdit;
    DominioClientDataSetIDDOMINIO: TIntegerField;
    DominioClientDataSetDESCRICAO: TWideStringField;
    DominioClientDataSetNUMORDEM: TIntegerField;
    Label1: TLabel;
    NumOrdemSpinEdit: TwwDBSpinEdit;
    procedure DominioClientDataSetBeforePost(DataSet: TDataSet);
    procedure DominioClientDataSetAfterApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DominioEditForm: TDominioEditForm;

implementation

uses DominioDataUn, osUtils, SQLMainData;

{$R *.DFM}

procedure TDominioEditForm.DominioClientDataSetBeforePost(DataSet: TDataSet);
begin
  inherited;
  DominioData.Validate(DataSet);
end;

procedure TDominioEditForm.DominioClientDataSetAfterApplyUpdates(
  Sender: TObject; var OwnerData: OleVariant);
begin
  inherited;
  if TClientDataSet(Sender).UpdateStatus in [usModified, usInserted, usDeleted] then
    MainData.UpdateVersion(tnDominio);

end;

initialization
  OSRegisterClass(TDominioEditForm);

end.
