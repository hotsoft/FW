unit UtilsUnit;

interface

uses
  {$IFDEF VER250}IBServices,{$ENDIF}{$IFDEF VER320}IBX.IBServices,{$ENDIF}
  INIFiles, System.Zip, System.IOUtils, StrUtils,
  Classes, Math, RegExpr, DB, DBClient, Winapi.PsApi,
  osSQLConnection, osSQLQuery, WinSock, Soap.EncdDecd, Vcl.Imaging.PngImage, Vcl.Imaging.Jpeg, TlHelp32,
  Vcl.Imaging.GifImg, WinSpool, Winapi.Windows, System.SysUtils,  IdHashSHA,
  Vcl.Graphics, Winapi.Messages, SHFolder, IdCoderMIME, Data.SqlExpr, System.Generics.Collections,
  Data.DBXJSON, IdHTTP, acNetUtils, Data.DBXPlatform;

type
  TKeyValue = class(TDictionary<string, string>);

  TFormOrigem  = (TabEditConvenio, TabEditLaudo, TabEditExame);

  THSHash = class
    class function CalculaHash(conteudo: string; pDig : Integer = 2): string;
    class function GeraHashPCMed(linha: string): string;
  end;

const 
  sMODELOMSGLOG = #13+#13+'Campo %s alterado.'+#13+'De: %s'+#13+'Para: %s';  
  szChar = SizeOf(Char);

function isDigitOrControl(Key: char): boolean;
function RemoveAcento(Str:String): String;
procedure criarArquivoBackupIB(nomeArq: string);
function getSombraValue(Str:String): String;
function TiraSimbolos(Str: String): String;
function LastDayOfMonth(dia: TDate = 0): TDate;
function roundToCurr(val: double): double;
procedure ListFileDir(Path: string; FileList: TStrings; pExtensao: string = 'xml');
function isNumeric(valor: string; acceptThousandSeparator: Boolean = False): boolean;
function isIP(valor: string): boolean;
function isConvert(Str: string): boolean;
function extractPhoneNumber(Str: String; defaultDDD: string = '041'): string;
function InvertIntOn(const ANumberL, ANumberH: Integer): Int64;
function InvertIntOff(const ANumberL, ANumberH: Integer): Int64;
function ConvertIntToBase(ANumber: Int64): string;
function RegistroDuplicado(PDataSet: TDataSet; IDField: string): Boolean;
function ConverteFK(id: Integer): string;
function ValidaTempo(tempo: string): string;
function ValidaMinutos(tempo: string): Boolean;
function ValidaHoras(tempo: string): Boolean;
function ValidaIntervalo(inicio: string; fim: string; permiteIgual: Boolean = false): Boolean;
function FormataHora(tempo: string): string;
function GetHora(tempo: string): Integer;
function GetMinuto(tempo: string): Integer;
function ConverteData(data: string): TDateTime;
function ConverteDataHora(data: string): TDateTime;
function NomeDaTecla(Key: Word): string;
function RoundToCurrency(const AValue: Currency; const ADigit: TRoundToRange = -2): Currency;
function ConverteTecladoNumerico(Key: Word): Word;
function ConverteMinutos(minutos: Integer): string;
function GetDateTime(conn: TSQLConnection): TDateTime;
function GetNewID(conn: TSQLConnection): Integer;
function GetGenerator(conn: TSQLConnection; generator: string): Integer;
function ConverteStrToDate(data: string): TDateTime;
function ConverteStrToDate2(data: string): TDateTime;
function ConverteStrToDate3(data: string): TDateTime;
function ConverteStrToDate4(data: string): TDateTime;
function GetIPAddress: string;
function GetCurrentIpList:TSTringList;
function FieldHasChanged(aField : TField):Boolean;
procedure CheckChangedFields(aDataSet: TClientDataSet; aChangedFields: TStringList);
function ValueIsEmptyNull(aValue : Variant):Boolean;
function getDescricaoSexo(const vValor : Variant):String;
function getDescricaoSimNao(const vValor : Variant):String;
function getDescricaoTipoResultado(const vValor : Variant):String;
procedure ClonarDadosClientDataSet(cdsOrigem: TClientDataSet; cdsDestino: TClientDataSet);
function FormataStringList(texto, delimitador: string): string;
function ApenasNumeros(const valor : String) : String;
function ApenasLetrasNumeros(nStr:String): String;
function ZeraEsquerda(const Valor:String; const Tamanho:Integer): String;
function EspacoDireita(Valor: String; const Tamanho: Integer): String;
function KeyToStr(Key:Word): String;
function Base64FromBinary(const FileName: String): string;
function Base64FromText(const text: String): string;
function TextFromBase64(const text: String): string;
function BinaryFromBase64(const base64: string): TBytesStream;
function Base64ToBitmap(base64Field: TBlobField): TBitmap;
function Base64FromStream(const input: TStream): string;
function TestConnection(const url: String; conn: TosSQLConnection = nil): boolean;
function SortCustomClientDataSet(ClientDataSet: TClientDataSet;
  const FieldName: string): Boolean;
function getUriUrlStatus(const address: String; stream: TStream; AOwner: TComponent=nil): Boolean;
function GetMacAddress: string;
function GetWindowsDir: string;
function GetPcName: string;
function GetWindowsVersion: string;
function GetLanguage: string;
function GetScrollState: string;
function ScreenResolution: string;
function FreeDiskSpace(strDisk: string): string;
function TimeInWindows: string;
function GetPowerStatus: string;
function GetUser: string;
function getMemoryUsed: Integer;
function GetSystemDecimal: string;
function GetWindowPID(sFile: String): Cardinal;
function EnumProcess(hHwnd: HWND; lParam : integer; var FProcessa: Boolean;
 var FHWND: HWND; var FPid: DWORD; var iListOfProcess: Integer): boolean; stdcall;
function EnumWindowsProc(Wnd: HWND; List: TStringList): BOOL; stdcall;
function KillTask(const ExeFileName: string): Integer;
function GetMD5FromString(const text: string): String;
function GetPageAsstring(const url: string): String;
function GetUrlWithoutParams(const url: String): String;
function GetDllName: string;
function GetTempDirectory: string;
function GetLastErrorMessage: string;
function FormatIP(const ip: string): String;
function TryForceDirectories(const aDir: string): String; overload;
function TryForceDirectories(const aDir: string; out aErrorMessage: string): boolean; overload;
function GetSHA1FromString(const text: string): string;
function GetSHA1FromFile(const path: string): string;
function GetFileSize(const filename: widestring): Int64;
function GetTelaAprovacao(conn: TosSQLConnection) : string;
function GetSpecialFolderPath(const folder : integer) : string;
function GetProgramDataAppDataFolder: string;
function MD5File(const FileName: string): string;
function HandleException(const aURL: string): string;
procedure ParseJSONObject(aDict: TKeyValue; aJsonValue: TJSONValue;
  aJsonString: TJSONString; aJsonPairEnum: TJSONPairEnumerator;
  aJsonArrayEnum: TJSONArrayEnumerator);

function GetIdHttp: TIdHTTP;
function getJsonStringFromServer(const aURL: string; var aException: string): string;
function MappJsonToDict(const aJsonString: string) : TJsonArray;
function GetListaCamposTabela(conn: TSQLConnection; pTabela: String): TStringList;
procedure SaveToFile(const aFilename, aContent: string);
function LoadFromFile(const aFileName: string): string;
Function FileIsOpen(const FileName : TFileName) : Boolean;
procedure UpdateProxy(dir: string);
procedure RemoveDiretorio(Dir: String);
function ExtractBetween(const Value, A, B: string): string;


implementation

uses DateUtils, Variants, StatusUnit, IdSSLOpenSSL, IdMultipartFormData, IdExceptionCore, IdStack,
  IdHash, IdHashMessageDigest, IdGlobal, IdURI, ParametroSistemaDataUn;


const
  CSIDL_COMMON_APPDATA = $0023;

function ApenasNumeros(const valor : String) : String;
var
  i : byte;
begin
  Result := EmptyStr;
  for i := 1 to length(valor) do
    if CharInSet(valor[i], ['0'..'9']) then
      Result := result + valor[i];
end;

function ApenasLetrasNumeros(nStr:String): String;
Var
   I: Integer;
begin
  Result := '';
  for I := 1 to Length(nStr) do
    if CharInSet(nStr[I], ['0'..'9','a'..'z','A'..'Z',Chr(8)]) then
       Result := Result + nStr[I]; 
end;

function FormataStringList(texto, delimitador: string): string;
begin
  Result := '"' + StringReplace(texto,
    delimitador, '"' + delimitador + '"', [rfReplaceAll]) + '"';
end;  

// 20001020
function ConverteData(data: string): TDateTime;
begin
  Result := StrToDateTime(Copy(data,7,2)+'/'+Copy(data,5,2)+'/'+Copy(data,1,4));
end;

// 20001020235959
function ConverteDataHora(data: string): TDateTime;
begin
  Result := StrToDateTime(Copy(data,7,2)+'/'+Copy(data,5,2)+'/'+Copy(data,1,4)+' '+
      Copy(data,9,2)+':'+Copy(data,11,2)+':'+Copy(data,13,2));
end;

procedure ListFileDir(Path: string; FileList: TStrings; pExtensao: string = 'xml');
var
  SR: TSearchRec;
begin
  if FindFirst(Path + '\*.'+pExtensao, faAnyFile, SR) = 0 then
  begin
    repeat
      if (SR.Attr <> faDirectory) then
      begin
        FileList.Add(SR.Name);
      end;
    until FindNext(SR) <> 0;
    FindClose(SR);
  end;
end;

function isDigitOrControl(Key: char): boolean;
var
  um, dois, tres, quatro, cinco: boolean;
begin
  //este código está muito muito feio
  um := ord(key)<32;
  dois := ord(key)=127;
  tres := ord(key)>47;
  quatro := ord(key)<58;
  cinco := um or dois or (tres and quatro);
  result := cinco;
end;

function RemoveAcento(Str:String): String;
Const
  ComAcento = 'àâêôûãõáéíóúçüäÀÂÊÔÛÃÕÁÉÍÓÚÇÜÄ';
  SemAcento = 'aaeouaoaeioucuaAAEOUAOAEIOUCUA';
Var
  x : Integer;
Begin
  For x := 1 to Length(Str) do
    if Pos(Str[x],ComAcento)<>0 Then
      Str[x] := SemAcento[Pos(Str[x],ComAcento)];
  Result := Str;
end;

procedure criarArquivoBackupIB(nomeArq: string);
var
  IBBackup: TIBBackupService;
  zipper: TZipFile;
begin
  IBBackup := TIBBackupService.Create(nil);
  zipper := TZipFile.Create;
  try
    DeleteFile('tmp.gbk');
    IBBackup.Active := false;
    IBBackup.DatabaseName := ExtractFilePath(ParamStr(0)) + '..\DB\' +
      copy(ExtractFileName(ParamStr(0)),1,pos('.',ExtractFileName(ParamStr(0)))-1) + '.gdb';
    IBBackup.LoginPrompt := false;
    IBBackup.Params.Clear;
    IBBackup.Params.Add('user_name=sysdba');
    IBBackup.Params.Add('password=masterkey');
    IBBackup.BackupFile.Add(ExtractFilePath(ParamStr(0)) + 'tmp.gbk');
    IBBackup.Active := true;
    IBBackup.ServiceStart;
    while IBBackup.IsServiceRunning do Sleep(1);
    IBBackup.Active := false;
    DeleteFile(PCHAR(ExtractFilePath(ParamStr(0)) + 'tmp.zip'));
    Zipper.Open(ExtractFilePath(ParamStr(0)) + 'tmp.zip', zmWrite);
    Zipper.Add(ExtractFilePath(ParamStr(0)) + 'tmp.gbk');
    Zipper.Close;
    deleteFile(PCHAR(ExtractFilePath(ParamStr(0)) + '..\backups\ultimoBackup.bkp'));
    CopyFile(PWideChar(ExtractFilePath(ParamStr(0)) + 'tmp.zip'),
      PWideChar(ExtractFilePath(ParamStr(0)) + '..\backups\ultimoBackup.bkp'),false);
    RenameFile(ExtractFilePath(ParamStr(0)) + 'tmp.zip', nomeArq);
    DeleteFile(PCHAR(ExtractFilePath(ParamStr(0)) + 'tmp.gbk'));
    DeleteFile(PCHAR(ExtractFilePath(ParamStr(0)) + 'tmp.zip'))
  finally
    FreeAndNil(zipper);
    FreeAndNil(IBBackup);
  end;
end;

function tiraEspacosDesnecessarios(val: String): string;
var
  adicionouEspaco: boolean;
  i: integer;
  valStr2: string;
begin
  adicionouEspaco := false;
  valStr2 := '';
  for i := 1 to length(val) do
  begin
    if val[i] = ' ' then
    begin
      if not adicionouEspaco then
        adicionouEspaco := true
      else
        continue;
    end
    else
      adicionouEspaco := false;
    valStr2 := valStr2 + val[i];
  end;
  result := valStr2;
end;

function getSombraValue(Str:String): String;
begin
  result := UpperCase(RemoveAcento(tiraEspacosDesnecessarios(trim(str))));
end;

function TiraSimbolos(Str: String): String;
var
  i: integer;
  str2: String;
begin
  str2 := '';
  str  := Trim(Str);
  for i := 1 to length(Str) do Begin
    if Ord(Str[i]) in [Ord('a')..Ord('z'),Ord('A')..Ord('Z'),Ord('0')..Ord('9')] then
      str2 := str2 + Str[i];
  end;
  result := Str2;
end;

function LastDayOfMonth(dia: TDate = 0): TDate;
var
   y, m, d: word;
begin
  if dia = 0 then
    dia := now;
  decodedate(dia, y, m, d) ;
  m := m + 1;
  if m > 12 then
  begin
    y := y + 1;
    m := 1;
  end;
  result := encodedate(y, m, 1) - 1;
end;

function roundToCurr(val: double): double;
begin
  result := roundTo(val, -2);
end;

function isNumeric(valor: string;
  acceptThousandSeparator: Boolean = False): boolean;
begin
  valor := Trim(valor);
  if acceptThousandSeparator then
    Result := ExecRegExpr('^((\d{1,3}(\.\d{3})*)|(\d+))(,\d+)?$', valor)
  else
    Result := ExecRegExpr('^\d+(,\d+)?$', valor);
end;

function isIP(valor: string): boolean;
begin
  valor := Trim(valor);
  Result := ExecRegExpr('^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}?$', valor);
end;

function isConvert(Str: string): boolean;
var
  Qtd, i: Smallint;
  StrAux: String;
  Posicao: Array[1..50] of Integer;
  existe, possui: Boolean;
begin
  for i := 1 to 50 do
    Posicao[i] := 0;

  Qtd := 0;
  StrAux := Str;

  // Qtde de ocorrências do caracter "."
  while Pos('.', StrAux) > 0 do
  begin
    Inc(Qtd);
    Posicao[Qtd] := Pos('.', StrAux);
    StrAux[Pos('.', StrAux)] := '*';
  end;

  existe := false;
  // Verifica se existe uma ocorrência após a outra Ex.: 1.000..000
  if(Qtd > 1) then
    for i := 1 to Qtd-1 do
      if(Posicao[i]+1) = (Posicao[i+1]) then
        existe := True;

  possui := false;
  // Verifica se a ocorrência está correta Ex.: 1.0000.000
  if(Qtd > 1) then
  begin
    if(Posicao[1] > 4) then
      possui := true;

    if(Posicao[Qtd]+3) > Length(Str) then
      possui := true;

    for i := 1 to Qtd-1 do
      if(Posicao[i]+4) <> (Posicao[i+1]) then
        possui := true;
  end
  else if(Qtd = 1) and ((Posicao[1]+3) > Length(Str)) then
    possui := true;

  Result := not(existe) and  not(possui);
end;

function extractPhoneNumber(Str: String; defaultDDD: string = '041'): string;
var
  i: integer;
  res: string;
begin
  res := '';
  for i := 1 to length(Str) do
    if isNumeric(str[i]) then
      res := res + str[i];
  if Length(res) = 11 then
    result := res
  else if Length(res) = 8 then
    result := defaultDDD + res
  else if length(res) = 10 then
    result := '0' + res
  else
    result := '00000000000';
end;

function InvertIntOn(const ANumberL, ANumberH: Integer): Int64;
asm
  XOR EAX,$FFFFFFFF
  XOR EDX,$FFFFFFFF
  OR  EDX,$80000000
end;

function InvertIntOff(const ANumberL, ANumberH: Integer): Int64;
asm
  XOR EAX,$FFFFFFFF
  XOR EDX,$FFFFFFFF
end;

function ConvertIntToBase(ANumber: Int64): string;
const
  CBaseMap: array[0..31] of Char = (
    '2','3','4','5','6','7','8','9', //0-7
    'A','B','C','D','E','F','G','H', //8-15
    'J','K','L','M','N', //16-20
    'P','Q','R','S','T','U','V','X','W','Y','Z'); //21-31
var
  I: Integer;
begin
  SetLength(Result, 15);
  I := 0;

  if ANumber < 0 then
  begin
    Inc(I);
    Result[I] := '1';
    ANumber := InvertIntOff(ANumber and $FFFFFFFF, (ANumber and $FFFFFFFF00000000) shr 32);
  end;

  while ANumber <> 0 do
  begin
    Inc(I);
    Result[I] := CBaseMap[ANumber and $1F];
    ANumber := ANumber shr 5;
  end;

  SetLength(Result, I);
end;

function RegistroDuplicado(PDataSet: TDataSet; IDField: string): Boolean;
var
  ID: TField;
  CDS: TClientDataset;
  RecNoJaExiste : Integer;
begin
  CDS := TClientDataSet.Create(nil);
  try
    CDS.CloneCursor(TCustomClientDataSet(PDataSet), True);
    ID := PDataSet.FieldByName(IDField);
    if CDS.Locate(IDField,ID.Value,[loCaseInsensitive]) then
    begin
      RecNoJaExiste := CDS.RecNo;
      if RecNoJaExiste <> PDataSet.RecNo then
        Result := True
      else
        Result := False;
    end
    else
      Result := False;
  finally
    FreeAndNil(CDS);
  end;
end;

function ConverteFK(id: Integer): string;
begin
  if (id = 0) then
    Result := 'null'
  else
  begin
    Result := IntToSTr(id);
  end;
end;

function ValidaTempo(tempo: string): string;
var
  hora: Integer;
  tamanho: Integer;
begin
  tamanho := Length(tempo);
  Result := 'ok';
  if (Trim(tempo) = ':') or (Trim(tempo) = '') then
    Result := 'vazio'
  else if (Trim(Copy(tempo,0,tamanho-3)) = '') or (Trim(Copy(tempo,tamanho-1,2)) = '') then
    Result := 'incorreto'
  else if not TryStrToInt(Trim(Copy(tempo,0,tamanho-3)), hora) then
    Result := 'incorreto';
end;

function ValidaMinutos(tempo: string): Boolean;
var
  minuto: Integer;
  tamanho: Integer;
begin
  tamanho := Length(tempo);
  minuto := StrToIntDef(Trim(Copy(tempo,tamanho-1,2)),0);
  Result := not (minuto > 59);
end;

function ValidaHoras(tempo: string): Boolean;
var
  hora: Integer;
begin
  hora := StrToIntDef(Trim(Copy(tempo,0,2)),0);
  Result := not (hora > 23);
end;

function ValidaIntervalo(inicio: string; fim: string; permiteIgual: Boolean): Boolean;
var
  horaInicio, minutoInicio: Integer;
  horaFim, minutoFim: Integer;
  tamInicio, tamFim: Integer;
begin
  tamInicio := Length(inicio);
  tamFim := Length(fim);
  horaInicio := StrToIntDef(Trim(Copy(inicio,0,tamInicio-3)),0);
  minutoInicio := StrToIntDef(Trim(Copy(inicio,tamInicio-1,2)),0);
  horaFim := StrToIntDef(Trim(Copy(fim,0,tamFim-3)),0);
  minutoFim := StrToIntDef(Trim(Copy(fim,tamFim-1,2)),0);

  Result := True;
  if (horaFim <= horaInicio) then
  begin
    if (horaFim = horaInicio) then
    begin
      if (minutoInicio < minutoFim) then
        Exit
      else if (minutoInicio = minutoFim) and (permiteIgual) then
        Exit;
    end;
    Result := False;
  end;
end;

// essa função corrige horas como 1_:00, 1_:_0
function FormataHora(tempo: string): string;
var
  hora: Integer;
  minuto: Integer;
  sHora: string;
  sMinuto: string;
begin
  hora := GetHora(tempo);
  if hora = 0 then
    sHora := '00'
  else
    sHora := IntToStr(hora);

  minuto := GetMinuto(tempo);
  if minuto = 0 then
    sMinuto := '00'
  else
    sMinuto := IntToStr(minuto);

  Result := sHora+':'+sMinuto;
end;

function GetHora(tempo: string): Integer;
var
  tam: Integer;
begin
  tam := Length(tempo);
  Result := StrToIntDef(Trim(Copy(tempo,0,tam-3)),0);
end;

function GetMinuto(tempo: string): Integer;
var
  tam: Integer;
begin
  tam := Length(tempo);
  Result := StrToIntDef(Trim(Copy(tempo,tam-1,2)),0);
end;


function NomeDaTecla(Key: Word): string;
var
  keyboardState: TKeyboardState;
  asciiResult: Integer;
begin
  case Key of
    VK_BACK:    Result := '[BACKSPACE]'; //backspace
    VK_RETURN:  Result := '[ENTER]'; //enter
    VK_SHIFT:   Result := '[SHIFT]';	//Shift key
    VK_CONTROL: Result := '[CTRL]';	//Ctrl key
    VK_MENU:    Result := '[ALT]';	//Alt key
    VK_ESCAPE:  Result := '[ESC]';	//Esc key
    VK_CAPITAL: Result := '[CAPS LOCK]';
    VK_SPACE:   Result := '[ESPAÇO]';	//Space bar
    VK_LEFT:    Result := '[SETA PARA ESQUERDA]';	//Left Arrow key
    VK_UP:      Result := '[SETA PARA CIMA]';	//Up Arrow key
    VK_RIGHT:   Result := '[SETA PARA DIREITA]';	//Right Arrow key
    VK_DOWN:    Result := '[SETA PARA BAIXO]';	//Down Arrow key
    VK_INSERT:  Result := '[INSERT]';	//Insert key
    VK_DELETE:  Result := '[DELETE]';	//Delete key
    VK_END:     Result := '[END]';	//End key
    VK_HOME:    Result := '[HOME]';	//Home key
    VK_PRIOR:   Result := '[PAGE UP]';	//Page Up key
    VK_NEXT:    Result := '[PAGE DOWN]';	//Page Down key
    VK_TAB:     Result := '';	//Tab key
    VK_NUMPAD0: Result := '0';	//96 0 key (numeric keypad)
    VK_NUMPAD1: Result := '1';	//97 1 key (numeric keypad)
    VK_NUMPAD2: Result := '2';	//98 2 key (numeric keypad)
    VK_NUMPAD3: Result := '3';	//99 3 key (numeric keypad)
    VK_NUMPAD4: Result := '4';	//100 4 key (numeric keypad)
    VK_NUMPAD5: Result := '5';	//101 5 key (numeric keypad)
    VK_NUMPAD6: Result := '6';	//102 6 key (numeric keypad)
    VK_NUMPAD7: Result := '7';	//103 7 key (numeric keypad)
    VK_NUMPAD8: Result := '8';	//104 8 key (numeric keypad)
    VK_NUMPAD9: Result := '9';	//105 9 key (numeric keypad)
    VK_MULTIPLY:  Result := '*';	//106 Multiply key (numeric keypad)
    VK_ADD:       Result := '+';	//107 Add key (numeric keypad)
    VK_SEPARATOR: Result := '.';	//108 / 194 Separator key (numeric keypad)
    VK_SUBTRACT:  Result := '-';	//109 Subtract key (numeric keypad)
    VK_DECIMAL:   Result := ',';	//110 Decimal key (numeric keypad)
    VK_DIVIDE:    Result := '/';	//111 Divide key (numeric keypad)
    194:    Result := '.';  //. numeric keypad
    VK_F1:  Result := '[F1]';	//F1 key
    VK_F2:  Result := '[F2]';	//F2 key
    VK_F3:  Result := '[F3]';	//F3 key
    VK_F4:  Result := '[F4]';	//F4 key
    VK_F5:  Result := '[F5]';	//F5 key
    VK_F6:  Result := '[F6]';	//F6 key
    VK_F7:  Result := '[F7]';	//F7 key
    VK_F8:  Result := '[F8]';	//F8 key
    VK_F9:  Result := '[F9]'; //F9 key
    VK_F10: Result := '[F10]'; //F10 key
    VK_F11: Result := '[F11]'; //F11 key
    VK_F12: Result := '[F12]'; //F12 key
    219: Result := '´'; //´ acento
    222: Result := '~'; //~ acento
  else
    GetKeyboardState(keyboardState);
    SetLength(Result, 10) ;
    asciiResult := ToAscii(key, MapVirtualKey(key, 0), keyboardState, @Result[1], 0) ;
    case asciiResult of
      0: Result := '';
      1: SetLength(Result, 1);
      2:;
      else
        Result := '';
    end;
    if Trim(Result) <> '' then
      Result := UpperCase(Result);
  end;
end;

function RoundToCurrency(const AValue: Currency; const ADigit: TRoundToRange): Currency;
var
  LFactor: Extended;
  rmOrig: TFPURoundingMode;
begin
  rmOrig := GetRoundMode();
  if rmOrig <> rmNearest then
    SetRoundMode(rmNearest);

  LFactor := IntPower(10, ADigit);
  Result := Round(AValue / LFactor) * LFactor;

  if rmOrig <> rmNearest then
    SetRoundMode(rmOrig);
end;

function ConverteTecladoNumerico(Key: Word): Word;
begin
  Result := 190;
  case Key of
    VK_NUMPAD0: Result := 48;	//96 0 key (numeric keypad)
    VK_NUMPAD1: Result := 49;	//97 1 key (numeric keypad)
    VK_NUMPAD2: Result := 50;	//98 2 key (numeric keypad)
    VK_NUMPAD3: Result := 51;	//99 3 key (numeric keypad)
    VK_NUMPAD4: Result := 52;	//100 4 key (numeric keypad)
    VK_NUMPAD5: Result := 53;	//101 5 key (numeric keypad)
    VK_NUMPAD6: Result := 54;	//102 6 key (numeric keypad)
    VK_NUMPAD7: Result := 55;	//103 7 key (numeric keypad)
    VK_NUMPAD8: Result := 56;	//104 8 key (numeric keypad)
    VK_NUMPAD9: Result := 57;	//105 9 key (numeric keypad)
    VK_MULTIPLY:  Result := 106;	//106 Multiply key (numeric keypad)
    VK_ADD:       Result := 107;	//107 Add key (numeric keypad)
    VK_SEPARATOR: Result := 194;	//108 / 194 Separator key (numeric keypad)
    VK_SUBTRACT:  Result := 189;	//109 Subtract key (numeric keypad)
    VK_DECIMAL:   Result := 188;	//110 Decimal key (numeric keypad)
    VK_DIVIDE:    Result := 193;	//111 Divide key (numeric keypad)
    194: Result := 190;
  end;
end;

function ConverteMinutos(minutos: Integer): String;
var
  horas: Integer;
  h,m: string;
begin
  if minutos < 0 then
  begin
    minutos := minutos * -1;
    Result := '-';
  end
  else
    Result := '';

  horas := minutos div 60;
  minutos := minutos mod 60;

  h := IntToStr(horas);
  if Length(h) = 2 then
    h := '0'+h
  else if Length(h) = 1 then
    h := '00'+h;

  m := IntToStr(minutos);
  if Length(m) = 1 then
    m := '0'+m;
  Result := Result+h+':'+m;
end;

function GetDateTime(conn: TSQLConnection): TDateTime;
var
  qry: TosSQLQuery;
begin
  try
    qry := TosSQLQuery.Create(nil);
    qry.SQLConnection := conn;
    qry.SQL.Text := 'select CURRENT_TIMESTAMP as DataHoraServidor from RDB$DATABASE';
    qry.Open;
    Result := qry.FieldByName('DataHoraServidor').AsDatetime;
  finally
    qry.Close;
    FreeAndNil(qry);
  end;
end;

function GetNewID(conn: TSQLConnection): Integer;
var
  qry: TosSQLQuery;
begin
  try
    qry := TosSQLQuery.Create(nil);
    qry.SQLConnection := conn;
    qry.SQL.Text := 'select gen_id(KGIDHIGH, 1) id from RDB$DATABASE';
    qry.Open;

    Result := qry.FieldByName('id').AsInteger * 10;
  finally
    FreeAndNil(qry);
  end;
end;

function GetGenerator(conn: TSQLConnection; generator: string): Integer;
var
  qry: TosSQLQuery;
begin
  try
    qry := TosSQLQuery.Create(nil);
    qry.SQLConnection := conn;
    qry.SQL.Text := 'select gen_id('+generator+', 1) id from RDB$DATABASE';
    qry.Open;

    Result := qry.FieldByName('id').AsInteger * 10;
  finally
    FreeAndNil(qry);
  end;
end;

// 2000/10/20
function ConverteStrToDate(data: string): TDateTime;
begin
  Result := StrToDateTime(Copy(data,9,2)+'/'+Copy(data,6,2)+'/'+Copy(data,1,4));
end;

// 10/20/00
function ConverteStrToDate2(data: string): TDateTime;
begin
  Result := StrToDateTime(Copy(data,4,2)+'/'+Copy(data,1,2)+'/'+
    Copy(FormatDateTime('yyyy',Today),1,2)+Copy(data,7,2));
end;

//010120131015 => 01/01/2013 10:15
function ConverteStrToDate3(data: string): TDateTime;
begin
  Result := StrToDateTime(Copy(data,1,2)+'/'+Copy(data,3,2)+'/20'+Copy(data,5,2)+' '+
    Copy(data,7,2)+':'+Copy(data,9,2));
end;

//19800515
function ConverteStrToDate4(data: string): TDateTime;
begin
  Result := StrToDate(Copy(data,7,2)+'/'+Copy(data,5,2)+'/'+Copy(data,1,4));
end;

function GetIPAddress: string;
var
  Buffer: array[0..255] of AnsiChar;
  RemoteHost: PHostEnt;
  tempAddress: Integer;
  BufferR: array[0..3] of Byte absolute tempAddress;
begin
  Winsock.GetHostName(@Buffer, 255);
  RemoteHost := Winsock.GetHostByName(Buffer);
  if RemoteHost = nil then
  begin
    tempAddress := winsock.htonl($07000001); { 127.0.0.1 }
  end
  else
  begin
    tempAddress := longint(pointer(RemoteHost^.h_addr_list^)^);
    tempAddress := Winsock.ntohl(tempAddress);
  end;
  Result := Format('%d.%d.%d.%d', [BufferR[3], BufferR[2], BufferR[1], BufferR[0]]);
end;

Function GetCurrentIpList:TSTringList;
type
  TaPInAddr = array [0..10] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  phe : PHostEnt;
  pptr : PaPInAddr;
  Buffer : array [0..63] of Ansichar;
  I : Integer;
  GInitData : TWSADATA;
begin
  Result:=TStringList.Create;
  WSAStartup($101, GInitData);
  GetHostName(Buffer, SizeOf(Buffer));
  phe :=GetHostByName(buffer);
  if phe = nil then
    Exit;
  pptr := PaPInAddr(Phe^.h_addr_list);
  I := 0;
  while pptr^[I] <> nil do
  begin
    result.add(String(inet_ntoa(pptr^[I]^)));
    Inc(I);
  end;
  WSACleanup;
end;

function FormatIP(const ip: string): String;
var
  _ip: TStringList;
begin
  Result := ip;
  _ip := TStringList.Create;
  _ip.Delimiter := '.';
  _ip.DelimitedText := ip;
  try
    Result := Format('%.3d.%.3d.%.3d.%.3d', [StrToIntDef(_ip[0], 1), StrToIntDef(_ip[1], 1), StrToIntDef(_ip[2], 1), StrToIntDef(_ip[3], 1)]);
  finally
    FreeAndNil(_ip);
  end;
end;

class function THSHash.CalculaHash(conteudo: string; pDig : Integer = 2): string;
var
  sum, i : Integer;
  HFrame : string;
begin
  sum := 0;
  for i := 1 to Length(conteudo) do
  begin
    sum := sum + Ord(conteudo[i]);
  end;
  HFrame := IntToHex(sum mod 256,pDig);

  if (Length(HFrame) < 2) then
  HFrame := '0' + HFrame;

  result := UpperCase(HFrame);
end;


class function THSHash.GeraHashPCMed(linha: string): string;
var
  i: Integer;
  valor: integer;
  hexa: string;
begin
  valor := 0;
  for i := 1 to Length(linha) do
  begin
    valor := valor + ord(copy(linha,i,1)[1]);
  end;
  valor := valor mod 256;
  hexa := IntToHex(valor,0);
  Result :=  hexa;
end;

function FieldHasChanged(aField : TField):Boolean;
begin
  case AField.DataType of
    ftString : Result := Trim(VarToStrDef(aField.OldValue,'')) <> Trim(VarToStrDef(aField.NewValue,''));
    ftMemo : Result := Trim(VarToStrDef(aField.OldValue,'')) <> Trim(VarToStrDef(aField.NewValue,''));
  else
    if ValueIsEmptyNull(aField.OldValue) and ValueIsEmptyNull(aField.NewValue) then
      result := False
    else
      Result := aField.OldValue <> aField.NewValue;
  end;
end;

procedure CheckChangedFields(aDataSet: TClientDataSet; aChangedFields: TStringList);
var
  _i: integer;
begin
  aChangedFields.Clear;
  for _i := 0 to aDataSet.FieldCount - 1 do
  begin
    if (aDataSet.Fields[_i].FieldKind = fkData) and
       (aDataSet.Fields[_i].DataType in [ftString, ftSmallint, ftInteger, ftWord,
                                         ftBoolean, ftFloat, ftCurrency, ftBCD, ftDate, ftTime, ftDateTime,
                                         ftWideString, ftLargeint, ftLongWord, ftShortint,
                                         ftByte, ftExtended]) and
       (not aDataSet.Fields[_i].IsNull) then
    begin
      if UtilsUnit.FieldHasChanged(aDataSet.Fields[_i]) then
        aChangedFields.Add(aDataSet.Fields[_i].FieldName);
    end;
  end;
end;


function ValueIsEmptyNull(aValue : Variant):Boolean;
begin
  Result := VarIsEmpty(aValue) or VarIsNull(aValue);

  if (not Result) and VarIsStr(aValue) then
    Result := Trim(varToStr(aValue)) = EmptyStr
end;

function getDescricaoSexo(const vValor : Variant):String;
var
  cValor : Char;
begin
  cValor := Char(AnsiString(VarToStrDef(vValor, ' '))[1]);
  case cValor of
    spMasculino : Result := 'Masculino';
    spFeminino : Result := 'Feminino';
    spAmbos : Result := 'Ambos';
  else
    result := '';
  end;
end;

function getDescricaoSimNao(const vValor : Variant):String;
var
  cValor : Char;
begin
  try
    cValor := Char(AnsiString(VarToStrDef(vValor, ' '))[1]);
    case cValor of
      'S' : Result := 'Sim';
      'N' : Result := 'Não';
    else
      result := '';
    end;
  except
    result := 'Indefinido'
  end;
end;

function getDescricaoTipoResultado(const vValor : Variant):String;
var
  cValor : Char;
begin
  cValor := Char(AnsiString(VarToStrDef(vValor, ' '))[1]);
  case cValor of
    satrGerme : Result := 'Germe';
    satrNumerico : Result := 'Número';
    satrParasita : Result := 'Parasita';
    satrTexto : Result := 'Texto';
    satrTitulo : Result := 'Título';
  else
    result := '';
  end;
end;

procedure ClonarDadosClientDataSet(cdsOrigem: TClientDataSet; cdsDestino: TClientDataSet);
var
  field : TField;
  i: Integer;
begin
  if cdsOrigem.Fields.Count <> cdsDestino.Fields.Count then
  begin
    for i := 0 to cdsOrigem.FieldCount-1 do
    begin
      if (cdsOrigem.Fields[i]) is TMemoField then
        field := TMemoField.Create(cdsDestino)
      else if (cdsOrigem.Fields[i]) is TIntegerField then
        field := TIntegerField.Create(cdsDestino)
      else
        field := TStringField.Create(cdsDestino);

      Field.FieldKind := fkData;
      Field.FieldName := cdsOrigem.Fields[i].FieldName;
      Field.DisplayLabel := cdsOrigem.Fields[i].DisplayLabel;
      Field.Visible := cdsOrigem.Fields[i].Visible;
      if (cdsOrigem.Fields[i] is TStringField) then
        Field.Size := cdsOrigem.Fields[i].Size;
      Field.DataSet := cdsDestino;
      
    end;
    cdsDestino.Close;
    cdsDestino.CreateDataSet;
  end;


  cdsOrigem.First;
  while not cdsOrigem.Eof do
  begin
    cdsDestino.Append;
    for i := 0 to cdsOrigem.FieldCount-1 do
    begin
      if not cdsOrigem.FieldByName(cdsDestino.Fields[i].FieldName).IsNull then
        cdsDestino.FieldByName(cdsDestino.Fields[i].FieldName).AsString := cdsOrigem.FieldByName(cdsDestino.Fields[i].FieldName).AsString;
    end;
    cdsDestino.Post;
    cdsOrigem.Next;
  end;
end;

function ZeraEsquerda(const Valor:String; const Tamanho:Integer): String;
begin
  Result := Trim(Valor);
  Result := DupeString('0',Tamanho - Length(Result)) + Result;
end;

function EspacoDireita(Valor: String; const Tamanho: Integer): String;
var
  I : Integer ;
begin
  Result := '' ;
  Valor := Trim(Valor);
  for I:=Length(Valor)+1 to Tamanho do
    Result := Result + ' ';  
  Result := Valor + Result ;
end;

function KeyToStr(Key:Word): String;
var
  keyboardState: TKeyboardState;
  asciiResult: Integer;
begin
  GetKeyboardState(keyboardState);
  SetLength(Result, 2);
  asciiResult := ToAscii(key, MapVirtualKey(key, 0), keyboardState, @Result[1], 0);
  case asciiResult of
    1: SetLength(Result, 1)  ;
    2:;
    else Result := '';
  end;
end;


function Base64FromBinary(const FileName: String): string;
var
  Input: TFileStream;
  InputMemoryStream: TMemoryStream;
  Output: UTF8String;
  Encoder: TIdEncoderMIME;
begin
  Result := EmptyStr;
  Output := UTF8Encode(EmptyStr);

  Input := TFileStream.Create(FileName, fmOpenRead);
  InputMemoryStream := TMemoryStream.Create();
  Encoder := TIdEncoderMIME.Create();
  try
    //Soap.EncdDecd.EncodeStream(Input, Output);
    InputMemoryStream.LoadFromStream(Input);
    Output := UTF8Encode(Encoder.EncodeStream(InputMemoryStream, InputMemoryStream.Size));
    Result := UTF8ToString(Output);
  finally
    FreeAndNil(Input);
    FreeAndNil(InputMemoryStream);
    FreeAndNil(Encoder);
  end;
end;

function Base64FromText(const text: String): string;
begin
  Result := Soap.EncdDecd.EncodeString(text);
end;

function TextFromBase64(const text: String): string;
begin
  Result := Soap.EncdDecd.DecodeString(text);
end;

function Base64FromStream(const input: TStream): string;
var
  Output: TStringStream;
begin
  input.Position := 0;
  Output := TStringStream.Create('', TEncoding.ASCII);
  try
    Soap.EncdDecd.EncodeStream(input, Output);
    Result := Output.DataString;
  finally
    Output.Free;
  end;
end;

function BinaryFromBase64(const base64: string): TBytesStream;
var
  Input: TStringStream;
  Output: TBytesStream;
begin
  Input := TStringStream.Create(base64, TEncoding.ASCII);
  try
    Output := TBytesStream.Create;
    try
      Soap.EncdDecd.DecodeStream(Input, Output);
      Output.Position := 0;
      Result := TBytesStream.Create;
      try
        Result.LoadFromStream(Output);
      except
        Result.Free;
        raise;
      end;
    finally
      Output.Free;
    end;
  finally
    Input.Free;
  end;
end;

procedure DetectImage(BS:TBytesStream; BM: TBitmap);
var
  FirstBytes: AnsiString;
  Graphic: TGraphic;
begin
  Graphic := nil;
  SetLength(FirstBytes, 8);
  BS.Read(FirstBytes[1], 8);
  if Copy(FirstBytes, 1, 2) = 'BM' then
  begin
    Graphic := TBitmap.Create;
  end else
  if FirstBytes = #137'PNG'#13#10#26#10 then
  begin
    Graphic := TPngImage.Create;
  end else
  if Copy(FirstBytes, 1, 3) =  'GIF' then
  begin
    Graphic := TGIFImage.Create;
  end else
  if Copy(FirstBytes, 1, 2) = #$FF#$D8 then
  begin
    Graphic := TJPEGImage.Create;
  end;
  if Assigned(Graphic) then
  begin
    try
      BS.Seek(0, soFromBeginning);
      Graphic.LoadFromStream(BS);
      BM.Assign(Graphic);
    except
    end;
    Graphic.Free;
  end;
end;

function Base64ToBitmap(base64Field: TBlobField): TBitmap;
var
  ms : TMemoryStream;
  base64String : AnsiString;
  myFile: TBytesStream;
begin
  ms := TMemoryStream.Create;
  try
    Result := TBitmap.Create;
    base64Field.SaveToStream(ms);
    ms.Position := 0;

    SetString(base64String, PAnsiChar(ms.Memory), ms.Size);
    myFile := BinaryFromBase64(string(base64String));
    try
      DetectImage(myFile, Result);
    finally
      myFile.Free;
    end;
  finally   
    ms.Free;
  end;
end;

function TestConnection(const url: String; conn: TosSQLConnection = nil): boolean;
var
  HTTPClient: TidHTTP;
  Stream: TStringStream;
  LHandler: TIdSSLIOHandlerSocketOpenSSL;
  ParametroSistema: TParametroSistemaData;
  qryProxy: TosSQLQuery;
begin
  Stream := TStringStream.Create('', TEncoding.UTF8);

  HTTPClient := TidHTTP.Create(nil);
  LHandler := TIdSSLIOHandlerSocketOpenSSL.Create(HTTPClient);
  HTTPClient.IOHandler := LHandler;
  HTTPClient.HandleRedirects := True;
  HTTPClient.AllowCookies := True;
  HTTPClient.Request.ContentType := 'utf-8';
  HTTPClient.ReadTimeout := 30000;
  HTTPClient.ConnectTimeout := 30000;

  if conn = nil then
  begin
    ParametroSistema := TParametroSistemaData.Create(nil);
    ParametroSistema.MasterDataSet.Open;
    if ParametroSistema.MasterDataSetENDERECOPROXY.AsString <> '' then
      HTTPClient.ProxyParams.ProxyServer := ParametroSistema.MasterDataSetENDERECOPROXY.AsString;
    if ParametroSistema.MasterDataSetPORTAPROXY.AsString <> '' then
      HTTPClient.ProxyParams.ProxyPort := ParametroSistema.MasterDataSetPORTAPROXY.AsInteger;
    if ParametroSistema.MasterDataSetUSUARIOPROXY.AsString <> '' then
      HTTPClient.ProxyParams.ProxyUsername := ParametroSistema.MasterDataSetUSUARIOPROXY.AsString;
    if ParametroSistema.MasterDataSetSENHAPROXY.AsString <> '' then
      HTTPClient.ProxyParams.ProxyPassword := ParametroSistema.MasterDataSetSENHAPROXY.AsString;
  end
  else
  begin
    try
      qryProxy := TosSQLQuery.Create(nil);
      qryProxy.SQLConnection := conn;
      qryProxy.CommandText := 'select ENDERECOPROXY, PORTAPROXY, USUARIOPROXY, SENHAPROXY from PARAMETROSISTEMA';
      qryProxy.Open;

      if not ValueIsEmptyNull(qryProxy.FieldByName('ENDERECOPROXY').Value) then
        HTTPClient.ProxyParams.ProxyServer := ParametroSistema.MasterDataSetENDERECOPROXY.AsString;
      if not ValueIsEmptyNull(qryProxy.FieldByName('PORTAPROXY').Value) then
        HTTPClient.ProxyParams.ProxyPort := ParametroSistema.MasterDataSetPORTAPROXY.AsInteger;
      if not ValueIsEmptyNull(qryProxy.FieldByName('USUARIOPROXY').Value) then
        HTTPClient.ProxyParams.ProxyUsername := ParametroSistema.MasterDataSetUSUARIOPROXY.AsString;
      if not ValueIsEmptyNull(qryProxy.FieldByName('SENHAPROXY').Value) then
        HTTPClient.ProxyParams.ProxyPassword := ParametroSistema.MasterDataSetSENHAPROXY.AsString;
    finally
      FreeAndNil(qryProxy);
    end;
  end;

  HTTPClient.ProxyParams.BasicAuthentication := HTTPClient.ProxyParams.ProxyUsername <> '';
  try
    try
      HTTPClient.Get(url, Stream);
      Stream.Position := 0;
      Result := HTTPClient.ResponseCode.ToBoolean;
    except
      on E: Exception do
        Result := False;
    end;
  finally
    Stream.Free;
    LHandler.Free;
    HTTPClient.Free;
    FreeAndNil(ParametroSistema);
  end;
end;

function SortCustomClientDataSet(ClientDataSet: TClientDataSet;
  const FieldName: string): Boolean;
var
  i: Integer;
  NewIndexName: string;
  IndexOptions: TIndexOptions;
  Field: TField;
begin
  Result := False;
  Field := ClientDataSet.Fields.FindField(FieldName);

  //se for lookup ou calculado
  if Field.FieldKind in [fkLookup, fkCalculated] then
    exit;

  //Se fieldname inválido, exit.
  if Field = nil then Exit;

  //se field type inválido, exit.
  if (Field is TObjectField) or (Field is TBlobField) or
    (Field is TAggregateField) or (Field is TVariantField)
    or (Field is TBinaryField) then Exit;

  //Obter IndexDefs e IndexName usando RTTI
  //Garantir que IndexDefs esteja atualizado.
  ClientDataSet.IndexDefs.Update;

  //se um índice ascendente já estiver em uso,
  //mudar para um índice descendente.
  if ClientDataSet.IndexName = FieldName + '__IdxA'
    then
  begin
    NewIndexName := FieldName + '__IdxD';
    IndexOptions := [ixDescending];
  end
  else
  begin
    NewIndexName := FieldName + '__IdxA';
    IndexOptions := [];
  end;

 //Procurar um índice existente
  for i := 0 to Pred(ClientDataSet.IndexDefs.Count) do
  begin
    if ClientDataSet.IndexDefs[i].Name = NewIndexName then
    begin
      Result := True;
      Break
    end; //if
  end; // for

  //Se não enconttrado índice existente, criar um
  if not Result then
  begin
    ClientDataSet.AddIndex(NewIndexName,
      FieldName, IndexOptions);
    Result := True;
  end; // if not

  //Configurar o índice.
  ClientDataSet.IndexName := NewIndexName;
end;

function getUriUrlStatus(const address: String; stream: TStream; AOwner: TComponent=nil) : Boolean;
var
  _idHTTP: TIdHTTP;
  LHandler: TIdSSLIOHandlerSocketOpenSSL;
  _resCode: Integer;

  function Fallback: Boolean;
  var
    _FHttp: TIdHTTP;
  begin
    _FHttp := TIdHTTP.Create(AOwner);
    try
      Result := TestConnection(address);
      try
        if stream is TIdMultiPartFormDataStream  then
          _FHttp.Post(address, TIdMultiPartFormDataStream(stream))
        else
          _FHttp.Post(address, TStringStream(stream));
        _resCode := _FHttp.Response.ResponseCode;
        Result := (_resCode > 99) and (_resCode < 400);
      except
        on E : Exception do
        begin
        end
      end;
    finally
      FreeAndNil(_FHttp);
    end;
  end;
begin
  _resCode := -1;
  _idHTTP := TIdHTTP.Create(AOwner);
  LHandler := TIdSSLIOHandlerSocketOpenSSL.Create(_idHTTP);
  try
    try
      _idHTTP.ReadTimeout := 30000;
      _idHTTP.ConnectTimeout := 30000;
      _idHTTP.AllowCookies := True;
      _idHTTP.IOHandler := LHandler;
      _idHTTP.HandleRedirects := True;

      _IdHTTP.Head(address);
      _resCode := _IdHTTP.Response.ResponseCode;

      Result := (_resCode > 99) and (_resCode < 400);
      if not Result then
        Result := Fallback;
    except
      on E : Exception do
      begin
        Result := Fallback;
      end;
    end;
  finally
    FreeAndNil(_idHTTP);
    FreeAndNil(LHandler);
  end;
end;

function GetUrlWithoutParams(const url: String): String;
var
  _uri: TIdURI;
begin
  Result := EmptyStr;

  if url <> EmptyStr then
  begin
   _uri := TIdURI.Create(url);
   try
     Result := _uri.Protocol + '://' + _uri.Host + ':' + _uri.Port + '/';
   finally
     FreeAndNil(_uri);
   end;
  end;
end;

function GetMacAddress: string;
var
  Lib: Cardinal;
  Func: function(GUID: PGUID): Longint; stdcall;
  GUID1, GUID2: TGUID;
begin
  Result := EmptyStr;
  Lib := LoadLibrary('rpcrt4.dll');
  if Lib <> 0 then
  begin
    try
      @Func := GetProcAddress(Lib, 'UuidCreateSequential');
      if Assigned(Func) then
      begin
        if (Func(@GUID1) = 0) and
           (Func(@GUID2) = 0) and
           (GUID1.D4[2] = GUID2.D4[2]) and
           (GUID1.D4[3] = GUID2.D4[3]) and
           (GUID1.D4[4] = GUID2.D4[4]) and
           (GUID1.D4[5] = GUID2.D4[5]) and
           (GUID1.D4[6] = GUID2.D4[6]) and
           (GUID1.D4[7] = GUID2.D4[7]) then
        begin
          Result :=
            IntToHex(GUID1.D4[2], 2) + '-' +
            IntToHex(GUID1.D4[3], 2) + '-' +
            IntToHex(GUID1.D4[4], 2) + '-' +
            IntToHex(GUID1.D4[5], 2) + '-' +
            IntToHex(GUID1.D4[6], 2) + '-' +
            IntToHex(GUID1.D4[7], 2);
        end;
      end;
    finally
      FreeLibrary(Lib)
    end;
  end;
end;

function GetWindowsDir: string;
var
  PWindowsDir: array [0..255] of Char;
begin
  Result := EmptyStr;
  GetWindowsDirectory(PWindowsDir,255);
  Result := StrPas(PWindowsDir);
end;

function GetPowerStatus: string;
var
  PowerStatus: TSystemPowerStatus;
begin
  Result := EmptyStr;
  GetSystemPowerStatus(PowerStatus);
  if PowerStatus.ACLineStatus=1 then
    Result := 'AC power online'
  else
    Result := 'AC power offline';
end;

function GetSystemDecimal: string;
var
  MyDecimal: PChar;
begin
  Result := EmptyStr;
  MyDecimal := Pwidechar(Widestring(EmptyStr));
  try
    MyDecimal:=StrAlloc(10);
    GetLocaleInfo(
      LOCALE_SYSTEM_DEFAULT,
      LOCALE_SDECIMAL,
      MyDecimal,
      10);
    Result := 'System decimal is - "'+MyDecimal+'"';
  finally
    FreeMem(MyDecimal);
  end;
end;

function GetPcName: string;
var
  CompName: array[0..256] of Char;
  i: DWord;
begin
  Result := EmptyStr;
  i:=256;
  GetComputerName(CompName, i);
  Result := StrPas(CompName);
end;

function getMemoryUsed: Integer;
var
  pmc: PROCESS_MEMORY_COUNTERS;
begin
  pmc.cb := sizeof(pmc);

  Result := 0;
  if GetProcessMemoryInfo(GetCurrentProcess, @pmc, sizeof(pmc)) then
    Result := pmc.WorkingSetSize;
end;

function GetUser: string;
var
  StrUserName: PChar;
  Size: DWord;
begin
  Result := EmptyStr;
  StrUserName := Pwidechar(Widestring(EmptyStr));
  try
    Size:=250;
    GetMem(StrUserName, Size);
    GetUserName(StrUserName, Size);
    Result := StrPas(StrUserName);
  finally
    FreeMem(StrUserName);
  end;
end;

function GetWindowsVersion: string;
begin
  Result := TOSVersion.ToString;
end;

function TimeInWindows: string;
begin
  Result := FormatFloat('0#', GetTickCount div 1000 div 60);
end;

function FreeDiskSpace(strDisk: string): string;
var
  Bytes, Sectors: Cardinal;
  freeClusters, totalClusters: Cardinal;
begin
  GetDiskFreeSpace(PChar(strDisk), Sectors, Bytes, freeClusters, totalClusters);
  FreeDiskSpace := FormatFloat('###,###', (Sectors * Bytes * freeClusters));
end;

function ScreenResolution: string;
var
  X, Y: longint;
begin
  Result := EmptyStr;

  X := GetSystemMetrics(SM_CXSCREEN);
  Y := GetSystemMetrics(SM_CYSCREEN);
  Result := Format('%dx%d', [X, Y]);
end;

function GetScrollState: string;
begin
  Result := EmptyStr;

  if Odd(GetKeyState(VK_SCROLL)) then
    Result := 'On'
  else
    Result := 'Off';
end;

function GetLanguage: string;
var
  LanguageID: LangID;
  Lang: array[0..100] of char;
begin
  Result := EmptyStr;

  LanguageID := GetSystemDefaultLangID;
  VerLanguageName(LanguageID, Lang, 100);
  Result := string(Lang);
end;


function GetWindowPID(sFile: String): Cardinal;
var
  verSystem: TOSVersionInfo;
  hdlProcess: THandle;
  bPath: Bool;
  arrPid: Array [0..1023] of DWORD;
  iC: DWord;
  k,iCount: Integer;
  arrModul: Array [0..299] of Char;
  hdlModul: HMODULE;
begin
  Result := 0;
  if ExtractFileName(sFile)=sFile then
    bPath:=false
  else
    bPath:=true;

  verSystem.dwOSVersionInfoSize:=SizeOf(TOSVersionInfo);
  GetVersionEx(verSystem);
  if verSystem.dwPlatformId=VER_PLATFORM_WIN32_NT then
  begin
    EnumProcesses(@arrPid,SizeOf(arrPid),iC);
    iCount := iC div SizeOf(DWORD);
    for k := 0 to Pred(iCount) do
    begin
      hdlProcess:=OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ,false,arrPid [k]);
      if (hdlProcess<>0) then
      begin
        EnumProcessModules(hdlProcess,@hdlModul,SizeOf(hdlModul),iC);
        GetModuleFilenameEx(hdlProcess,hdlModul,arrModul,SizeOf(arrModul));
        if bPath then
        begin
          if CompareText(arrModul,sFile) = 0 then
          begin
            Result := arrPid[k];
          end;
        end
        else
        begin
          if CompareText(ExtractFileName(arrModul),sFile) = 0 then
          begin
            Result := arrPid[k];
          end;
        end;
        CloseHandle(hdlProcess);
      end;
    end;
  end;
end;

function EnumProcess(hHwnd: HWND; lParam : integer; var FProcessa: Boolean;
 var FHWND: HWND; var FPid: DWORD; var iListOfProcess: Integer): boolean; stdcall;
var
  pPid : DWORD;
  ClassName : string;
  AHWND : HWND;
begin
  Result := True;

  try
    if not FProcessa then
      Exit;

    FHWND := 0;
    //Se retornar nulo, cancela e sai
    if (hHwnd=NULL) then
    begin
      result := false;
    end
    else
    begin
      AHWND := hHWND;
      GetWindowThreadProcessId(hHwnd,pPid);
      //ClassName do Processo
      SetLength(ClassName, 255);
      SetLength(ClassName,
                GetClassName(hHwnd,
                             PChar(className),
                             Length(className)));
      if (pPid = FPid) and (UpperCase(className) = UpperCase('TApplication')) then
      begin
        FHWND := AHWND;
        FProcessa := False;
        Result := True;
        Abort;
      end;
      Result := True;
    end;
  except
  end;
end;

function EnumWindowsProc (Wnd: HWND; List: TStringList): BOOL; stdcall;
(*Copy all Task-names into a list*)
var
  Caption: Array [0..128] of Char;
begin
  Result := True;
  SendMessage(Wnd, WM_GETTEXT, Sizeof(Caption), integer(@Caption));
  List.AddObject(Caption, TObject(Wnd));
end;


function KillTask(const ExeFileName: string): Integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeFileName))) then
      Result := Integer(TerminateProcess(
                        OpenProcess(PROCESS_TERMINATE,
                                    BOOL(0),
                                    FProcessEntry32.th32ProcessID),
                                    0));
     ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

function GetMD5FromString(const text: string): String;
var
  hashMessageDigest5 : TIdHashMessageDigest5;
begin
  Result := EmptyStr;
  hashMessageDigest5 := TIdHashMessageDigest5.Create;
  try
    Result := IdGlobal.IndyLowerCase(hashMessageDigest5.HashStringAsHex(Trim(text)));
  finally
    FreeAndNil(hashMessageDigest5);
  end;
end;

function MD5File(const FileName: string): string;
var
  IdMD5: TIdHashMessageDigest5;
  FS: TFileStream;
begin
 IdMD5 := TIdHashMessageDigest5.Create;
 FS := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
 try
   Result := IdMD5.HashStreamAsHex(FS)
 finally
   FS.Free;
   IdMD5.Free;
 end;
end;

function GetDllName: string;
var
  szFileName: array[0..MAX_PATH] of Char;
begin
  Result := EmptyStr;
  FillChar(szFileName, SizeOf(szFileName), #0);
  if ( Winapi.Windows.GetModuleFileName(HInstance, szFileName, MAX_PATH) ) > 0 then
    Result := string(szFileName);
end;

function GetTempDirectory: string;
var
  tempFolder: array[0..MAX_PATH] of Char;
begin
  Result := 'C:\Windows\Temp';
  GetTempPath(MAX_PATH, @tempFolder);
  Result := StrPas(tempFolder);
end;

function GetLastErrorMessage: string;
begin
  Result := EmptyStr;
  Result := SysErrorMessage(Winapi.Windows.GetLastError);
end;

function TryForceDirectories(const aDir: string): string;
begin
  Result := EmptyStr;
  if not ForceDirectories(aDir) then
    Result := GetLastErrorMessage;
end;

function TryForceDirectories(const aDir: string; out aErrorMessage: string): boolean;
begin
  aErrorMessage := TryForceDirectories(aDir);
  Result := aErrorMessage = EmptyStr;
end;

function GetSHA1FromString(const text: string): string;
var
  _sha1: TIdHashSHA1;
begin
  Result := EmptyStr;
  _sha1 := TIdHashSHA1.Create;
  try
    Result := Trim(_sha1.HashStringAsHex(text));
    Result := LeftStr(Result, 40);
  finally
    FreeAndNil(_sha1);
  end;
end;

function GetSHA1FromFile(const path: string): string;
var
  _sha1: TIdHashSHA1;
  _file: TFileStream;
  _reader: TBinaryReader;
  _size: integer;
begin
  Result := EmptyStr;

  _sha1 := TIdHashSHA1.Create;
  _size := GetFileSize(path);
  if FileExists(path) then
  begin
    _file := TFileStream.Create(path,fmOpenRead);
    _reader := TBinaryReader.Create(_file);
    try
      if _size > 0 then
        Result := Trim(_sha1.HashBytesAsHex(TIdBytes(_reader.ReadBytes(_size))));
        Result := LeftStr(Result, 40);
    finally
      FreeAndNil(_sha1);
      FreeAndNil(_file);
      FreeAndNil(_reader);
    end;
  end;
end;

function GetFileSize(const filename: widestring): Int64;
var
  sr: TSearchRec;
begin
  Result := -1;
  try
    {$WARNINGS OFF}
    if ((FileExists(filename)) and (FindFirst(filename, faAnyFile, sr) = 0)) then
        Result := Int64(sr.FindData.nFileSizeHigh) shl Int64(32) +
        Int64(sr.FindData.nFileSizeLow);
    {$WARNINGS ON}
  finally
    FindClose(sr);
  end;
end;

function GetTelaAprovacao(conn: TosSQLConnection) : string;
var
  qry: TosSQLQuery;
begin
  Result := '';
  try
    qry := TosSQLQuery.Create(nil);
    qry.SQLConnection := conn;
    qry.SQL.Text := 'select upper(r.resclassname) as resclassname from recurso r where r.nome = ''Aprovação Resultados'' or (r.filterdefname = ''fltAprovaResultado'')';
    qry.Open;
    if not qry.IsEmpty then
      Result := qry.FieldByName('resclassname').AsString;
  finally
    qry.Close;
    FreeAndNil(qry);
  end;
end;

function GetPageAsString(const url: String): String;
var
  lHTTP: TIdHTTP;
  lUri: TIdURI;
  IOHandler: TIdSSLIOHandlerSocketOpenSSL;
begin
  Result := EmptyStr;

  if TestConnection(url) then
  begin
    lHTTP := TIdHTTP.Create(nil);
    IOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(lHTTP);
    lUri := TIdUri.Create;
    try
      lHTTP.IOHandler := IOHandler;
      Result := lHTTP.Get(lUri.URLEncode(url));
    finally
      FreeAndNil(IOHandler);
      FreeAndNil(lHTTP);
      FreeAndNil(lUri);
    end;
  end;
end;

function GetSpecialFolderPath(const folder : integer) : string;
 const
   SHGFP_TYPE_CURRENT = 0;
 var
   path: array [0..MAX_PATH] of char;
 begin
   if SUCCEEDED(SHGetFolderPath(0,folder,0,SHGFP_TYPE_CURRENT,@path[0])) then
     Result := path
   else
     Result := '';
 end;

function GetProgramDataAppDataFolder: string;
begin
  Result := GetSpecialFolderPath(CSIDL_COMMON_APPDATA); //C:\ProgramData
end;

function HandleException(const aURL: string): string;
var
  _Exception: Exception;
begin
  _Exception := Exception(ExceptObject);
  Result := _Exception.Message;
  if _Exception is EIdOSSLCouldNotLoadSSLLibrary then
     Result := 'DLLs libeay32.dll e ssleay32.dll não encontradas: '
  else if _Exception is EIdIOHandlerPropInvalid then
    Result := 'Protocolo inválido, tente alternar entre http:// e https://. URL: ' + aURL
  else if _Exception is EIdConnectTimeout then
    Result := 'Servidor indisponível (Connect time out):' + aURL
  else if _Exception is EIdReadTimeOut then
    Result := 'Servidor indisponível (Read time out):' + aURL
  else if _Exception is EIdSocketError then
    Result := 'Verifique se o servidor está respondendo ou se a URL/Porta está(ão) correta(s): ' + aURL
  else if _Exception is EIdHTTPProtocolException then
  begin
    if EIdHTTPProtocolException(_Exception).ErrorCode = 500 then
      Result := Format('Erro ao conectar-se ao servidor. Código de erro: %d. Erro interno no servidor. ',[EIdHTTPProtocolException(_Exception).ErrorCode])
    else
      Result := Format('Erro ao conectar-se ao servidor. Código de erro: %d. Erro: %s.',[EIdHTTPProtocolException(_Exception).ErrorCode, EIdHTTPProtocolException(_Exception).ErrorMessage]);
  end;
end;

procedure ParseJSONObject(aDict: TKeyValue; aJsonValue: TJSONValue;
  aJsonString: TJSONString; aJsonPairEnum: TJSONPairEnumerator;
  aJsonArrayEnum: TJSONArrayEnumerator);
var
  _jsonPairEnum: TJSONPairEnumerator;
  _jsonArrayEnum: TJSONArrayEnumerator;
  _jsonPair: TJSONPair;
  _jsonString: TJSONString;
  _jsonValue: TJSONValue;
begin
  _jsonString := nil;
  // ... IS A JSONObject?
  if (aJsonValue is TJSONObject) then
  begin
    _jsonPairEnum := (aJsonValue as TJSONObject).GetEnumerator;
    if (_jsonPairEnum.MoveNext) then
    begin
      _jsonPair := _jsonPairEnum.Current;
      _jsonString := _jsonPair.JSONString;
      _jsonValue := _jsonPair.JSONValue;
      parseJSONObject(aDict, _jsonValue, _jsonString, _jsonPairEnum,
        aJsonArrayEnum);
    end;
  end
  // ... IS A JSON ARRAY?
  else if (aJsonValue is TJsonArray) then
  begin
    _jsonArrayEnum := (aJsonValue as TJsonArray).GetEnumerator;
    if (_jsonArrayEnum.MoveNext) then
    begin
      _jsonValue := _jsonArrayEnum.Current;
      parseJSONObject(aDict, _jsonValue, nil, aJsonPairEnum, _jsonArrayEnum);
    end;
  end
  // ... IS A JSON STRING?
  else if (aJsonValue is TJSONString) then
  begin
    if (aJsonString <> nil) then
      aDict.Add(aJsonString.Value, aJsonValue.Value);
  end
  // ... IS A JSONNull?
  else if (aJsonValue is TJSONNull) then
  begin
    if (aJsonString <> nil) then
      aDict.Add(aJsonString.Value, aJsonValue.Value);
  end;
  // ... to complete
  // ... IS A JSONNumber?
  // ... IS A JSONBool?

  // ... MOVE NEXT PROPERTY OF OBJECT
  if (aJsonPairEnum <> nil) then
  begin
    if (aJsonPairEnum.MoveNext) then
    begin
      _jsonPair := aJsonPairEnum.Current;
      _jsonString := _jsonPair.JSONString;
      _jsonValue := _jsonPair.JSONValue;
      // ... CALL RECURSIVE
      parseJSONObject(aDict, _jsonValue, _jsonString, aJsonPairEnum,
        aJsonArrayEnum);
    end;
  end;
  // ... MOVE NEXT ITEM OF ARRAY
  if (aJsonArrayEnum <> nil) then
  begin
    if (aJsonArrayEnum.MoveNext) then
    begin
      _jsonValue := aJsonArrayEnum.Current;
      // ... CALL RECURSIVE
      parseJSONObject(aDict, _jsonValue, _jsonString, aJsonPairEnum, aJsonArrayEnum);
    end;
  end;
end;

function GetIdHttp: TIdHTTP;
begin
  Result := acNetUtils.getHTTPInstance;
  // verificar se o servidor está ativo.
  Result.ConnectTimeout := 30000;
  Result.ReadTimeout := 30000;
  Result.Request.Clear;
  Result.Request.Connection := 'keep-alive';
  Result.HandleRedirects := True;
end;

function getJsonStringFromServer(const aURL: string; var aException: string): string;
var
  _http: TIdHTTP;
  _Response: TStringStream;
  IOHandler: TIdSSLIOHandlerSocketOpenSSL;
begin
  aException := EmptyStr;
  _Response := TStringStream.Create(EmptyStr, TEncoding.UTF8);
  _http := GetIdHttp;
  if aURL.ToLower.Contains('https') then
  begin
    IOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(_http);
    _http.IOHandler := IOHandler;
  end;
  try
    try
      _http.Get(aURL, _Response);
      if _http.ResponseCode = 204 then
        Result := EmptyStr
      else
        Result := _Response.DataString;

      _http.Disconnect;
    except
      aException := UtilsUnit.HandleException(aURL);
    end;
  finally
    if aURL.ToLower.Contains('https') then
      FreeAndNil(IOHandler);
    FreeAndNil(_http);
    FreeAndNil(_Response);
  end;
end;

function MappJsonToDict(const aJsonString: string) : TJsonArray;
begin
  Result := nil;
  if aJsonString <> EmptyStr then
  begin
    Result := TJSONObject.ParseJSONValue(TEncoding.ASCII.getBytes(aJsonString), 0) as TJsonArray;
  end;
end;

function GetListaCamposTabela(conn: TSQLConnection; pTabela: String): TStringList;
var
  qry: TosSQLQuery;
begin
  Result := TStringList.Create;
  try
    qry := TosSQLQuery.Create(nil);
    qry.SQLConnection := conn;
    qry.SQL.Text := 'select rdb$field_name AS CAMPOS from rdb$relation_fields rf where rf.rdb$relation_name = :nomeTabela ';
    qry.ParamByName('nomeTabela').AsString := UPPERCASE(pTabela);
    qry.Open;
    qry.First;
    while not qry.Eof do
    begin
      Result.Add(qry.FieldByName('CAMPOS').AsString);
      qry.Next;
    end;
  finally
    qry.Close;
    FreeAndNil(qry);
  end;
end;

procedure SaveToFile(const aFilename, aContent: string);
var
  FileStream: TFileStream;
  _FH: NativeUInt;
begin
  if not FileExists(aFilename) then
    _FH := fmCreate
  else
    _FH := fmOpenReadWrite;

  FileStream := TFileStream.Create(aFileName, _FH, fmShareDenyNone);
  try
    FileStream.Seek(0, soFromEnd);
    FileStream.WriteBuffer(Pointer(aContent)^, (Length(aContent) * szChar));
  finally
    FileStream.Free;
  end;
end;

function LoadFromFile(const aFileName: string): string;
var
  _SStream: TStringStream;
begin
  Result := EmptyStr;
  if FileExists(aFileName) then
  begin
    _SStream := TStringStream.Create(aFileName, TEncoding.ANSI);
    try
      _SStream.LoadFromFile(aFileName);
      Result := _SStream.DataString;
    finally
      _SStream.Free;
    end;
  end;
end;

Function FileIsOpen(const FileName : TFileName) : Boolean;
begin
  Result := False;
  try
    With TFileStream.Create( FileName, fmOpenread or fmShareExclusive)
    do Free;
  except
    Result := True;
  end;
end;

procedure UpdateProxy(dir: string);
var
  configFileName, porta, proxy: string;
  configFile: TStringList;
  i: integer;
begin
  proxy := ParametroSistemaData.MasterClientDatasetENDERECOPROXY.asString;
  porta := ParametroSistemaData.MasterClientDatasetPORTAPROXY.asString;

  if (proxy <> '') and (porta <> '') then
  begin
    configFile := TStringList.Create;
    configFileName := dir + '\prefs.js';

    configFile.LoadFromFile(configFileName);
    i := 0;
    while (i < configFile.Count) do
    begin
      if (pos('user_pref("network.cookie.prefsMigrated', configFile.strings[i]) > 0)
      or (pos('user_pref("network.predictor.cleaned-up', configFile.strings[i]) > 0)
      or (pos('user_pref("network.proxy', configFile.strings[i]) > 0) then
        configFile.Delete(i)
      else
        Inc(i);
    end;

    configFile.add('user_pref("network.cookie.prefsMigrated", true);');
    configFile.add('user_pref("network.predictor.cleaned-up", true);');
    configFile.add('user_pref("network.proxy.backup.ftp", "");');
    configFile.add('user_pref("network.proxy.backup.ftp_port", 0);');
    configFile.add('user_pref("network.proxy.backup.socks", "");');
    configFile.add('user_pref("network.proxy.backup.socks_port", 0);');
    configFile.add('user_pref("network.proxy.backup.ssl", "");');
    configFile.add('user_pref("network.proxy.backup.ssl_port", 0);');
    configFile.add('user_pref("network.proxy.ftp", "' + proxy + '");');
    configFile.add('user_pref("network.proxy.ftp_port", ' + porta + ');');
    configFile.add('user_pref("network.proxy.http", "' + proxy + '");');
    configFile.add('user_pref("network.proxy.http_port", ' + porta + ');');
    configFile.add('user_pref("network.proxy.share_proxy_settings", true);');
    configFile.add('user_pref("network.proxy.socks", "' + proxy + '");');
    configFile.add('user_pref("network.proxy.socks_port", ' + porta + ');');
    configFile.add('user_pref("network.proxy.ssl", "' + proxy + '");');
    configFile.add('user_pref("network.proxy.ssl_port", ' + porta + ');');
    configFile.add('user_pref("network.proxy.type", 1);');

    configFile.SaveToFile(configFileName);
  end;
end;

procedure RemoveDiretorio(Dir: String);
var
  Result: TSearchRec; Found: Boolean;
begin
  Found := False;
  if FindFirst(Dir + '\*', faAnyFile, Result) = 0 then
    while not Found do begin
      if (Result.Attr and faDirectory = faDirectory) AND (Result.Name <> '.') AND (Result.Name <> '..') then RemoveDiretorio(Dir + '\' + Result.Name)
      else if (Result.Attr and faAnyFile <> faDirectory) then DeleteFile(Dir + '\' + Result.Name);
      Found := FindNext(Result) <> 0;
    end;
  FindClose(Result); RemoveDir(Dir);
end;

function ExtractBetween(const Value, A, B: string): string;
var
  aPos, bPos: Integer;
begin
  result := '';
  aPos := Pos(A, Value);
  if aPos > 0 then begin
    aPos := aPos + Length(A);
    bPos := PosEx(B, Value, aPos);
    if bPos > 0 then begin
      result := Copy(Value, aPos, bPos - aPos);
    end;
  end;
end;

end.

