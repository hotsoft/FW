unit DominioDataUn;

interface

uses
  SysUtils, Classes, FMTBcd, DB, Provider, osSQLDataSetProvider, SqlExpr, osUtils,
  osCustomDataSetProvider, osSQLDataSet;

type
  TDominioData = class(TDataModule)
    MasterDataSet: TosSQLDataset;
    MasterProvider: TosSQLDataSetProvider;
    MasterDataSetIDDOMINIO: TIntegerField;
    MasterDataSetDESCRICAO: TWideStringField;
    MasterDataSetNUMORDEM: TIntegerField;
  private

  public
    procedure Validate(PDataSet: TDataSet);
  end;

var
  DominioData: TDominioData;

implementation

uses osErrorHandler, SQLMainData;

{$R *.dfm}

procedure TDominioData.Validate(PDataSet: TDataSet);
begin
  with PDataSet, HError do
  begin
    Clear;
    CheckEmpty(FieldByName('Descricao'));
    WarningEmpty(FieldByName('NumOrdem'));
    Check;
  end;
end;

initialization
  OSRegisterClass(TDominioData);

end.
