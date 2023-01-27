unit UtilsUnitGUI;

interface

uses
  Vcl.Forms, Vcl.Controls, ComCtrls, DBCtrls, wwdbdatetimepicker, Wwdbcomb, StdCtrls,  Buttons, Wwdbgrid,
  wwdbedit, acSysUtils, Printers, osComboSearch, System.Classes, DB, DBClient,  Winapi.PsApi, Winapi.Windows,
  Vcl.Graphics, ShellAPI, UMensagemAguarde, SysUtils, UtilsUnit, Variants, Winapi.Messages, Winapi.TlHelp32,
  Winsock, StrUtils;

type
  varArrayOfcomps = array of TComponent;
  TFuncaoParametroGetDesc = function(const vValor : Variant) : string;

const
  CSIDL_COMMON_APPDATA = $0023;

procedure setHabilitaDBEdit(edt: TDBEdit; enabled: boolean);
procedure setHabilitaButton(btn: TButton; enabled: boolean);
procedure setHabilitaSpeedButton(btn: TSpeedButton; enabled: boolean);
procedure setHabilitawwComboBox(comboBox: TwwDBComboBox; enabled: boolean);
procedure setHabilitaComboBox(comboBox: TComboBox; enabled: boolean);
procedure setHabilitawwDateTimePicker(dateTimePicker: TwwDBDateTimePicker; enabled: boolean);
procedure setHabilitaDBCheckBox(edtd: TDBCheckBox; enabled: boolean);
procedure setHabilitaDBMemo(comp: TDBMemo; enabled: boolean);
procedure setHabilitawwDBGrid(grd: TwwDBGrid; enabled: boolean);
procedure setHabilitaEdit(edit: TEdit; enabled: boolean);
procedure setHabilitaComboSearch(cbo: TosComboSearch; enabled: boolean);
procedure setHabilitaComponente(comp: TComponent; enabled: boolean);
procedure habilitaComponentes(comps: varArrayOfcomps);
procedure desHabilitaComponentes(comps: array of TComponent);
procedure ImprimirImpressoraTermica(const comando, impressora: String; var erro: string);
function ConverteRTF(rtf: string): string;
function ConverteTextoToRTF(const Texto: string; FontSize: integer = 0; FontName: string= ''): string;
function getCampoSemRTF(const vValor : Variant):String;
function CriarMsgLogAlteracaoField(aField : TField):String; overload;
function CriarMsgLogAlteracaoField(aField : TField; aFuncaoGetDescricao : TFuncaoParametroGetDesc):String; overload;
function CriarMsgLogAlteracaoFieldLookup(aField : TField; oCDSLookup: TClientDataSet;
  const sCampoChave: String; const sCampoRetorno: String):String;
function CriarMsgLogAlteracaoCDS(oCDS: TClientDataSet; key: string; aCamposDescricao, aCamposLOG: Array of String): String;
function CriarMsgLogInclusaoExclusaoCDS(AlteradoCDS: TClientDataSet; OriginalCDS: TClientDataSet;
  const sCampoChave: String; aCampoDescricao: Array of String): String;
function CriarMsgLogCDSNotLocateOrigemDestino(OriginalCDS: TClientDataSet; AlteradoCDS: TClientDataSet;
  const sCampoChave: String;  aCampoDescricao: Array of String; const sDescricao : String ): String;
function CriarMsgLogCDSNovoRegistro(pCDS: TClientDataSet) : String;
function isRTFValue(vValor: Variant): Boolean; //{\rtf
procedure TrimAppMemorySize;
function dgCreateProcess(const FileName: string; SleepInterval: integer = 10000): boolean;
function GetPrinters: string;
function GetProcessList: string;
function GetSystemInfo: string;
function GetTaskHandle(const ATaskName : string; var FTaskName: String; var FPid: PDWORD_PTR;
  var FProcessa: Boolean; var FHWND: HWND; var iListOfProcess: Integer) : HWND;
procedure ExecuteAndWait(const aCommando: string);
function Execute(const aCommando: string; const ShowWindow: boolean; var aProcessInformation: TProcessInformation): boolean;
function GetDosOutput(outPut: TMemo; CommandLine: string): string;
procedure WaitProcess(const aProcessInformation: TProcessInformation; aCheckIsAlive: boolean; aThreadId: TThreadID; const aPort: integer);
procedure CloseProcess(const aProcessInformation: TProcessInformation);
function LocalIp: string;
function ValidaTravamento(const Aplicacao: string; var FTaskName: string; var FPid: PDWORD_PTR; var FProcessa: Boolean; var FHWND: HWND; var iListOfProcess: Integer) : Boolean;
function ProcessExists(exeFileName: string; var FTaskName: string; var FPid: PDWORD_PTR; var FProcessa: Boolean; var FHWND: HWND; var iListOfProcess: Integer): Boolean;
procedure MakeRounded(Control: TWinControl);
function SendMessageToTCPServer(const aMessage: string; aPort: integer): boolean;

implementation

uses IdIPWatch, IdTCPClient, WinSpool;

procedure setHabilitaButton(btn: TButton; enabled: boolean);
begin
  btn.Enabled := enabled;
end;

procedure setHabilitaSpeedButton(btn: TSpeedButton; enabled: boolean);
begin
  btn.Enabled := enabled;
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

procedure setHabilitaComboBox(comboBox: TComboBox; enabled: boolean);
begin
  if enabled then
  begin
    comboBox.Enabled := True;
    comboBox.Color := clWhite;
  end
  else
  begin
    comboBox.Enabled := False;
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

procedure ImprimirImpressoraTermica(const comando, impressora: String; var erro: string);
var
  cmm: AnsiString;
  I: Integer;
  vPrinter : TPrinter;
begin
  try
    if length(trim(comando)) > 30 then
    begin
      vPrinter := TPrinter.Create;
      try
        for I := 0 to Printer.Printers.Count-1 do
        begin
          if POS('(', Printer.Printers[I]) > 0 then
          begin
            if Trim(UpperCase(copy(Printer.Printers[I], 1, POS('(', Printer.Printers[I])-1))) = Trim(UpperCase(copy(Impressora, 1, POS('(', Impressora)-1))) then
            begin
              vPrinter.PrinterIndex := I;
              break;
            end;
          end
          else
          begin
            if Trim(UpperCase(Printer.Printers[I])) = Trim(UpperCase(Impressora)) then
            begin
              vPrinter.PrinterIndex := I;
              break;
            end;
          end;
        end;

        //É necessário inicializar o comando com "N" para limpar as configurações da impressora caso ela tenha imprimido algum outro padrão de etiqueta.
        //é necessário que haja 2 "N" logo no começo do comando;
        cmm := AnsiString('N' + #10 + Trim(comando)+#10 + 'N' + #10);
        StartDocPrinter(vPrinter.Handle, 1, @cmm);
        vPrinter.BeginDoc;

        pword(cmm)^ := length(cmm)-2;
        if ExtEscape(vPrinter.Handle, PASSTHROUGH, Length(cmm), pointer(cmm), 0, nil)<0 then
          erro := 'Error ao enviar comandos para a impressora';
        EndDocPrinter(vPrinter.Handle);
        vPrinter.EndDoc;
      finally
        FreeAndNil(vPrinter);
      end;
    end;
  except

  end;
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

function ConverteTextoToRTF(const Texto: string; FontSize: integer = 0; FontName: string= ''): string;
var
  form: TForm;
  richEdit: TRichEdit;
  ss: TStringStream;
begin
  if isRTFValue(Texto) then
    Result := Texto
  else
  begin
    try
      ss := TStringStream.Create(Texto);
      form := TForm.Create(nil);
      richEdit := TRichEdit.Create(form);
      richEdit.Parent := form;
      if FontSize > 0 then
        richEdit.Font.Size := FontSize;
      if not FontName.IsEmpty then
        richEdit.Font.Name := FontName;
      richEdit.Text:= Texto;
      richEdit.PlainText := False;
      richEdit.Lines.SaveToStream(ss);
      Result :=  ss.DataString;
    finally
      FreeAndNil(ss);
      FreeAndNil(richEdit);
      FreeAndNil(form);
    end;
  end;
end;

function getCampoSemRTF(const vValor : Variant):String;
var
  sValor : String;
begin
  result := EmptyStr;
  if not ValueIsEmptyNull(vValor) then
  begin
    sValor := VarToStr(vValor);
    if isRTFValue(sValor) then
      result := ConverteRTF(sValor)
    else
      result := sValor;
  end;
end;

function CriarMsgLogAlteracaoField(aField : TField):String; overload;
begin
  Result := EmptyStr;
  if (aField.FieldKind <> fkLookup) and (aField.DataType <> ftDataSet) and (FieldHasChanged(aField)) then
    Result := Format(sMODELOMSGLOG,[aField.DisplayLabel, getCampoSemRTF(aField.OldValue),
      getCampoSemRTF(aField.NewValue)]);
end;

function CriarMsgLogAlteracaoField(aField : TField; aFuncaoGetDescricao : TFuncaoParametroGetDesc):String; overload;
begin
  Result := EmptyStr;
  if (aField.FieldKind <> fkLookup) and (FieldHasChanged(aField)) then
    Result := Format(sMODELOMSGLOG,[aField.DisplayLabel, aFuncaoGetDescricao(aField.OldValue),
      aFuncaoGetDescricao(aField.NewValue)]);
end;

function CriarMsgLogAlteracaoFieldLookup(aField : TField; oCDSLookup: TClientDataSet;const sCampoChave: String;
  const sCampoRetorno: String):String;
var
  sDescOld, sDescNew : String;
begin
  sDescOld := EmptyStr;
  sDescNew := EmptyStr;
  Result := EmptyStr;
  if FieldHasChanged(aField) then
  begin
    if not ValueIsEmptyNull(aField.OldValue) then
      sDescOld := oCDSLookup.Lookup(sCampoChave, aField.OldValue, sCampoRetorno);
    if not ValueIsEmptyNull(aField.NewValue) then
      sDescNew := oCDSLookup.Lookup(sCampoChave, aField.NewValue, sCampoRetorno);

    if (sDescOld <> EmptyStr) or (sDescNew <> EmptyStr) then
      Result := Format(sMODELOMSGLOG,[aField.DisplayLabel, sDescOld, sDescNew]);
  end;
end;

function CriarMsgLogAlteracaoCDS(oCDS: TClientDataSet; key: string; aCamposDescricao, aCamposLOG: Array of String): String;
var
  i : Integer;
  bm : TBookmark;
  aMsgReg, aMsgAlt : String;
begin
  Result := EmptyStr;
  if (oCDS = nil) or (not oCDS.Active) or (oCDS.RecordCount = 0)  then
    Exit;
  bm := oCDS.Bookmark;
  oCDS.DisableControls;
  try
    oCDS.First;
    while not oCDS.Eof do
    begin
      aMsgReg := EmptyStr;
      aMsgAlt := EmptyStr;
      // loga se não for inclusão
      if not ValueIsEmptyNull(oCDS.FieldByName(key).OldValue) then
      begin
        // Todos os Campos
        if Length(aCamposLOG)=0 then
        begin
          for i := 0 to oCDS.FieldCount-1 do
          begin
            if oCDS.FieldByName(oCDS.Fields[i].FieldName).FieldKind <> fkLookup then
              aMsgAlt := aMsgAlt + CriarMsgLogAlteracaoField(
                oCDS.FieldByName(oCDS.Fields[i].FieldName) );
          end;
        end
        // campos do Array
        else
        begin
          for i := 0 to Length(aCamposLOG)-1 do
          begin
            aMsgAlt := aMsgAlt + CriarMsgLogAlteracaoField( oCDS.FieldByName(aCamposLOG[i]) );
          end;
        end;

        if (Length(aCamposDescricao) > 0) and (aMsgAlt <> EmptyStr) then
        begin
          aMsgReg := EmptyStr;
          for i := 0 to Length(aCamposDescricao)-1 do
          begin
            if aMsgReg <> EmptyStr then
              aMsgReg := aMsgReg + ', ';
            aMsgReg := aMsgReg + getCampoSemRTF(oCDS.FieldByName(aCamposDescricao[i]).AsString);
          end;
          aMsgReg := #13 + #13 + 'Alterado ' + aMsgReg;
        end;

        // Copy retira uma linha no começo da mensagem dos campos
        if aMsgAlt <> EmptyStr then
          Result := Result + aMsgReg + Copy(aMsgAlt, 2, length(aMsgAlt));
      end;
      oCDS.Next;
    end;
  finally
    oCDS.GotoBookmark(bm);
    oCDS.EnableControls;
  end;
end;

function CriarMsgLogInclusaoExclusaoCDS(AlteradoCDS: TClientDataSet; OriginalCDS: TClientDataSet;
  const sCampoChave: String; aCampoDescricao: Array of String): String;
begin
  Result := EmptyStr;
  AlteradoCDS.DisableControls;
  try
    if OriginalCDS <> nil then
    begin
      // Verifica Registros Excluidos
      Result := Result + CriarMsgLogCDSNotLocateOrigemDestino(OriginalCDS, AlteradoCDS, sCampoChave, aCampoDescricao,
        'Exclusão: ');

      // Verifica Registros Incluídos
      Result := Result + CriarMsgLogCDSNotLocateOrigemDestino(AlteradoCDS, OriginalCDS, sCampoChave, aCampoDescricao,
        'Inclusão: ');
    end;
  finally
    AlteradoCDS.EnableControls;
  end;
end;

function CriarMsgLogCDSNotLocateOrigemDestino(OriginalCDS: TClientDataSet; AlteradoCDS: TClientDataSet;
  const sCampoChave: String; aCampoDescricao: Array of String; const sDescricao : String ): String;
var
  nRegCol : Integer;
  aMsgReg : String;
  _Str: TStringList;
  _Valor: string;
begin
  Result := EmptyStr;
  _Str := TStringList.Create;
  if OriginalCDS <> nil then
  begin
    try
      OriginalCDS.First;
      while not OriginalCDS.Eof do
      begin
        if not AlteradoCDS.Locate(sCampoChave, OriginalCDS.FieldByName(sCampoChave).AsVariant, []) then
        begin
          if Length(aCampoDescricao) > 0 then
          begin
            aMsgReg := EmptyStr;
            for nRegCol := 0 to Length(aCampoDescricao)-1 do
            begin
              _valor := getCampoSemRTF(OriginalCDS.FieldByName(aCampoDescricao[nRegCol]).AsString);
              if _valor <> EmptyStr then
                _Str.Add(OriginalCDS.FieldByName(aCampoDescricao[nRegCol]).DisplayLabel + ': '+ _valor);
            end;
          end;
          Result := Result + #13 + sDescricao + _Str.CommaText;
        end;
        OriginalCDS.Next;
      end;
    finally
      FreeAndNil(_Str);
    end;
  end;
end;

function CriarMsgLogCDSNovoRegistro(pCDS: TClientDataSet) : String;
var
  I: Integer;
  msg: String;
begin
  Result := EmptyStr;
  pCDS.First;
  msg := '';
  for I := 0 to pCDS.FieldCount-1 do
  begin
    if (pCDS.Fields[I].FieldKind = fkData) and (pCDS.Fields[I].DataType <> ftBlob) and (pCDS.Fields[I].DataType <> ftMemo) and
       (pCDS.Fields[I].DataType <> ftDataSet) then
      msg := msg + pCDS.Fields[I].DisplayLabel + ' : ' + pCDS.Fields[I].AsString + #13#10;
  end;
  Result := msg;
end;

function isRTFValue(vValor: Variant): Boolean;
begin
  Result := False;
  if not ValueIsEmptyNull(vValor) then
    Result :=  Copy(vValor, 1, 5) = '{\rtf';
end;

procedure TrimAppMemorySize;
var
  MainHandle : THandle;
begin
  try
    MainHandle := OpenProcess(PROCESS_ALL_ACCESS, false, GetCurrentProcessID) ;
    SetProcessWorkingSetSize(MainHandle, $FFFFFFFF, $FFFFFFFF) ;
    CloseHandle(MainHandle) ;
  except
  end;
  Application.ProcessMessages;
end;

function dgCreateProcess(const FileName: string; SleepInterval: integer = 10000): boolean;
var ProcInfo: TProcessInformation;
    StartInfo: TStartupInfo;
    FrmMensagem : TFrmMensagemAguarde;
begin
  FrmMensagem := TFrmMensagemAguarde.Create(Application);
  try
    FrmMensagem.Show;
    FrmMensagem.setMensagem('Aguarde, Carregando... ', True);
    FrmMensagem.Update;

    {https://msdn.microsoft.com/en-us/library/ms686331.aspx}
    FillMemory(@StartInfo, SizeOf(StartInfo), 0);
    StartInfo.cb := SizeOf(StartInfo);
    StartInfo.dwFlags := STARTF_RUNFULLSCREEN;
    StartInfo.wShowWindow := SW_SHOWMAXIMIZED;
    StartInfo.dwXSize := Screen.Width;
    StartInfo.dwYSize := Screen.Height;
    StartInfo.dwX := 0;
    StartInfo.dwY := 0;

    Result := CreateProcess(
      nil,
      PChar(FileName),
      nil, Nil, False,
      DEBUG_PROCESS and CREATE_NEW_CONSOLE and CREATE_NEW_PROCESS_GROUP and BELOW_NORMAL_PRIORITY_CLASS,
      nil, nil,
      StartInfo,
      ProcInfo);
    CloseHandle(ProcInfo.hProcess);
    CloseHandle(ProcInfo.hThread);
  finally
    SleepEx(SleepInterval, False);
    FrmMensagem.Close;
    FrmMensagem.Release;
  end;
end;

function GetPrinters: string;
begin
  Result := Printer.Printers.Text;
end;

function GetProcessList: string;
var
  Wnd: hWnd;
  Buff: array [0..127] of Char;
begin
  Result := EmptyStr;

  Wnd:=GetWindow(Application.Handle, gw_HWndFirst);
  while Wnd<>0 do
  begin
    if (Wnd<>Application.Handle) and
      IsWindowVisible(Wnd) and
      (GetWindow(Wnd, gw_Owner)=0) and
      (GetWindowText(Wnd, Buff, sizeof(buff))<>0) then
    begin
      GetWindowText(Wnd, Buff, SizeOf(Buff));
      Result := Result + #13#10 + StrPas(Buff) + 'Memória: ' + IntToStr(getMemoryUsed);
    end;
    Wnd:=GetWindow(Wnd, gw_hWndNext);
  end;
end;

function GetTaskHandle(const ATaskName : string; var FTaskName: String; var FPid: PDWORD_PTR;
  var FProcessa: Boolean; var FHWND: HWND; var iListOfProcess: Integer) : HWND;
begin
  Result := FHWND;

  if Trim(ATaskName) <> EmptyStr then
  begin
    FTaskName := ATaskName;
    FPid := PDWORD_PTR(GetWindowPID(ATaskName));
    FProcessa := True;
    if not EnumWindows(@EnumProcess, iListOfProcess) then
      Exit
    else
      Application.ProcessMessages;

    Result := FHWND;
  end;
end;

procedure ExecuteAndWait(const aCommando: string);
var
  tmpStartupInfo: TStartupInfo;
  tmpProcessInformation: TProcessInformation;
  tmpProgram: String;
begin
  tmpProgram := trim(aCommando);
  FillChar(tmpStartupInfo, SizeOf(tmpStartupInfo), 0);
  with tmpStartupInfo do
  begin
    cb := SizeOf(TStartupInfo);
    wShowWindow := SW_HIDE;
  end;

  if CreateProcess(nil, pchar(tmpProgram), nil, nil, true, CREATE_NO_WINDOW,
    nil, nil, tmpStartupInfo, tmpProcessInformation) then
  begin
    // loop every 10 ms
    while WaitForSingleObject(tmpProcessInformation.hProcess, 10) > 0 do
    begin
      Application.ProcessMessages;
    end;
    CloseHandle(tmpProcessInformation.hProcess);
    CloseHandle(tmpProcessInformation.hThread);
  end
  else
  begin
    RaiseLastOSError;
  end;
end;

function Execute(const aCommando: string; const ShowWindow: boolean; var aProcessInformation: TProcessInformation): boolean;
var
  tmpStartupInfo: TStartupInfo;
  tmpProgram: String;
  CreationFlags: Cardinal;
  nHwnd: Hwnd;
begin
  tmpProgram := trim(aCommando);
  FillChar(tmpStartupInfo, SizeOf(tmpStartupInfo), 0);
  with tmpStartupInfo do
  begin
    cb := SizeOf(TStartupInfo);

    if ShowWindow then
      wShowWindow := SW_SHOWMINNOACTIVE
    else
      wShowWindow := SW_HIDE;
  end;
  if ShowWindow then
    CreationFlags := NORMAL_PRIORITY_CLASS
  else
    CreationFlags := CREATE_NO_WINDOW or CREATE_DEFAULT_ERROR_MODE;

  if CreateProcess(nil, pchar(tmpProgram), nil, nil, true, CreationFlags,
    nil, nil, tmpStartupInfo, aProcessInformation) then
    Result := True
  else
  begin
    Result := False;
    RaiseLastOSError;
  end;
  nHwnd := FindWindow ('Spartacus', '');
  SendMessage(nHwnd, WM_SYSCOMMAND, SC_MINIMIZE, 0)
end;

function GetDosOutput(outPut: TMemo; CommandLine: string): String;
var
  SA: TSecurityAttributes;
  SI: TStartupInfo;
  PI: TProcessInformation;
  StdOutPipeRead, StdOutPipeWrite: THandle;
  WasOK: Boolean;
  Buffer: array[0..255] of AnsiChar;
  BytesRead: Cardinal;
  Handle: Boolean;
begin
  with SA do begin
    nLength := SizeOf(SA);
    bInheritHandle := True;
    lpSecurityDescriptor := nil;
  end;
  CreatePipe(StdOutPipeRead, StdOutPipeWrite, @SA, 0);
  try
    with SI do
    begin
      FillChar(SI, SizeOf(SI), 0);
      cb := SizeOf(SI);
      dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
      wShowWindow := SW_HIDE;
      hStdInput := GetStdHandle(STD_INPUT_HANDLE); // don't redirect stdin
      hStdOutput := StdOutPipeWrite;
      hStdError := StdOutPipeWrite;
    end;
    Handle := CreateProcess(nil, PChar(CommandLine),
                            nil, nil, True, 0, nil,
                            nil, SI, PI);
    Application.BringToFront;
    CloseHandle(StdOutPipeWrite);
    if Handle then
      try
        repeat
          WasOK := ReadFile(StdOutPipeRead, Buffer, 255, BytesRead, nil);
          if WasOK and (BytesRead > 0) then
          begin
            Buffer[BytesRead] := #0;
            outPut.SelStart := outPut.GetTextLen;
            outPut.SelLength := 0;
            outPut.SelText := Buffer;
          end;
        until not WasOK or (BytesRead = 0);
        WaitForSingleObject(PI.hProcess, INFINITE);
      finally
        CloseHandle(PI.hThread);
        CloseHandle(PI.hProcess);
      end;
  finally
    CloseHandle(StdOutPipeRead);
  end;
end;

function PortTCP_IsOpen(dwPort : Word; ipAddressStr:AnsiString) : boolean;
var
  client : sockaddr_in;
  sock   : Integer;

  ret    : Integer;
  wsdata : WSAData;
begin
 Result:=False;
 ret := WSAStartup($0002, wsdata); //initiates use of the Winsock DLL
  if ret<>0 then exit;
  try
    client.sin_family      := AF_INET;  //Set the protocol to use , in this case (IPv4)
    client.sin_port        := htons(dwPort); //convert to TCP/IP network byte order (big-endian)
    client.sin_addr.s_addr := inet_addr(PAnsiChar(ipAddressStr));  //convert to IN_ADDR  structure
    sock  :=socket(AF_INET, SOCK_STREAM, 0);    //creates a socket
    Result:=connect(sock,client,SizeOf(client))=0;  //establishes a connection to a specified socket
  finally
    WSACleanup;
  end;
end;

function SendMessageToTCPServer(const aMessage: string; aPort: integer): boolean;
var
  IdTCP: TIdTCPClient;
begin
  Result := False;
  try
    IdTCP := TIdTCPClient.Create(nil);
    try
      IdTCP.Host := '127.0.0.1';
      IdTCP.Port := aPort;
      IdTCP.ConnectTimeout := 3000;
      IdTCP.Connect;

      if IdTCP.Connected then
      begin
        IdTCP.IOHandler.WriteLn(aMessage);
        IdTCP.IOHandler.ReadTimeout := 500;
      end;

    finally
      IdTCP.Disconnect;
      FreeAndNil(IdTCP);
    end;
    Result := True;
  except

  end;
end;

procedure WaitProcess(const aProcessInformation: TProcessInformation; aCheckIsAlive: boolean; aThreadId: TThreadID; const aPort: integer);
var
  StringToSend: string;
begin
  // loop every 10 ms
  while WaitForSingleObject(aProcessInformation.hProcess, 10) > 0 do
  begin
    Application.ProcessMessages;
    if aCheckIsAlive then
    begin
      StringToSend := Format('{"ThreadId":%d,"ProcessId":%d}', [aThreadId, aProcessInformation.dwProcessId]);
      if not SendMessageToTCPServer(StringToSend, aPort) then
        TerminateProcess(aProcessInformation.hProcess , 0);
    end;
  end;
  CloseProcess(aProcessInformation);
end;

procedure CloseProcess(const aProcessInformation: TProcessInformation);
begin
  CloseHandle(aProcessInformation.hProcess);
  CloseHandle(aProcessInformation.hThread);
end;

function GetSystemInfo: string;
begin
  Result := 'INFORMAÇÕES DO SISTEMA:';
  Result := Result + #13#10 + '---------------------------------------------------------------------------';
  Result := Result + #13#10 + 'Mac Address: '          + GetMacAddress;
  Result := Result + #13#10 + 'Diretório do Windows: ' + GetWindowsDir;
  Result := Result + #13#10 + 'Nome do Computador: '   + GetPcName;
  Result := Result + #13#10 + 'Impressoras: ' + #13#10 + GetPrinters;
  Result := Result + #13#10 + 'Versão do Windows: '    + GetWindowsVersion;
  Result := Result + #13#10 + 'Idioma: '               + GetLanguage;
  Result := Result + #13#10 + 'Estado do Scroll: '     + GetScrollState;
  Result := Result + #13#10 + 'Resolução da Tela: '    + ScreenResolution;
  Result := Result + #13#10 + 'Espaço Livre no C: '    + FreeDiskSpace('C');
  Result := Result + #13#10 + 'Horário do Windows: '   + TimeInWindows;
  Result := Result + #13#10 + 'Estado de Energia: '    + GetPowerStatus;
  Result := Result + #13#10 + 'Usuário: '              + GetUser;
  Result := Result + #13#10 + 'Lista de Processos: '   + GetProcessList;
  Result := Result + #13#10 + '---------------------------------------------------------------------------';
  //Result := GetSystemDecimal;
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

function LocalIp: string;
var
  IPW: TIdIPWatch;
begin
  Result := '127.0.0.1';

  IpW := TIdIPWatch.Create(Application);
  try
    IpW.Active := True;
    if IpW.LocalIP <> EmptyStr then
      Result := FormatIP(IpW.LocalIP);
  finally
    if Assigned(IpW) then
      FreeAndNil(IpW);
  end;
end;

function ValidaTravamento(const Aplicacao: string; var FTaskName: string; var FPid: PDWORD_PTR;
  var FProcessa: Boolean; var FHWND: HWND; var iListOfProcess: Integer) : Boolean;
var
 dwResult: PDWORD_PTR;
 ValorRetorno: Longint;
 AppHandle : THandle;
begin
  Result := False;
  dwResult := nil;
  try
    AppHandle:= UtilsUnitGui.GetTaskHandle(Aplicacao, FTaskName, FPid, FProcessa, FHWND, iListOfProcess);
    if AppHandle <> 0 then
    begin
      ValorRetorno:= SendMessageTimeout(AppHandle, WM_NULL, 0, 0,
       SMTO_ABORTIFHUNG OR SMTO_BLOCK, 1000, dwResult);
      if ValorRetorno > 0 then
        Result := True
      else
        Result := False;
    end;
  except
  end;
end;

function ProcessExists(exeFileName: string; var FTaskName: string; var FPid: PDWORD_PTR;
  var FProcessa: Boolean; var FHWND: HWND; var iListOfProcess: Integer): Boolean;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  try
    FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
    ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
    Result := False;
    while Integer(ContinueLoop) <> 0 do
    begin
      if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
        UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
        UpperCase(ExeFileName))) then
      begin
        Result := True;
        ValidaTravamento(UpperCase(ExeFileName), FTaskName, FPid, FProcessa, FHWND, iListOfProcess);
      end;
      ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
    end;
  finally
    CloseHandle(FSnapshotHandle);
  end;
end;

procedure MakeRounded(Control: TWinControl);
var
  R: TRect;
  Rgn: HRGN;
begin
  with Control do
  begin
    R := ClientRect;
    rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom, 20, 20);
    Perform(EM_GETRECT, 0, lParam(@r));
    InflateRect(r, - 10, - 10);
    Perform(EM_SETRECTNP, 0, lParam(@r));
    SetWindowRgn(Handle, rgn, True);
    Invalidate;
  end;
end;

end.


