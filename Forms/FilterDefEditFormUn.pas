unit FilterDefEditFormUn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  osCUSTOMEDITFRM, Wwintl, Db, DBClient, osClientDataset, ActnList,
  StdCtrls, Mask, DBCtrls, Grids, DBGrids, ComCtrls,
  wwdbedit, Wwdotdot, Wwdbcomb, Menus, ImgList,
  osActionList, ToolWin, Buttons, ExtCtrls, osComboSearch, osUtils, osSQLDataSet, ppReport,
  daDataModule, daQueryDataView, ppTypes, daSQL, ppClass, ppComm, ppRelatv,
  ppProd, ppParameter, System.Actions;

type
  TFilterDefEditForm = class(TosCustomEditForm)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    cdsEditDetail: TosClientDataset;
    DBGrid1: TDBGrid;
    dsEditDetail: TDataSource;
    cdsEditName: TWideStringField;
    cdsEditDetailNumber: TIntegerField;
    cdsEditDetailDescription: TWideStringField;
    cdsEditDetailQueryText: TMemoField;
    cdsEditDetailAttributeList: TMemoField;
    cdsEditDetailExpressionList: TMemoField;
    cdsEditDetailConstraintList: TMemoField;
    cdsEditDetailOrderList: TMemoField;
    cbTipo: TwwDBComboBox;
    Label3: TLabel;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    edQuery: TDBMemo;
    TabSheet2: TTabSheet;
    edAtributos: TDBMemo;
    TabSheet3: TTabSheet;
    edExpression: TDBMemo;
    TabSheet4: TTabSheet;
    edRestricoes: TDBMemo;
    TabSheet5: TTabSheet;
    edOrdenacao: TDBMemo;
    TestarAction: TAction;
    cdsEditIDXFILTERDEF: TIntegerField;
    cdsEditFilterDefDetailDataset: TDataSetField;
    cdsEditDetailIDXFILTERDEFDETAIL: TIntegerField;
    cdsEditDetailIDXFILTERDEF: TIntegerField;
    cdsEditFILTERTYPE: TWideStringField;
    PopupMenu: TPopupMenu;
    Delete1: TMenuItem;
    cdsEdit: TosClientDataset;
    ApagarFiltroAction: TAction;
    Label4: TLabel;
    csTeste: TosComboSearch;
    cdsTeste: TosClientDataset;
    cdsTesteResult: TWideStringField;
    dsTeste: TDataSource;
    cdsTesteTeste: TWideStringField;
    ImportarButton: TButton;
    FiltroComboSearch: TosComboSearch;
    ImportarQueryButton: TButton;
    RBComboSearch: TosComboSearch;
    report: TppReport;
    cdsEditTITULO: TWideStringField;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    cdsEditDetailORDERCOLUMN: TWideStringField;
    DBCheckBox1: TDBCheckBox;
    cdsEditDetailORDERTYPE: TWideStringField;
    procedure TestarActionExecute(Sender: TObject);
    procedure cdsEditNewRecord(DataSet: TDataSet);
    procedure ApagarFiltroActionExecute(Sender: TObject);
    procedure csTesteEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ImportarButtonClick(Sender: TObject);
    procedure FiltroComboSearchReturnSearch(Sender: TObject;
      Dataset: TDataSet);
    procedure ImportarQueryButtonClick(Sender: TObject);
    procedure RBComboSearchReturnSearch(Sender: TObject;
      Dataset: TDataSet);
    procedure ReportPreviewFormCreate(Sender: TObject);
  private
    function getSQLFromTemplate(template: TMemoryStream): string;
  public
    { Public declarations }
  end;

var
  FilterDefEditForm: TFilterDefEditForm;

implementation

uses FilterDefDataUn, acCustomSQLMainDataUn, osCustomMainFrm, daDataView;

{$R *.DFM}

procedure TFilterDefEditForm.TestarActionExecute(Sender: TObject);
//var
//  frm: TCustomFilterForm;
begin
{
  frm := TBizCustomFilterForm.Create(Self);
  try
    frm.cbConsulta.ViewClassName := cdsEditName.Value;
    frm.ShowModal;
  finally
    frm.Free;
  end;
}
end;

procedure TFilterDefEditForm.cdsEditNewRecord(DataSet: TDataSet);
begin
  inherited;
  cdsEditFilterType.Value := 'FLT';
end;

procedure TFilterDefEditForm.ApagarFiltroActionExecute(Sender: TObject);
begin
  inherited;
  cdsEditDetail.Delete;
end;

procedure TFilterDefEditForm.csTesteEnter(Sender: TObject);
begin
  inherited;
  csTeste.ClearFilter;
  csTeste.FilterDefName := cdsEdit.FieldByName('Name').Value;
end;

procedure TFilterDefEditForm.FormCreate(Sender: TObject);
begin
  inherited;
  cdsTeste.Close;
  cdsTeste.CreateDataSet;
  csTeste.FilterDataProvider := acCustomSQLMainData.prvFilter;
end;

procedure TFilterDefEditForm.ImportarButtonClick(Sender: TObject);
begin
  inherited;
  FiltroComboSearch.Execute;
end;

procedure TFilterDefEditForm.FiltroComboSearchReturnSearch(Sender: TObject;
  Dataset: TDataSet);
var
  IDFiltroImport: integer;
  query: TosSQLDataSet;
  field: TField;
  i: integer;
begin
  inherited;
  IDFiltroImport := DataSet.Fields[0].AsInteger;
  cdsEditDetail.First;
  while not cdsEditDetail.eof do
  begin
    cdsEditDetail.Delete;
    cdsEditDetail.First;
  end;
  query := TosSQLDataSet.Create(nil);
  try
    query.SQLConnection := acCustomSQLMainData.SQLConnection;
    query.CommandText := 'SELECT                           ' +
                         '  Number,                        ' +
                         '  Description,                   ' +
                         '  QueryText,                     ' +
                         '  AttributeList,                 ' +
                         '  ExpressionList,                ' +
                         '  ConstraintList,                ' +
                         '  OrderList                      ' +
                         'FROM                             ' +
                         '  XFilterDefDetail               ' +
                         'WHERE                            ' +
                         '  IDXFilterDef = ' + IntToStr(IDFiltroImport) ;
    query.Open;
    query.First;
    while not(query.Eof) do
    begin
      cdsEditDetail.Append;
      cdsEditDetail.fieldByName('IDXFILTERDEF').AsInteger := cdsEdit.FieldByName('IDXFILTERDEF').AsInteger;
      for i := 0 to query.FieldCount-1 do
      begin
        field := cdsEditDetail.FindField(query.Fields[i].FieldName);
        if field <> nil then
          field.Value := query.Fields[i].value;
      end;
      query.next;
    end;
  finally
    FreeAndNil(query);
  end;
end;

procedure TFilterDefEditForm.ImportarQueryButtonClick(Sender: TObject);
begin
  inherited;
  RBComboSearch.Execute;
end;

procedure TFilterDefEditForm.RBComboSearchReturnSearch(Sender: TObject;
  Dataset: TDataSet);
var
  stream: TMemoryStream;
begin
  inherited;
  stream := TMemoryStream.Create;
  try
    if osCustomMainForm.getReportByResource(DataSet.Fields[1].AsString, stream) then
    begin
      if not(cdsEditDetail.State in [dsEdit, dsInsert]) then
        cdsEditDetail.Edit;
      cdsEditDetailQueryText.Value := AnsiString(getSQLFromTemplate(stream));
    end;

  finally
//    FreeAndNil(stream);
  end;
end;

function TFilterDefEditForm.getSQLFromTemplate(template: TMemoryStream): string;
var
  liIndex: Integer;
  lDataModule: TdaDataModule;
  lDataView: TdaDataView;
  aSQL: TDaSQL;
begin
  report.Template.LoadFromStream(template);

  aSQL := nil;

  {get the datamodule}
  lDataModule := daGetDataModule(Report.MainReport);

  if (lDataModule <> nil) then
  begin

      liIndex := 0;

      while (liIndex < lDatamodule.DataViewCount) and (aSQL = nil) do
      begin

        lDataView := lDataModule.DataViews[liIndex];

        if (lDataView <> nil) and (lDataView is TdaQueryDataView) and (Report.Datapipeline <> nil) and (Report.DataPipeline.Dataview = lDataview) then
        begin
          aSQL := TdaQueryDataView(lDataView).SQL;
          result := asql.SQLText.GetText;
        end;

        Inc(liIndex);

      end;
  end;
end;

procedure TFilterDefEditForm.ReportPreviewFormCreate(Sender: TObject);
begin
  inherited;
  //
end;

initialization
  OSRegisterClass(TFilterDefEditForm);

end.
