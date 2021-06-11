unit RelatorioLookupDataUn;

interface

uses
  SysUtils, Classes, DB, DBClient, osClientDataset, osLookupDataUn, FMTBcd,
  Provider, osCustomDataSetProvider, osSQLDataSetProvider, SqlExpr,
  osSQLDataSet;

type
  TRelatorioLookupData = class(TosLookupData)
    TipoRelatorioClientDataSet: TosClientDataset;
    TipoRelatorioLookupDataSet: TosSQLDataSet;
    TipoRelatorioLookupProvider: TosSQLDataSetProvider;
    TipoRelatorioClientDataSetNOME: TWideStringField;
    TemplateClientDataset: TosClientDataset;
    TemplateLookupDataSet: TosSQLDataSet;
    TemplateLookupProvider: TosSQLDataSetProvider;
    TemplateLookupDataSetNOME: TWideStringField;
    TemplateLookupDataSetITEM_ID: TIntegerField;
    TemplateClientDatasetNOME: TWideStringField;
    TemplateClientDatasetITEM_ID: TIntegerField;
    FilterDefClientDataSet: TosClientDataset;
    FilterDefLookupDataSet: TosSQLDataSet;
    FilterDefLookupProvider: TosSQLDataSetProvider;
    FilterDefLookupDataSetNAME: TWideStringField;
    FilterDefClientDataSetNAME: TWideStringField;
    FilterDefLookupDataSetIDXFILTERDEF: TIntegerField;
    FilterDefClientDataSetIDXFILTERDEF: TIntegerField;
    TipoRelatorioClientDataSetIDTIPORELATORIO: TIntegerField;
    RelatorioClientDataset: TosClientDataset;
    RelatorioDataSet: TosSQLDataSet;
    RelatorioDataSetProvider: TosSQLDataSetProvider;
    RelatorioClientDatasetIDRELATORIO: TIntegerField;
    RelatorioClientDatasetTITULO: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure GetData;  override;
  end;

var
  RelatorioLookupData: TRelatorioLookupData;

implementation

uses acCustomSQLMainDataUn;

{$R *.dfm}

procedure TRelatorioLookupData.GetData;
begin
  acCustomSQLMainData.RegisterRefreshTable(tnTipoRelatorio, TipoRelatorioClientDataSet);
end;

procedure TRelatorioLookupData.DataModuleCreate(Sender: TObject);
begin
  inherited;
   TipoRelatorioLookupDataSet.SQLConnection := acCustomSQLMainData.SQLConnection;
   TemplateLookupDataSet.SQLConnection := acCustomSQLMainData.SQLConnection;
   FilterDefLookupDataSet.SQLConnection := acCustomSQLMainData.SQLConnection;
   RelatorioDataSet.SQLConnection := acCustomSQLMainData.SQLConnection;
end;

end.
