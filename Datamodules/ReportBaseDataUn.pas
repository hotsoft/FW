unit ReportBaseDataUn;

interface

uses
  SysUtils, Classes, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, DB, DBClient, osClientDataset, ppVar, ppPrnabl, ppCtrls,
  ppBands, ppCache, Forms, ppModule, raCodMod, ppForms, ppViewr;

type
  TReportBaseData = class(TDataModule)
    MasterDataSource: TDataSource;
    MasterDBPipeline: TppDBPipeline;
    Report: TppReport;
    ParametroDataSource: TDataSource;
    ParametroDBPipeline: TppDBPipeline;
    MasterClientDataset: TosClientDataset;
    ParametroClientDataset: TosClientDataset;
    ParametroClientDatasetNOMEFANTASIA: TWideStringField;
    ParametroClientDatasetENDERECO: TWideStringField;
    ParametroClientDatasetBAIRRO: TWideStringField;
    ParametroClientDatasetCIDADE: TWideStringField;
    ParametroClientDatasetUF: TWideStringField;
    ParametroClientDatasetTELEFONE: TWideStringField;
    ParametroClientDatasetLOGO: TBlobField;
    ppHeaderBand1: TppHeaderBand;
    ppLine1: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    BairroCidadeUFVariable: TppVariable;
    ppDBText3: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBImage1: TppDBImage;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppLine2: TppLine;
    raCodeModule1: TraCodeModule;
    procedure ReportPreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Print(const PID : integer);
  end;

  TReportBaseClass = class of TReportBaseData;

implementation

{$R *.dfm}

{ TdmReportBase }

procedure TReportBaseData.Print(const PID: integer);
begin
  MasterClientDataSet.Close;
  MasterClientDataSet.Params.ParamByName('ID').Value := PID;
  Report.Print;
  MasterClientDataSet.Close;
end;

procedure TReportBaseData.ReportPreviewFormCreate(Sender: TObject);
begin
  TppReport(Sender).PreviewForm.WindowState := wsMaximized;

  //TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting := zs100Percent;
end;

end.
