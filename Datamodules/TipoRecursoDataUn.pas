unit TipoRecursoDataUn;

interface

uses
  SysUtils, Classes, FMTBcd, DB, Provider, osSQLDataSetProvider, SqlExpr, osUtils,
  osCustomDataSetProvider, osSQLDataSet;

type
  TTipoRecursoData = class(TDataModule)
    MasterDataSet: TosSQLDataset;
    MasterProvider: TosSQLDataSetProvider;
    MasterDataSetIDTIPORECURSO: TIntegerField;
    MasterDataSetDESCRICAO: TWideStringField;
  private

  public
    procedure Validate(PDataSet: TDataSet);
  end;

var
  TipoRecursoData: TTipoRecursoData;

implementation

uses osErrorHandler, SQLMainData;

{$R *.dfm}

procedure TTipoRecursoData.Validate(PDataSet: TDataSet);
begin
  with PDataSet, HError do
  begin
    Clear;
    CheckEmpty(FieldByName('Descricao'));
    Check;
  end;
end;

initialization
  OSRegisterClass(TTipoRecursoData);

end.
