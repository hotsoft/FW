unit AdministracaoLookupDataUn;

interface

uses
  SysUtils, Classes, DB, DBClient, osClientDataset, osLookupDataUn, FMTBcd,
  Provider, osCustomDataSetProvider, osSQLDataSetProvider, SqlExpr,
  osSQLDataSet, acCustomSQLMainDataUn;

type
  TAdministracaoLookupData = class(TosLookupData)
    UsuarioClientDataSet: TosClientDataset;
    UsuarioClientDataSetIDUSUARIO: TIntegerField;
    UsuarioClientDataSetNOME: TWideStringField;
    RecursoClientDataset: TosClientDataset;
    RecursoClientDatasetIDRECURSO: TIntegerField;
    RecursoClientDatasetNOME: TWideStringField;
    AcaoClientDataSet: TosClientDataset;
    AcaoClientDataSetIDACAO: TIntegerField;
    AcaoClientDataSetIDRECURSO: TIntegerField;
    AcaoClientDataSetNOME: TWideStringField;
    DominioClientDataset: TosClientDataset;
    DominioClientDatasetIDDOMINIO: TIntegerField;
    DominioClientDatasetDESCRICAO: TWideStringField;
    TipoRecursoClientDataSet: TosClientDataset;
    TipoRecursoClientDataSetIDTIPORECURSO: TIntegerField;
    TipoRecursoClientDataSetDESCRICAO: TWideStringField;
    CargoClientDataSet: TosClientDataset;
    CargoClientDataSetIDCARGO: TIntegerField;
    CargoClientDataSetNOME: TWideStringField;
    CargoLookupDataSet: TosSQLDataSet;
    IntegerField1: TIntegerField;
    StringField1: TWideStringField;
    CargoLookupProvider: TosSQLDataSetProvider;
    TipoRecursoLookupDataSet: TosSQLDataSet;
    IntegerField2: TIntegerField;
    StringField2: TWideStringField;
    TipoRecursoLookupProvider: TosSQLDataSetProvider;
    DominioLookupDataSet: TosSQLDataSet;
    DominioLookupDataSetIDDOMINIO: TIntegerField;
    DominioLookupDataSetDESCRICAO: TWideStringField;
    DominioLookupProvider: TosSQLDataSetProvider;
    AcaoLookupDataSet: TosSQLDataSet;
    AcaoLookupDataSetIDACAO: TIntegerField;
    AcaoLookupDataSetIDRECURSO: TIntegerField;
    AcaoLookupDataSetNOME: TWideStringField;
    AcaoLookupProvider: TosSQLDataSetProvider;
    RecursoLookupDataSet: TSQLDataSet;
    RecursoLookupDataSetIDRECURSO: TIntegerField;
    RecursoLookupDataSetNOME: TWideStringField;
    RecursoLookupProvider: TosSQLDataSetProvider;
    UsuarioLookupDataSet: TSQLDataSet;
    UsuarioLookupProvider: TosSQLDataSetProvider;
    UsuarioLookupDataSetIDUSUARIO: TIntegerField;
    UsuarioLookupDataSetNOME: TWideStringField;
    GrupoClientDataSet: TosClientDataset;
    GrupoLookupDataSet: TosSQLDataSet;
    GrupoLookupProvider: TosSQLDataSetProvider;
    GrupoLookupDataSetIDGRUPO: TIntegerField;
    GrupoLookupDataSetNOME: TWideStringField;
    GrupoClientDataSetIDGRUPO: TIntegerField;
    GrupoClientDataSetNOME: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure GetData; override;

  end;

var
  AdministracaoLookupData: TAdministracaoLookupData;

implementation


{$R *.dfm}


procedure TAdministracaoLookupData.GetData;
begin
  with acCustomSQLMainData do
  begin
    RegisterRefreshTable(tnUsuario, UsuarioClientDataSet);
    RegisterRefreshTable(tnRecurso, RecursoClientDataset);
    RegisterRefreshTable(tnAcao, AcaoClientDataSet);
    RegisterRefreshTable(tnDominio, DominioClientDataset);
    RegisterRefreshTable(tnTipoRecurso, TipoRecursoClientDataSet);
    RegisterRefreshTable(tnCargo, CargoClientDataSet);
    RegisterRefreshTable(tnGrupo, GrupoClientDataSet);
  end;
end;

procedure TAdministracaoLookupData.DataModuleCreate(Sender: TObject);
begin
  inherited;
  UsuarioLookupDataSet.SQLConnection := acCustomSQLMainData.SQLConnection;
  RecursoLookupDataSet.SQLConnection := acCustomSQLMainData.SQLConnection;
  AcaoLookupDataSet.SQLConnection := acCustomSQLMainData.SQLConnection;
  DominioLookupDataSet.SQLConnection := acCustomSQLMainData.SQLConnection;
  TipoRecursoLookupDataSet.SQLConnection := acCustomSQLMainData.SQLConnection;
  CargoLookupDataSet.SQLConnection := acCustomSQLMainData.SQLConnection;
  GrupoLookupDataSet.SQLConnection := acCustomSQLMainData.SQLConnection;
  GetData;
end;

end.
