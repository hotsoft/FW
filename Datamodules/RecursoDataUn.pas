unit RecursoDataUn;

interface

uses
  SysUtils, Classes, FMTBcd, Provider, osSQLDataSetProvider, DB, SqlExpr,
  osCustomDataSetProvider, osUtils, osSQLDataSet;

type
  TRecursoData = class(TDataModule)
    MasterDataSet: TosSQLDataset;
    MasterProvider: TosSQLDataSetProvider;
    MasterDataSetIDRECURSO: TIntegerField;
    MasterDataSetIDTIPORECURSO: TIntegerField;
    MasterDataSetDESCRICAO: TWideStringField;
    MasterDataSource: TDataSource;
    MasterDataSetIDDOMINIO: TIntegerField;
    MasterDataSetNOME: TWideStringField;
    MasterDataSetFILTERDEFNAME: TWideStringField;
    MasterDataSetDATACLASSNAME: TWideStringField;
    MasterDataSetRESCLASSNAME: TWideStringField;
    MasterDataSetREPORTCLASSNAME: TWideStringField;
    MasterDataSetINDICEIMAGEM: TIntegerField;
    MasterDataSetNUMORDEM: TIntegerField;
    RecursosUsuarioDataSet: TosSQLDataset;
    RecursosUsuarioProvider: TosSQLDataSetProvider;
    AcaoDataSet: TosSQLDataset;
    AcaoDataSetDESCRICAO: TWideStringField;
    AcaoDataSetIDACAO: TIntegerField;
    AcaoDataSetIDRECURSO: TIntegerField;
    AcaoDataSetINDICEIMAGEM: TIntegerField;
    AcaoDataSetNOME: TWideStringField;
    AcaoDataSetNOMECOMPONENTE: TWideStringField;
    AcoesUsuarioDataSet: TosSQLDataset;
    AcoesUsuarioDataSetNOMECOMPONENTE: TWideStringField;
    AcoesUsuarioProvider: TosSQLDataSetProvider;
    UsuarioDataSet: TosSQLDataset;
    UsuarioDataSetAPELIDO: TWideStringField;
    UsuarioDataSetSENHA: TWideStringField;
    UsuarioDataSetNOME: TWideStringField;
    UsuarioProvider: TosSQLDataSetProvider;
    MasterDataSetHABILITAEDITARTODOS: TWideStringField;
    MasterDataSetFORCAREEXECUCAOFILTRO: TWideStringField;
    UsuarioDataSetSTATUS: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
  private

  public
    procedure Validate (PDataSet : TDataSet);
    procedure ValidateAcao (PDataSet : TDataSet);
    function CheckResource(const User, Resource, Action: string): boolean; 
  end;

var
  RecursoData: TRecursoData;

implementation

uses osAppResources, osErrorHandler, acCustomSQLMainDataUn;

{$R *.dfm}

{ TRecursoData }

function TRecursoData.CheckResource(const User, Resource, Action: string): boolean;
var
  Query: TSQLDataSet;
begin
  Query := TSQLDataSet.Create(nil);
  try
    Query.SQLConnection := acCustomSQLMainData.SQLConnection;
    Query.CommandText := 'SELECT ' +
                         '  COUNT(DU.IDDireitoUso) HasRight ' +
                         'FROM ' +
                         '  DireitoUso DU ' +
                         '  JOIN GrupoUsuario GU ' +
                         '    ON DU.IDGrupo = GU.IDGrupo ' +
                         '  JOIN Usuario U ' +
                         '    ON GU.IDUsuario = U.IDUsuario ' +
                         '  JOIN Recurso R ' +
                         '    ON DU.IDRecurso = R.IDRecurso ' +
                         '  JOIN Acao A ' +
                         '    ON DU.IDAcao = A.IDAcao ' +
                         'WHERE ' +
                         '  U.Apelido LIKE ''' + User + ''' ' +
                         '  AND R.Nome LIKE ''' + Resource + ''' ' +
                         '  AND A.Nome LIKE ''' + Action + '''';
    Query.Open;
    Result := Query.FieldByName('HASRIGHT').Value > 0;
  finally
    Query.Free;
  end;
end;

procedure TRecursoData.Validate(PDataSet: TDataSet);
var
  TipoRecursoField: TIntegerField;
begin
  with PDataSet, HError do
  begin
    Clear;
    CheckEmpty(FieldByName('IdDominio'));
    TipoRecursoField := TIntegerField(FieldByName('IdTipoRecurso'));
    CheckEmpty(TipoRecursoField);
    CheckEmpty(FieldByName('Nome'));
    WarningEmpty(FieldByName('Descricao'));
    if TipoRecursoField.AsInteger = Ord(rtReport) then
    begin
      CheckEmpty(FieldByName('ReportClassName'));
    end
    else
    begin
      CheckEmpty(FieldByName('DataClassName'));
      CheckEmpty(FieldByName('ResClassName'));
    end;

    CheckEmpty(FieldByName('IndiceImagem'));
    CheckEmpty(FieldByName('NumOrdem'));
    Check;
  end;
end;

procedure TRecursoData.ValidateAcao(PDataSet: TDataSet);
begin
  with PDataSet, HError do
  begin
    Clear;
    CheckEmpty(FieldByName('NomeComponente'));
    WarningEmpty(FieldByName('Descricao'));
    CheckEmpty(FieldByName('IndiceImagem'));
    Check;
  end;
end;

procedure TRecursoData.DataModuleCreate(Sender: TObject);
begin
  MasterDataSet.SQLConnection := acCustomSQLMainData.SQLConnection;
  AcaoDataSet.SQLConnection := acCustomSQLMainData.SQLConnection;
  AcoesUsuarioDataSet.SQLConnection := acCustomSQLMainData.SQLConnection;
  RecursosUsuarioDataSet.SQLConnection := acCustomSQLMainData.SQLConnection;
  UsuarioDataSet.SQLConnection := acCustomSQLMainData.SQLConnection;
end;

initialization
  OSRegisterClass(TRecursoData);

end.
