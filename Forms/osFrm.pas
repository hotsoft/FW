unit osFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Vcl.ComCtrls,
  ActnList, osUtils, ImgList, osActionList, System.Generics.Collections, System.Actions {$IFDEF VER320} , System.ImageList {$ENDIF};

type
  TOperacao  = (oInserir, oEditar, oExcluir, oVisualizar, oImprimir);
  TOperacoes = set of TOperacao;

  TWhiteList = class(TObjectList<TComponent>)
  end;

  TWinControlEx = class(TWinControl)
  private

  protected
    procedure KeyPress(var Key: Char); override;
  public
    procedure SetFocus; override;
  end;


  TosForm = class(TForm)
    ActionList: TosActionList;
    OnCheckActionsAction: TAction;
    ImageList: TImageList;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FOperacoes: TOperacoes;
    procedure SetOperacoes(const Value: TOperacoes);
  protected
    FTabSheet: TTabSheet;
    FWhiteList: TWhiteList;
    procedure DisableWinControlComponents(aWinControl: TWinControl);
    procedure EnableWinControlComponents(aWinControl: TWinControl);
    procedure AddControlsToWhiteListByContainer(aContainer: TWinControl);
    function GetWhiteList: TWhiteList;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function EditAba(pTabSheet: TTabSheet): boolean;
  published
    property Operacoes: TOperacoes read FOperacoes write SetOperacoes;
  end;

var
  osForm: TosForm;

implementation

uses TypInfo, Vcl.Menus;

{$R *.DFM}

{ TBizForm }


constructor TosForm.Create(AOwner: TComponent);
begin                     
  inherited;
  //CheckDefaultParams; // Carrega os parâmetros empresa/estabelecimento se necessário
end;

destructor TosForm.Destroy;
begin
  FreeAndNil(FWhiteList);
  inherited;
end;

procedure TosForm.FormShow(Sender: TObject);
begin
  OnCheckActionsAction.Execute;
end;


procedure TosForm.SetOperacoes(const Value: TOperacoes);
begin
  FOperacoes := Value;
end;

procedure TosForm.FormCreate(Sender: TObject);
begin
  Operacoes := [oInserir, oEditar, oExcluir, oVisualizar]; // operações Defaults
end;

procedure TosForm.DisableWinControlComponents(aWinControl: TWinControl);
var
  i: integer;
  infoEnabled: PPropInfo;
begin
  for i:= 0 to aWinControl.ComponentCount - 1 do
    if (aWinControl.Components[i] is TPageControl) then
      Self.DisableWinControlComponents(TPageControl(aWinControl.Components[i]))
    else
    begin
      if (not self.GetWhiteList.Contains(aWinControl.Components[i])) and
        ((aWinControl.Components[i] is TPopupMenu) or (aWinControl.Components[i] is TMenuItem) or (aWinControl.Components[i] is TWinControl)) then
      begin
        infoEnabled := TypInfo.GetPropInfo(aWinControl.Components[i], 'Enabled');
        if assigned(infoEnabled) then
          TypInfo.SetPropValue(aWinControl.Components[i], 'Enabled', False);
      end;
    end;
end;

procedure TosForm.EnableWinControlComponents(aWinControl: TWinControl);
var
  i: integer;
  infoEnabled: PPropInfo;
begin
  for i:= 0 to aWinControl.ComponentCount - 1 do
  begin
    infoEnabled := TypInfo.GetPropInfo(aWinControl.Components[i], 'Enabled');
    if assigned(infoEnabled) then
      TypInfo.SetPropValue(aWinControl.Components[i], 'Enabled', True);
    if aWinControl.Components[i] is TWinControl then
      EnableWinControlComponents(TWinControl(aWinControl.Components[i]));
  end;
end;

function TosForm.GetWhiteList: TWhiteList;
begin
  if FWhiteList = nil then
  begin
    FWhiteList := TWhiteList.Create;
    FWhiteList.OwnsObjects := False;
  end;
  Result := FWhiteList;
end;

procedure TosForm.AddControlsToWhiteListByContainer(aContainer: TWinControl);
var
  i: integer;
begin
  Self.GetWhiteList.Add(aContainer);
  for i:= 0 to aContainer.ComponentCount - 1 do
  begin
    Self.GetWhiteList.Add(aContainer.Components[i]);
    if (aContainer.Components[i] is TWinControl) then
      AddControlsToWhiteListByContainer(TWinControl(aContainer.Components[i]));
  end;
end;

function TosForm.EditAba(pTabSheet: TTabSheet): boolean;
begin
  Screen.Cursor := crHourglass;

  OnCheckActionsAction.Execute;
  Screen.Cursor := crDefault;

  FTabSheet := pTabSheet;
  self.Parent := pTabSheet;
  self.Align := alClient;
  self.BorderStyle := bsNone;
  self.Visible := true;
  pTabSheet.Caption := self.Caption;
end;

procedure TWinControlex.KeyPress(var Key: Char);
begin
  inherited;
end;

procedure TWinControlEx.SetFocus;
begin
  inherited;

end;

end.
