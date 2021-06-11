unit GrupoDataUn;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, Provider, osSQLDataSetProvider,
  osCustomDataSetProvider, osUtils, DBClient, osSQLDataSet;

type
  TGrupoData = class(TDataModule)
    MasterDataSet: TosSQLDataset;
    MasterProvider: TosSQLDataSetProvider;
    MasterDataSource: TDataSource;
    MasterDataSetIDGRUPO: TIntegerField;
    MasterDataSetNOME: TWideStringField;
    MasterDataSetDESCRICAO: TWideStringField;
    GrupoUsuarioDataSet: TosSQLDataset;
    GrupoUsuarioDataSetIDGRUPOUSUARIO: TIntegerField;
    GrupoUsuarioDataSetIDGRUPO: TIntegerField;
    GrupoUsuarioDataSetIDUSUARIO: TIntegerField;
    UsuarioDataSet: TosSQLDataset;
    UsuarioDataSetIDUSUARIO: TIntegerField;
    UsuarioDataSetNOME: TWideStringField;
    UsuarioProvider: TosSQLDataSetProvider;
    DireitoUsoDataSet: TosSQLDataset;
    DireitoUsoDataSetIDGRUPO: TIntegerField;
    DireitoUsoDataSetIDRECURSO: TIntegerField;
    RecursoDataSet: TosSQLDataset;
    RecursoDataSetIDRECURSO: TIntegerField;
    RecursoDataSetNOMERECURSO: TWideStringField;
    RecursoDataSetNOMEDOMINIO: TWideStringField;
    RecursoProvider: TosSQLDataSetProvider;
    DireitoUsoDataSource: TDataSource;
    DireitoUsoAcaoDataSet: TosSQLDataset;
    DireitoUsoAcaoDataSetIDDIREITOUSO: TIntegerField;
    DireitoUsoAcaoDataSetIDGRUPO: TIntegerField;
    DireitoUsoAcaoDataSetIDRECURSO: TIntegerField;
    DireitoUsoAcaoDataSetIDACAO: TIntegerField;
    AcaoDataSet: TosSQLDataset;
    AcaoDataSetIDACAO: TIntegerField;
    AcaoDataSetNOME: TWideStringField;
    AcaoProvider: TosSQLDataSetProvider;
    procedure MasterProviderBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure UsuarioProviderBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure RecursoProviderBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
  private
    { Private declarations }
  public
    procedure Validate(PDataSet: TDataSet);
  end;

var
  GrupoData: TGrupoData;

implementation

uses osErrorHandler, SQLMainData;

{$R *.dfm}

procedure TGrupoData.MasterProviderBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
  if SourceDS = DireitoUsoDataSet then
    Applied := True;
end;

procedure TGrupoData.UsuarioProviderBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
  Applied := True;
end;

procedure TGrupoData.RecursoProviderBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
  Applied := True;
end;

procedure TGrupoData.Validate(PDataSet: TDataSet);
begin
  with PDataSet, HError do
  begin
    Clear;
    CheckEmpty(FieldByName('Nome'));
    WarningEmpty(FieldByName('Descricao'));
    Check;
  end;
end;


initialization
  OSRegisterClass(TGrupoData);

end.
