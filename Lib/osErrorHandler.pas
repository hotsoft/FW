unit osErrorHandler;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, db, osCIC, richedit, RegExpr;

type
  TErrorType = (etError, etCritical, etWarning);

  TosErrorHandlerForm = class(TForm)
    lbErros: TListBox;
    btnFechar: TButton;
    btnContinua: TButton;
    btnCancela: TButton;
    procedure lbErrosDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure lbErrosMeasureItem(Control: TWinControl; Index: Integer;
      var Height: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    FErrorBmp: TBitmap;
    FWarningBmp: TBitmap;
    FCriticalBmp: TBitmap;
    FEnableWarnings: boolean;

    function Execute: boolean;
    function GetErrorCount: integer;

  public
    procedure CheckEmpty(PField : TField; PFieldName: string = ''); overload;
    procedure CheckEmpty(PStr, PFieldName: string); overload;
    procedure WarningEmpty(PField : TField; PFieldName: string = ''); overload;
    function IsEmpty(PStr : string) : boolean; overload;
    function IsEmpty(PField : TField) : boolean; overload;
    function IsFullStr(PField : TField) : boolean;
    function IsFullDigit(PField : TField) : boolean;
    function IsCIC(PField : TField): boolean;
    function IsCNPJ(PField : TField): boolean;
    function IsCPF(PField : TField): boolean;
    function IsUF(PField : TField) : boolean;
    function IsEmail(PField : TField) : boolean;

    procedure Check;
    procedure Clear;
    procedure Add(PMsg : string; PErrorType : TErrorType = etError);

    property ErrorCount: integer read GetErrorCount;

    property EnableWarnings: boolean read FEnableWarnings write FEnableWarnings;
  end;
const
  OBRIGATORIO = 'Obrigatório: %s';
  AVISO_OBRIGATORIO = '%s não informado';

var
  HError: TosErrorHandlerForm;

implementation

{$R *.dfm}
{$R osErrorHandlerIcons.R32}

procedure TosErrorHandlerForm.Add(PMsg: string; PErrorType: TErrorType);
begin
  if (PErrorType <> etWarning) or (EnableWarnings) then
    lbErros.Items.AddObject(PMsg, TObject(PErrorType));
end;

function TosErrorHandlerForm.Execute: boolean;
var
  bContinua: boolean;
  i: integer;
begin
  bContinua := True;
  for i:=0 to lbErros.Items.Count-1 do
    if TErrorType(lbErros.Items.Objects[i]) <> etWarning then
    begin
      bContinua := False;
      break;
    end;

  btnFechar.Visible := not bContinua;
  btnContinua.Visible := bContinua;
  btnCancela.Visible := bContinua;
  ShowModal;
  Result := (ModalResult = mrYes);
end;

procedure TosErrorHandlerForm.lbErrosDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  Bmp: TBitmap;
  R, DestRct, SrcRct: TRect;
  TransColor: TColor;
  ItemStz: array[ 0..255 ] of Char;

  function GetTransparentColor( B: TBitmap ): TColor;
  begin
    Result := B.Canvas.Pixels[ 0, B.Height - 1 ];
  end;

begin
  with lbErros.Canvas do
  begin
    Bmp := TBitmap.Create;
    try
      FillRect( Rect );                   { Clear area for icon and text }

      DestRct := Classes.Rect( 0, 0, 18, 18 );
      SrcRct := DestRct;

      { Don't forget to set the Width and Height of destination bitmap. }
      Bmp.Width := 18;
      Bmp.Height := 18;

      if odSelected in State then
        Bmp.Canvas.Brush.Color := clHighlight
      else
        Bmp.Canvas.Brush.Color := lbErros.Color;

      case TErrorType( lbErros.Items.Objects[ Index ] ) of
        etWarning:
        begin
          TransColor := GetTransparentColor( FWarningBmp );
          Bmp.Canvas.BrushCopy( DestRct, FWarningBmp, SrcRct, TransColor);
        end;

        etCritical:
        begin
          TransColor := GetTransparentColor( FCriticalBmp );
          Bmp.Canvas.BrushCopy( DestRct, FCriticalBmp, SrcRct, TransColor );
        end;
        else
        begin
          TransColor := GetTransparentColor( FErrorBmp );
          Bmp.Canvas.BrushCopy( DestRct, FErrorBmp, SrcRct, TransColor );
        end;
      end;
      Draw( Rect.Left + 4, Rect.Top + 2, Bmp );

      R := Rect;
      Inc( R.Left, 24 );
      Inc( R.Top, 2 );
      StrPCopy( ItemStz, lbErros.Items[ Index ] );
      DrawText( Handle, ItemStz, -1, R, dt_WordBreak or dt_ExpandTabs );
    finally
      Bmp.Free;
    end;
  end;
end;

procedure TosErrorHandlerForm.lbErrosMeasureItem(Control: TWinControl; Index: Integer;
  var Height: Integer);
var
  R: TRect;
  ItemStz: array[ 0..255 ] of Char;
  H: Integer;
begin
  R := Rect( 0, 0, lbErros.Width - 24, 2 );
  StrPCopy( ItemStz, lbErros.Items[ Index ] );
  H := DrawText( lbErros.Canvas.Handle, ItemStz, -1, R,
                 dt_CalcRect or dt_WordBreak or dt_ExpandTabs );
  if H < 20 then
    H := 20;
  Height := H + 15;
end;

procedure TosErrorHandlerForm.FormCreate(Sender: TObject);
begin
  FErrorBmp := TBitmap.Create;
  FErrorBmp.Handle := LoadBitmap( HInstance, 'OS_ERROR' );
  FWarningBmp := TBitmap.Create;
  FWarningBmp.Handle := LoadBitmap( HInstance, 'OS_WARNING' );
  FCriticalBmp := TBitmap.Create;
  FCriticalBmp.Handle := LoadBitmap( HInstance, 'OS_CRITICAL' );
  FEnableWarnings := True;
end;

procedure TosErrorHandlerForm.FormDestroy(Sender: TObject);
begin
  FErrorBmp.Free;
  FWarningBmp.Free;
  FCriticalBmp.Free;
end;


function TosErrorHandlerForm.GetErrorCount: integer;
begin
  Result := lbErros.Items.Count;
end;

procedure TosErrorHandlerForm.Check;
begin
  if lbErros.Items.Count > 0 then
  begin
    if Execute then
      Abort;
  end;
end;

procedure TosErrorHandlerForm.Clear;
begin
  lbErros.Items.Clear;
end;

procedure TosErrorHandlerForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caHide;
end;

function TosErrorHandlerForm.IsCIC(PField : TField): boolean;
var
  n : integer;
  CIC : string;
  DV : integer;
begin
  CIC := Trim(PField.AsString);
  DV := -1;
  n := 0;
  if not IsEmpty(CIC) then
  begin
    n := Length(CIC);
    if n = 14 then
      DV := CalcDV_CNPJ(CIC)
    else if n = 11 then
      DV := CalcDV_CPF(CIC);
  end;
  if DV = -1 then
    Result := False
  else
    Result := StrToInt(Copy(CIC, n - 1, 2)) = DV;
end;

function TosErrorHandlerForm.IsCNPJ(PField: TField): boolean;
var
  DV : integer;
  CNPJ : string;
begin
  CNPJ := PField.AsString;
  if IsEmpty(CNPJ) then
    Result := False
  else
  begin
    DV := CalcDV_CNPJ(Trim(CNPJ));
    if DV = -1 then
      Result := False
    else
      Result := StrToInt(Copy(CNPJ, 13, 2)) = DV;
  end;
end;

function TosErrorHandlerForm.IsCPF(PField: TField): boolean;
var
  DV : integer;
  CPF : string;
begin
  CPF := PField.AsString;
  if IsEmpty(CPF) then
    Result := False
  else
  begin
    DV := CalcDV_CPF(Trim(CPF));
    if DV = -1 then
      Result := False
    else
      Result := StrToInt(Copy(CPF, 10, 2)) = DV;
  end;
end;

function TosErrorHandlerForm.IsEmpty(PStr: string): boolean;
begin
  Result := (Trim(PStr) = '');
end;

function TosErrorHandlerForm.IsFullDigit(PField: TField): boolean;
var
  s : string;
  n : integer;
  i : integer;
begin
  Result := False;
  if not PField.IsNull then
  begin
    s := Trim(PField.AsString);
    n := Length(s);
    if n = PField.DisplayWidth then
    begin
      i := 1;
      while (i <= n) and (s[i] >= '0') and (s[i] <= '9') do
        Inc(i);

      Result := (i > n);
    end;
  end;
end;

function TosErrorHandlerForm.IsFullStr(PField: TField): boolean;
begin
  Result := False;
  if not PField.IsNull then
    Result := (Length(Trim(PField.AsString)) = PField.DisplayWidth);
end;

function TosErrorHandlerForm.IsUF(PField: TField): boolean;
const
  SiglasValidas = ' RS SC PR SP MS MT RJ ES MG GO BA PE SE AL PI MA RN CE PB PA AM AC RO RR AP TO DF ';
var
  SiglaUF : string;
begin
  SiglaUF := PField.AsString;
  if IsEmpty(SiglaUF) then
    Result := False
  else
    Result := (Pos(' '+UpperCase(SiglaUF)+' ', SiglasValidas) > 0);
end;

function TosErrorHandlerForm.IsEmail(PField : TField) : boolean;
begin
  Result := ExecRegExpr('^[A-Za-z0-9._%+-]+@[A-Za-z0-9-]+\.[A-Za-z0-9-]{2,}(\.[A-Za-z0-9-]{2,})*$',
    PField.AsString);
end;

function TosErrorHandlerForm.IsEmpty(PField: TField): boolean;
begin
  Result := (IsEmpty(PField.AsString))
end;

procedure TosErrorHandlerForm.CheckEmpty(PField: TField; PFieldName: string);
begin
  if IsEmpty(PField) then
  begin
    if PFieldName = '' then
      PFieldName := PField.DisplayLabel;

    Add(Format(OBRIGATORIO,[PFieldName]));
  end;
end;

procedure TosErrorHandlerForm.CheckEmpty(PStr, PFieldName: string);
begin
  if IsEmpty(PStr) then
    Add(Format(OBRIGATORIO,[PFieldName]));
end;

procedure TosErrorHandlerForm.WarningEmpty(PField: TField; PFieldName: string);
begin
  if IsEmpty(PField) then
  begin
    if PFieldName = '' then
      PFieldName := PField.DisplayLabel;

    Add(Format(AVISO_OBRIGATORIO,[PFieldName]), etWarning);
  end;
end;

procedure TosErrorHandlerForm.FormShow(Sender: TObject);
begin
  if Application.MainForm <> nil then
  begin
    Self.Left := Application.MainForm.ClientOrigin.X + Application.MainForm.ClientWidth - Self.Width - 18;
    Self.Top := Application.MainForm.ClientOrigin.Y + 54;
  end;
end;


procedure TosErrorHandlerForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((ssAlt in Shift) and (Key = VK_F4)) then
    Key := 0; 
end;

initialization
  HError := TosErrorHandlerForm.Create(Application);

end.
