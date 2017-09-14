unit RecursoEditFormUn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  osCUSTOMEDITFRM, Wwintl, Db, DBClient, osClientDataset, ActnList,
  StdCtrls, Mask, DBCtrls, Grids, DBGrids, ComCtrls,
  wwdbedit, Wwdotdot, Wwdbcomb, Menus, ImgList,
  osActionList, ToolWin, Buttons, ExtCtrls, osComboSearch, osUtils,
  Wwdbigrd, Wwdbgrid, Wwdbspin, DBActns, acCustomSQLMainDataUn,
  System.ImageList, System.Actions;

type
  TRecursoEditForm = class(TosCustomEditForm)
    AcaoClientDataSet: TosClientDataset;
    AcaoDataSource: TDataSource;
    TestarAction: TAction;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    NomeEdit: TDBEdit;
    DescricaoEdit: TDBMemo;
    RecursoClientDataSource: TosClientDataset;
    PopupMenu: TPopupMenu;
    Novo2: TMenuItem;
    Excluir1: TMenuItem;
    RecursoClientDataSourceIDRECURSO: TIntegerField;
    RecursoClientDataSourceIDTIPORECURSO: TIntegerField;
    RecursoClientDataSourceDESCRICAO: TStringField;
    RecursoClientDataSourceIDDOMINIO: TIntegerField;
    RecursoClientDataSourceNOME: TStringField;
    RecursoClientDataSourceFILTERDEFNAME: TStringField;
    RecursoClientDataSourceDATACLASSNAME: TStringField;
    RecursoClientDataSourceRESCLASSNAME: TStringField;
    RecursoClientDataSourceREPORTCLASSNAME: TStringField;
    RecursoClientDataSourceINDICEIMAGEM: TIntegerField;
    RecursoClientDataSourceNUMORDEM: TIntegerField;
    AcaoClientDataSetIDACAO: TIntegerField;
    AcaoClientDataSetIDRECURSO: TIntegerField;
    AcaoClientDataSetNOME: TStringField;
    AcaoClientDataSetNOMECOMPONENTE: TStringField;
    AcaoClientDataSetDESCRICAO: TStringField;
    AcaoClientDataSetINDICEIMAGEM: TIntegerField;
    RecursoClientDataSourceDescricaoDominio: TStringField;
    DescricaoDominioCombo: TosComboSearch;
    DescricaoTipoRecursoCombo: TosComboSearch;
    RecursoClientDataSourceDescricaoTipoRecurso: TStringField;
    RecursoClientDataSourceAcaoDataSet: TDataSetField;
    PageControl: TPageControl;
    ClassesTabSheet: TTabSheet;
    AcoesTabSheet: TTabSheet;
    AcaoGrid: TwwDBGrid;
    Label5: TLabel;
    FilterDefNameEdit: TDBEdit;
    Label6: TLabel;
    DataClassNameEdit: TDBEdit;
    Label7: TLabel;
    ResClassNameDBEdit: TDBEdit;
    Label8: TLabel;
    ReportClassNameEdit: TDBEdit;
    Label9: TLabel;
    NumOrdemSpinEdit: TwwDBSpinEdit;
    Label10: TLabel;
    ImagemEdit: TDBEdit;
    AntibioticoPopupMenu: TPopupMenu;
    EditarAcaoMenu: TMenuItem;
    InserirAcaoMenu: TMenuItem;
    SalvarAcaoMenu: TMenuItem;
    CancelarAcaoMenu: TMenuItem;
    ExcluirAcaoMenu: TMenuItem;
    AcaoActionList: TosActionList;
    AcaoEdit: TDataSetEdit;
    AcaoInsert: TDataSetInsert;
    AcaoPost: TDataSetPost;
    AcaoCancel: TDataSetCancel;
    AcaoDelete: TDataSetDelete;
    DBCheckBox1: TDBCheckBox;
    RecursoClientDataSourceHABILITAEDITARTODOS: TStringField;
    RecursoClientDataSourceFORCAREEXECUCAOFILTRO: TStringField;
    DBCheckBox2: TDBCheckBox;

    procedure RecursoClientDataSourceBeforePost(DataSet: TDataSet);
    procedure AcaoClientDataSetBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure RecursoClientDataSourceAfterApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
    procedure AcaoClientDataSetAfterApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
  private

  public

  end;

var
  RecursoEditForm: TRecursoEditForm;

implementation

uses RecursoDataUn, AdministracaoLookupDataUn;

{$R *.DFM}

procedure TRecursoEditForm.RecursoClientDataSourceBeforePost(DataSet: TDataSet);
begin
  inherited;
  RecursoData.Validate(DataSet);
end;

procedure TRecursoEditForm.AcaoClientDataSetBeforePost(DataSet: TDataSet);
begin
  inherited;
  RecursoData.ValidateAcao(DataSet);
end;

procedure TRecursoEditForm.FormShow(Sender: TObject);
var
  viewMode: boolean; 
begin
  inherited;
  PageControl.ActivePage := ClassesTabSheet;

  acCustomSQlMainData.RefreshTables([tnDominio, tnTipoRecurso]);

  viewMode := FormMode=fmView;
  if viewMode then
    AcaoGrid.KeyOptions := AcaoGrid.KeyOptions-[dgAllowInsert]
  else
    AcaoGrid.KeyOptions := AcaoGrid.KeyOptions+[dgAllowInsert];
end;

procedure TRecursoEditForm.RecursoClientDataSourceAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  inherited;
  if TClientDataSet(Sender).UpdateStatus in [usModified, usInserted, usDeleted] then
    acCustomSQLMainData.UpdateVersion(tnRecurso);
end;

procedure TRecursoEditForm.AcaoClientDataSetAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  inherited;
  if TClientDataSet(Sender).UpdateStatus in [usModified, usInserted, usDeleted] then
    acCustomSQLMainData.UpdateVersion(tnAcao);

end;

initialization
  OSRegisterClass(TRecursoEditForm);

end.
