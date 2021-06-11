unit UsuarioDataUn;

interface

uses
  SysUtils, Classes, FMTBcd, Provider, osSQLDataSetProvider, DB, SqlExpr,
  osCustomDataSetProvider, osUtils, osSQLDataSet;

type
  TUsuarioData = class(TDataModule)
    MasterDataSet: TosSQLDataset;
    MasterProvider: TosSQLDataSetProvider;
    MasterDataSource: TDataSource;
    GrupoDataSet: TosSQLDataset;
    GrupoProvider: TosSQLDataSetProvider;
    MasterDataSetIDUSUARIO: TIntegerField;
    MasterDataSetNOME: TWideStringField;
    MasterDataSetIDCARGO: TIntegerField;
    MasterDataSetAPELIDO: TWideStringField;
    MasterDataSetSENHA: TWideStringField;
    MasterDataSetSTATUS: TWideStringField;
    GrupoUsuarioDataSet: TosSQLDataset;
    GrupoUsuarioDataSetIDGRUPOUSUARIO: TIntegerField;
    GrupoUsuarioDataSetIDGRUPO: TIntegerField;
    GrupoUsuarioDataSetIDUSUARIO: TIntegerField;
  private

  public
    procedure Validate(PDataSet: TDataSet);
  end;

var
  UsuarioData: TUsuarioData;

implementation

uses osErrorHandler, SQLMainData;

{$R *.dfm}

procedure TUsuarioData.Validate(PDataSet: TDataSet);
begin
  with PDataSet, HError do
  begin
    Clear;
    WarningEmpty(FieldByName('IdCargo'));
    CheckEmpty(FieldByName('Apelido'));
    CheckEmpty(FieldByName('Nome'));
    WarningEmpty(FieldByName('Senha'));
    Check;
  end;
end;

initialization
  OSRegisterClass(TUsuarioData);

end.
