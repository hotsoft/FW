unit osShellAPI;

interface
uses
  SysUtils, WinTypes, WinProcs, ShlObj, Windows, ComObj, ActiveX, ShellApi, Registry,
  Forms;

function ShGetTempPathFileName(p_sPrefix : string) : string;
{ obtem um nome de arquivo temporario com o caminho do diretorio
  padrao de arquivos temporarios (se houver) ou a raiz }

function ShGetTempPath : string;
{ retorna o caminho do diretorio padrao de arquivos temporarios
  ou ''}

function BrowseForFolder(p_sRootFolder, p_selectionFolder, p_sTitle : string) : string;
{ Browse por um diretorio tendo como raiz p_sRootFolder. Se p_sRootFolder = '' entao a raiz é Meu Computador
}

procedure AddToRecentDocs(p_sFileName : string);
{ Adiciona um atalho para p_sFileName na menu Documentos do menu
  iniciar}

procedure CopyFiles(p_sFrom, p_sTo : string);
procedure MoveFiles(p_sFrom, p_sTo : string);
procedure DeleteFiles(p_sFiles : string);

procedure SilentDeleteFiles(p_sFiles : string);
{ O mesmo que DeleteFiles mas sem confirmaçao ou janela de progresso }

function GetSpecialFolderPath(p_iFolder : Integer) : string;

function GetMyDocumentsPath : string;
{ Retorna o caminho para a pasta Meus Documentos do usuario atual }

function GetDesktopPath : string;
{ Retorna o caminho para a pasta Desktop do usuario atual }

function GetProgramsMenuPath : string;
{ Retorna o caminho para a pasta Iniciar|Programas do usuario atual }

function GetStartMenuPath : string;
{ Retorna o caminho para a pasta Iniciar do usuario atual }

function GetStartUpMenuPath : string;
{ Retorna o caminho para a pasta Iniciar|Programas|Iniciar do usuario atual }

function GetApplicationDataPath : string;

procedure CreateLink(p_sLinkFile, p_sWorkingFolder, p_sLinkPath : string);
{ Cria um atalho do arquivo p_sLinkFile com o nome p_sLinkPath, diretorio p_sWorkingFolder
  Ex.:

  CreateLink('C:\Windows\Notepad.exe', 'C:\Windows', 'C:\Notepad.lnk');
}

procedure CreateDesktopLink(p_sLinkFile, p_sWorkingFolder, p_sLinkPath : string);
{ Cria um atalho do arquivo p_sLinkFile no desktop

  CreateDesktopLink('C:\Windows\Notepad.exe', 'C:\Windows', 'Notepad.lnk');
}

procedure CreateProgramsMenuLink(p_sLinkFile, p_sWorkingFolder, p_sLinkPath : string);
{ Cria um atalho do arquivo p_sLinkFile no menu Iniciar|Programas

  CreateProgramsMenuLink('C:\Windows\Notepad.exe', 'C:\Windows', 'Notepad.lnk');
  CreateProgramsMenuLink('C:\Windows\Notepad.exe', GetMyDocumentsPath, 'Utilitários\Notepad.lnk');
}

procedure CreateStartMenuLink(p_sLinkFile, p_sWorkingFolder, p_sLinkPath : string);
{ Cria um atalho no menu Iniciar }

procedure CreateStartUpMenuLink(p_sLinkFile, p_sWorkingFolder, p_sLinkPath : string);
{ Cria um atalho no menu Iniciar|Programas|Iniciar }

type
  TShMessageStyle = (msStandard, msQuestion, msWarning, msError);

function ShShowMessage(Mensagem : String; msStyle : TShMessageStyle = msStandard) : boolean;

function VersionInfo(p_exeName : String; p_key : String) : String;

function VersionInfoCompanyName(p_exeName : String) : String;
function VersionInfoFileDescription(p_exeName : String) : String;
function VersionInfoFileVersion(p_exeName : String) : String;
function VersionInfoInternalName(p_exeName : String) : String;
function VersionInfoLegalCopyright(p_exeName : String) : String;
function VersionInfoLegalTrademarks(p_exeName : String) : String;
function VersionInfoOriginalFilename(p_exeName : String) : String;
function VersionInfoProductName(p_exeName : String) : String;
function VersionInfoProductVersion(p_exeName : String) : String;
function VersionInfoComments(p_exeName : String) : String;

function ExecuteWait(const p_commandLine : string; const p_commandShow: Word) : integer;
function ExecuteWaitTime(const p_commandLine : string; const p_commandShow: Word; const timeout: DWORD; var ProcessInfo: TProcessInformation) : integer;
{ Executa uma aplicação e espera até que ela termine
  Retorna: Codigo de Erro
           ou o ExitCode retornado pela aplicação executada }

function GetFolder(aRoot: integer; aCaption :string): string;

implementation


function ShGetTempPath : string;
var
  sFilePath : string;
begin
  sFilePath := StringOfChar(' ', 1024);

  if GetTempPath(1024, PChar(sFilePath)) = 0 then
    sFilePath := '';

  ShGetTempPath := Trim(sFilePath);
end;

function ShGetTempPathFileName(p_sPrefix : string) : string;
var
  sFilePath : string;
  sFileName : string;
begin
  sFilePath := StringOfChar(' ', 1024);
  sFileName := StringOfChar(' ', 1024);

  if GetTempPath(1024, PChar(sFilePath)) = 0 then
    sFilePath := '\';

  GetTempFileName(PChar(sFilePath), PChar(p_sPrefix), 1, PChar(sFileName));

  ShGetTempPathFileName := Trim(sFileName);
end;

function GetSpecialFolderPath(p_iFolder : Integer) : string;
var
  sPath : string;
  ppidl : PItemIDList;
begin
  sPath := StringOfChar(' ', 1024);
{
  SHGetSpecialFolderPath(0, PChar(sPath), p_iFolder, FALSE);
}
  SHGetSpecialFolderLocation(0, p_iFolder, ppidl);
  SHGetPathFromIDList(ppidl, PChar(sPath));

  GetSpecialFolderPath := Trim(sPath);
end;

function GetMyDocumentsPath : string;
begin
  GetMyDocumentsPath := GetSpecialFolderPath(CSIDL_PERSONAL);
end;

function GetDesktopPath : string;
begin
  GetDesktopPath := GetSpecialFolderPath(CSIDL_DESKTOP);
end;

function GetProgramsMenuPath : string;
begin
  GetProgramsMenuPath := GetSpecialFolderPath(CSIDL_PROGRAMS);
end;

function GetStartMenuPath : string;
begin
  GetStartMenuPath := GetSpecialFolderPath(CSIDL_STARTMENU);
end;

function GetStartUpMenuPath : string;
begin
  GetStartUpMenuPath := GetSpecialFolderPath(CSIDL_STARTUP);
end;

function GetApplicationDataPath : string;
begin
  GetApplicationDataPath := GetSpecialFolderPath(CSIDL_APPDATA);
end;

// -- BrowseForFolder
var
  g_selectionFolder : string;     // -- nao pode ser local a funcao (i.e. nao pode estar no stack)

function BrowseForFolder(p_sRootFolder, p_selectionFolder, p_sTitle : string) : string;
var
  lpbi : TBrowseInfo;
  lpidl : PItemIDList;
  lpidlroot : PItemIDList;
  pszDisplayName : string;
  pszResult : string;
  psl : IShellLink;

  function BrowserFolderCallback(Wnd: HWND; uMsg: UINT; lParam, lpData: LPARAM): Integer; stdcall;
  begin
    if uMsg = BFFM_INITIALIZED then
      SendMessage(Wnd, BFFM_SETSELECTION, 1, LongInt(PChar(g_selectionFolder)));

    BrowserFolderCallback := 0;
  end;

begin
  g_selectionFolder := p_selectionFolder;

  pszDisplayName := StringOfChar(' ', 1024);

  lpidlroot := nil;
  if p_sRootFolder <> '' then
  begin
    psl := CreateComObject(CLSID_ShellLink) as IShellLink;

    psl.SetPath(PChar(p_sRootFolder));
    psl.GetIDList(lpidlroot);
  end;

  lpbi.hwndOwner := 0;
  lpbi.pidlRoot := lpidlroot;
  lpbi.pszDisplayName := PChar(pszDisplayName);
  lpbi.lpszTitle := PChar(p_sTitle);
  lpbi.ulFlags := 0;
  lpbi.lpfn := @BrowserFolderCallback;
  lpbi.lParam := 0;
  lpbi.iImage := 0;

  lpidl := SHBrowseForFolder(lpbi);

  pszResult := StringOfChar(' ', 1024);

  if lpidl <> nil then
    SHGetPathFromIDList(lpidl, PChar(pszResult));

  BrowseForFolder := Trim(pszResult);
end;

procedure CopyFiles(p_sFrom, p_sTo : string);
var
  lpFileOp : ^TSHFileOpStruct;
begin
  lpFileOp := AllocMem(Sizeof(TSHFileOpStruct));

  lpFileOp.Wnd := 0;
  lpFileOp.wFunc := FO_COPY;
  lpFileOp.pFrom := PChar(p_sFrom);
  lpFileOp.pTo := PChar(p_sTo);
  lpFileOp.fFlags := FOF_NOCONFIRMMKDIR;

  SHFileOperation(lpFileOp^);

  FreeMem(lpFileOp);
end;

procedure MoveFiles(p_sFrom, p_sTo : string);
var
  lpFileOp : ^TSHFileOpStruct;
begin
  lpFileOp := AllocMem(Sizeof(TSHFileOpStruct));

  lpFileOp.Wnd := 0;
  lpFileOp.wFunc := FO_MOVE;
  lpFileOp.pFrom := PChar(p_sFrom);
  lpFileOp.pTo := PChar(p_sTo);
  lpFileOp.fFlags := FOF_NOCONFIRMMKDIR;

  SHFileOperation(lpFileOp^);

  FreeMem(lpFileOp);
end;

procedure DeleteFiles(p_sFiles : string);
var
  lpFileOp : ^TSHFileOpStruct;
begin
  lpFileOp := AllocMem(Sizeof(TSHFileOpStruct));

  lpFileOp.Wnd := 0;
  lpFileOp.wFunc := FO_DELETE;
  lpFileOp.pFrom := PChar(p_sFiles);
  lpFileOp.fFlags := FOF_ALLOWUNDO;

  SHFileOperation(lpFileOp^);

  FreeMem(lpFileOp);
end;

procedure SilentDeleteFiles(p_sFiles : string);
var
  lpFileOp : ^TSHFileOpStruct;
begin
  lpFileOp := AllocMem(Sizeof(TSHFileOpStruct));

  lpFileOp.Wnd := 0;
  lpFileOp.wFunc := FO_DELETE;
  lpFileOp.pFrom := PChar(p_sFiles);
  lpFileOp.fFlags := FOF_ALLOWUNDO + FOF_SILENT + FOF_NOCONFIRMATION;

  SHFileOperation(lpFileOp^);

  FreeMem(lpFileOp);
end;

procedure AddToRecentDocs(p_sFileName : string);
begin
  SHAddToRecentDocs(SHARD_PATH, PChar(p_sFileName));
end;

procedure CreateLink(p_sLinkFile, p_sWorkingFolder, p_sLinkPath : string);
const
  IID_IPersistFile: TGUID = (
    D1:$0000010B;D2:$0000;D3:$0000;D4:($C0,$00,$00,$00,$00,$00,$00,$46));
var
  psl : IShellLink;
  ppf : IPersistFile;
  wsz: array[0..1024] of WideChar;
begin
  psl := CreateComObject(CLSID_ShellLink) as IShellLink;

  psl.SetPath(PChar(p_sLinkFile));
  psl.SetWorkingDirectory(PChar(p_sWorkingFolder));

  psl.QueryInterface(IID_IPersistFile, ppf);

  StringToWideChar(p_sLinkPath, wsz, SizeOf(wsz) div 2);

  ppf.Save(wsz, False);
end;

procedure CreateDesktopLink(p_sLinkFile, p_sWorkingFolder, p_sLinkPath : string);
begin
  CreateLink(p_sLinkFile, p_sWorkingFolder, GetDesktopPath + '\' + p_sLinkPath);
end;

procedure CreateProgramsMenuLink(p_sLinkFile, p_sWorkingFolder, p_sLinkPath : string);
begin
  CreateLink(p_sLinkFile, p_sWorkingFolder, GetProgramsMenuPath + '\' + p_sLinkPath);
end;

procedure CreateStartMenuLink(p_sLinkFile, p_sWorkingFolder, p_sLinkPath : string);
begin
  CreateLink(p_sLinkFile, p_sWorkingFolder, GetStartMenuPath + '\' + p_sLinkPath);
end;

procedure CreateStartUpMenuLink(p_sLinkFile, p_sWorkingFolder, p_sLinkPath : string);
begin
  CreateLink(p_sLinkFile, p_sWorkingFolder, GetStartUpMenuPath + '\' + p_sLinkPath);
end;

function ShShowMessage(Mensagem : String; msStyle : TShMessageStyle) : boolean;
var
  s : String;
  Flags : LongInt;
begin
  Flags := 0;
  s := Application.ExeName;
  if Application.Title <> '' then
    s := Application.Title;

  case msStyle of
    msStandard:   Flags := MB_ICONINFORMATION;
    msQuestion:   Flags := MB_ICONQUESTION;
    msWarning:    Flags := MB_ICONWARNING;
    msError:      Flags := MB_ICONSTOP;
  end;

  Result := Application.MessageBox(PChar(Mensagem), PChar(s), MB_OKCANCEL + MB_DEFBUTTON1 + Flags) = IDOK;
end;

function VersionInfo(p_exeName : String; p_key : String) : String;
var
  InfoSize, Wnd: DWORD;
  VerBuf: Pointer;
  VerSize: DWORD;
  VersionS : String;
  VersionPtr : PChar;
begin
  VersionS := StringOfChar(' ', 1024);
  VersionPtr := PChar(VersionS);

  VerSize := StrLen(VersionPtr);

  InfoSize := GetFileVersionInfoSize(PChar(p_exeName), Wnd);
  if InfoSize <> 0 then
  begin
    GetMem(VerBuf, InfoSize);
    try
      if GetFileVersionInfo(PChar(p_exeName), Wnd, InfoSize, VerBuf) then
        if VerQueryValue(VerBuf, PChar('\StringFileInfo\041604E4\' + p_key), Pointer(VersionPtr), VerSize) then
          VersionS := VersionPtr;
    finally
      FreeMem(VerBuf);
    end;
  end;
  VersionInfo := Trim(VersionS);
end;

function VersionInfoCompanyName(p_exeName : String) : String;
begin
  VersionInfoCompanyName := VersionInfo(p_exeName, 'CompanyName');
end;

function VersionInfoFileDescription(p_exeName : String) : String;
begin
  VersionInfoFileDescription := VersionInfo(p_exeName, 'FileDescription');
end;

function VersionInfoFileVersion(p_exeName : String) : String;
begin
  VersionInfoFileVersion := VersionInfo(p_exeName, 'FileVersion');
end;

function VersionInfoInternalName(p_exeName : String) : String;
begin
  VersionInfoInternalName := VersionInfo(p_exeName, 'InternalName');
end;

function VersionInfoLegalCopyright(p_exeName : String) : String;
begin
  VersionInfoLegalCopyright := VersionInfo(p_exeName, 'LegalCopyright');
end;

function VersionInfoLegalTrademarks(p_exeName : String) : String;
begin
  VersionInfoLegalTrademarks := VersionInfo(p_exeName, 'LegalTrademarks');
end;

function VersionInfoOriginalFilename(p_exeName : String) : String;
begin
  VersionInfoOriginalFilename := VersionInfo(p_exeName, 'OriginalFilename');
end;

function VersionInfoProductName(p_exeName : String) : String;
begin
  VersionInfoProductName := VersionInfo(p_exeName, 'ProductName');
end;

function VersionInfoProductVersion(p_exeName : String) : String;
begin
  VersionInfoProductVersion := VersionInfo(p_exeName, 'ProductVersion');
end;

function VersionInfoComments(p_exeName : String) : String;
begin
  VersionInfoComments := VersionInfo(p_exeName, 'Comments');
end;


// With a big Help from my Theodoros Bebekis - Thessaloniki, Greece
function ExecuteWait(const p_commandLine : string; const p_commandShow: Word) : integer;
var
  pCommandLine  : array[0..MAX_PATH] of char;
  StartupInfo   : TStartupInfo;
  ProcessInfo   : TProcessInformation;
  hAppProcess,  hAppThread   : THandle;
  dwExitCode    : DWORD;
  bRet          : boolean;
begin
  StrPCopy(pCommandLine, p_commandLine);
  hAppThread := 0;
  hAppProcess := 0;
TRY
{ Prepare StartupInfo structure }
    FillChar(StartupInfo, SizeOf(StartupInfo), #0);
    StartupInfo.cb          := SizeOf(StartupInfo);
    StartupInfo.dwFlags     := STARTF_USESHOWWINDOW or
                               STARTF_USESTDHANDLES;
    StartupInfo.wShowWindow := p_commandShow;
    StartupInfo.hStdOutput  := 0;
    StartupInfo.hStdInput   := 0;

    dwExitCode := $FFFFFFFF;
{ Create the app }
    bRet := CreateProcess(
          nil,                { pointer to name of executable module }
          pCommandLine,       { pointer to command line string }
          nil,                { pointer to process security attributes }
          nil,                { pointer to thread security attributes }
          True,               { handle inheritance flag }
          HIGH_PRIORITY_CLASS,{ creation flags }
          nil,                { pointer to new environment block }
          nil,                { pointer to current directory name }
          StartupInfo,        { pointer to STARTUPINFO }
          ProcessInfo);       { pointer to PROCESS_INF }

{ wait for the app to finish its job and take the handles to free them later }
    if bRet then
    begin
      WaitforSingleObject(ProcessInfo.hProcess, INFINITE);
      hAppProcess  := ProcessInfo.hProcess;
      hAppThread   := ProcessInfo.hThread;
      GetExitCodeProcess (hAppProcess, dwExitCode);
    end
    else
      dwExitCode := GetLastError;

  FINALLY
{ Close the handles.
      Kernel objects, like the process and the files
      we created in this case, are maintained by a usage
      count.  So, for cleaning up purposes, we have to
      close the handles to inform the system that we don't
      need the objects anymore }

    if hAppThread <> 0 then
      CloseHandle(hAppThread);

    if hAppProcess <> 0 then
      CloseHandle(hAppProcess);

  end;
  Result := dwExitCode;
end;

function ExecuteWaitTime(const p_commandLine : string; const p_commandShow: Word; const timeout: DWORD; var ProcessInfo: TProcessInformation) : integer;
var
  pCommandLine  : array[0..MAX_PATH] of char;
  StartupInfo   : TStartupInfo;
  hAppProcess,  hAppThread   : THandle;
  dwExitCode    : DWORD;
  bRet          : boolean;
begin
  StrPCopy(pCommandLine, p_commandLine);
  hAppThread := 0;
  hAppProcess := 0;
TRY
{ Prepare StartupInfo structure }
    FillChar(StartupInfo, SizeOf(StartupInfo), #0);
    StartupInfo.cb          := SizeOf(StartupInfo);
    StartupInfo.dwFlags     := STARTF_USESHOWWINDOW or
                               STARTF_USESTDHANDLES;
    StartupInfo.wShowWindow := p_commandShow;
    StartupInfo.hStdOutput  := 0;
    StartupInfo.hStdInput   := 0;

    dwExitCode := $FFFFFFFF;
{ Create the app }
    bRet := CreateProcess(
          nil,                { pointer to name of executable module }
          pCommandLine,       { pointer to command line string }
          nil,                { pointer to process security attributes }
          nil,                { pointer to thread security attributes }
          True,               { handle inheritance flag }
          HIGH_PRIORITY_CLASS,{ creation flags }
          nil,                { pointer to new environment block }
          nil,                { pointer to current directory name }
          StartupInfo,        { pointer to STARTUPINFO }
          ProcessInfo);       { pointer to PROCESS_INF }

{ wait for the app to finish its job and take the handles to free them later }
    if bRet then
    begin
      WaitforSingleObject(ProcessInfo.hProcess, timeout);
      hAppProcess  := ProcessInfo.hProcess;
      hAppThread   := ProcessInfo.hThread;
      GetExitCodeProcess (hAppProcess, dwExitCode);
    end
    else
      dwExitCode := GetLastError;

  FINALLY
{ Close the handles.
      Kernel objects, like the process and the files
      we created in this case, are maintained by a usage
      count.  So, for cleaning up purposes, we have to
      close the handles to inform the system that we don't
      need the objects anymore }



  end;
  Result := dwExitCode;
end;

function GetFolder(aRoot: integer; aCaption :string): string;
var
  pPrograms,pBrowse: PItemIDList;
  hBrowseInfo: TBROWSEINFO;
  hPChar: PChar;

begin
  Result := '';

  if (not SUCCEEDED(SHGetSpecialFolderLocation(Getactivewindow, aRoot,
                    pPrograms))) then
    Exit;

  hPChar := StrAlloc(100);
  try
    with hBrowseInfo do
    begin
      hwndOwner := Getactivewindow;
      pidlRoot := pPrograms;
      pszDisplayName := hPChar;
      lpszTitle := pChar(aCaption);
      ulFlags := BIF_RETURNONLYFSDIRS;
      lpfn := nil;
      lParam := 0;
    end;

    pBrowse := SHBrowseForFolder(hBrowseInfo);
    if (pBrowse <> nil) then
      if (SHGetPathFromIDList(pBrowse, hPChar)) then
        Result:= hPChar;
  finally
    StrDispose(hPChar);
  end;
end;

end.
