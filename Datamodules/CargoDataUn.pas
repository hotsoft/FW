unit CargoDataUn;

interface

uses
  SysUtils, Classes, FMTBcd, DB, Provider, osSQLDataSetProvider, SqlExpr, osUtils,
  osCustomDataSetProvider, osSQLDataSet;

type
  TCargoData = class(TDataModule)
    MasterDataSet: TosSQLDataset;
    MasterProvider: TosSQLDataSetProvider;
    MasterDataSetIDCARGO: TIntegerField;
    MasterDataSetNOME: TWideStringField;
    MasterDataSetAREAATUACAO: TWideStringField;

  private

  public
    procedure Validate(PDataSet: TDataSet);
  end;
  
var
  CargoData: TCargoData;

implementation

uses osErrorHandler, SQLMainData;

{$R *.dfm}

procedure TCargoData.Validate(PDataSet: TDataSet);
begin
  with PDataSet, HError do
  begin
    Clear;
    CheckEmpty(FieldByName('Nome'));
    CheckEmpty(FieldByName('AreaAtuacao'));
    Check;
  end;
end;

initialization
  OSRegisterClass(TCargoData);

end.
