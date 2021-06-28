unit osCustomEditFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ActnList, Db, DBClient, dbctrls,
  Wwintl, osFrm, ImgList, Menus, Buttons, ComCtrls,
  ToolWin, ExtCtrls, osActionList, osClientDataset, provider, osUtils,
  Grids, Wwdbigrd, Wwdbgrid, wwdbdatetimepicker, wwrcdpnl, Mask, wwdbedit, wwriched,
  osComboSearch, osDBDualTree, wwDBSpin, wwDBNavigator, wwDBcomb, wwDBlook, DBGrids,
  System.Actions, System.UITypes;

type
  TFormMode      = (fmEdit, fmInsert, fmView, fmDelete);

// tags                     0              1          2          3       4
  TVisibleButton  = (vbSalvarFechar, vbImprimir, vbExcluir, vbFechar, vbParar);

  TVisibleButtons = set of TVisibleButton;

  TosCustomEditForm = class(TosForm)
    MasterDataSource: TDataSource;
    MainControlBar: TControlBar;
    ControlBarPanel: TPanel;
    SalvarFecharButton: TSpeedButton;
    SaveAction: TAction;
    SaveCloseAction: TAction;
    NewAction: TAction;
    CloseAction: TAction;
    SaveNewAction: TAction;
    CancelUpdatesAction: TAction;
    ContentAction: TAction;
    IndexAction: TAction;
    DeleteAction: TAction;
    ImprimirAction: TAction;
    ImprimirButton: TSpeedButton;
    ExcluirButton: TSpeedButton;
    FecharButton: TSpeedButton;
    PararButton: TSpeedButton;
    MenuPadraoPopup: TPopupMenu;
    A1: TMenuItem;
    E1: TMenuItem;
    Novo1: TMenuItem;
    Desfazeralteraes1: TMenuItem;
    N1: TMenuItem;
    Salvar1: TMenuItem;
    SalvareFechar1: TMenuItem;
    SalvareNovo1: TMenuItem;
    N2: TMenuItem;
    Fechar1: TMenuItem;
    PopUpPardaoButton: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure SaveActionExecute(Sender: TObject);
    procedure SaveCloseActionExecute(Sender: TObject);
    procedure CloseActionExecute(Sender: TObject);
    procedure SaveNewActionExecute(Sender: TObject);
    procedure OnCheckActionsActionExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure NewActionExecute(Sender: TObject);
    procedure CancelUpdatesActionExecute(Sender: TObject);
    procedure DeleteActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PararButtonClick(Sender: TObject);
    procedure MasterDataSourceDataChange(Sender: TObject; Field: TField);
    procedure PopUpPardaoButtonClick(Sender: TObject);
  private
    FDatamodule: TDatamodule;
    FInitialControl: TWinControl;
    FVisibleButtons: TVisibleButtons;
    procedure SetExternalCDS(const Value: TosClientDataset);
    procedure SetDatamodule(const Value: TDatamodule);
    function GetKeyValues: Variant;

  protected
    FMasterDataset: TosClientDataset;
    FKeyValues: variant;
    FFormMode: TFormMode;
    FExternalCDS: TosClientDataset;
    FIsModified: boolean;
    procedure ControlButtons;
    procedure MasterDatasetAfterEdit(DataSet: TDataSet); virtual;
    procedure CheckMasterDataset;
    procedure Loaded; override;
    procedure ParseParams(PParams: TParams; const KeyFields: string; const KeyValues: Variant);
    procedure CheckChanges; virtual;
    procedure ChangeColor(PReadOnly: boolean);
    procedure ReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError;
                             UpdateKind: TUpdateKind; var Action: TReconcileAction);
  public
    continue: boolean;
    constructor Create(AOwner: TComponent); override;
    function Insert: boolean; virtual;
    function InsertAba(pTabSheet: TTabSheet): boolean; virtual;
    function Edit(const KeyFields: string; const KeyValues: Variant): boolean; virtual;
    function EditAba(const KeyFields: string; const KeyValues: Variant; pTabSheet: TTabSheet): boolean;
    function View(const KeyFields: string; const KeyValues: Variant; PClose: boolean = True; deleting: boolean = false): boolean; virtual;
    function Delete(const KeyFields: string; const KeyValues: Variant): boolean; virtual;
    property CurrentKeyValues: Variant read GetKeyValues;
    property FormMode: TFormMode read FFormMode write FFormMode;
    property ExternalCDS: TosClientDataset read FExternalCDS write SetExternalCDS;
    property IsModified: boolean read FIsModified;
    property Datamodule: TDatamodule read FDatamodule write SetDatamodule;
    property VisibleButtons: TVisibleButtons read FVisibleButtons write FVisibleButtons;
    function canInsert: boolean; virtual;
  end;

  TosFormClass = class of TosForm;

  TosCustomEditFormClass = class of TosCustomEditForm;

var
  osCustomEditForm: TosCustomEditForm;

implementation

uses TradutorFormUn;

{$R *.DFM}

function TosCustomEditForm.Edit(const KeyFields: string; const KeyValues: Variant): boolean;
begin
  try
    Screen.Cursor := crHourglass;
    FFormMode := fmEdit;
    CheckMasterDataset;

    ParseParams(FMasterDataset.Params, KeyFields, KeyValues);
    FMasterDataset.close;
    FMasterDataset.Open;

    OnCheckActionsAction.Execute;
    Screen.Cursor := crDefault;

    ShowModal;
  finally
    Screen.Cursor := crDefault;
    FMasterDataset.Close;
    Result := (ModalResult = mrOK);
  end;
end;

function TosCustomEditForm.EditAba(const KeyFields: string; const KeyValues: Variant; pTabSheet: TTabSheet): boolean;
begin
  try
    Screen.Cursor := crHourglass;
    FFormMode := fmEdit;
    CheckMasterDataset;

    ParseParams(FMasterDataset.Params, KeyFields, KeyValues);
    FMasterDataset.close;
    FMasterDataset.Open;

    OnCheckActionsAction.Execute;
    Screen.Cursor := crDefault;

    FTabSheet := pTabSheet;
    self.Parent := pTabSheet;
    self.Align := alClient;
    self.BorderStyle := bsNone;
    self.Visible := true;
    pTabSheet.Caption := self.Caption;
    //ShowModal;
  finally
    //Screen.Cursor := crDefault;
    //FMasterDataset.Close;
    //Result := (ModalResult = mrOK);
  end;
end;

function TosCustomEditForm.Insert: boolean;
begin
  try
    Screen.Cursor := crHourglass;
    FFormMode := fmInsert;
    CheckMasterDataset;

    with FMasterDataset do
    begin
      Params.ParamByName('ID').AsInteger := -1; // Para não trazer dados no open
      Open;
      Insert;
    end;

    OnCheckActionsAction.Execute;
    Screen.Cursor := crDefault;
    ShowModal;
    FKeyValues := FMasterDataset.IDField.Value;
  finally
    FMasterDataset.Close;
    Result := (ModalResult = mrOK);
  end;
end;

function TosCustomEditForm.InsertAba(pTabSheet: TTabSheet): boolean;
begin
  Screen.Cursor := crHourglass;
  FFormMode := fmInsert;
  CheckMasterDataset;

  FMasterDataset.Params.ParamByName('ID').AsInteger := -1; // Para não trazer dados no open
  FMasterDataset.Open;
  FMasterDataset.Insert;

  OnCheckActionsAction.Execute;
  Screen.Cursor := crDefault;

  FTabSheet := pTabSheet;
  self.Parent := pTabSheet;
  self.Align := alClient;
  self.BorderStyle := bsNone;
  self.Visible := true;

  FKeyValues := FMasterDataset.IDField.Value;
end;

function TosCustomEditForm.View(const KeyFields: string; const KeyValues: Variant; PClose: boolean =true; deleting: boolean = false): boolean;
begin
  try
    Screen.Cursor := crHourglass;
    if deleting then
      fformMode := fmDelete
    else
      FFormMode := fmView;
    CheckMasterDataset;

    FMasterDataset.ReadOnly := True;
    ParseParams(FMasterDataset.Params, KeyFields, KeyValues);
    FMasterDataset.Close;
    FMasterDataset.Open;

    OnCheckActionsAction.Execute;
    Screen.Cursor := crDefault;
    ChangeColor(True);
    ShowModal;
  finally
    if PClose then
      FMasterDataset.Close;
    FMasterDataset.ReadOnly := False;
    ChangeColor(False);

    Result := (ModalResult = mrOK);
  end;
end;

constructor TosCustomEditForm.Create(AOwner: TComponent);
begin
  inherited;
  FFormMode := fmView;
  FIsModified := False;
  if Assigned(MasterDatasource.Dataset) then
  begin
    FMasterDataset := TosClientDataset(MasterDatasource.Dataset);
    FMasterDataset.AfterEdit := MasterDatasetAfterEdit;
  end;

end;

procedure TosCustomEditForm.SetExternalCDS(const Value: TosClientDataset);
begin
  FMasterDataset := Value;
end;

procedure TosCustomEditForm.PopUpPardaoButtonClick(Sender: TObject);
var
  pnt: TPoint;
begin
  if GetCursorPos(pnt) then
    MenuPadraoPopup.Popup(pnt.X, pnt.Y);
end;

procedure TosCustomEditForm.MasterDatasetAfterEdit(DataSet: TDataSet);
begin
  inherited;
  SaveAction.Enabled := True;
  SaveCloseAction.Enabled := True;
  SaveNewAction.Enabled := oInserir in Operacoes;
end;

procedure TosCustomEditForm.FormShow(Sender: TObject);
var
  viewMode: boolean;
begin
  inherited;
  FIsModified := False;
  ControlButtons;
  if Assigned(FInitialControl) then
    if FInitialControl.Enabled and FInitialControl.Visible then
      FInitialControl.SetFocus;

  viewMode := FormMode=fmView;
  novo1.Enabled := (oInserir in Operacoes) and (not viewMode);
  saveNewAction.Enabled := (oInserir in Operacoes) and (not viewMode);
  CancelUpdatesAction.Enabled := false;

  if PararButton.Visible then
  begin
    NewAction.Enabled := false;
    SaveNewAction.Enabled := false;
  end;
end;

procedure TosCustomEditForm.ControlButtons;
var
  i, j : integer;
  PosLeft : integer;
  Button : TSpeedButton;
begin
  PosLeft := 0;
  for i := 0 to ControlBarPanel.ControlCount - 1 do
  begin
    if ControlBarPanel.Controls[i] is TSpeedButton then
    begin
      Button := TSpeedButton(ControlBarPanel.Controls[i]);
      j := Button.Tag;
      if TVisibleButton(j) in FVisibleButtons then
      begin
        Button.Visible := True;
        Button.Left := PosLeft;
        PosLeft := PosLeft + Button.Width + 2;
      end
      else
        Button.Visible := False;
    end; // if
  end; // for
  ControlBarPanel.Width := PosLeft;
end;

function TosCustomEditForm.Delete(const KeyFields: string; const KeyValues: Variant): boolean;
begin
  try
    Result := View(KeyFields, KeyValues, False, true);
    if Result then
    begin
      FMasterDataset.Delete;
      try
         FMasterDataset.ApplyUpdates(0);
      except                       
        MessageDlg('Erro ao salvar as alterações.', mtWarning, [mbOK], 0);
      end;
    end;
  finally
    FMasterDataset.Close;
  end;
end;

procedure TosCustomEditForm.SaveActionExecute(Sender: TObject);
begin
  inherited;
  if FormMode in [fmInsert, fmEdit] then
  begin
    if FMasterDataset.ApplyUpdates(0) = 0 then
      FIsModified := True;
  end;
end;

procedure TosCustomEditForm.SaveCloseActionExecute(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
  SaveAction.Execute;
  CloseAction.Execute;
  ModalResult := mrOK;
end;

procedure TosCustomEditForm.CloseActionExecute(Sender: TObject);
begin
  inherited;
  Close;
  if FTabSheet <> nil then
  begin
    FTabSheet.PageControl.SelectNextPage(True);
    FreeAndNil(FTabSheet);
  end;
end;

procedure TosCustomEditForm.SaveNewActionExecute(Sender: TObject);
begin
  inherited;
  SaveAction.Execute;
  NewAction.Execute;
end;

procedure TosCustomEditForm.Loaded;
begin
  inherited;
  FInitialControl := ActiveControl;
end;

procedure TosCustomEditForm.CheckMasterDataset;
begin
  if not Assigned(FMasterDataset) then
    raise Exception.Create('MasterDataset não atribuído');
end;


procedure TosCustomEditForm.ParseParams(PParams: TParams;
  const KeyFields: string; const KeyValues: Variant);
begin
  { TODO : Estender o parse dos parâmetros para funcionar com qualquer chave }
  // Por enquanto somente para ID's ou parâmetros únicos
  FKeyValues := KeyValues;
  PParams.ParamByName(KeyFields).Value := KeyValues;
end;

procedure TosCustomEditForm.OnCheckActionsActionExecute(Sender: TObject);
begin
  inherited;
  SaveAction.Enabled := ((FormMode = fmInsert));
  SaveCloseAction.Enabled := ((FormMode = fmInsert));
  SaveNewAction.Enabled := ((FormMode = fmInsert));
  NewAction.Enabled := CanInsert;
end;

procedure TosCustomEditForm.SetDatamodule(const Value: TDatamodule);
var
  Provider: TCustomProvider;
begin
  if Value <> FDatamodule then
  begin
    FMasterDataset := TosClientDataset(MasterDatasource.Dataset);
    FDatamodule := Value;
    Provider := TCustomProvider(GetComponentByName(FDatamodule, 'MasterProvider', TCustomProvider));
    FMasterDataset.DataProvider := Provider;
  end;
end;

procedure TosCustomEditForm.CheckChanges;
begin
  if (FMasterDataset.ChangeCount > 0) or //(FMasterDataset.UpdateStatus=usModified) or
      (fmasterdataset.state in [dsEdit, dsInsert]) then

     if (MessageDlg('Os dados foram alterados. Salvar antes de sair?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes) then
  begin
    SaveAction.Execute;
  end;
end;

procedure TosCustomEditForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  CheckChanges;
end;

procedure TosCustomEditForm.NewActionExecute(Sender: TObject);
begin
  inherited;
  CheckChanges;
  FFormMode := fmInsert;
  FMasterDataset.Insert;
  OnCheckActionsAction.Execute;
  if Assigned(FInitialControl) then
    FInitialControl.SetFocus; // Retorna ao controle inicial
  CancelUpdatesAction.Enabled := false;
end;

procedure TosCustomEditForm.CancelUpdatesActionExecute(Sender: TObject);
begin
  inherited;
  FMasterDataset.CancelUpdates;
  CancelUpdatesAction.Enabled := false;
end;

procedure TosCustomEditForm.ChangeColor(PReadOnly: boolean);
var
  i: integer;
  OldColor, NewColor: TColor;

  procedure DoChange(POldColor, PNewColor: TColor; PComponent: TComponent);
  var
    i: integer;
    PComp: TComponent;
  begin
    for i:=0 to PComponent.ComponentCount - 1 do
    begin
      PComp := PComponent.Components[i];
      if (PComp is TDBEdit) and (TDBEdit(PComp).Color = POldColor) then
        TDBEdit(PComp).Color := PNewColor
      else if (PComp is TwwDBEdit) and (TwwDBEdit(PComp).Color = POldColor) then
        TwwDBEdit(PComp).Color := PNewColor
      else if (PComp is TwwDBGrid) and (TwwDBGrid(PComp).Color = POldColor) then
        TwwDBGrid(PComp).Color := PNewColor
      else if (PComp is TwwDBDatetimePicker) and (TwwDBDatetimePicker(PComp).Color = POldColor) then
        TwwDBDatetimePicker(PComp).Color := PNewColor
      else if (PComp is TosDBDualTree) then
        TosDBDualTree(PComp).Enabled := not PReadOnly
      else if (PComp is TwwDBSpinEdit) and (TwwDBSpinEdit(PComp).Color = POldColor) then
        TwwDBSpinEdit(PComp).Color := PNewColor
      else if (PComp is TosComboSearch) and (TosComboSearch(PComp).Color = POldColor) then
      begin
        TosComboSearch(PComp).Color := PNewColor;
        TosComboSearch(PComp).ShowButton := not PReadOnly;
      end
      else if (PComp is TDBMemo) and (TDBMemo(PComp).Color = POldColor) then
        TDBMemo(PComp).Color := PNewColor
      else if (PComp is TwwDBComboBox) and (TwwDBComboBox(PComp).Color = POldColor) then
      begin
        TwwDBComboBox(PComp).Color := PNewColor;
        TwwDBComboBox(PComp).ShowButton := not PReadOnly;
      end
      else if (PComp is TDBLookupComboBox) and (TDBLookupComboBox(PComp).Color = POldColor) then
        TDBLookupComboBox(PComp).Color := PNewColor
      else if (PComp is TDBGrid) and (TDBGrid(PComp).Color = POldColor) then
        TDBGrid(PComp).Color := PNewColor
      else if (PComp is TRadioButton) and (TRadioButton(PComp).Color = POldColor) then
      begin
        TRadioButton(PComp).Color := PNewColor;
        TRadioButton(PComp).Enabled := not PReadOnly;
      end
      else if (PComp is TwwDBLookupCombo) and (TwwDBLookupCombo(PComp).Color = POldColor) then
      begin
        TwwDBLookupCombo(PComp).Color := PNewColor;
        TwwDBLookupCombo(PComp).enabled := not PReadOnly;
      end
      else if (PComp is TwwDBRichEdit) and (TwwDBRichEdit(PComp).Color = POldColor) then
        TwwDBRichEdit(PComp).Color := PNewColor;
    end;
  end;

begin
  if PReadOnly then
  begin
    OldColor := clWindow;
    NewColor := clMenu;
  end
  else
  begin
    OldColor := clMenu;
    NewColor := clWindow;
  end;
  DoChange(OldColor, NewColor, Self);
  for i:=0 to ComponentCount - 1 do
  begin
    if ((Components[i] is TwwRecordViewPanel) or (Components[i] is TFrame)) then
      DoChange(OldColor, NewColor, Components[i]);
  end;
end;

function TosCustomEditForm.GetKeyValues: Variant;
begin
  Result := FKeyValues;
end;

procedure TosCustomEditForm.DeleteActionExecute(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TosCustomEditForm.ReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  if (E.ErrorCode=1) and (UpdateKind=ukDelete) then
    MessageDlg('Não é possível excluir este registro pois existem dados no sistema que dependem dele.', mtError, [mbOK], 0)
  else
    ShowMessage('Erro no clientDataSet com a mensagem: ' + quotedStr(E.message));
end;

procedure TosCustomEditForm.FormCreate(Sender: TObject);
var
  i: integer;
begin
  inherited;
  for i := 0 to ComponentCount-1 do
  begin
    if Components[i] is TClientDataSet then
      (Components[i] as TClientDataSet).onReconcileError := ReconcileError;
  end;
end;


function TosCustomEditForm.canInsert: boolean;
begin
  Result := true;
end;

procedure TosCustomEditForm.PararButtonClick(Sender: TObject);
begin
  inherited;
  continue := FAlse;
  CloseActionExecute(PararButton);
end;

procedure TosCustomEditForm.MasterDataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  CancelUpdatesAction.Enabled := true;
end;

end.


