unit ClasseRelatorioDataUn;

interface

uses
  SysUtils, Classes, FMTBcd, Provider, osSQLDataSetProvider, DB, SqlExpr, osUtils,
  osCustomDataSetProvider, osSQLDataSet;

type
  TClasseRelatorioData = class(TDataModule)
    MasterDataSet: TosSQLDataset;
    MasterProvider: TosSQLDataSetProvider;
    MasterDataSetIDCLASSERELATORIO: TIntegerField;
    MasterDataSetNOME: TWideStringField;
    MasterDataSetDESCRICAO: TWideStringField;
  private

  public
    procedure Validate(PDataSet: TDataSet);
  end;

var
  ClasseRelatorioData: TClasseRelatorioData;

implementation

uses osErrorHandler, SQLMainData;

{$R *.dfm}

procedure TClasseRelatorioData.Validate(PDataSet: TDataSet);
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
  OSRegisterClass(TClasseRelatorioData);

end.
