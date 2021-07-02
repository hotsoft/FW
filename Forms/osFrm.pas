unit osFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Vcl.ComCtrls,
  ActnList, osUtils, ImgList, osActionList, System.Generics.Collections, provider, osAppResources,
  System.Actions {$IFDEF VER320} , System.ImageList {$ENDIF};

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

  TDatamoduleClass = class of TDatamodule;

  TosForm = class(TForm)
    ActionList: TosActionList;
    OnCheckActionsAction: TAction;
    ImageList: TImageList;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FOperacoes: TOperacoes;
    FDatamodule: TDatamodule;
    procedure SetOperacoes(const Value: TOperacoes);
    function CreateCurrentDatamodule(FCurrentResource: TosAppResource): TDatamodule;
    procedure SetDatamodule(const Value: TDatamodule);
  protected
    FTabSheet: TTabSheet;
    FWhiteList: TWhiteList;
    procedure DisableWinControlComponents(aWinControl: TWinControl);
    procedure EnableWinControlComponents(aWinControl: TWinControl);
    procedure AddControlsToWhiteListByContainer(aContainer: TWinControl);
    function GetWhiteList: TWhiteList;
    property Datamodule: TDatamodule read FDatamodule write SetDatamodule;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function EditAba(pTabSheet: TTabSheet; FCurrentResource: TosAppResource): boolean;
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

procedure TosForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FDatamodule <> nil then
    FreeAndNil(FDatamodule);
  if FTabSheet <> nil then
  begin
    FTabSheet.PageControl.SelectNextPage(True);
    FreeAndNil(FTabSheet);
  end;
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

function TosForm.EditAba(pTabSheet: TTabSheet; FCurrentResource: TosAppResource): boolean;
begin
  self.Datamodule := self.CreateCurrentDatamodule(FCurrentResource);
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

function TosForm.CreateCurrentDatamodule(FCurrentResource: TosAppResource): TDatamodule;
begin
  if (FCurrentResource.ResType in [rtEdit, rtReport, rtOther]) and
    (Assigned(FCurrentResource.DataClass)) then
    Result := TDatamoduleClass(FCurrentResource.DataClass).Create(Self)
  else
    Result := nil;
//    raise Exception.CreateFmt('Datamodule %s não registrado', [FCurrentResource.DataClassName]);
end;

procedure TosForm.SetDatamodule(const Value: TDatamodule);
var
  Provider: TCustomProvider;
begin
  if Value <> FDatamodule then
  begin
    FDatamodule := Value;
    Provider := TCustomProvider(GetComponentByName(FDatamodule, 'MasterProvider', TCustomProvider));
  end;
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
