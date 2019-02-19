unit osCustomMainFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, Grids, DBGrids, Buttons, StdCtrls, ImgList, ComCtrls,
  ToolWin, ActnList, Db, DBClient, MConnect, SConnect,
  osCustomEditFrm, Mask, wwdbedit, Wwdotdot, Wwdbcomb,
  osComboFilter, contnrs, printers, Wwintl, Wwdbigrd, Wwdbgrid,
  ADODB, Provider, osFrm, osAppResources, ppViewr, ppClass,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppBands, ppCache, ppVar, ppCtrls,
  ppProd, ppPrnabl, osActionList, osClientDataset, osMD5,
  osUtils, OleCtrls, SHDocVw, ppTmplat, osSQLDataSet,
  SqlExpr, Data.DBXFirebird, daIDE, daDBExpress, ppCTDsgn, raIDE, myChkBox,
  ppModule, daDataModule, FMTBcd, osCustomDataSetProvider,
  osSQLDataSetProvider, daSQl, daQueryDataView, ppTypes, acCustomReportUn,
  osSQLQuery, acFilterController, CommCtrl, clipbrd, osCustomLoginFormUn,
  acReportContainer, ppParameter, Data.DBXInterBase, System.Actions, Vcl.Samples.Spin, W7Classes, W7Buttons,
  System.UITypes;

type
  TDatamoduleClass = class of TDatamodule;
  TTipoExibicao = (teGrid, teRelat);

  TOnEditForm = procedure (AForm: TosCustomEditForm) of object;

  TosCustomMainForm = class(TosForm)
    MainMenu: TMainMenu;
    ControlBar: TControlBar;
    Sair: TMenuItem;
    Arquivo: TMenuItem;
    Editar: TMenuItem;
    Ajuda: TMenuItem;
    MainToolbar: TToolBar;
    NewToolButton: TToolButton;
    EditToolButton: TToolButton;
    DeleteToolButton: TToolButton;
    ViewToolButton: TToolButton;
    PrintToolButton: TToolButton;
    StatusBar: TStatusBar;
    FilterDatasource: TDataSource;
    FilterDataset: TosClientDataset;
    CloseAction: TAction;
    FilterAction: TAction;
    EditAction: TAction;
    NewAction: TAction;
    ViewAction: TAction;
    DeleteAction: TAction;
    PrintFilterAction: TAction;
    PopupMenu: TPopupMenu;
    Novo1: TMenuItem;
    Alterar1: TMenuItem;
    Excluir1: TMenuItem;
    N1: TMenuItem;
    Visualizar1: TMenuItem;
    Imprimir1: TMenuItem;
    N2: TMenuItem;
    ShowQueryAction: TAction;
    MostrarQuery: TMenuItem;
    PrintAction: TAction;
    Novo: TMenuItem;
    Alterar: TMenuItem;
    Visualizar: TMenuItem;
    N3: TMenuItem;
    Excluir: TMenuItem;
    N4: TMenuItem;
    Imprimir: TMenuItem;
    Filter: TMenuItem;
    N6: TMenuItem;
    MoveFirstAction: TAction;
    MoveNextAction: TAction;
    MovePrevious: TAction;
    MoveLastAction: TAction;
    Manager: TosAppResourceManager;
    BarLargeImages: TImageList;
    BarSmallImages: TImageList;
    Panel2: TPanel;
    Grid: TwwDBGrid;
    ResourcePanel: TPanel;
    AdvanceAction: TAction;
    RetrocedeAction: TAction;
    ActionDataSet: TosClientDataset;
    OnSelectResourceAction: TAction;
    ActionDataSetNOMECOMPONENTE: TStringField;
    WebBrowser: TWebBrowser;
    PaginaInicialToolButton: TToolButton;
    Exibir: TMenuItem;
    ExibirPaginaInicial: TMenuItem;
    ArrowsImageList: TImageList;
    ppDBPipeline: TppDBPipeline;
    ppReport: TppReport;
    ppHeaderBand: TppHeaderBand;
    ppLineHeader: TppLine;
    pplblTitulo: TppLabel;
    ppvarDtHora: TppSystemVariable;
    pplblSubtitulo: TppLabel;
    ppDetailBand: TppDetailBand;
    ppFooterBand: TppFooterBand;
    ppvarPagina: TppSystemVariable;
    ppLine2: TppLine;
    LoginAction: TAction;
    LogoutAction: TAction;
    Login1: TMenuItem;
    Logout1: TMenuItem;
    N8: TMenuItem;
    RelatPanel: TPanel;
    ReportViewer: TppViewer;
    pnlStatusBar: TPanel;
    plItem: TppDBPipeline;
    Report: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    MainImageList: TImageList;
    SQLConnection: TSQLConnection;
    ConsultaPanel: TPanel;
    ConsultaLabel: TLabel;
    EditarTodosButton: TSpeedButton;
    tbrFilter: TToolBar;
    FilterButton: TToolButton;
    ConsultaCombo: TosComboFilter;
    SearchEdit: TEdit;
    Backup1: TMenuItem;
    EfetuarBackupemarquivolocal1: TMenuItem;
    SaveBackupDialog: TSaveDialog;
    FFilterDepot: TacFilterController;
    pnlPreviewBar: TPanel;
    spbPreviewPrint: TSpeedButton;
    spbPreviewWhole: TSpeedButton;
    spbPreviewWidth: TSpeedButton;
    spbPreview100Percent: TSpeedButton;
    spbPreviewFirst: TSpeedButton;
    spbPreviewPrior: TSpeedButton;
    mskPreviewPage: TMaskEdit;
    spbPreviewNext: TSpeedButton;
    spbPreviewLast: TSpeedButton;
    mskPreviewPercentage: TMaskEdit;
    spbPreviewCancel: TSpeedButton;
    FReportDepot: TacReportContainer;
    Panel1: TPanel;
    TreeView1: TTreeView;
    EdtPesquisa: TEdit;
    Splitter1: TSplitter;
    PrintAllToolButton: TW7ToolButton;
    procedure EditActionExecute(Sender: TObject);
    procedure ViewActionExecute(Sender: TObject);
    procedure NewActionExecute(Sender: TObject);
    procedure DeleteActionExecute(Sender: TObject);
    procedure FilterDatasetAfterOpen(DataSet: TDataSet);
    procedure GridDblClick(Sender: TObject);
    procedure CheckActionsExecute(Sender: TObject);
    procedure FilterActionExecute(Sender: TObject);
    procedure ConsultaComboCloseUp(Sender: TwwDBComboBox; Select: Boolean);
    procedure FilterDatasetAfterScroll(DataSet: TDataSet);
    procedure GridTitleClick(Column: TColumn);
    procedure FilterDatasetBeforeOpen(DataSet: TDataSet);
    procedure ShowQueryActionExecute(Sender: TObject);
    procedure CloseActionExecute(Sender: TObject);
    procedure PrintActionExecute(Sender: TObject);
    procedure OnSelectResourceActionExecute(Sender: TObject);
    procedure SearchEditDblClick(Sender: TObject);
    procedure PaginaInicial(Sender: TObject);
    procedure GridCalcTitleImage(Sender: TObject; Field: TField;
      var TitleImageAttributes: TwwTitleImageAttributes);
    procedure GridTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure FilterDatasetBeforeClose(DataSet: TDataSet);
    procedure PrintFilterActionExecute(Sender: TObject);
    procedure LoginActionExecute(Sender: TObject);
    procedure LogoutActionExecute(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridKeyPress(Sender: TObject; var Key: Char);
    procedure spbPreviewPrintClick(Sender: TObject);
    procedure spbPreviewWholeClick(Sender: TObject);
    procedure spbPreviewWidthClick(Sender: TObject);
    procedure spbPreview100PercentClick(Sender: TObject);
    procedure spbPreviewFirstClick(Sender: TObject);
    procedure spbPreviewPriorClick(Sender: TObject);
    procedure spbPreviewNextClick(Sender: TObject);
    procedure spbPreviewLastClick(Sender: TObject);
    procedure mskPreviewPageKeyPress(Sender: TObject; var Key: Char);
    procedure mskPreviewPercentageKeyPress(Sender: TObject; var Key: Char);
    procedure ReportViewerPageChange(Sender: TObject);
    procedure ReportViewerPrintStateChange(Sender: TObject);
    procedure ReportViewerStatusChange(Sender: TObject);
    procedure ReportPreviewFormCreate(Sender: TObject);
    procedure mskPreviewPercentageExit(Sender: TObject);
    procedure EditarTodosButtonClick(Sender: TObject);
    procedure EfetuarBackupemarquivolocal1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure GridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure EdtPesquisaChange(Sender: TObject);
    procedure TreeView1CustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState;
      var DefaultDraw: Boolean);
    procedure EdtPesquisaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtPesquisaEnter(Sender: TObject);
  private
    FNewFilter: boolean;
    FUserName: string;
    FEditForm: TosCustomEditForm;
    FActionDblClick: TAction;
    FSelectedList: TStringListExt;
    FSelectionField: TField;

    // Field que está sendo usado para ordenação
    SortField: TField;
    // Sentido da ordenação
    AscendingSort: boolean;

    // Armazena a string que será usada na busca incremental do grid
    CurrentSearchString: string;
    // Indica quando o método de busca incremental está rolando o dataset,
    // para impedir que este, quando tiver um evento OnScroll executado, esvazie
    // CurrentSearchString
    IncrementalSearchScrolling: boolean;
    // O evento OnKeyDown do grid liga esta variável toda vez que a tecla Alt ou
    // Ctrl estiver pressionada. O evento OnKeyPress, que é executado após o
    // OnKeyDown, pode determinar, assim, se uma dessas teclas está pressionada
    // e ignorar o caractere se desejado
    CtrlOrAltPressed: boolean;
    FSuperUserLogged: boolean;
    FIndiceMenu : Integer;
    FUltimoIndiceMenu : Integer;
    FOnEditForm: TOnEditForm;
    procedure SetEditForm(const Value: TosCustomEditForm);
    procedure SetActionDblClick(const Value: TAction);
    function GetSelectedList: TStringList;
    function CreateCurrentForm: TForm;
    function CreateCurrentEditForm: TosCustomEditForm;
    function CreateCurrentDatamodule: TDatamodule;
    function CreateCurrentReport: TacCustomReport;

    procedure LoadTreeView;
    procedure checkOperations;

    procedure adjustReportZoom;
    procedure SetOnEditForm(const Value: TOnEditForm);
  protected
    FCurrentTemplate: TMemoryStream;
    FCurrentResource: TosAppResource;
    FSuperUserName: string;
    FModifiedList: TStringList;
    FIDField: TField;
    procedure ResourceClick( Sender: TObject );
    procedure replaceReportSQLPrint;
    procedure CheckMultiSelection;
    procedure ControlActions(enabled: boolean);
    procedure ShowHomePage(freeRes: boolean; goHome: boolean = true);  dynamic;
    procedure HideHomePage(tipo: TTipoExibicao);
    function getSuperUserPass: string; virtual;
    procedure Logout; dynamic;
    function Login: boolean; dynamic;
    procedure execSplash; virtual; abstract;
    function getLoginFormClass: TLoginFormClass; virtual;
  public
    FCurrentEditForm: TosCustomEditForm;
    FCurrentDatamodule: TDatamodule;
    FCurrentForm: TForm;
    property superUserName: string read FSuperUserName;
    property superUserLogged: boolean read FSuperUserLogged;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property UserName: string read FUserName;
    property ActionDblClick: TAction read FActionDblClick write SetActionDblClick;
    procedure ExecLastFilter;
    function getReportByResource(name: string; stream: TMemoryStream): boolean;
    procedure PesquisaMenu(pOrigem: Integer; pIndice : Integer);
  published
    property EditForm: TosCustomEditForm read FEditForm write SetEditForm;
    property SelectedList: TStringList read GetSelectedList;
    property CurrentResource: TosAppResource read FCurrentResource;
    property OnEditForm : TOnEditForm read FOnEditForm write SetOnEditForm;
  end;

var
  osCustomMainForm: TosCustomMainForm;

implementation

uses acCustomSQLMainDataUn, FilterDefEditFormUn, RecursoDataUn,
  osReportUtils, UtilsUnit, Types, TerminalConsultaFormUn, UMensagemAguarde;

{$R *.DFM}

const
  // Nome do índice usado para ordenar os registros do filtro
  SortIndexName = 'SortIndex';

constructor TosCustomMainForm.Create(AOwner: TComponent);
var
  sName : string;
  i : integer;
  qry: TosSQLQuery;
begin
  inherited;
  FIndiceMenu := 0;
  FNewFilter := true;
  FActionDblClick := EditAction;
  FSelectedList := TStringListExt.Create;
  FCurrentResource := nil;
  FCurrentTemplate := TMemoryStream.Create;
  FModifiedList := TStringList.Create;

  if Login then
  begin
    LoginAction.Caption := 'Alterar usuário';
    execSplash;
  end
  else
  begin
    Width := 0;
    Height := 0;
    Application.Terminate;
    Application.ProcessMessages;
  end;

  if (not Application.Terminated) then
  begin
    Grid.Align := alClient;
    RelatPanel.Align := alClient;

  //preparar a abertura dos reports
  //verificar se vale a pena manter uma SQLConnection só para os relatórios
    SQLConnection.Close;
    with TStringList.Create do
    begin
      try
        LoadFromFile('AppParams.ini');
        for i := 0 to Count - 1 do
        begin
          sName := Names[i];
          SQLConnection.Params.Values[sName] := Values[sName];
        end;
        if SQLConnection.Params.Values['DataBaseMeta']<>'' then
          SQLConnection.Params.Values['Database'] :=
            SQLConnection.Params.Values['DatabaseMeta'];
      finally
        Free;
      end;
    end;

    //TTMCI
    //para buscar os metadados dos filtros usar o SQLConnection de metadados
    acCustomSQLMainData.FilterQuery.SQLConnection := acCustomSQLMainData.SQLConnectionMeta;
    qry := acCustomSQLMainData.GetQuery;
    try
      qry.SQLConnection := acCustomSQLMainData.SQLConnectionMeta;
      qry.SQL.Text := 'SELECT NAME FROM XFILTERDEF';
      qry.Open;
      qry.First;
    finally
      FreeAndNil(qry);
      acCustomSQLMainData.FilterQuery.SQLConnection := acCustomSQLMainData.SQLConnection;
    end;
  end;
end;

procedure TosCustomMainForm.EditActionExecute(Sender: TObject);
var
  iID: integer;
  Form: TosCustomEditForm;
begin
  inherited;
  Form := FCurrentEditForm;
  if Assigned(Form) then
  begin
    if not Form.Showing then
    begin
      iID := FIDField.AsInteger;
      Form.VisibleButtons := [vbSalvarFechar, vbFechar];
      if PrintAction.Enabled then
        Form.VisibleButtons := Form.VisibleButtons + [vbImprimir];
      if assigned(Self.FOnEditForm) then
        Self.FOnEditForm(Form);
      Form.Edit('ID', iID);
      if Form.IsModified then
      begin
        FModifiedList.Add(FilterDatasource.DataSet.fieldByName('id').AsString);
        if false then //TODO: trocar pela lógica de forçar a reexecução de filtro
        begin
          ExecLastFilter;
          FilterDataset.Locate('ID', iID, []);
        end;
      end;
    end;
  end;
end;

procedure TosCustomMainForm.ViewActionExecute(Sender: TObject);
var
  iID: integer;
  Form: TosCustomEditForm;
begin
  inherited;
  Form := FCurrentEditForm;
  iID := FIDField.AsInteger;
  Form.VisibleButtons := [vbFechar];
  if PrintAction.Enabled then
    Form.VisibleButtons := Form.VisibleButtons + [vbImprimir];
  Form.View('ID', iID);
end;

procedure TosCustomMainForm.NewActionExecute(Sender: TObject);
var
  Form: TosCustomEditForm;
begin
  inherited;
  if FCurrentEditForm.canInsert then
  begin
    Form := FCurrentEditForm;
    Form.VisibleButtons := [vbSalvarFechar];
    if PrintAction.Enabled then
      Form.VisibleButtons := Form.VisibleButtons + [vbImprimir];
    Form.Insert;
    ExecLastFilter;
  end;
end;

procedure TosCustomMainForm.DeleteActionExecute(Sender: TObject);
var
  Form: TosCustomEditForm;
begin
  inherited;
  Form := FCurrentEditForm;
  if Form <> nil then
  begin
    Form.VisibleButtons := [vbExcluir, vbFechar];
    if Form.Delete('ID', FIdField.AsInteger) then
      ExecLastFilter;
  end;
end;

procedure TosCustomMainForm.FilterDatasetAfterOpen(DataSet: TDataSet);
var
  IndexOptions: TIndexOptions;
  orderColumn: string;
begin
  inherited;
  OnCheckActionsAction.Execute;

  // O filtro deve ter mais de uma coluna para ser mostrado ao usuário, já que
  // a primeira é sempre o field 'ID'
  Assert(FilterDataset.Fields.Count > 1);

  orderColumn := trim(ConsultaCombo.FOrderColumn);
  if Copy(orderColumn, 1, 1) = '#' then
    SortField := FilterDataSet.Fields[strToInt(Copy(orderColumn, 2, 1))]
  else
    SortField := FilterDataset.FindField(ConsultaCombo.FOrderColumn);
  if SortField <> nil then
  begin
    AscendingSort := ConsultaCombo.FOrderType <> 'D';
    if AscendingSort then
      IndexOptions := [ixCaseInsensitive]
    else
      IndexOptions := [ixDescending, ixCaseInsensitive];

    // Cria um índice para o field e a ordem estabelecidos
    FilterDataSet.AddIndex(SortIndexName, SortField.FieldName,
        IndexOptions);
    // Define o nome do índice a ser usado pelo dataset
    FilterDataset.IndexName := SortIndexName;
  end;

  FilterDataset.First;

  // Redesenha o grid para que seja mostrada a seta na coluna apropriada
  Grid.RedrawGrid;
end;

procedure TosCustomMainForm.SetActionDblClick(const Value: TAction);
begin
  FActionDblClick := Value;
end;

procedure TosCustomMainForm.GridDblClick(Sender: TObject);
begin
  inherited;
  ActionDblClick.Execute;
end;

procedure TosCustomMainForm.CheckActionsExecute(Sender: TObject);
var
  ActionName: string;
  ActionComponent: TComponent;
  ComponentNotFound,
  ComponentIsNotAction: boolean;
  ExceptionMsg: string;
  i: integer;
  DataSetIsEmpty: boolean;
begin
  inherited;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TAction) and (Components[i].Tag = 0) then
      (Components[i] as TAction).Enabled := False;

  Assert(ftString = ActionDataSet.FieldByName('NomeComponente').DataType,
      'O field que deveria conter o nome do componente não é do tipo string.');

  if not Assigned(CurrentResource) then
    Exit;

  ActionDataSet.Params.ParamByName('NomeRecurso').Value := CurrentResource.Name;

  ComponentNotFound := False;
  ComponentIsNotAction := False;

  DataSetIsEmpty := (FilterDataset.active) and (FilterDataset.RecordCount = 0);

  ActionDataSet.Open;

  while not ActionDataSet.Eof do
  begin
    ActionName := ActionDataSet.FieldByName('NomeComponente').Value;
    ActionComponent := FindComponent(ActionName);

    if Assigned(ActionComponent) then
      try
        (ActionComponent as TAction).Enabled := not DataSetIsEmpty or
            ((ActionComponent as TAction) = NewAction);
      except
        on EInvalidCast do ComponentIsNotAction := True;
      end
    else
      ComponentNotFound := True;

    ActionDataSet.Next;
  end;
  ActionDataSet.Close;

  if ComponentNotFound then
    ExceptionMsg := 'Um ou mais componentes cujos nomes estão informados na tab'
        + 'ela XPAcao não existem.'#13#10;
  if ComponentIsNotAction then
    ExceptionMsg := ExceptionMsg + 'Um ou mais componentes cujos nomes estão in'
        + 'formados na tabela XPAcao não são TAction''s válidos.#13#10';
  if ComponentNotFound or ComponentIsNotAction then
    raise Exception.Create(ExceptionMsg + 'Contate o administrador.');
  checkOperations;
end;

procedure TosCustomMainForm.FilterActionExecute(Sender: TObject);
var
  sent: string;
  data: oleVariant;
begin
  inherited;
  data := FilterDataset.data;
  FModifiedList.Clear;
  if Assigned(FCurrentResource) then
  begin
    Screen.Cursor := crHourglass;
    try
      if FCurrentResource.ResType = rtReport then
        ReplaceReportSQLPrint
      else
      begin
        sent := ConsultaCombo.ExecuteFilter;
        if sent = '' then
        begin
          FilterDataset.data := data;
          ConsultaCombo.ConfigFields(ConsultaCombo.ItemIndex);
        end;
      end;
      FIDField := FilterDataset.Fields.FindField('ID');
      CheckMultiSelection;

    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TosCustomMainForm.ConsultaComboCloseUp(Sender: TwwDBComboBox;
  Select: Boolean);
begin
  inherited;
  if Select and (ConsultaCombo.Items.Count > 0) then
    FilterAction.Execute;
end;

procedure TosCustomMainForm.ExecLastFilter;
begin
  FModifiedList.clear;
  Screen.Cursor := crHourglass;
  try
    FilterDataset.Close;
    ConsultaCombo.ExecuteFilter(FNewFilter);
    FNewFilter := false;
    FIDField := FilterDataset.Fields.FindField('ID');
    CheckMultiSelection;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TosCustomMainForm.FilterDatasetAfterScroll(DataSet: TDataSet);
begin
  inherited;
  StatusBar.Panels[0].Text := Format('%d/%d', [FilterDataset.RecNo, FilterDataset.RecordCount]);
  OnCheckActionsAction.Execute;

  // Toda vez que um registro for selecionado manualmente pelo usuário a string
  // de busca incremental é esvaziada. Quando o método de busca estiver rolando
  // o dataset a variável IncrementalSearchScrolling será ligada para informar
  // este método
  if not IncrementalSearchScrolling then
    CurrentSearchString := '';
end;

function TosCustomMainForm.GetSelectedList: TStringList;
var
  i: integer;
begin
	with Grid, FilterDataset do
  begin
		DisableControls;
		for i:= 0 to SelectedList.Count-1 do
    begin
		  GotoBookmark(SelectedList.items[i]);
			Freebookmark(SelectedList.items[i]);
      FSelectedList.Add(FIDField.AsString);
		end;
		SelectedList.Clear;
		EnableControls;		{ Re-enable controls }
  end;

  Result := FSelectedList;
end;

destructor TosCustomMainForm.Destroy;
begin
  FreeAndNil(FSelectedList);
  FreeAndNil(FModifiedList);
  inherited;
end;

procedure TosCustomMainForm.GridTitleClick(Column: TColumn);
begin
  inherited;
  FilterDataset.IndexFieldNames := Column.FieldName;
end;

procedure TosCustomMainForm.PrintFilterActionExecute(Sender: TObject);
var
  i: integer;
  RepComps: TObjectList;
  RepLabel: TppLabel;
  RepText: TppDBText;
  iPosLeft, iPosTop, iWidth: integer;
  bmPos: TBookmark;
begin
  RepComps := TObjectList.Create(True);
  bmPos := FilterDataset.GetBookmark;
  try
    FilterDataset.DisableControls;
    iPosLeft := 1;
    iPosTop := ppLineHeader.spTop - 16;
    ppReport.PrinterSetup.Orientation := poPortrait;
    for i:=0 to FilterDataset.Fields.Count - 1 do
    begin
      if FilterDataset.Fields[i].Visible then
      begin
        iWidth := FilterDataset.Fields[i].DisplayWidth * 6 + 2;
        if Length(FilterDataset.Fields[i].DisplayName) * 6 + 2 > iWidth then
          iWidth := Length(FilterDataset.Fields[i].DisplayName) * 6 + 2;
        RepLabel := TppLabel.Create(Self);
        with RepLabel do
        begin
          spLeft := iPosLeft;
          spTop := iPosTop;
          Caption := FilterDataset.Fields[i].DisplayName;
          //spWidth := iWidth;
          Band := ppHeaderBand;
        end;
        RepText := TppDBText.Create(Self);
        with RepText do
        begin
          spLeft := iPosLeft;
          spTop := 1;
          DataPipeline := ppDBPipeline;
          DataField := FilterDataset.Fields[i].FieldName;
          spWidth := iWidth;
          Band := ppDetailBand;
        end;
        iPosLeft := iPosLeft + iWidth;
        if (ppDetailBand.spWidth < iPosLeft) and
           (ppReport.PrinterSetup.Orientation <> poLandscape) then
          ppReport.PrinterSetup.Orientation := poLandscape;
        RepComps.Add(RepLabel);
        RepComps.Add(RepText);
        if iPosLeft > ppDetailBand.spWidth then
        begin
          RepText.spWidth := RepText.spWidth - (iPosLeft- ppDetailBand.spWidth);
          break;
        end;
      end;

    end;
    pplblTitulo.Caption := Self.Caption;
    pplblSubtitulo.Caption := Format('Consulta:  %s', [ConsultaCombo.Text]);
    pplblTitulo.spLeft := Trunc((ppHeaderBand.spWidth - pplblTitulo.spWidth) / 2);
    pplblSubtitulo.spLeft := Trunc((ppHeaderBand.spWidth - pplblSubtitulo.spWidth) / 2);
    ppvarDtHora.spLeft := ppHeaderBand.spWidth - ppvarDtHora.spWidth - 2;
    ppvarPagina.spLeft := ppFooterBand.spWidth - ppvarPagina.spWidth - 8;
    ppReport.Print;
  finally
    FilterDataset.GotoBookmark(bmPos);
    FilterDataset.FreeBookmark(bmPos);
    FilterDataset.EnableControls;
    RepComps.Free;
  end;
end;

procedure TosCustomMainForm.FilterDatasetBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  if ShowQueryAction.Checked then
  begin
    ShowMessage(FilterDataset.CommandText);
    Clipboard.AsText := FilterDataset.CommandText;
  end;
end;

procedure TosCustomMainForm.ShowQueryActionExecute(Sender: TObject);
begin
  inherited;
  ShowQueryAction.Checked := not ShowQueryAction.Checked;
end;

procedure TosCustomMainForm.ResourceClick(Sender: TObject);
var
  NewResource: TosAppResource;
begin
  FModifiedList.Clear;
  FNewFilter := false;
  NewResource :=
    TosAppResource(Manager.Resources.FindItemID(TTreeNode(Sender).SelectedIndex));
  if FCurrentResource <> NewResource then
  begin
    FCurrentResource := NewResource;
    Manager.currentResource := FCurrentResource;
    // Libera o datamodule associado
    FCurrentDatamodule.Free;
    FCurrentDatamodule := CreateCurrentDatamodule;

    // Libera o form corrente
    if Assigned(FCurrentEditForm) then
      FreeAndNil(FCurrentEditForm);
    if Assigned(FCurrentForm) then
      FreeAndNil(FCurrentForm);

    // Limpa o Template corrente
    FCurrentTemplate.Clear;

    if FCurrentResource.ResType = rtReport then
    begin
      getReportByResource(FCurrentResource.ResClassName, FCurrentTemplate);
    end
    else if FCurrentResource.ResType = rtEdit then
    begin
      FActionDblClick := EditAction;
      FCurrentEditForm := CreateCurrentEditForm;
      if Assigned(FCurrentEditForm) and Assigned(FCurrentDatamodule) then
        FCurrentEditForm.Datamodule := FCurrentDatamodule;
    end
    else if FCurrentResource.ResType = rtOther then
      FCurrentForm := CreateCurrentForm;

    OnSelectResourceAction.Execute;
  end;

  if FCurrentResource.ResType = rtOther then
  begin
    Screen.Cursor := crHourglass;
    try
      CheckActionsExecute(self);
      if FCurrentForm is TosCustomEditForm then
        (FCurrentForm as TosCustomEditForm).VisibleButtons := [vbSalvarFechar];
      FCurrentForm.ShowModal;
    finally
      Screen.Cursor := crDefault;
    end;
  end;

  PrintAction.Enabled := (FCurrentResource.ReportClassName <> '');
end;

procedure TosCustomMainForm.SetEditForm(const Value: TosCustomEditForm);
begin

end;

procedure TosCustomMainForm.SetOnEditForm(const Value: TOnEditForm);
begin
  FOnEditForm := Value;
end;

function TosCustomMainForm.CreateCurrentEditForm: TosCustomEditForm;
begin
  if (Assigned(FCurrentResource)) and
     (Assigned(FCurrentResource.ResClass)) and
     (FCurrentResource.ResType = rtEdit) then
      Result := TosCustomEditFormClass(FCurrentResource.ResClass).Create(Self)
  else
    Result := nil;
//    raise Exception.CreateFmt('Form %s não registrado', [FCurrentResource.ResClassName]);
end;

function TosCustomMainForm.CreateCurrentDatamodule: TDatamodule;
begin
  if (Assigned(FCurrentResource)) and
    (FCurrentResource.ResType in [rtEdit, rtReport, rtOther]) and
    (Assigned(FCurrentResource.DataClass)) then
    Result := TDatamoduleClass(FCurrentResource.DataClass).Create(Self)
  else
    Result := nil;
//    raise Exception.CreateFmt('Datamodule %s não registrado', [FCurrentResource.DataClassName]);
end;

procedure TosCustomMainForm.CloseActionExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TosCustomMainForm.PrintActionExecute(Sender: TObject);
var
  Report : TacCustomReport;
  FrmMensagem : TFrmMensagemAguarde;
begin
  inherited;
  // Because the report is not often printed, the object can be created on the
  // fly
  if TAction(Sender).ActionComponent = PrintAllToolButton then
  begin
    FrmMensagem := TFrmMensagemAguarde.Create(Application);
    try
      FrmMensagem.Show;
      FilterDataset.First;
      while not FilterDataset.Eof do
      begin
        FrmMensagem.setMensagem('Imprimindo... ' + IntToStr(FilterDataset.RecNo) + ' / ' + IntToStr(FilterDataset.RecordCount), True);
        FrmMensagem.Update;
        Report := CreateCurrentReport;
        if Assigned (Report) then
          try
            Report.RecursoOrigem := CurrentResource.Name;
            Report.forcePrintWithoutDialog := True;
            Report.Print (FIDField.AsInteger);
          finally
            Report.Free;
          end
        else
        begin
          Assert(False, 'The report wasn''t created');
          break;
        end;

        FilterDataset.Next;
      end;
    finally
      FreeAndNil(FrmMensagem);
    end;
  end
  else
  begin
    Report := CreateCurrentReport;
    if Assigned (Report) then
      try
        Report.RecursoOrigem := CurrentResource.Name;
        Report.Print (FIDField.AsInteger);
      finally
        Report.Free;
      end
    else
      Assert(False, 'The report wasn''t created');
  end;
end;

function TosCustomMainForm.CreateCurrentReport: TacCustomReport;
begin
  if (Assigned(FCurrentResource)) and
    (FCurrentResource.ResType in [rtEdit, rtReport]) and
    (Assigned(FCurrentResource.ReportClass)) then
  begin
    Result := TReportClass(FCurrentResource.ReportClass).Create(nil);
//    if getReportByResource(FCurrentResource.Name, FCurrentTemplate) then
//      Result.Report.Template.LoadFromStream(FCurrentTemplate);
  end
  else
    Result := nil;
//    raise Exception.CreateFmt('Report %s não registrado', [FCurrentResource.ReportClassName]);
end;

procedure TosCustomMainForm.OnSelectResourceActionExecute(Sender: TObject);
begin
  inherited;
  ResourcePanel.Caption := '  ' + FCurrentResource.Name;

  if Trim(FCurrentResource.FilterDefName) <> '' then
  begin
    FilterDataset.Close;
    with ConsultaCombo do
    begin
      ClearViews;
      FilterDefName := FCurrentResource.FilterDefName;
      GetViews;
      if ItemIndex <> -1 then
        FilterAction.Execute;
    end;
    case FCurrentResource.ResType of
      rtEdit:
        HideHomePage(teGrid);
      rtReport:
        HideHomePage(teRelat);
    end;
  end
  else
    case FCurrentResource.ResType of
      rtReport:
        begin
          replaceReportSQLPrint;
          HideHomePage(teRelat);
        end;
    else
      ShowHomePage(False, False);
    end;
end;

procedure TosCustomMainForm.CheckMultiSelection;
begin
  FSelectionField := FilterDataset.Fields.FindField('Selected');
  if Assigned(FSelectionField) then
  begin
    Grid.Options := Grid.Options + [dgMultiSelect];
    Grid.MultiSelectOptions := [msoShiftSelect];
  end
  else
  begin
    Grid.Options := Grid.Options - [dgMultiSelect];
    Grid.MultiSelectOptions := [];
  end
end;

procedure TosCustomMainForm.SearchEditDblClick(Sender: TObject);
begin
  inherited;
  ShowMessage(SelectedList.Text);
end;

function TosCustomMainForm.CreateCurrentForm: TForm;
var
  x: TosFormClass;
begin
  if (FCurrentResource.ResType = rtOther) then
  begin
    x := TosFormClass(FCurrentResource.ResClass);
    Result := x.Create(Self);
//    Result := TosFormClass(FCurrentResource.ResClass).Create(Self)
  end
  else
    Result := nil;
end;

procedure TosCustomMainForm.ShowHomePage(freeRes: boolean; goHome: boolean = true);
var
  sURL : WideString;
begin
  if goHome then
  begin
    //sURL := 'File://' + ExtractFilePath(Application.ExeName) + 'Web\este.htm';
    sURL := 'File://' + ExtractFilePath(Application.ExeName) + 'Web\PaginaInicial.htm';
    WebBrowser.Navigate(sURL);
  end;
  FilterDataset.Close;
  StatusBar.Panels[0].Text := '';
  Grid.Visible := False;
  RelatPanel.Visible := False;
  controlActions(false);
  ResourcePanel.Visible := false;
  ConsultaCombo.ClearViews;
  if freeRes then
    FCurrentResource := nil;
end;

procedure TosCustomMainForm.HideHomePage(tipo: TTipoExibicao);
begin
  Grid.Visible := tipo = teGrid;
  RelatPanel.Visible := tipo = teRelat;
  if tipo=teRelat then
    controlActions(false);
  WebBrowser.Stop;
  ResourcePanel.Visible := true;
end;

procedure TosCustomMainForm.PaginaInicial(Sender: TObject);
begin
  inherited;
  ShowHomePage(true);
end;

procedure TosCustomMainForm.PesquisaMenu(pOrigem: Integer; pIndice : Integer);
var
  i,vTamanho: integer;
  vNo: ttreenode;
begin
  vTamanho := length(EdtPesquisa.text);
  if vTamanho > 2 then
  begin
    for i := pIndice to TreeView1.Items.Count-1 do
    begin
      if Pos(UpperCase(EdtPesquisa.text), UpperCase(TreeView1.Items[i].Text)) > 0 then      
      begin
        vNo := TreeView1.Items[i];
        TreeView1.Select(vNo);
        if pOrigem = 0 then        
           break
        else
        begin
          FIndiceMenu := i ;
          pOrigem := 0;
        end;
      end;
    end;
  end;
end;

procedure TosCustomMainForm.GridCalcTitleImage(Sender: TObject;
  Field: TField; var TitleImageAttributes: TwwTitleImageAttributes);
begin
  inherited;
  // Se a coluna que está sendo desenhada for aquela escolhida pelo usuário...
  if Field = SortField then
  begin
    // ... desenha a seta correspondente ao sentido da ordenação desejado
    if AscendingSort then
      TitleImageAttributes.ImageIndex := 0
    else
      TitleImageAttributes.ImageIndex := 1;
  end
  else
    // Senão não desenha imagem alguma
    TitleImageAttributes.ImageIndex := -1;
end;

procedure TosCustomMainForm.GridTitleButtonClick(Sender: TObject;
  AFieldName: String);
var
  Field: TField;
  IndexOptions: TIndexOptions;
begin
  inherited;
  // Considera-se inválido o buffer da string de busca incremental quando um
  // novo field é selecionado para ordenação
  CurrentSearchString := '';

  // Obtém o Field correspondente do DataSet (FieldByName retorna uma exceção
  // caso o field não seja encontrado. Todavia isso não deve acontecer, uma vez
  // que este evento será disparado apenas quando o dataset estiver aberto e com
  // fields válidos)
  Field := Grid.DataSource.DataSet.FieldByName(AFieldName);
  // Se o usuário clicou no mesmo field de antes então...
  if Field = SortField then
    // ... muda o sentido da seta
    AscendingSort := not AscendingSort
  else
  // Senão se o Field é diferente então...
  begin
    // ... define o novo field e redesenha o grid para remover as setas das
    // outras colunas
    SortField := Field;
    AscendingSort := True;
    Grid.RedrawGrid;
  end;



  // Apaga o índice atual
  if FilterDataset.IndexFieldCount > 0 then
    FilterDataset.DeleteIndex(SortIndexName);

  // Define as opções do índice para não-sensível à caixa e ordenação ascendente
  // ou descendente, de acordo com a seleção atual
  if AscendingSort then
    IndexOptions := [ixCaseInsensitive]
  else
    IndexOptions := [ixDescending, ixCaseInsensitive];
  // Cria o índice no field selecionado
  FilterDataset.AddIndex(SortIndexName, AFieldName, IndexOptions);

  // Define o nome do índice e ordena novamente o dataset (caso já seja aquele
  // o nome do índice)
  FilterDataset.IndexName := SortIndexName;
end;

procedure TosCustomMainForm.FilterDatasetBeforeClose(DataSet: TDataSet);
begin
  inherited;
  // Limpa o nome do índice porque os índices se tornam inválidos quando o
  // dataset é fechado
  FilterDataset.IndexName := '';

  // SortField conterá um endereço inválido aqui
  SortField := nil;
end;

function TosCustomMainForm.Login: boolean;
  function GetSystemUserName: string;
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
const
  MaxErrorCount = 3;
var
  LoginForm: TosCustomLoginForm;
  cdsUsuario: TosClientDataSet;
  cds: TosClientDataSet;
  ErrorCount: integer;
  LoginCorrect: boolean;
begin
  FUserName := GetSystemUserName;

  LoginForm := getLoginFormClass.Create(nil);
  cdsUsuario := TosClientDataSet.Create(nil);
  cds := TosClientDataset.Create(nil);
  try
    cdsUsuario.DataProvider := RecursoData.UsuarioProvider;
    cds.DataProvider := RecursoData.RecursosUsuarioProvider;

{$IFDEF DESENV}
    LoginForm.UsernameEdit.Text := 'Desenvolvedor';
    LoginForm.PasswordEdit.Text := 'Desenv';
{$ELSE}
    LoginForm.UsernameEdit.Text := FUsername;
    LoginForm.PasswordEdit.Text := '';
{$ENDIF}
    LoginForm.FocusedControl := LoginForm.UsernameEdit;

    ErrorCount := 0;
    LoginCorrect := False;

    FSuperUserLogged := false;

    while not LoginCorrect and (ErrorCount < MaxErrorCount)
        and (mrCancel <> LoginForm.ShowModal) do
    begin
      if LoginForm.UsernameEdit.Text=FSuperUserName then
      begin
        if LoginForm.PasswordEdit.Text = getSuperUserPass then
        begin
          FSuperUserLogged := true;
          LoginCorrect := True;
          Break;
        end;
      end;
      cdsUsuario.Params.Clear;
      with cdsUsuario.Params.CreateParam(ftString, 'Username', ptInput) do
        Value := LoginForm.UsernameEdit.Text;
      
      cdsUsuario.Open;
      try
        if cdsUsuario.RecordCount = 0 then
        begin
          MessageDlg('Usuário inexistente.', mtError, [mbOK], 0);
          LoginForm.FocusedControl := LoginForm.UsernameEdit;
          Inc(ErrorCount);
        end
        else if (cdsUsuario.FieldByName('Senha').Value <> MD5Digest(LoginForm.PasswordEdit.Text))
            and (not cdsUsuario.FieldByName('Senha').IsNull or (LoginForm.PasswordEdit.Text <> '')) then
        begin
          MessageDlg('Senha incorreta.', mtError, [mbOK], 0);
          LoginForm.FocusedControl := LoginForm.PasswordEdit;
          Inc(ErrorCount);
        end
        else if (cdsUsuario.FieldByName('Status').AsString = 'X') then
        begin
          MessageDlg('Este usuário está inativo e não pode efetuar seu login no sistema.' +
            #13 + 'Entre em contato com o administrador do sistema ou com o Suporte da Hotsoft.',
            mtError, [mbOK], 0);
          LoginForm.FocusedControl := LoginForm.PasswordEdit;
          Inc(ErrorCount);
        end
        else
          LoginCorrect := True;
      finally
        cdsUsuario.Close;
      end;
    end;

    if LoginCorrect then
    begin
      //Efetua logout do usuário anteriormente logado, se existir
      Logout;

      Manager.Resources.Clear;

      FUsername := LoginForm.UsernameEdit.Text;

      acCustomSQLMainData.GetUserInfo(FUserName);

      StatusBar.Panels[1].Text := FUsername;
      cds.Params.Clear;
      if FUserName=FSuperUserName then
        with cds.Params.CreateParam(ftString, 'UserName', ptInput) do
          Value := '%'
      else
        with cds.Params.CreateParam(ftString, 'UserName', ptInput) do
          Value := FUserName;
      cds.IndexFieldNames := 'OrdemDominio; OrdemRecurso';
      cds.Open;
      if FUserName=FSuperUserName then
        cds.Filtered := false
      else
      begin
        cds.Filter := 'OrdemRecurso>=0';
        cds.Filtered := true;
      end;
      try
        while not cds.Eof do
        begin
          Manager.AddResource(cds.FieldByName('Nome').AsString,
                              cds.FieldByName('Descricao').AsString,
                              cds.FieldByName('FilterDefName').AsString,
                              cds.FieldByName('ResClassName').AsString,
                              cds.FieldByName('DataClassName').AsString,
                              cds.FieldByName('ReportClassName').AsString,
                              cds.FieldByName('NomeDominio').AsString,
                              cds.FieldByName('IndiceImagem').AsInteger,
                              cds.FieldByName('IDTipoRecurso').AsInteger);
          cds.Next;
        end;
      finally
        cds.Close;
      end;

      Manager.Reload;

      if FUserName=FSuperUserName then
        ActionDataSet.Params.ParamByName('UserName').Value := '%'
      else
        ActionDataSet.Params.ParamByName('UserName').Value := FUserName;

      LoadTreeView  ;
    end;
  finally
    cds.Free;
    cdsUsuario.Free;
    LoginForm.Free;
  end;

  Result := LoginCorrect;
end;

procedure TosCustomMainForm.Logout;
begin
  FilterDataSet.Close;

  TreeView1.Items.Clear;

  StatusBar.Panels[0].Text := '';
  StatusBar.Panels[1].Text := '';
  ResourcePanel.Caption := 'LabMaster';
  ActionDataSet.Params.ParamByName('UserName').Value := '';

  FCurrentResource := nil;
  FreeAndNil(FCurrentEditForm);
  FreeAndNil(FCurrentForm);
  FreeAndNil(FCurrentDatamodule);

  OnCheckActionsAction.Execute;

  ShowHomePage(true, false);
end;

procedure TosCustomMainForm.LoginActionExecute(Sender: TObject);
begin
  inherited;
  if Login then
  begin
    LogoutAction.Enabled := True;
    LoginAction.Caption := 'Alterar usuário';
  end;
end;

procedure TosCustomMainForm.LogoutActionExecute(Sender: TObject);
begin
  inherited;
  Logout;
  LogoutAction.Enabled := False;
  LoginAction.Caption := 'Login';
end;

procedure TosCustomMainForm.LoadTreeView;
var
  i: integer;
  sDomain: string;
  noPai, no: TTreeNode;
begin
  sDomain := '';
  for i:=0 to Manager.Resources.Count - 1 do
  begin
    with Manager.Resources[i] do
    begin
      if DomainName <> sDomain then
      begin
        sDomain := DomainName;
        noPai := TreeView1.Items.Add(nil, sDomain);
      end;
      // Cria o botão
      no := TreeView1.Items.AddChild(noPai, name);
      no.ImageIndex := ImageIndex;
      no.SelectedIndex := Manager.Resources[i].ID;
    end;
  end;
end;

procedure TosCustomMainForm.GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  // Executa a ação padrão para o recurso quando o usuário pressiona Enter
  if VK_RETURN = Key then
  begin
    // Limpa a string para impedir que a busca incremental continue do ponto
    // onde parou após o usuário fechar a caixa de diálogo
    CurrentSearchString := '';
    ActionDblClick.Execute;
  end
  else
  begin
    // A string de busca incremental é esvaziada quando o usuário pressiona ESC
    if VK_ESCAPE = Key then
      CurrentSearchString := '';

    // Sinaliza, para o evento OnKeyPress, que a tecla Alt ou Ctrl está
    // pressionada. Isto é necessário porque o evento OnKeyPress não reconhece
    // se uma dessas teclas está pressionada quando um caractere é recebido do
    // teclado. A tecla Shift não interessa ao evento OnKeyPress porque a busca
    // incremental não é sensível à caixa
    CtrlOrAltPressed := Shift * [ssAlt, ssCtrl] <> [];
  end;
end;

procedure TosCustomMainForm.GridKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not Assigned(SortField) then exit;
  // O índice de ordenação é criado no evento AfterOpen do dataset e, por isso,
  // ele deve estar obrigatoriamente criado quando este método for executado e
  // o dataset estiver ativo
  Assert((not FilterDataset.Active) or Assigned(SortField));

  // Não faz sentido usar a busca incremental enquanto o dataset está fechado;
  // deve-se ignorar teclas como TAB e ESC, que acionam o evento OnKeyPress; a
  // tecla deve ser ignorada se Alt Ou Ctrl estiver pressionado; e, por fim, o
  // field deve ser do tipo string, porque o FindNearest não funciona de outro
  // modo. O teste que verifica se o dataset está ativo deve ser feito antes
  // daquele que verifica o tipo do field para impedir que seja feito o acesso a
  // uma propriedade cujo objeto não existe
  if (not CtrlOrAltPressed) and (Ord(Key) >= 32) and FilterDataset.Active
      and (SortField.DataType = ftString) then
  begin
    // Adiciona o novo caractere à string de busca incremental
    CurrentSearchString := CurrentSearchString + Key;
    // Sinaliza para os eventos OnScroll que irá rolar o dataset
    IncrementalSearchScrolling := True;
    try
      // Procura o registro mais semelhante, baseado na string de busca
      // acumulada até o momento e no índice selecionado atualmente
      FilterDataset.FindNearest([CurrentSearchString]);
    finally
      // Restaura o valor da variável
      IncrementalSearchScrolling := False;
    end;
  end;
end;

procedure TosCustomMainForm.spbPreviewPrintClick(Sender: TObject);
begin
  inherited;
  ReportViewer.Print;
end;

procedure TosCustomMainForm.spbPreviewWholeClick(Sender: TObject);
begin
  inherited;
  ReportViewer.ZoomSetting := zsWholePage;

  mskPreviewPercentage.Text := IntToStr(ReportViewer.CalculatedZoom);

  pnlPreviewBar.SetFocus;
end;

procedure TosCustomMainForm.spbPreviewWidthClick(Sender: TObject);
begin
  inherited;
  ReportViewer.ZoomSetting := zsPageWidth;

  mskPreviewPercentage.Text := IntToStr(ReportViewer.CalculatedZoom);

  pnlPreviewBar.SetFocus;
end;

procedure TosCustomMainForm.spbPreview100PercentClick(Sender: TObject);
begin
  inherited;
  ReportViewer.ZoomSetting := zs100Percent;

  mskPreviewPercentage.Text := IntToStr(ReportViewer.CalculatedZoom);

  pnlPreviewBar.SetFocus;
end;

procedure TosCustomMainForm.spbPreviewFirstClick(Sender: TObject);
begin
  inherited;
  ReportViewer.FirstPage;
end;

procedure TosCustomMainForm.spbPreviewPriorClick(Sender: TObject);
begin
  inherited;
  ReportViewer.PriorPage;
end;

procedure TosCustomMainForm.spbPreviewNextClick(Sender: TObject);
begin
  inherited;
  ReportViewer.NextPage;
end;

procedure TosCustomMainForm.spbPreviewLastClick(Sender: TObject);
begin
  inherited;
  ReportViewer.LastPage;
end;

procedure TosCustomMainForm.mskPreviewPageKeyPress(Sender: TObject;
  var Key: Char);
var
  liPage: Longint;
begin

  if (Key = #13) then
    begin
      liPage := StrToInt(mskPreviewPage.Text);

      ReportViewer.GotoPage(liPage);
    end; {if, carriage return pressed}
end;

procedure TosCustomMainForm.mskPreviewPercentageKeyPress(Sender: TObject;
  var Key: Char);

begin
  if (Key = #13) then
    begin
      adjustReportZoom;
    end; {if, carriage return pressed}
end;

procedure TosCustomMainForm.ReportViewerPageChange(Sender: TObject);
begin
  inherited;
  mskPreviewPage.Text := IntToStr(ReportViewer.AbsolutePageNo);
  mskPreviewPercentage.Text := IntToStr(ReportViewer.CalculatedZoom);
end;

procedure TosCustomMainForm.ReportViewerPrintStateChange(Sender: TObject);
var
  lPosition: TPoint;
begin
  if ReportViewer.Busy then
    begin
      mskPreviewPercentage.Enabled := False;
      mskPreviewPage.Enabled := False;

      pnlPreviewBar.Cursor := crHourGlass;

      ReportViewer.Cursor := crHourGlass;

      pnlStatusBar.Cursor := crHourGlass;

      spbPreviewCancel.Cursor := crArrow;

      spbPreviewCancel.Enabled := True;
    end
  else
    begin
      mskPreviewPercentage.Enabled := True;
      mskPreviewPage.Enabled := True;

      pnlPreviewBar.Cursor := crDefault;

      ReportViewer.Cursor := crDefault;

      pnlStatusBar.Cursor := crDefault;

      spbPreviewCancel.Cursor := crDefault;

      spbPreviewCancel.Enabled := False;
    end;

  {this code will force the cursor to update}
  GetCursorPos(lPosition);
  SetCursorPos(lPosition.X, lPosition.Y);
end;

procedure TosCustomMainForm.ReportViewerStatusChange(Sender: TObject);
begin
  inherited;
  pnlStatusBar.Caption := ReportViewer.Status;
end;

function TosCustomMainForm.getReportByResource(name: string; stream: TMemoryStream): boolean;
begin
  result := getTemplateByName(name, stream);
end;

procedure TosCustomMainForm.ReportPreviewFormCreate(Sender: TObject);
begin
  inherited;
  //
end;

procedure TosCustomMainForm.replaceReportSQLPrint;
var
  strSQL: string;
  dummy: integer;
begin
  strSQL := ConsultaCombo.getSQLFilter(dummy);
  replaceReportSQL(report, FCurrentTemplate, strSQL);
  if strSQL <> '' then
    report.PrintToDevices;
  if FCurrentDatamodule <> nil then
    TacCustomReport(FCurrentDataModule).Print(0);
end;

procedure TosCustomMainForm.checkOperations;
var
  osForm: TosForm;
begin
  //Após verificar todos os direitos de uso que os usuários possuem, o programa
  //deve verificar as operações que o form fornece.
  //Por exemplo, se o usuário tem direito de excluir um registro para um determinado
  //form mas este form não permite exclusão, então o usuário perde este direito.
  //O Contrário não é verdadeiro. Assim, as operações do form servem apenas para
  //tirar direitos.
  osForm := nil;
  if FCurrentEditForm <> nil then
    osForm := FCurrentEditForm
  else
    if FCurrentForm is TosForm then
      osForm := FCurrentForm as TosForm;
  if osForm <> nil then
  begin
    NewAction.Enabled := NewAction.Enabled AND (oInserir in osForm.Operacoes);
    EditAction.Enabled := EditAction.Enabled AND (oEditar in osForm.Operacoes);
    EditarTodosButton.Enabled := EditAction.Enabled;
    DeleteAction.Enabled := DeleteAction.Enabled AND (oExcluir in osForm.Operacoes);
    ViewAction.Enabled := ViewAction.Enabled AND (oVisualizar in osForm.Operacoes);
    PrintAction.Enabled := PrintAction.Enabled AND ((oImprimir in osForm.Operacoes) or ((FCurrentResource.ReportClassName <> '')));
  end;
end;

procedure TosCustomMainForm.ControlActions(enabled: boolean);
begin
  NewAction.Enabled := enabled;
  EditAction.Enabled := enabled;
  EditarTodosButton.Enabled := enabled;
  DeleteAction.Enabled := enabled;
  ViewAction.Enabled := enabled;
  PrintAction.Enabled := enabled;
  RetrocedeAction.Enabled := enabled;
  AdvanceAction.Enabled := enabled;
end;

procedure TosCustomMainForm.adjustReportZoom;
var
  liPercentage: Integer;
begin
  liPercentage := StrToIntDef(mskPreviewPercentage.Text, 100);

  ReportViewer.ZoomPercentage := liPercentage;

  spbPreviewWhole.Down := False;
  spbPreviewWidth.Down := False;
  spbPreview100Percent.Down := False;

  mskPreviewPercentage.Text := IntToStr(ReportViewer.CalculatedZoom);
end;

procedure TosCustomMainForm.mskPreviewPercentageExit(Sender: TObject);
begin
  inherited;
  adjustReportZoom;
end;

procedure TosCustomMainForm.EditarTodosButtonClick(Sender: TObject);
var
  iID: integer;
  Form: TosCustomEditForm;
begin
  inherited;
  Form := FCurrentEditForm;
  if Assigned(Form) then
  begin
    Form.PararButton.Visible := true;
    Form.continue := true;
    //FilterDataset.First;
    while (not(FilterDataset.Eof)) and (Form.Continue) do
    begin
      iID := FIDField.AsInteger;
      Form.VisibleButtons := [vbSalvarFechar, vbParar];
      if PrintAction.Enabled then
        Form.VisibleButtons := Form.VisibleButtons + [vbImprimir];
      if assigned(Self.FOnEditForm) then
        Self.FOnEditForm(Form);
      Form.Edit('ID', iID);
      if Form.IsModified then
      begin
        FModifiedList.Add(FilterDatasource.DataSet.fieldByName('id').AsString);
        if false then //TODO considerar o forçar reexecutar filtro
        begin
          ExecLastFilter;
          FilterDataset.Locate('ID', iID, []); //TODO: localizar o próximo ID
        end;
      end;
      FilterDataset.Next;
    end;
  end;
end;


procedure TosCustomMainForm.EdtPesquisaChange(Sender: TObject);
begin
  inherited;
  FIndiceMenu := 0;
  Self.PesquisaMenu(0,FIndiceMenu);
end;

procedure TosCustomMainForm.EdtPesquisaEnter(Sender: TObject);
begin
  inherited;
  self.OnKeyDown := nil;
end;

procedure TosCustomMainForm.EdtPesquisaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  vNo : TTreeNode;
  TerminalConsultaForm : TTerminalConsultaEditForm;
begin
  inherited;
  if key = vk_return then
  begin
    if isNumeric(EdtPesquisa.Text, False) then
    begin
      try
        TerminalConsultaForm := TTerminalConsultaEditForm.Create(self);
        TerminalConsultaForm.pDigitacao := EdtPesquisa.Text;
        TerminalConsultaForm.ShowModal;
      except
        FreeAndNil(TerminalConsultaForm);
      end;
    end
    else if (FUltimoIndiceMenu > 0) and (FIndiceMenu = FUltimoIndiceMenu) then
    begin
      FIndiceMenu := 0;
      Self.PesquisaMenu(0,FIndiceMenu);
    end
    else
    begin
      FUltimoIndiceMenu := FIndiceMenu;    
      Self.PesquisaMenu(1,FIndiceMenu+1);
    end;
  end
  else
  if (key = VK_DOWN) or (key = VK_UP) or (key = VK_RIGHT)  then
  begin
    if KEY = VK_DOWN then
    BEGIN
      if (TreeView1.Items.Count-1) > FIndiceMenu then
      begin     
        vNo := TreeView1.Items[FIndiceMenu+1];
        TreeView1.Select(vNo);
        inc(FIndiceMenu);
      end;
    END
    else if KEY = VK_UP then
    begin
      if FIndiceMenu > 0 then
      begin
        vNo := TreeView1.Items[FIndiceMenu-1];
        TreeView1.Select(vNo);
        dec(FIndiceMenu);
      end;
    end
    else if KEY = VK_RIGHT then
    begin
      Self.TreeView1Change(Self, TreeView1.Items[FIndiceMenu]);
    end;
  end;
end;

procedure TosCustomMainForm.EfetuarBackupemarquivolocal1Click(
  Sender: TObject);
var
  nomeArq: String;
begin
  with SaveBackupDialog do
  begin
    if SaveBackupDialog.Execute then
    begin
      nomeArq := SaveBackupDialog.FileName;
      if FileExists(nomeArq) then
        DeleteFile(nomeArq);
      criarArquivoBackupIB(nomeArq);
    end;
  end;
end;

function TosCustomMainForm.getSuperUserPass: string;
begin
  result := 'superpass';
end;

procedure TosCustomMainForm.FormCreate(Sender: TObject);
begin
  inherited;
  FSuperUserName := 'FWSuperUser';

  StatusBar.Panels[2].Text := acCustomSQLMainData.Profile;
end;


procedure TosCustomMainForm.TreeView1Change(Sender: TObject;
  Node: TTreeNode);
var
  NewResource: TosAppResource;
begin
  inherited;
  FNewFilter := true;
  //se o nó escolhido não contiver pai ele é referente a um domínio
  if node.Parent=nil then
  begin
    ShowHomePage(true, False);
    exit;
  end;

  NewResource := TosAppResource(Manager.Resources.FindItemID(node.SelectedIndex));
  if FCurrentResource <> NewResource then
  begin
    FCurrentResource := NewResource;
    Manager.currentResource := FCurrentResource;
    // Libera o datamodule associado
    FCurrentDatamodule.Free;
    FCurrentDatamodule := CreateCurrentDatamodule;

    // Libera o form corrente
    if Assigned(FCurrentEditForm) then
      FreeAndNil(FCurrentEditForm);
    if Assigned(FCurrentForm) then
      FreeAndNil(FCurrentForm);

    // Limpa o Template corrente
    FCurrentTemplate.Clear;

    if FCurrentResource.ResType = rtReport then
    begin
      getReportByResource(FCurrentResource.Name, FCurrentTemplate);
    end
    else if FCurrentResource.ResType = rtEdit then
    begin
      FActionDblClick := EditAction;
      FCurrentEditForm := CreateCurrentEditForm;
      if Assigned(FCurrentEditForm) and Assigned(FCurrentDatamodule) then
        FCurrentEditForm.Datamodule := FCurrentDatamodule;
    end
    else if FCurrentResource.ResType = rtOther then
      FCurrentForm := CreateCurrentForm;

    OnSelectResourceAction.Execute;
  end;

  if FCurrentResource.ResType = rtOther then
  begin
    Screen.Cursor := crHourglass;
    try
      CheckActionsExecute(self);
      if FCurrentForm is TosCustomEditForm then
        (FCurrentForm as TosCustomEditForm).VisibleButtons := [vbSalvarFechar];
      FCurrentForm.ShowModal;
    finally
      Screen.Cursor := crDefault;
    end;
  end;

  PrintAction.Enabled := (FCurrentResource.ReportClassName <> '');
end;

procedure TosCustomMainForm.TreeView1CustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
  State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  inherited;

  if Node.Selected then
  begin
    Sender.Canvas.Brush.Color := clInfoBk;
    Sender.Canvas.Font.Color  := clBlack;
  end
  else
  begin
    Sender.Canvas.Brush.Color := TTreeView(Sender).Color;
    Sender.Canvas.Font.Color  := TTreeView(Sender).Font.Color;
  end;

end;



procedure TosCustomMainForm.GridCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
var
  id: integer;
begin
  inherited;
  if field.DataSet.findField('id') <> nil then
  begin
    id := field.DataSet.fieldByName('id').AsInteger;
    if FModifiedList.IndexOf(IntToStr(id)) <> -1  then
      AFont.Style := [fsItalic, fsBold];
  end;
end;


function TosCustomMainForm.getLoginFormClass: TLoginFormClass;
begin
  result := TosCustomLoginForm;
end;

initialization
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';


end.
