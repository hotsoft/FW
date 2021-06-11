unit TipoRelatorioDataUn;

interface

uses
  SysUtils, Classes, FMTBcd, Provider, osSQLDataSetProvider, DB, SqlExpr, osUtils,
  osCustomDataSetProvider, osSQLDataSet;

type
  TTipoRelatorioData = class(TDataModule)
    MasterDataSet: TosSQLDataset;
    MasterProvider: TosSQLDataSetProvider;
    MasterDataSetNOME: TWideStringField;
    MasterDataSetDESCRICAO: TWideStringField;
    MasterDataSetIDTIPORELATORIO: TIntegerField;
  private

  public
    procedure Validate(PDataSet: TDataSet);
  end;

var
  TipoRelatorioData: TTipoRelatorioData;

implementation

uses osErrorHandler, SQLMainData;

{$R *.dfm}

procedure TTipoRelatorioData.Validate(PDataSet: TDataSet);
begin
  with PDataSet, HError do
  begin
    Clear;
    CheckEmpty(FieldByName('Nome'));
    CheckEmpty(FieldByName('Descricao'));
    Check;
  end;
end;

initialization
  OSRegisterClass(TTipoRelatorioData);

end.
