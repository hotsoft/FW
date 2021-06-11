unit ParametroSistemaEditFormUn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  osCUSTOMEDITFRM, Wwintl, Db, DBClient, osClientDataset, ActnList,
  StdCtrls, Mask, DBCtrls, Grids, DBGrids, ComCtrls,
  wwdbedit, Wwdotdot, Wwdbcomb, Menus, ImgList,
  osActionList, ToolWin, Buttons, ExtCtrls, osComboSearch, osUtils,
  Wwdbigrd, Wwdbgrid, DBTables, Wwdbspin, wwcheckbox, wwclearbuttongroup,
  wwradiogroup, ExtDlgs;

type
  TEstruturaContabilEditForm = class(TosCustomEditForm)
    TestarAction: TAction;
    MasterClientDataSet: TosClientDataset;
    MasterClientDataSetIDEMPRESA: TIntegerField;
    MasterClientDataSetLOGO: TBlobField;
    OpenDialog: TOpenPictureDialog;
    MasterClientDataSetNOMEFANTASIA: TWideStringField;
    MasterClientDataSetENDERECO: TWideStringField;
    MasterClientDataSetBAIRRO: TWideStringField;
    MasterClientDataSetCIDADE: TWideStringField;
    MasterClientDataSetUF: TWideStringField;
    MasterClientDataSetTELEFONE: TWideStringField;
    MasterClientDataSetNomeEmpresa: TWideStringField;
    MasterClientDataSetMENSAGEMORCAMENTO: TWideStringField;
    MasterClientDataSetMENSAGEMLOCACAO: TWideStringField;
    MasterClientDataSetNOMELOCATARIO: TWideStringField;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  EstruturaContabilEditForm: TEstruturaContabilEditForm;

implementation

uses SQLMainData, osFrm;

{$R *.DFM}

procedure TEstruturaContabilEditForm.FormShow(Sender: TObject);
begin
  inherited;
  MasterClientDataSet.Open;
  FormMode := fmEdit;
end;

procedure TEstruturaContabilEditForm.FormCreate(Sender: TObject);
begin
  inherited;
  Operacoes := [];
end;

initialization
  OSRegisterClass(TEstruturaContabilEditForm);

end.
