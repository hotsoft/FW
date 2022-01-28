unit osLogin;

interface

uses
  Windows, SysUtils, osSQLDataSet, acCustomSQLMainDataUn, Controls, Dialogs,
    osCustomLoginFormUn, System.UITypes;

type
  TLoginUsuario = class
  private
    FDefaultUserName: string;
    FNome: string;
    FIDUsuario: integer;
    FStatus: string;
    FApelido: string;
    function GetSystemUserName: string;
    function isGrupo(nomeColuna: string; caption: string): boolean;
  public
    property IDUsuario: integer read FIDUsuario;
    property Apelido: string read FApelido;
    property Nome: string read FNome;
    property Status: string read FStatus;
    property DefaultUserName: string read FDefaultUserName write FDefaultUserName;
    procedure getInfoUsuarioLogadoSistema;
    function Login(caption: string): boolean; overload;
    function Login(caption: string; loginFormClass: TLoginFormClass): boolean; overload;
    procedure Logout;
    function isTesoureiro: boolean;
    function isCaixa: boolean;
    constructor create;
  end;

implementation

uses DB, osMD5, StatusUnit;

constructor TLoginUsuario.create;
begin
  FApelido    := '';
  FStatus     := '';
  FNome       := '';
  FIDUsuario  := -1;
end;

procedure TLoginUsuario.getInfoUsuarioLogadoSistema;
var
  query: TosSQLDataSet;
begin
  query := TosSQLDataSet.Create(nil);
  try
    query.SQLConnection := acCustomSQLMainData.SQLConnection;
    query.commandText := 'SELECT IDUsuario, Apelido, Nome, Status FROM Usuario ' +
                         ' where UPPER(Apelido)= ' + QuotedStr(UpperCase(acCustomSQLMainData.ApelidoUsuario));
    query.Open;
    FIDUsuario := query.fieldByName('IDUsuario').AsInteger;
    FNome      := query.fieldByName('Nome').AsString;
    FApelido   := query.fieldByName('Apelido').AsString;
    FStatus    := query.fieldByName('Status').AsString;
  finally
    FreeAndNil(query);
  end;
end;

function TLoginUsuario.GetSystemUserName: string;
const
  MaxUNSize = 20;
var
  BufSize: Cardinal;
  UserName: array [0..MaxUNSize] of char;
begin
  BufSize := MaxUNSize + 1;
  if not GetUserName(@UserName, BufSize) then
    Exception.Create('Não foi possível obter o nome do usuário do sistema. Co'
        + 'ntate o administrador.');
  Result := Copy(UserName, 0, BufSize - 1);
end;

function TLoginUsuario.isCaixa: boolean;
begin
  result := isGrupo('IDGrupoCaixa', 'Login do Caixa');
end;

function TLoginUsuario.isGrupo(nomeColuna: string; caption: string): boolean;
var
  query: TosSQLDataSet;
begin
  query := TosSQLDataSet.Create(nil);
  try
    query.SQLConnection := acCustomSQLMainData.SQLConnection;
    query.CommandText := 'SELECT                                        ' +
                         ' Apelido '+
                         '   FROM                                       ' +
                         '     usuario u                                ' +
                         '     JOIN grupousuario gu                     ' +
                         '       ON gu.idusuario=u.idusuario            ' +
                         '     JOIN ParametroSistema ps                 ' +
                         '       ON ps.' + nomeColuna + '=gu.idGrupo    ' +
                         'WHERE '+
                         '  u.Apelido=' + QuotedStr(FApelido);
    query.Open;
    result := not(query.eof);
  finally
    FreeAndNil(query);
  end;
end;

function TLoginUsuario.isTesoureiro: boolean;
begin
  result := isGrupo('IDGrupoTesoureiro','Login do Tesoureiro');
end;

function TLoginUsuario.Login(caption: string): boolean;
begin
  result := login(caption, TosCustomLoginForm);
end;

function TLoginUsuario.Login(caption: string;
  loginFormClass: TLoginFormClass): boolean;
const
  MaxErrorCount = 3;
var
  LoginForm: TosCustomLoginForm;
  query: TosSQLDataSet;
  ErrorCount: integer;
  LoginCorrect: boolean;
begin
  LoginForm := loginFormClass.Create(nil);
  LoginForm.Caption := caption;
  query := TosSQLDataSet.Create(nil);
  try
  {$IFDEF DESENV}
    LoginForm.UsernameEdit.Text := 'Desenvolvedor';
    LoginForm.PasswordEdit.Text := 'Desenv';
  {$ELSE}
    if FDefaultUserName<>'' then
      LoginForm.UsernameEdit.Text := FDefaultUserName
    else
      LoginForm.UsernameEdit.Text := GetSystemUserName;

    LoginForm.PasswordEdit.Text := '';
  {$ENDIF}


    LoginForm.FocusedControl := LoginForm.UsernameEdit;

    ErrorCount := 0;
    LoginCorrect := False;

    while (not LoginCorrect) and (ErrorCount < MaxErrorCount)
        and (mrCancel <> LoginForm.ShowModal) do
    begin
      query.SQLConnection := acCustomSQLMainData.SQLConnection;
      query.CommandText := 'SELECT idusuario, apelido, nome, senha, status FROM USUARIO' +
        ' WHERE lower(apelido) = ' + quotedStr(LowerCase(LoginForm.UsernameEdit.Text));
      query.Open;
      try
        if query.RecordCount = 0 then
        begin
          MessageDlg('Usuário inexistente.', mtError, [mbOK], 0);
          LoginForm.FocusedControl := LoginForm.UsernameEdit;
          Inc(ErrorCount);
        end
        else if (query.FieldByName('Senha').Value <> MD5Digest(LoginForm.PasswordEdit.Text))
            and (not query.FieldByName('Senha').IsNull or (LoginForm.PasswordEdit.Text <> '')) then
        begin
          MessageDlg('Senha incorreta.', mtError, [mbOK], 0);
          LoginForm.FocusedControl := LoginForm.PasswordEdit;
          Inc(ErrorCount);
        end
        else if query.FieldByName('Status').AsString <> stuAtivo then
        begin
          MessageDlg('Usuário Inativo.', mtError, [mbOK], 0);
          LoginForm.FocusedControl := LoginForm.UsernameEdit;
        end
        else
        begin
          FIDUsuario := query.fieldByName('IDUsuario').AsInteger;
          FApelido := query.fieldByName('Apelido').AsString;
          FNome := query.fieldByName('Nome').AsString;
          FStatus := query.fieldByName('Status').AsString;
          LoginCorrect := True;
        end;
      finally
        query.Close;
      end;
    end;
  finally
    FreeAndNil(query);
    FreeAndNil(LoginForm);
  end;

  Result := LoginCorrect;
end;



procedure TLoginUsuario.Logout;
begin
  FApelido    := '';
  FStatus     := '';
  FNome       := '';
  FIDUsuario  := -1;
end;

end.
 
