unit acCustomSQLMainDataUn;

interface

uses
  SysUtils, Classes, Data.DBXFirebird, FMTBcd, SqlExpr, osSQLDataSet, DB,
  osSQLConnection, Provider, osCustomDataSetProvider, osSQLDataSetProvider,
  osClientDataSet, Contnrs, osSQLQuery, Forms, Types, Variants,
  Data.DBXInterBase, Data.DBXCommon, System.Generics.Collections;

const

// Nomes das Tabelas a serem atualizadas (refresh) na aplicação Cliente
// para fornecer dados para Lookup

  tnUsuario             = 'Usuario';
  tnRecurso             = 'Recurso';
  tnAcao                = 'Acao';
  tnDominio             = 'Dominio';
  tnTipoRecurso         = 'TipoRecurso';
  tnCargo               = 'Cargo';
  tnGrupo               = 'Grupo';
  tnTipoRelatorio       = 'TipoRelatorio';
  tnParametroSistema    = 'ParametroSistema';
  tnTipo                = 'Tipo';
  tnEmpresa             = 'Empresa';

type
  TRefreshTable = class(TObject)
  private
    FTableName: string;
    FVersion: integer;
    FDataSet: TosClientDataSet;
  public
    property Version: integer read FVersion;
    property TableName: string read FTableName write FTableName;
    property DataSet: TosClientDataset read FDataSet write FDataSet;
    procedure RefreshData(NewVersion: integer);
  end;

  TRefreshTableList = class(TList<TRefreshTable>)
  end;

  TacCustomSQLMainData = class(TDataModule)
    prvFilter: TosSQLDataSetProvider;
    SQLConnection: TosSQLConnection;
    FilterQuery: TosSQLDataSet;
    SQLMonitor: TSQLMonitor;
    SQLConnectionMeta: TosSQLConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    
  protected
    BD: string;
    FQueryList: TObjectList;
    FIDHighValue: integer;
    FIDLowValue: integer;
    FTransactionDesc: TTransactionDesc;
    FIDUsuario: Integer;
    FNomeUsuario: String;
    FApelidoUsuario: String;
    FRefreshTableList: TRefreshTableList;
    FProfile: string;
    function selectParamsFileName: string;

  public
    { Public declarations }
    property NomeUsuario: String read FNomeUsuario;
    property IDUsuario: Integer read FIDUsuario;
    property ApelidoUsuario: String read FApelidoUsuario;
    property Profile: string read FProfile;

    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; BD: String); overload;
    destructor Destroy; override;
    function GetNetUserName: string;

    function GetQuery(meta: boolean = false): TosSQLQuery;
    procedure FreeQuery(Query: TosSQLQuery);

    function GetServerDate: TDatetime;
    function GetServerDatetime(aConnection: TSQLConnection=nil): TDatetime;
    function InTransaction: boolean;
    function StartTransaction: TDBXTransaction;
    procedure Commit(var Transaction: TDBXTransaction);
    procedure Rollback(var Transaction: TDBXTransaction);
    procedure CloseTransaction;
    function GetNewID(nomeGenerator: String= ''; aConnection: TSQLConnection = nil): integer;
    function GetGeneratorValue(nomeGenerator: String): integer;
    procedure GetUserInfo(apelido: string);

    procedure LoadRefreshTables;
    procedure RegisterRefreshTable(PTableName: string; PDataSet: TosClientDataSet);
    function FindRefreshTable(PTableName: string): TRefreshTable;
    procedure UpdateVersion(PTableName: string);
    procedure CheckVersion(PTableFilter: string);
    procedure RefreshTables; overload;
    procedure RefreshTable(PTableName: string);
    procedure RefreshTables(PTablesNames: array of string); overload;
    function GeTosSQLDataset: TosSQLDataset;

    function getSQLResult(sqlText: string; connection: TosSQLConnection = nil): variant;
    procedure execSQL(sqlText: string);
  end;

var
  acCustomSQLMainData: TacCustomSQLMainData;

implementation

uses EscolhaConexaoFormUn;

{$R *.dfm}

{ TacCustomSQLMainData }

{-------------------------------------------------------------------------
 Objetivo   > Verifica a versão de tabelas conforme uma pista usada para
                filtrar as Tabelas
 Parâmetros > Conforme documentação
 Retorno    >
 Criação    >
 Observações>  Comentario iniciado em 23.06.2006 por Ricardo N. Acras
 Atualização>
 ------------------------------------------------------------------------}
procedure TacCustomSQLMainData.CheckVersion(PTableFilter: string);
var
  Query: TosSQLQuery;
  NomeTabelaField: TStringField;
  VersaoField: TIntegerField;
  RefreshTable: TRefreshTable;
begin
  Query := GetQuery;
  try
    Query.SQL.Text :=
    'SELECT ' +
      'NomeTabela, ' +
      'Versao ' +
    'FROM ' +
      'VersaoTabela ' + PTableFilter;
    Query.Open;
    if not Query.Eof then
    begin
      NomeTabelaField := TStringField(Query.Fields[0]);
      VersaoField := TIntegerField(Query.Fields[1]);
      while not Query.Eof do
      begin
        Application.ProcessMessages;

        RefreshTable := FindRefreshTable(Trim(NomeTabelaField.Value));
        if (RefreshTable <> nil) then
        begin
          if RefreshTable.FVersion < VersaoField.Value then
             RefreshTable.RefreshData(VersaoField.Value);
        end;

        Query.Next;
      end; // while
    end; // if
  finally
    FreeQuery(Query);
  end;
end;

{-------------------------------------------------------------------------
 Objetivo   > 
 Parâmetros > Conforme documentação
 Retorno    >
 Criação    >
 Observações> Comentario iniciado em 23.06.2006 por Ricardo N. Acras
 Atualização>
 ------------------------------------------------------------------------}
constructor TacCustomSQLMainData.Create(AOwner: TComponent);
begin
  FQueryList := TObjectList.Create(True); // OwnsObjects = True
  FIDHighValue := -1;
  FRefreshTableList := TRefreshTableList.Create; // OwnsObjects = True
  inherited Create(AOwner);
end;

{-------------------------------------------------------------------------
 Objetivo   > 
 Parâmetros > Conforme documentação
 Retorno    >
 Criação    > 19.07.2006 - Ricardo N. Acras
 Observações>
 Atualização>
 ------------------------------------------------------------------------}
constructor TacCustomSQLMainData.Create(AOwner: TComponent; bd: string);
begin
  Self.Create(AOwner);
  self.BD := bd;
end;

{-------------------------------------------------------------------------
 Objetivo   > Procura um objeto TRefreshTable na lista de objetos
                se encontrar retorna a instancia senão retorna nulo
 Parâmetros > PTableName: Nome da tabela no BD
 Retorno    >
 Criação    >
 Observações> Comentario iniciado em 23.06.2006 por Ricardo N. Acras
 Atualização>
 ------------------------------------------------------------------------}
destructor TacCustomSQLMainData.Destroy;
var
  _RefreshTable: TRefreshTable;
begin
  for _RefreshTable in Self.FRefreshTableList do
   _RefreshTable.Free;
  FQueryList.Free;
  FRefreshTableList.Free;
  inherited;
end;

function TacCustomSQLMainData.FindRefreshTable(
  PTableName: string): TRefreshTable;
var
  _RefreshTable: TRefreshTable;
begin
  Result := nil;
  for _RefreshTable in Self.FRefreshTableList do
    if _RefreshTable.TableName.Trim = PTableName.Trim then
    begin
      Result := _RefreshTable;
      break;
    end;
end;

{-------------------------------------------------------------------------
 Objetivo   > Pegar o nome do usuário logado no windows 
 Parâmetros >
 Retorno    >
 Criação    >
 Observações> Comentário Iniciado em 23.06.2006 por Ricardo N. Acras
 Atualização>
 ------------------------------------------------------------------------}
function TacCustomSQLMainData.GetNetUserName: string;
const
    NetUserNameLength: DWORD = 50;
begin
    SetLength(Result, NetUserNameLength);
    SetLength(Result, StrLen(pChar(Result)));
end;

{-------------------------------------------------------------------------
 Objetivo   > Carrega as tabelas cadastradas no Banco de Dados  para a lista
                de objetos na memória para posterior controle de versões de
                dados básicos e Refresh nos ClientsDataSets usados para Lookup
 Parâmetros > Conforme documentação
 Retorno    >
 Criação    >
 Observações> Comentario iniciado em 23.06.2006 por Ricardo N. Acras
 Atualização>
 ------------------------------------------------------------------------}
procedure TacCustomSQLMainData.LoadRefreshTables;
var
  Query: TosSQLQuery;
  NomeTabelaField: TStringField;
  VersaoField: TIntegerField;
  RefreshTable: TRefreshTable;
begin
  Query := GetQuery;
  try
     Query.SQL.Text :=
      'SELECT ' +
        'NomeTabela, ' +
        'Versao ' +
      'FROM ' +
        'VersaoTabela ';
      Query.Open;
      if not Query.Eof then
      begin
        NomeTabelaField := TStringField(Query.Fields[0]);
        VersaoField := TIntegerField(Query.Fields[1]);
        FRefreshTableList.Clear;
        while not Query.Eof do
        begin
          RefreshTable := TRefreshTable.Create;
          RefreshTable.FTableName := Trim(NomeTabelaField.Value);
          RefreshTable.FVersion := VersaoField.Value;
          RefreshTable.FDataSet := nil;

          FRefreshTableList.Add(RefreshTable);

          Query.Next;
        end; // while
      end; // if
  finally
    FreeQuery(Query);
  end;
end;

{-------------------------------------------------------------------------
 Objetivo   > 
 Parâmetros > Conforme documentação
 Retorno    >
 Criação    > 23.06.2006 - Ricardo N. Acras
 Observações>
 Atualização>
 ------------------------------------------------------------------------}
function TacCustomSQLMainData.selectParamsFileName: string;
var
  opcaoConexao: TOpcaoConexao;
begin
  result := '';
  if FileExists(ExtractFilePath(Application.ExeName)+'profiles.ini') then
  begin
    opcaoConexao := TEscolhaConexaoForm.execute;
    result := opcaoConexao.nomeArquivo;
    fprofile := opcaoConexao.nome;
  end;
  if result = '' then
    result := 'AppParams.ini';
end;

{-------------------------------------------------------------------------
 Objetivo   >
 Parâmetros > Conforme documentação
 Retorno    >
 Criação    > 23.06.2006 - Ricardo N. Acras
 Observações>
 Atualização> 19.07.2006 - Ricardo N. Acras
                Atualizado para respeitar a configuração caso um BD tenha
                sido passado na criação.
 ------------------------------------------------------------------------}
procedure TacCustomSQLMainData.DataModuleCreate(Sender: TObject);
var
   sName : string;
   i : integer;
begin
  SQLConnection.Close;

  with TStringList.Create do
  begin
    try
      if bd='' then
        LoadFromFile(selectParamsFileName)
      else
      begin
        add('BlobSize=-1');
        add('CommitRetain=False');
        add('Database=' + BD);
        add('DriverName=Interbase');
        add('ErrorResourceFile=');
        add('LocaleCode=0000');
        add('Password=masterkey');
        add('RoleName=RoleName');
        add('ServerCharSet=');
        add('SQLDialect=2');
        add('Interbase TransIsolation=ReadCommited');
        add('User_Name=SYSDBA');
        add('WaitOnLocks=True');
      end;
      for i := 0 to Count - 1 do
      begin
        sName := Names[i];
        SQLConnection.Params.Values[sName] := Values[sName];
        SQLConnectionMeta.Params.Values[sName] := Values[sName];
      end;
      if SQLConnectionMeta.Params.Values['DataBaseMeta']<>'' then
        SQLConnectionMeta.Params.Values['Database'] :=
          SQLConnectionMeta.Params.Values['DatabaseMeta'];
    finally
      Free;
    end;
  end;
  SQLConnection.Open;
  SQLConnectionMeta.Open;

  LoadRefreshTables;
end;

{-------------------------------------------------------------------------
 Objetivo   > Retorna um TosSQLQuery conectado ao SQLConnection 
 Parâmetros > meta: indica se o SQLConnection deve ser o de metadados ou o
                de dados.
 Retorno    >
 Criação    >
 Observações> Comentário iniciado em 23.06.2006 por Ricardo N. Acras
 Atualização>
 ------------------------------------------------------------------------}
function TacCustomSQLMainData.GetQuery(meta: boolean): TosSQLQuery;
begin
  Result := TosSQLQuery.Create(Self);
  if meta then
    Result.SQLConnection := SQLConnectionMeta
  else
    Result.SQLConnection := SQLConnection;
end;

procedure TacCustomSQLMainData.FreeQuery(Query: TosSQLQuery);
begin
  Query.Close;
  FreeAndNil(Query);
end;

procedure TacCustomSQLMainData.Commit(var Transaction: TDBXTransaction);
begin
  SQLConnection.CommitFreeAndNil(Transaction);
end;

function TacCustomSQLMainData.GetNewID(nomeGenerator: String= ''; aConnection: TSQLConnection = nil): integer;
var
  v: variant;
  qryAux: TosSQLDataSet;
begin
  if nomeGenerator='' then
  begin
    // Se estourou a faixa, lê um novo HighValue
    if (FIDLowValue = 10) or (FIDHighValue = -1) then
    begin
      try
        if (aConnection <> nil) then
          FilterQuery.SQLConnection := aConnection;
      
        v := prvFilter.GetIDHigh;
        if v = NULL then
          raise Exception.Create('Não conseguiu obter o ID do server para inclusão');
        FIDHighValue := v;
        FIDLowValue := 0;
      finally
        FilterQuery.SQLConnection := Self.SQLConnection;
      end;
    end;
    Result := FIDHighValue * 10 + FIDLowValue;
    Inc(FIDLowValue);
  end else
  begin
    qryAux := GeTosSQLDataset;
    try
      if (aConnection <> nil) then
        qryAux.SQLConnection := aConnection;
      qryAux.CommandText := 'select gen_id('+nomeGenerator+', 1) from RDB$DATABASE';
      qryAux.Open;
      result := qryAux.Fields[0].AsInteger;
    finally
      FreeAndNil(qryAux);
    end;
  end;
end;

function TacCustomSQLMainData.GetServerDate: TDatetime;
begin
  Result := StrToDatetime(FormatDatetime('dd/mm/yyyy', GetServerDatetime));
end;

function TacCustomSQLMainData.GetServerDatetime(aConnection: TSQLConnection=nil): TDatetime;
var
  Query: TosSQLQuery;
begin
  try
    Query := GetQuery;
    if (aConnection <> nil) then
      Query.SQLConnection := aConnection;

    try
      Query.SQL.Add('select CURRENT_TIMESTAMP as DataHoraServidor from RDB$DATABASE');
      Query.Open;
      Result := Query.Fields[0].AsDatetime;
      Query.Close;
    finally
      FreeQuery(Query);
    end;
  except
    Result :=  now();
  end;
end;

procedure TacCustomSQLMainData.GetUserInfo(apelido: string);
var
  Query: TosSQLQuery;
begin
  Query := GetQuery;
  try
    Query.SQL.Text :=
        'SELECT ' +
        'Nome, ' +
        'IdUsuario, ' +
        'Apelido ' +
        'FROM ' +
        'Usuario ' +
        'WHERE ' +
        'upper(Apelido) = upper(:Apelido)';
    Query.ParamByName('Apelido').AsString := apelido;
    Query.Open;
    FNomeUsuario := Query.FieldbyName('Nome').AsString;
    FIDUsuario := Query.FieldByName('IdUsuario').AsInteger;
    FApelidoUsuario := Query.FieldByName('Apelido').AsString;
    Query.Close;
  finally
    FreeQuery(Query);
  end;
end;

function TacCustomSQLMainData.InTransaction: boolean;
begin
  Result := SQLConnection.InTransaction;
end;

procedure TacCustomSQLMainData.RollBack(var Transaction: TDBXTransaction);
begin
  SQLConnection.RollbackIncompleteFreeAndNil(Transaction);
end;

function TacCustomSQLMainData.StartTransaction: TDBXTransaction;
begin
  Result := nil;
  if not SQLConnection.InTransaction then
    Result := SQLConnection.BeginTransaction(TDBXIsolations.ReadCommitted);
end;

procedure TacCustomSQLMainData.CloseTransaction;
begin
  SQLConnection.Close;
end;

{-------------------------------------------------------------------------
 Objetivo   > Registra qual o ClientDataset de Lookup deve ser atualizado
                quando uma determinada tabela for alterada, isto é quando
                houver mudança de versão da tabela
 Parâmetros > Conforme documentação
 Retorno    >
 Criação    >
 Observações> Comentarios iniciados em 23.06.2006 por Ricardo N. Acras
 Atualização>
 ------------------------------------------------------------------------}
procedure TacCustomSQLMainData.RegisterRefreshTable(PTableName: string;
  PDataSet: TosClientDataSet);
var
  RefreshTable: TRefreshTable;
begin
  RefreshTable := FindRefreshTable(PTableName);
  if (RefreshTable = nil) then
  begin
    RefreshTable := TRefreshTable.Create;
    RefreshTable.FTableName := PTableName;
    RefreshTable.FVersion := 0;
    RefreshTable.FDataSet := PDataSet;
    Self.FRefreshTableList.Add(RefreshTable)
  end
  else
    RefreshTable.FDataset := PDataSet;

  PDataSet.Open;
end;


{-------------------------------------------------------------------------
 Objetivo   >   Trata a notifica que uma tabela sofreu alteração
              registra a evolução de verção faz refresh dos dados
 Parâmetros > Conforme documentação
 Retorno    >
 Criação    >
 Observações> Comentarios iniciados em 23.06.2006
 Atualização>
 ------------------------------------------------------------------------}
procedure TacCustomSQLMainData.UpdateVersion(PTableName: string);
var
  Query: TosSQLQuery;
  _Versao: integer;
begin
  Query := GetQuery;
  try
    Query.SQL.Text := Format('SELECT Versao FROM VersaoTabela WHERE nomeTabela = %s', [QuotedStr(PTableName)]);
    Query.Open;
    _Versao := 1;
    if (not Query.IsEmpty) then
      _Versao := Query.FieldByName('Versao').AsInteger + 1;
    
    Query.SQL.Text := Format(
    'UPDATE OR INSERT INTO ' +
    ' VersaoTabela (nometabela, Versao) ' +
    ' VALUES (%s,  %d) ' +
    ' MATCHING (nomeTabela) ', [QuotedStr(PTableName), _Versao]);
    Query.ExecSql;
  finally
    FreeQuery(Query);
  end;
  CheckVersion('WHERE NomeTabela = ' + QuotedStr(PTableName));
end;

procedure TacCustomSQLMainData.RefreshTable(PTableName: string);
begin
  CheckVersion('WHERE NomeTabela = ' + QuotedStr(PTableName));
end;

procedure TacCustomSQLMainData.RefreshTables;
begin
  CheckVersion(''); // Sem filtro
end;

procedure TacCustomSQLMainData.RefreshTables(
  PTablesNames: array of string);
var
  TableFilter: string;
  i: integer;
begin
  if Length(PTablesNames) > 0 then
  begin
    TableFilter := 'WHERE NomeTabela IN (' + QuotedStr(PTablesNames[0]);

    for i := Low(PTablesNames) + 1 to High(PTablesNames) do
      TableFilter := TableFilter + ', ' + QuotedStr(PTablesNames[i]);

    TableFilter := TableFilter + ')';
  end
  else
    TableFilter := '';

  CheckVersion(TableFilter);
end;

procedure SetParamToNull(PParam: TParam; PDatatype: TFieldtype);
begin
  PParam.DataType := PDatatype;
  PParam.Clear;
  PParam.Bound := True;
end;

function TacCustomSQLMainData.GeTosSQLDataset: TosSQLDataset;
begin
  Result := TosSQLDataset.Create(Self);
  Result.SQLConnection := SQLConnection
end;


{ TRefreshTable }

procedure TRefreshTable.RefreshData(NewVersion: integer);
begin
  FVersion := NewVersion;
  if (FDataSet <> nil) then
  begin
    FDataSet.Close;
    FDataSet.Open;
  end;
end;

function TacCustomSQLMainData.getSQLResult(sqlText: string;
  connection: TosSQLConnection = nil): variant;
var
  query: TosSQLQuery;
begin
  query := GetQuery;
  try
    if connection <> nil then
      query.SQLConnection := connection;
    query.SQL.Text := sqlText;
    query.Open;
    if query.Eof then
      result := null
    else
      result := query.Fields[0].Value;
  finally
    FreeAndNil(query);
  end;
end;

procedure TacCustomSQLMainData.execSQL(sqlText: string);
var
  query: TosSQLQuery;
begin
  query := GetQuery;
  try
    query.SQL.Text := sqlText;
    query.ExecSQL;
  finally
    FreeAndNil(query);
  end;
end;


function TacCustomSQLMainData.GetGeneratorValue(
  nomeGenerator: String): integer;
var
  qryAux: TosSQLDataSet;
begin
  qryAux := GeTosSQLDataset;
  try
    qryAux.CommandText := 'select gen_id('+nomeGenerator+', 1) from RDB$DATABASE';
    qryAux.Open;
    result := qryAux.fields[0].AsInteger;
  finally
    FreeAndNil(qryAux);
  end;
end;

end.
