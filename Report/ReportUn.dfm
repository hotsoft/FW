object Report: TReport
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 259
  Top = 181
  Height = 208
  Width = 206
  object FilterDatasource: TDataSource
    DataSet = FilterDataset
    Left = 128
    Top = 20
  end
  object FilterDataset: TosClientDataset
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ReadOnly = True
    DataProvider = MainData.prvFilter
    Left = 28
    Top = 24
  end
  object Report: TppReport
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14552
    PrinterSetup.mmMarginLeft = 14552
    PrinterSetup.mmMarginRight = 14552
    PrinterSetup.mmMarginTop = 14552
    PrinterSetup.mmPaperHeight = 297128
    PrinterSetup.mmPaperWidth = 210080
    PrinterSetup.PaperSize = 9
    Units = utScreenPixels
    DeviceType = 'Screen'
    OnPreviewFormCreate = ReportPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zsPageWidth
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 128
    Top = 96
    Version = '9.01'
    mmColumnWidth = 188914
    object Detail: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {00}
    end
  end
end
