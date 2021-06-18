inherited RelatorioEditForm: TRelatorioEditForm
  Left = 437
  Top = 191
  VertScrollBar.Range = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  BorderWidth = 4
  Caption = 'Cadastro de Relat'#243'rios'
  ClientHeight = 246
  ClientWidth = 422
  PixelsPerInch = 96
  TextHeight = 13
  inherited MainControlBar: TControlBar
    Width = 422
    inherited ControlBarPanel: TPanel
      Width = 385
      inherited ImprimirButton: TSpeedButton
        Left = 195
      end
      inherited ExcluirButton: TSpeedButton
        Left = 261
      end
      inherited FecharButton: TSpeedButton
        Left = 326
      end
    end
  end
  object PageControl: TPageControl [1]
    Left = 0
    Top = 30
    Width = 422
    Height = 216
    ActivePage = PrincipalTabSheet
    Align = alClient
    TabOrder = 1
    object PrincipalTabSheet: TTabSheet
      Caption = 'Principal'
      object Label3: TLabel
        Left = 8
        Top = 20
        Width = 24
        Height = 13
        Caption = '&Tipo:'
        FocusControl = TipoRelatorioCombo
      end
      object Label1: TLabel
        Left = 8
        Top = 70
        Width = 31
        Height = 13
        Caption = '&Nome:'
        FocusControl = TituloEdit
      end
      object Label4: TLabel
        Left = 8
        Top = 104
        Width = 51
        Height = 13
        Caption = '&Descri'#231#227'o:'
        FocusControl = DescricaoMemo
      end
      object Label7: TLabel
        Left = 8
        Top = 44
        Width = 34
        Height = 13
        Caption = 'Classe:'
      end
      object TipoRelatorioCombo: TDBLookupComboBox
        Left = 80
        Top = 18
        Width = 330
        Height = 21
        DataField = 'IDTIPORELATORIO'
        DataSource = MasterDataSource
        KeyField = 'IDTIPORELATORIO'
        ListField = 'NOME'
        ListSource = TipoRelatorioLookupDataSource
        TabOrder = 0
      end
      object TituloEdit: TDBEdit
        Left = 80
        Top = 68
        Width = 330
        Height = 21
        DataField = 'TITULO'
        DataSource = MasterDataSource
        TabOrder = 1
      end
      object DescricaoMemo: TDBMemo
        Left = 80
        Top = 96
        Width = 330
        Height = 87
        DataField = 'DESCRICAO'
        DataSource = MasterDataSource
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object ClasseCombo: TwwDBComboBox
        Left = 80
        Top = 42
        Width = 329
        Height = 21
        ShowButton = True
        Style = csDropDown
        MapList = True
        AllowClearKey = False
        DataField = 'CLASSERELATORIO'
        DataSource = MasterDataSource
        DropDownCount = 8
        HistoryList.FileName = 'LabMaster.ini.ini'
        ItemHeight = 0
        Items.Strings = (
          'Presta'#231#227'o de Contas'#9'TPrestacaoContas')
        Sorted = False
        TabOrder = 3
        UnboundDataType = wwDefault
      end
    end
    object ConfiguracoesTabSheet: TTabSheet
      Caption = 'Configura'#231#245'es'
      ImageIndex = 1
      object Label5: TLabel
        Left = 8
        Top = 49
        Width = 25
        Height = 13
        Caption = '&Filtro:'
      end
      object Label2: TLabel
        Left = 8
        Top = 22
        Width = 47
        Height = 13
        Caption = '&Template:'
      end
      object NomeRelatorioCombo: TosComboSearch
        Left = 80
        Top = 18
        Width = 330
        Height = 21
        ShowButton = True
        Style = csDropDown
        DataField = 'Template'
        DataSource = MasterDataSource
        TabOrder = 0
        WordWrap = False
        UnboundDataType = wwDefault
        FilterDataProvider = MainData.prvFilter
        FilterDefName = 'Relatorio_RB'
        ReturnField = 'ITEM_ID'
        AllowClearKey = False
      end
      object osComboSearch1: TosComboSearch
        Left = 80
        Top = 44
        Width = 329
        Height = 21
        ShowButton = True
        Style = csDropDown
        DataField = 'NomeFiltro'
        DataSource = MasterDataSource
        TabOrder = 1
        WordWrap = False
        UnboundDataType = wwDefault
        FilterDataProvider = MainData.prvFilter
        FilterDefName = 'FilterDef'
        ReturnField = 'IDXFilterDef'
        ReturnLookupField = 'ID'
        AllowClearKey = False
      end
      object ComboFilter: TosComboFilter
        Left = 80
        Top = 72
        Width = 121
        Height = 21
        ShowButton = True
        Style = csDropDown
        MapList = False
        AllowClearKey = False
        DropDownCount = 8
        HistoryList.FileName = 'LabMaster.ini.ini'
        ItemHeight = 0
        Sorted = False
        TabOrder = 2
        UnboundDataType = wwDefault
        Visible = False
        ClientDS = FilterDataset
        Params = <>
        ViewDefault = 0
      end
    end
    object VersaoTabSheet: TTabSheet
      Caption = 'Controle de Vers'#227'o'
      ImageIndex = 2
      object GroupBox1: TGroupBox
        Left = 5
        Top = 4
        Width = 405
        Height = 81
        Caption = ' Compatibilidade '
        TabOrder = 0
        object Label6: TLabel
          Left = 12
          Top = 24
          Width = 54
          Height = 13
          Caption = '&Impressora:'
        end
        object Label8: TLabel
          Left = 12
          Top = 50
          Width = 52
          Height = 13
          Caption = 'Da &vers'#227'o:'
          FocusControl = CompativelAPartirDaVersaoEdit
        end
        object Label9: TLabel
          Left = 232
          Top = 52
          Width = 62
          Height = 13
          Caption = 'at'#233' a vers'#227'o:'
          FocusControl = CompativelAteVersaoEdit
        end
        object ImpressoraCombo: TwwDBComboBox
          Left = 72
          Top = 20
          Width = 321
          Height = 21
          ShowButton = True
          Style = csDropDown
          MapList = False
          AllowClearKey = False
          AutoDropDown = True
          ShowMatchText = True
          DataField = 'CLASSEIMPRESSORA'
          DataSource = MasterDataSource
          DropDownCount = 8
          HistoryList.FileName = 'LabMaster.ini.ini'
          ItemHeight = 0
          Items.Strings = (
            'Laser'
            'Jato de Tinta'
            'Matricial'
            'Termica'
            'Cupom')
          Sorted = False
          TabOrder = 0
          UnboundDataType = wwDefault
        end
        object CompativelAPartirDaVersaoEdit: TDBEdit
          Left = 72
          Top = 48
          Width = 102
          Height = 21
          Color = clBtnHighlight
          DataField = 'COMPATIVELAPARTIRDAVERSAO'
          DataSource = MasterDataSource
          TabOrder = 1
        end
        object CompativelAteVersaoEdit: TDBEdit
          Left = 300
          Top = 48
          Width = 93
          Height = 21
          Color = clBtnHighlight
          DataField = 'COMPATIVELATEVERSAO'
          DataSource = MasterDataSource
          TabOrder = 2
        end
      end
      object GroupBox2: TGroupBox
        Left = 4
        Top = 92
        Width = 406
        Height = 89
        Caption = ' Importa'#231#227'o '
        TabOrder = 1
        object Label11: TLabel
          Left = 12
          Top = 24
          Width = 26
          Height = 13
          Caption = '&Data:'
        end
        object Label12: TLabel
          Left = 252
          Top = 24
          Width = 39
          Height = 13
          Caption = '&Usu'#225'rio:'
          FocusControl = UsuarioAlteracaoEdit
        end
        object Label13: TLabel
          Left = 12
          Top = 52
          Width = 39
          Height = 13
          Caption = '&Arquivo:'
          FocusControl = ArquivoOrigemEdit
        end
        object DataAlteracaoTimePicker: TwwDBDateTimePicker
          Left = 72
          Top = 20
          Width = 102
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Color = clBtnFace
          DataField = 'DATAIMPORTACAO'
          DataSource = MasterDataSource
          Epoch = 1950
          ReadOnly = True
          ShowButton = True
          TabOrder = 0
        end
        object UsuarioAlteracaoEdit: TDBEdit
          Left = 300
          Top = 20
          Width = 93
          Height = 21
          Color = clBtnFace
          DataField = 'NomeUsuario'
          DataSource = MasterDataSource
          ReadOnly = True
          TabOrder = 1
        end
        object ArquivoOrigemEdit: TDBEdit
          Left = 72
          Top = 48
          Width = 321
          Height = 21
          Color = clBtnFace
          DataField = 'ARQUIVOORIGEM'
          DataSource = MasterDataSource
          ReadOnly = True
          TabOrder = 2
        end
      end
    end
  end
  inherited ActionList: TosActionList
    Left = 316
    Top = 76
    inherited ImprimirAction: TAction
      OnExecute = ImprimirActionExecute
    end
  end
  inherited MasterDataSource: TDataSource
    DataSet = RelatorioClientDataSet
    Left = 264
    Top = 36
  end
  inherited ImageList: TImageList
    Left = 224
  end
  inherited MainMenu: TMainMenu
    Left = 268
    Top = 68
  end
  object RelatorioClientDataSet: TosClientDataset
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDRELATORIO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'TITULO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DESCRICAO'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'COMPATIVELAPARTIRDAVERSAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'COMPATIVELATEVERSAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DATAIMPORTACAO'
        DataType = ftTimeStamp
      end
      item
        Name = 'ARQUIVOORIGEM'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'IDUSUARIOIMPORTACAO'
        DataType = ftInteger
      end
      item
        Name = 'ITEM_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'IDXFILTERDEF'
        DataType = ftInteger
      end
      item
        Name = 'CLASSEIMPRESSORA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDTIPORELATORIO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CLASSERELATORIO'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <>
    FetchOnDemand = False
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
        Value = '-1'
      end>
    StoreDefs = True
    BeforePost = RelatorioClientDataSetBeforePost
    OnNewRecord = RelatorioClientDataSetNewRecord
    BizDatamoduleName = 'BizFilterDef'
    Left = 292
    Top = 36
    object RelatorioClientDataSetTemplate: TWideStringField
      DisplayLabel = 'Template do Relat'#243'rio'
      FieldKind = fkLookup
      FieldName = 'Template'
      LookupDataSet = RelatorioLookupData.TemplateClientDataset
      LookupKeyFields = 'ITEM_ID'
      LookupResultField = 'NOME'
      KeyFields = 'ITEM_ID'
      Size = 50
      Lookup = True
    end
    object RelatorioClientDataSetNomeUsuario: TWideStringField
      DisplayLabel = 'Nome do Usu'#225'rio'
      FieldKind = fkInternalCalc
      FieldName = 'NomeUsuario'
      Size = 50
    end
    object RelatorioClientDataSetIDRELATORIO: TIntegerField
      FieldName = 'IDRELATORIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object RelatorioClientDataSetTITULO: TWideStringField
      FieldName = 'TITULO'
      Size = 50
    end
    object RelatorioClientDataSetDESCRICAO: TWideMemoField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object RelatorioClientDataSetCLASSEIMPRESSORA: TWideStringField
      FieldName = 'CLASSEIMPRESSORA'
      FixedChar = True
      Size = 30
    end
    object RelatorioClientDataSetCOMPATIVELAPARTIRDAVERSAO: TWideStringField
      DisplayLabel = 'Vers'#227'o Inicial'
      FieldName = 'COMPATIVELAPARTIRDAVERSAO'
      FixedChar = True
      Size = 10
    end
    object RelatorioClientDataSetCOMPATIVELATEVERSAO: TWideStringField
      DisplayLabel = 'Vers'#227'o Final'
      FieldName = 'COMPATIVELATEVERSAO'
      FixedChar = True
      Size = 10
    end
    object RelatorioClientDataSetDATAIMPORTACAO: TSQLTimeStampField
      FieldName = 'DATAIMPORTACAO'
    end
    object RelatorioClientDataSetARQUIVOORIGEM: TWideStringField
      FieldName = 'ARQUIVOORIGEM'
      Size = 40
    end
    object RelatorioClientDataSetIDUSUARIOIMPORTACAO: TIntegerField
      FieldName = 'IDUSUARIOIMPORTACAO'
    end
    object RelatorioClientDataSetITEM_ID: TIntegerField
      FieldName = 'ITEM_ID'
      Required = True
    end
    object RelatorioClientDataSetIDXFILTERDEF: TIntegerField
      FieldName = 'IDXFILTERDEF'
    end
    object RelatorioClientDataSetNomeFiltro: TWideStringField
      FieldKind = fkLookup
      FieldName = 'NomeFiltro'
      LookupDataSet = RelatorioLookupData.FilterDefClientDataSet
      LookupKeyFields = 'IDXFILTERDEF'
      LookupResultField = 'NAME'
      KeyFields = 'IDXFILTERDEF'
      Size = 50
      Lookup = True
    end
    object RelatorioClientDataSetIDTIPORELATORIO: TIntegerField
      FieldName = 'IDTIPORELATORIO'
      Required = True
    end
    object RelatorioClientDataSetCLASSERELATORIO: TWideStringField
      FieldName = 'CLASSERELATORIO'
      Size = 30
    end
    object RelatorioClientDataSetNomeTipoRelatorio: TWideStringField
      FieldKind = fkLookup
      FieldName = 'NomeTipoRelatorio'
      LookupDataSet = RelatorioLookupData.TipoRelatorioClientDataSet
      LookupKeyFields = 'IDTIPORELATORIO'
      LookupResultField = 'NOME'
      KeyFields = 'IDTIPORELATORIO'
      Size = 40
      Lookup = True
    end
  end
  object TipoRelatorioLookupDataSource: TDataSource
    DataSet = RelatorioLookupData.TipoRelatorioClientDataSet
    Left = 320
    Top = 36
  end
  object Report: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OnPreviewFormCreate = ReportPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 356
    Top = 68
    Version = '10.09'
    mmColumnWidth = 0
  end
  object FilterDataset: TosClientDataset
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ReadOnly = True
    DataProvider = MainData.prvFilter
    Left = 88
    Top = 152
  end
  object FilterDatasource: TDataSource
    DataSet = FilterDataset
    Left = 116
    Top = 152
  end
end
