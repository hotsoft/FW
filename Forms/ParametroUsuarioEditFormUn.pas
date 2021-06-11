unit ParametroUsuarioEditFormUn;

interface

uses
  osCustomEditFrm, DB, DBClient, osClientDataset, StdCtrls, Mask,
  DBCtrls, Menus, ImgList, Controls, Classes, ActnList, osActionList,
  ComCtrls, ToolWin, Buttons, ExtCtrls, wwdbedit, Wwdotdot, Wwdbcomb;

type

  TParametroUsuarioEditForm = class(TosCustomEditForm)
    ParametroClientDataSet: TosClientDataset;
    ParametroClientDataSetIDPARAMETROUSUARIO: TIntegerField;
    ParametroClientDataSetNOMEPARAMETRO: TWideStringField;
    ParametroClientDataSetDESCRICAO: TWideStringField;
    ParametroClientDataSetCONTEUDO: TWideStringField;
    ParametroClientDataSetTIPODADO: TWideStringField;
    Label2: TLabel;
    NomeParametroEdit: TDBEdit;
    Label1: TLabel;
    ConteudoMemo: TDBMemo;
    Label3: TLabel;
    Label4: TLabel;
    TipoDadoComboBox: TwwDBComboBox;
    DescricaoDBEdit: TDBEdit;

    procedure ParametroClientDataSetBeforePost(DataSet: TDataSet);

  private

  public

  end;

var
  ParametroUsuarioEditForm: TParametroUsuarioEditForm;

implementation

uses ParametroUsuarioDataUn, osUtils;

{$R *.DFM}

procedure TParametroUsuarioEditForm.ParametroClientDataSetBeforePost(DataSet: TDataSet);
begin
  inherited;
  ParametroUsuarioData.Validate(DataSet);
end;

initialization
  OSRegisterClass(TParametroUsuarioEditForm);

end.
