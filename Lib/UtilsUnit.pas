unit UtilsUnit;

interface

uses
  IBServices, INIFiles, Forms, AbZipper, Windows, SysUtils, StrUtils, Controls,
  osComboSearch, graphics, Classes, DBCtrls, wwdbdatetimepicker, Wwdbcomb, ComCtrls,
  Math, Wwdbgrid, RegExpr,StdCtrls, DB, DBClient, wwdbedit, Buttons, ShellAPI, acSysUtils,
  osSQLConnection, osSQLQuery, WinSock;

type
  varArrayOfcomps = array of TComponent;

  THSHash = class
    class function CalculaHash(conteudo: string): string;
    class function GeraHashPCMed(linha: string): string;
  end;
  
function isDigitOrControl(Key: char): boolean;
function RemoveAcento(Str:String): String;
procedure criarArquivoBackupIB(nomeArq: string);
function getSombraValue(Str:String): String;
function TiraSimbolos(Str: String): String;
function LastDayOfMonth(dia: TDate = 0): TDate;
procedure setHabilitaComboSearch(cbo: TosComboSearch; enabled: boolean);
procedure setHabilitaComponente(comp: TComponent; enabled: boolean);
procedure habilitaComponentes(comps: varArrayOfcomps);
procedure desHabilitaComponentes(comps: array of TComponent);
procedure setHabilitaDBEdit(edt: TDBEdit; enabled: boolean);
procedure setHabilitaButton(btn: TButton; enabled: boolean);
procedure setHabilitaSpeedButton(btn: TSpeedButton; enabled: boolean);
procedure setHabilitawwComboBox(comboBox: TwwDBComboBox; enabled: boolean);
procedure setHabilitawwDateTimePicker(dateTimePicker: TwwDBDateTimePicker; enabled: boolean);
function roundToCurr(val: double): double;
procedure setHabilitaDBCheckBox(edtd: TDBCheckBox; enabled: boolean);
procedure setHabilitaDBMemo(comp: TDBMemo; enabled: boolean);
procedure setHabilitawwDBGrid(grd: TwwDBGrid; enabled: boolean);
procedure ListFileDir(Path: string; FileList: TStrings);
function isNumeric(valor: string; acceptThousandSeparator: Boolean = False): boolean;
function isIP(valor: string): boolean;
function isConvert(Str: string): boolean;
function extractPhoneNumber(Str: String; defaultDDD: string = '041'): string;
procedure setHabilitaEdit(edit: TEdit; enabled: boolean);
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
procedure ImprimirImpressoraTermica(const comando, impressora: String);
function NomeDaTecla(Key: Word): string;
function RoundToCurrency(const AValue: Currency; const ADigit: TRoundToRange = -2): Currency;
function ConverteTecladoNumerico(Key: Word): Word;
function ConverteMinutos(minutos: Integer): string;
function GetDateTime(conn: TosSQLConnection): TDateTime;
function GetNewID(conn: TosSQLConnection): Integer;
function GetGenerator(conn: TosSQLConnection; generator: string): Integer;
function ConverteStrToDate(data: string): TDateTime;
function ConverteStrToDate2(data: string): TDateTime;
function ConverteStrToDate3(data: string): TDateTime;
function ConverteStrToDate4(data: string): TDateTime;
function GetIPAddress: string;
function ConverteRTF(rtf: string): string;

implementation

uses DateUtils, Variants;

const
  CSIDL_COMMON_APPDATA = $0023;

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

procedure ListFileDir(Path: string; FileList: TStrings);
var
  SR: TSearchRec;
begin
  if FindFirst(Path + '\*.xml', faAnyFile, SR) = 0 then
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

procedure setHabilitaButton(btn: TButton; enabled: boolean);
begin
  btn.Enabled := enabled;
end;

procedure setHabilitaSpeedButton(btn: TSpeedButton; enabled: boolean);
begin
  btn.Enabled := enabled;
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
  zipper: TABZipper;
begin
  IBBackup := TIBBackupService.Create(nil);
  zipper := TAbZipper.Create(nil);
  try
    DeleteFile('tmp.gbk');
    IBBackup.Active := false;
    IBBackup.DatabaseName := ExtractFilePath(Application.ExeName) + '..\DB\' +
      copy(ExtractFileName(Application.ExeName),1,pos('.',ExtractFileName(Application.ExeName))-1) + '.gdb';
    IBBackup.LoginPrompt := false;
    IBBackup.Params.Clear;
    IBBackup.Params.Add('user_name=sysdba');
    IBBackup.Params.Add('password=masterkey');
    IBBackup.BackupFile.Add(ExtractFilePath(Application.ExeName) + 'tmp.gbk');
    IBBackup.Active := true;
    IBBackup.ServiceStart;
    while IBBackup.IsServiceRunning do Sleep(1);
    IBBackup.Active := false;
    DeleteFile(PCHAR(ExtractFilePath(Application.ExeName) + 'tmp.zip'));
    Zipper.FileName := ExtractFilePath(Application.ExeName) + 'tmp.zip';
    Zipper.AddFiles(ExtractFilePath(Application.ExeName) + 'tmp.gbk',0);
    Zipper.CloseArchive;
    deleteFile(PCHAR(ExtractFilePath(Application.ExeName) + '..\backups\ultimoBackup.bkp'));
    CopyFile(PWideChar(ExtractFilePath(Application.ExeName) + 'tmp.zip'),
      PWideChar(ExtractFilePath(Application.ExeName) + '..\backups\ultimoBackup.bkp'),false);
    RenameFile(ExtractFilePath(Application.ExeName) + 'tmp.zip', nomeArq);
    DeleteFile(PCHAR(ExtractFilePath(Application.ExeName) + 'tmp.gbk'));
    DeleteFile(PCHAR(ExtractFilePath(Application.ExeName) + 'tmp.zip'))
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

procedure setHabilitaComboSearch(cbo: TosComboSearch; enabled: boolean);
begin
  if enabled then
  begin
    cbo.ReadOnly := false;
    cbo.color := clWhite;
    cbo.showButton := true;
  end
  else
  begin
    cbo.ReadOnly := true;
    cbo.color := clBtnFace;
    cbo.showButton := false;
  end;
  cbo.invalidate;
end;

procedure setHabilitaDBEdit(edt: TDBEdit; enabled: boolean);
begin
  if enabled then
  begin
    edt.ReadOnly := false;
    edt.color := clWhite;
  end
  else
  begin
    edt.ReadOnly := true;
    edt.color := clBtnFace;
  end;
end;

procedure setHabilitawwComboBox(comboBox: TwwDBComboBox; enabled: boolean);
begin
  if enabled then
  begin
    comboBox.ReadOnly := false;
    comboBox.Color := clWhite;
  end
  else
  begin
    comboBox.ReadOnly := true;
    comboBox.Color := clBtnFace;
  end;
end;

procedure setHabilitawwDateTimePicker(dateTimePicker: TwwDBDateTimePicker; enabled: boolean);
begin
  if enabled then
  begin
    dateTimePicker.ReadOnly := false;
    dateTimePicker.Color := clWhite;
  end
  else
  begin
    dateTimePicker.ReadOnly := true;
    dateTimePicker.Color := clBtnFace;
  end;
end;

procedure setHabilitaDBCheckBox(edtd: TDBCheckBox; enabled: boolean);
begin
  if enabled then
  begin
    edtd.ReadOnly := false;
  end
  else
  begin
    edtd.ReadOnly := true;
  end;
end;

procedure setHabilitawwDBGrid(grd: TwwDBGrid; enabled: boolean);
begin
  if enabled then
  begin
    grd.ReadOnly := false;
  end
  else
  begin
    grd.ReadOnly := true;
  end;
end;


procedure setHabilitaDBMemo(comp: TDBMemo; enabled: boolean);
begin
  if enabled then
  begin
    comp.enabled := true;
    comp.Color := clWhite;
  end
  else
  begin
    comp.enabled := false;
    comp.Color := clBtnFace;
  end;
end;

procedure setHabilitaComponente(comp: TComponent; enabled: boolean);
begin
  if comp is TosComboSearch then
    setHabilitaComboSearch((comp as TosComboSearch), enabled);
  if comp is TDBEdit then
    setHabilitaDBEdit((comp as TDBEdit), enabled);
  if comp is TwwDBComboBox then
    setHabilitawwComboBox((comp as TwwDBComboBox), enabled);
  if comp is TwwDBDateTimePicker then
    setHabilitawwDateTimePicker((comp as TwwDBDateTimePicker), enabled);
  if comp is TDBCheckBox then
    setHabilitadbCheckBox((comp as TDBCheckBox), enabled);
  if comp is TDBMemo then
    setHabilitaDBMemo((comp as TDBMemo), enabled);
  if comp is TwwDBGrid then
    setHabilitawwDBGrid((comp as twwDBGrid), enabled);
  if comp is TButton then
    setHabilitaButton((comp as TButton), enabled);
  if comp is TSpeedButton then
    setHabilitaSpeedButton((comp as TSpeedButton), enabled);
end;

procedure habilitaComponentes(comps: varArrayOfcomps);
var
  i: integer;
begin
  for i := low(comps) to high(comps) do
    setHabilitaComponente(comps[i], true);
end;

procedure desHabilitaComponentes(comps: array of TComponent);
var
  i: integer;
begin
  for i := low(comps) to high(comps) do
    setHabilitaComponente(comps[i], false);
end;

function roundToCurr(val: double): double;
begin
  result := roundTo(val, -2);
end;

function isNumeric(valor: string;
  acceptThousandSeparator: Boolean = False): boolean;
var
  decimal: char;
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

procedure setHabilitaEdit(edit: TEdit; enabled: boolean);
begin
  if enabled then
  begin
    edit.ReadOnly := false;
    edit.Color := clWhite;
  end
  else
  begin
    edit.ReadOnly := true;
    edit.Color := clBtnFace;
  end;
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

procedure ImprimirImpressoraTermica(const comando, impressora: String);
var
  FBat, FComando: TextFile;
  diretorio: string;
begin
  diretorio:= GetSpecialFolderLocation(Application.Handle, CSIDL_COMMON_APPDATA) + '\';

  DeleteFile(diretorio + 'COMANDO.TXT');
  DeleteFile(diretorio + 'PRINTLBL.BAT');

  AssignFile(FComando, diretorio + 'COMANDO.TXT');
  try
    Rewrite(FComando);
    Writeln(FComando, comando);
  finally
    CloseFile(FComando);
  end;

  AssignFile(FBat, diretorio + 'PRINTLBL.BAT');
  try
    Rewrite(FBat);
    Writeln(FBat, 'TYPE "' + diretorio + 'COMANDO.TXT" > '+impressora);
  finally
    CloseFile(FBat);
  end;

  ShellExecute(0, 'Open', PChar(diretorio + 'PRINTLBL.BAT'), nil, nil, Ord(SW_HIDE));
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
    219: Result := ''; //´ acento
    222: Result := ''; //~ acento
  else
    GetKeyboardState(keyboardState);
    SetLength(Result, 2) ;
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

function GetDateTime(conn: TosSQLConnection): TDateTime;
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

function GetNewID(conn: TosSQLConnection): Integer;
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

function GetGenerator(conn: TosSQLConnection; generator: string): Integer;
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

class function THSHash.CalculaHash(conteudo: string): string;
var
  sum, i : Integer;
  HFrame : string;
begin
  for i := 1 to Length(conteudo) do
  begin
    sum := sum + Ord(conteudo[i]);
  end;
  HFrame := IntToHex(sum mod 256,2);

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

function ConverteRTF(rtf: string): string;
var
  form: TForm;
  richEdit: TRichEdit;
  ss: TStringStream;
begin
  try
    ss := TStringStream.Create(rtf);
    form := TForm.Create(nil);
    richEdit := TRichEdit.Create(form);
    richEdit.Parent := form;
    richEdit.Lines.LoadFromStream(ss);
    richEdit.PlainText := True;
    Result := richEdit.Text;
  finally
    FreeAndNil(ss);
    FreeAndNil(richEdit);
    FreeAndNil(form);
  end;
end;

end.
