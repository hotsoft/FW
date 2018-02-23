unit FilterDefDataUn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Provider, Db, FMTBcd, SqlExpr,
  osSQLDataSetProvider, osCustomDataSetProvider, osUtils, osSQLDataSet;

type
  TFilterDefData = class(TDataModule)
    MasterDatasource: TDataSource;
    MasterProvider: TosSQLDataSetProvider;
    MasterDataset: TosSQLDataset;
    FilterDefDetailDataset: TosSQLDataset;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FilterDefData: TFilterDefData;

implementation

uses acCustomSQLMainDataUn;

{$R *.DFM}

procedure TFilterDefData.DataModuleCreate(Sender: TObject);
begin
  MasterDataset.SQLConnection := acCustomSQLMainData.SQLConnection;
  FilterDefDetailDataset.SQLConnection := acCustomSQLMainData.SQLConnection;
end;

initialization
  OSRegisterClass(TFilterDefData);
  
end.
