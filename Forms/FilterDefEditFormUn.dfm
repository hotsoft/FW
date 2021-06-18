inherited FilterDefEditForm: TFilterDefEditForm
  Left = 492
  Top = 121
  ActiveControl = DBEdit2
  BorderIcons = [biSystemMenu, biMinimize]
  BorderWidth = 4
  Caption = 'Defini'#231#227'o de Filtros'
  ClientHeight = 501
  ClientWidth = 496
  ExplicitTop = -166
  ExplicitWidth = 520
  ExplicitHeight = 568
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 340
    Top = 40
    Width = 21
    Height = 13
    Caption = '&Tipo'
  end
  object Label2: TLabel [1]
    Left = 8
    Top = 40
    Width = 28
    Height = 13
    Caption = '&Nome'
    FocusControl = DBEdit2
  end
  object Label3: TLabel [2]
    Left = 8
    Top = 86
    Width = 27
    Height = 13
    Caption = 'F&iltros'
    FocusControl = DBGrid1
  end
  object Label4: TLabel [3]
    Left = 23
    Top = 506
    Width = 27
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'T&este'
  end
  object Label5: TLabel [4]
    Left = 8
    Top = 64
    Width = 31
    Height = 13
    Caption = 'T'#237'tulo:'
  end
  inherited MainControlBar: TControlBar
    Width = 496
    TabOrder = 4
    ExplicitWidth = 496
  end
  object DBEdit2: TDBEdit [6]
    Left = 48
    Top = 36
    Width = 289
    Height = 21
    DataField = 'Name'
    DataSource = MasterDataSource
    TabOrder = 0
  end
  object DBGrid1: TDBGrid [7]
    Left = 8
    Top = 104
    Width = 490
    Height = 161
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsEditDetail
    PopupMenu = PopupMenu
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Number'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Width = 415
        Visible = True
      end>
  end
  object cbTipo: TwwDBComboBox [8]
    Left = 368
    Top = 36
    Width = 121
    Height = 21
    ShowButton = True
    Style = csDropDown
    MapList = True
    AllowClearKey = False
    DataField = 'FILTERTYPE'
    DataSource = MasterDataSource
    DropDownCount = 8
    HistoryList.FileName = 'LabMaster.ini.ini'
    ItemHeight = 0
    Items.Strings = (
      'Edi'#231#227'o'#9'EDT'
      'Relat'#243'rio'#9'REP'
      'Lookup'#9'LOK')
    Sorted = False
    TabOrder = 1
    UnboundDataType = wwDefault
  end
  object PageControl: TPageControl [9]
    Left = 8
    Top = 272
    Width = 490
    Height = 195
    ActivePage = TabSheet1
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = '&Query'
      object edQuery: TDBMemo
        Left = 0
        Top = 0
        Width = 482
        Height = 167
        Align = alClient
        DataField = 'QueryText'
        DataSource = dsEditDetail
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = '&Atributos'
      ImageIndex = 1
      object edAtributos: TDBMemo
        Left = 0
        Top = 0
        Width = 482
        Height = 167
        Hint = 'Nome=TituloColuna[;Tam]'
        Align = alClient
        DataField = 'AttributeList'
        DataSource = dsEditDetail
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
    end
    object TabSheet3: TTabSheet
      Caption = '&Express'#245'es Default'
      ImageIndex = 2
      object edExpression: TDBMemo
        Left = 0
        Top = 0
        Width = 482
        Height = 167
        Hint = 'Express'#245'es que ser'#227'o adicionadas ao SQL (and)'
        Align = alClient
        DataField = 'ExpressionList'
        DataSource = dsEditDetail
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
    end
    object TabSheet4: TTabSheet
      Caption = '&Restri'#231#245'es usu'#225'rio'
      ImageIndex = 3
      object edRestricoes: TDBMemo
        Left = 0
        Top = 0
        Width = 482
        Height = 167
        Hint = 
          'Nome;Expressao'#13#10'Nome;Express'#227'o;Date'#13#10'Nome;Express'#227'o;List;cod1,de' +
          'scr1,cod2,descr2,...'#13#10'Nome;Express'#227'o;Dategroup;expr1 | expr2'#13#10'No' +
          'me;;Group Nome;Expressao[;...] | Nome;Expressao[;...] | ...'
        Align = alClient
        DataField = 'ConstraintList'
        DataSource = dsEditDetail
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
    end
    object TabSheet5: TTabSheet
      Caption = '&Ordena'#231#227'o'
      ImageIndex = 4
      object Label6: TLabel
        Left = 8
        Top = 149
        Width = 116
        Height = 13
        Caption = 'Coluna para Ordena'#231#227'o:'
      end
      object edOrdenacao: TDBMemo
        Left = 0
        Top = 0
        Width = 482
        Height = 145
        Hint = 'Nome=Express'#227'o'
        Align = alTop
        DataField = 'OrderList'
        DataSource = dsEditDetail
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 128
        Top = 146
        Width = 249
        Height = 21
        DataField = 'ORDERCOLUMN'
        DataSource = dsEditDetail
        TabOrder = 1
      end
      object DBCheckBox1: TDBCheckBox
        Left = 386
        Top = 148
        Width = 87
        Height = 17
        Caption = 'Descendente'
        DataField = 'ORDERTYPE'
        DataSource = dsEditDetail
        TabOrder = 2
        ValueChecked = 'D'
        ValueUnchecked = 'A'
      end
    end
  end
  object csTeste: TosComboSearch [10]
    Left = 11
    Top = 478
    Width = 157
    Height = 21
    Anchors = [akRight, akBottom]
    ShowButton = True
    Style = csDropDown
    DataField = 'Teste'
    DataSource = dsTeste
    TabOrder = 5
    WordWrap = False
    UnboundDataType = wwDefault
    OnEnter = csTesteEnter
    FilterDataProvider = acCustomSQLMainData.prvFilter
    AllowClearKey = False
  end
  object ImportarButton: TButton [11]
    Left = 407
    Top = 4
    Width = 75
    Height = 22
    Caption = 'Importar'
    TabOrder = 6
    OnClick = ImportarButtonClick
  end
  object FiltroComboSearch: TosComboSearch [12]
    Left = 324
    Top = 4
    Width = 121
    Height = 21
    ShowButton = True
    Style = csDropDown
    TabOrder = 7
    WordWrap = False
    UnboundDataType = wwDefault
    Visible = False
    FilterDefName = 'FilterDef'
    AllowClearKey = False
    OnReturnSearch = FiltroComboSearchReturnSearch
  end
  object ImportarQueryButton: TButton [13]
    Left = 387
    Top = 478
    Width = 107
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Importar Query'
    TabOrder = 8
    OnClick = ImportarQueryButtonClick
  end
  object RBComboSearch: TosComboSearch [14]
    Left = 236
    Top = 476
    Width = 121
    Height = 21
    ShowButton = True
    Style = csDropDown
    TabOrder = 9
    WordWrap = False
    UnboundDataType = wwDefault
    Visible = False
    FilterDefName = 'Relatorio_RB'
    AllowClearKey = False
    OnReturnSearch = RBComboSearchReturnSearch
  end
  object DBEdit1: TDBEdit [15]
    Left = 48
    Top = 60
    Width = 439
    Height = 21
    DataField = 'TITULO'
    DataSource = MasterDataSource
    TabOrder = 10
  end
  inherited ActionList: TosActionList
    Left = 308
    Top = 4
    object TestarAction: TAction
      Caption = 'TestarAction'
      OnExecute = TestarActionExecute
    end
    object ApagarFiltroAction: TAction
      Category = 'Edit'
      Caption = 'Apagar Filtro'
      ShortCut = 16452
      OnExecute = ApagarFiltroActionExecute
    end
  end
  inherited MasterDataSource: TDataSource
    DataSet = cdsEdit
    Left = 28
    Top = 428
  end
  inherited ImageList: TImageList
    Left = 276
  end
  inherited MainMenu: TMainMenu
    Left = 240
    Top = 4
  end
  object cdsEdit: TosClientDataset
    Aggregates = <>
    FetchOnDemand = False
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
        Value = '-1'
      end>
    OnNewRecord = cdsEditNewRecord
    DataProvider = FilterDefData.MasterProvider
    BizDatamoduleName = 'BizFilterDef'
    Left = 60
    Top = 428
    object cdsEditIDXFILTERDEF: TIntegerField
      FieldName = 'IDXFILTERDEF'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsEditName: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'Name'
      Origin = 'DB.XPFilterDef.Name'
      FixedChar = True
      Size = 50
    end
    object cdsEditFilterDefDetailDataset: TDataSetField
      FieldName = 'FilterDefDetailDataset'
    end
    object cdsEditFILTERTYPE: TWideStringField
      DisplayLabel = 'Tipo'
      FieldName = 'FILTERTYPE'
      FixedChar = True
      Size = 3
    end
    object cdsEditTITULO: TWideStringField
      FieldName = 'TITULO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
  end
  object cdsEditDetail: TosClientDataset
    Aggregates = <>
    DataSetField = cdsEditFilterDefDetailDataset
    FetchOnDemand = False
    Params = <>
    Left = 148
    Top = 432
    object cdsEditDetailIDXFILTERDEFDETAIL: TIntegerField
      FieldName = 'IDXFILTERDEFDETAIL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsEditDetailIDXFILTERDEF: TIntegerField
      FieldName = 'IDXFILTERDEF'
    end
    object cdsEditDetailNumber: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'Number'
    end
    object cdsEditDetailDescription: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Description'
      FixedChar = True
      Size = 200
    end
    object cdsEditDetailQueryText: TMemoField
      DisplayLabel = 'Query'
      FieldName = 'QueryText'
      BlobType = ftMemo
      Size = 1
    end
    object cdsEditDetailExpressionList: TMemoField
      DisplayLabel = 'Express'#245'es Default'
      FieldName = 'ExpressionList'
      BlobType = ftMemo
      Size = 1
    end
    object cdsEditDetailConstraintList: TMemoField
      DisplayLabel = 'Restri'#231#245'es do Usu'#225'rio'
      FieldName = 'ConstraintList'
      BlobType = ftMemo
      Size = 1
    end
    object cdsEditDetailOrderList: TMemoField
      DisplayLabel = 'Ordena'#231#227'o'
      FieldName = 'OrderList'
      BlobType = ftMemo
      Size = 1
    end
    object cdsEditDetailORDERCOLUMN: TWideStringField
      FieldName = 'ORDERCOLUMN'
      Size = 50
    end
    object cdsEditDetailORDERTYPE: TWideStringField
      FieldName = 'ORDERTYPE'
      FixedChar = True
      Size = 1
    end
    object cdsEditDetailAttributeList: TWideMemoField
      FieldName = 'AttributeList'
      BlobType = ftWideMemo
    end
  end
  object dsEditDetail: TDataSource
    DataSet = cdsEditDetail
    Left = 108
    Top = 420
  end
  object PopupMenu: TPopupMenu
    Left = 352
    Top = 8
    object Delete1: TMenuItem
      Action = ApagarFiltroAction
    end
  end
  object cdsTeste: TosClientDataset
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    Left = 304
    Top = 432
    object cdsTesteTeste: TWideStringField
      FieldName = 'Teste'
      Size = 100
    end
    object cdsTesteResult: TWideStringField
      DisplayLabel = 'Resultado'
      FieldName = 'Result'
      Size = 100
    end
  end
  object dsTeste: TDataSource
    DataSet = cdsTeste
    Left = 336
    Top = 416
  end
  object report: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OnPreviewFormCreate = ReportPreviewFormCreate
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 256
    Top = 460
    Version = '15.0'
    mmColumnWidth = 0
    object ppParameterList1: TppParameterList
    end
  end
end
