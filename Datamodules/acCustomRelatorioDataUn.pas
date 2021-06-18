unit acCustomRelatorioDataUn;

interface

uses
  SysUtils, Classes, FMTBcd, Provider, osSQLDataSetProvider, DB, SqlExpr, osUtils,
  osCustomDataSetProvider, osSQLDataSet, osSqlQuery, acCustomReportUn;

type
  TacCustomRelatorioData = class(TDataModule)
    MasterDataSet: TosSQLDataset;
    MasterProvider: TosSQLDataSetProvider;
    MasterDataSetIDRELATORIO: TIntegerField;
    MasterDataSetTITULO: TWideStringField;
    MasterDataSetDESCRICAO: TWideMemoField;
    MasterDataSetCOMPATIVELAPARTIRDAVERSAO: TWideStringField;
    MasterDataSetCOMPATIVELATEVERSAO: TWideStringField;
    MasterDataSetDATAIMPORTACAO: TSQLTimeStampField;
    MasterDataSetARQUIVOORIGEM: TWideStringField;
    MasterDataSetIDUSUARIOIMPORTACAO: TIntegerField;
    MasterDataSetITEM_ID: TIntegerField;
    MasterDataSetIDXFILTERDEF: TIntegerField;
    MasterDataSetCLASSEIMPRESSORA: TWideStringField;
    MasterDataSetIDTIPORELATORIO: TIntegerField;
    MasterDataSetCLASSERELATORIO: TWideStringField;
  private

  public
    procedure Validate(PDataSet: TDataSet);
    class function getItemIdByReportId(idRelatorio: integer): integer;
    class function getTitulo(IdRelatorio: integer): string;
    function isChangeable(className: string): boolean; virtual;
    class function getTemplateConfigForUser(className: string;
      var configImpressao: TConfigImpressao): integer; virtual;
  end;

var
  acCustomRelatorioData: TacCustomRelatorioData;

implementation

uses osErrorHandler, acCustomSQLMainDataUn, osLogin, osReportUtils;

{$R *.dfm}

class function TacCustomRelatorioData.getTemplateConfigForUser(
  className: string; var configImpressao: TConfigImpressao): integer;
{var
  qry: TosSQLQuery;
  nomeField: string;
  loginInfo: TLoginUsuario;}
begin
  result := -1;
  //todo o código foi comentado para implementar o novo esquema de herança
{  className := UpperCase(className);
  nomeField := '';
  if (classname = 'TPROTOCOLOREPORT') then
    nomeField := 'IdRelatorioProtocolo';
  if (classname = 'TFICHAPACIENTEREPORT') then
    nomeField := 'IdRelatorioFichaTrabalho';
  if (classname = 'TMAPALOTEREPORT') then
    nomeField := 'IdRelatorioMapaTrabalho';
  if (classname = 'TLAUDOREPORT') then
    nomeField := 'IdRelatorioLaudoExame';
  if (classname = 'TETIQUETAAMOSTRAREPORT') then
    nomeField := 'IdRelatorioEtiquetas';
  if (classname = 'TORCAMENTOREPORT') then
    nomeField := 'IdRelatorioOrcamento';

  if nomeField='' then
    result := -1
  else
  begin
    loginInfo := TLoginUsuario.create;
    loginInfo.getInfoUsuarioLogadoSistema;

    qry := MainData.GetQuery;
    try
      qry.SQL.Text := ' Select '+
                      '   r.ITEM_ID ' +
                      ' from '+
                      '   UsuarioRelatorio ur '+
                      ' JOIN Relatorio r' +
                      '   ON r.IdRelatorio=ur.'+nomeField+
                      ' Where IdUsuario=' + IntToStr(loginInfo.IDUsuario);
      qry.Open;
      if qry.Eof then
        result := -1
      else
        if qry.fields[0].AsString = '' then
          result := -1
        else
          result := qry.fields[0].AsInteger;
    finally
      FreeAndNil(qry);
    end;
  end;}
end;

function TacCustomRelatorioData.isChangeable(className: string): boolean;
begin
  result := false;
end;

class function TacCustomRelatorioData.getTitulo(IdRelatorio: integer): string;
var
  qry: TosSQLQuery;
begin
  qry := acCustomSQLMainData.GetQuery;
  try
    qry.SQL.Text := 'Select titulo from Relatorio Where IdRelatorio=' + IntToStr(IdRelatorio);
    qry.Open;
    if qry.Eof then
      result := ''
    else
      result := qry.fields[0].AsString;
  finally
    FreeAndNil(qry);
  end;
end;

procedure TacCustomRelatorioData.Validate(PDataSet: TDataSet);
begin
  with PDataSet, HError do
  begin
    Clear;
    CheckEmpty(FieldByName('ITEM_ID'));
    CheckEmpty(FieldByName('Titulo'));
    CheckEmpty(FieldByName('IDTipoRelatorio'));
    CheckEmpty(FieldByName('ClasseImpressora'));
    WarningEmpty(FieldByName('CompativelAPartirDaVersao'));
    WarningEmpty(FieldByName('CompativelAteVersao'));
    WarningEmpty(FieldByName('Descricao'));
    Check;
  end;
end;

class function TacCustomRelatorioData.getItemIdByReportId(
  idRelatorio: integer): integer;
var
  qry: TosSQLQuery;
begin
  qry := acCustomSQLMainData.GetQuery;
  try
    qry.SQL.Text := ' Select '+
                    '   ITEM_ID ' +
                    ' FROM Relatorio ' +
                    ' WHERE IDRelatorio = ' + IntToStr(idRelatorio);
    qry.Open;
    result := qry.fields[0].AsInteger;
  finally
    acCustomSQLMainData.FreeQuery(qry);
  end;
end;




end.
