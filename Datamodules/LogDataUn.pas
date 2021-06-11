unit LogDataUn;

interface

uses
  SysUtils, Classes, FMTBcd, Provider, osSQLDataSetProvider, DB, SqlExpr, osUtils,
  osCustomDataSetProvider, osSQLDataSet;

type
  TLogData = class(TDataModule)
    MasterDataSet: TosSQLDataset;
    MasterProvider: TosSQLDataSetProvider;
    MasterDataSetIDLOG: TIntegerField;
    MasterDataSetIDRECURSO: TIntegerField;
    MasterDataSetIDUSUARIO: TIntegerField;
    MasterDataSetDATAHORA: TSQLTimeStampField;
    MasterDataSetDESCRICAO: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LogData: TLogData;

implementation

uses SQLMainData;

{$R *.dfm}

initialization
  OSRegisterClass(TLogData);

end.
