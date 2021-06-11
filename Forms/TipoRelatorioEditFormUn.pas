unit TipoRelatorioEditFormUn;

interface

uses
  osCustomEditFrm, DB, DBClient, osClientDataset, StdCtrls, Mask,
  DBCtrls, Menus, ImgList, Controls, Classes, ActnList, osActionList,
  ComCtrls, ToolWin, Buttons, ExtCtrls, acCustomSQLMainDataUn;

type

  TTipoRelatorioEditForm = class(TosCustomEditForm)
    TipoRelatorioClientDataSet: TosClientDataset;
    Label2: TLabel;
    NomeEdit: TDBEdit;
    TipoRelatorioClientDataSetNOME: TWideStringField;
    Label1: TLabel;
    DescricaoEdit: TDBEdit;
    TipoRelatorioClientDataSetDESCRICAO: TWideStringField;
    TipoRelatorioClientDataSetIDTIPORELATORIO: TIntegerField;
    procedure TipoRelatorioClientDataSetBeforePost(DataSet: TDataSet);
    procedure TipoRelatorioClientDataSetAfterApplyUpdates(
      Sender: TObject; var OwnerData: OleVariant);
  private

  public

  end;

var
  TipoRelatorioEditForm: TTipoRelatorioEditForm;

implementation

uses TipoRelatorioDataUn, osUtils, SQLMainData;

{$R *.DFM}

procedure TTipoRelatorioEditForm.TipoRelatorioClientDataSetBeforePost(DataSet: TDataSet);
begin
  inherited;
  TipoRelatorioData.Validate(DataSet);
end;

procedure TTipoRelatorioEditForm.TipoRelatorioClientDataSetAfterApplyUpdates(
  Sender: TObject; var OwnerData: OleVariant);
begin
  inherited;
  if TClientDataSet(Sender).UpdateStatus in [usModified, usInserted, usDeleted] then
    MainData.UpdateVersion(tnTipoRelatorio);
end;

initialization
  OSRegisterClass(TTipoRelatorioEditForm);

end.
