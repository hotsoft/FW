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
    FilterDefDetailDatasetIDXFilterDefDetail: TIntegerField;
    FilterDefDetailDatasetIDXFilterDef: TIntegerField;
    FilterDefDetailDatasetNumber: TIntegerField;
    FilterDefDetailDatasetDescription: TWideStringField;
    FilterDefDetailDatasetQueryText: TBlobField;
    FilterDefDetailDatasetExpressionList: TBlobField;
    FilterDefDetailDatasetConstraintList: TBlobField;
    FilterDefDetailDatasetOrderList: TBlobField;
    FilterDefDetailDatasetOrderColumn: TWideStringField;
    FilterDefDetailDatasetOrderType: TWideStringField;
    MasterDatasetIDXFilterDef: TIntegerField;
    MasterDatasetName: TWideStringField;
    MasterDatasetFilterType: TWideStringField;
    MasterDatasetTitulo: TWideStringField;
    FilterDefDetailDatasetAttributeList: TWideMemoField;
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
