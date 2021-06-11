inherited PesquisaLogForm: TPesquisaLogForm
  Left = 257
  Top = 151
  Width = 575
  Height = 527
  Caption = 'Pesquisa no Log'
  Menu = MainMenu1
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFltro: TCollapsePanel [0]
    Left = 0
    Top = 0
    Width = 559
    Height = 15
    Align = alTop
    TabOrder = 0
    collapsed = False
    collapsedTitle = 'Op'#231#245'es de Filtragem'
    expandedTitle = 'Op'#231#245'es de Filtragem'
    expandedHeight = 241
    object Button4: TButton
      Left = 464
      Top = 208
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 0
      OnClick = Button4Click
    end
    object chkUsuario: TCheckBox
      Left = 16
      Top = 104
      Width = 65
      Height = 17
      Caption = 'Usu'#225'rio:'
      TabOrder = 1
      OnClick = chkUsuarioClick
    end
    object cboUsuario: TosComboSearch
      Left = 200
      Top = 104
      Width = 193
      Height = 21
      ShowButton = True
      Style = csDropDown
      Enabled = False
      TabOrder = 2
      WordWrap = False
      UnboundDataType = wwDefault
      AllowClearKey = False
    end
    object chkClasse: TCheckBox
      Left = 16
      Top = 128
      Width = 113
      Height = 17
      Caption = 'Classe do Evento:'
      TabOrder = 3
      OnClick = chkClasseClick
    end
    object cboClasses: TwwDBComboBox
      Left = 200
      Top = 128
      Width = 193
      Height = 21
      ShowButton = True
      Style = csDropDown
      MapList = True
      AllowClearKey = False
      DropDownCount = 8
      Enabled = False
      HistoryList.FileName = 'LabMaster.ini.ini'
      ItemHeight = 0
      Items.Strings = (
        'um'#9'1'
        'dois'#9'2')
      Sorted = False
      TabOrder = 4
      UnboundDataType = wwDefault
      OnChange = cboClassesChange
    end
    object chkEvento: TCheckBox
      Left = 16
      Top = 152
      Width = 129
      Height = 17
      Caption = 'Tipo do Evento:'
      TabOrder = 5
      OnClick = chkEventoClick
    end
    object cboTipos: TwwDBComboBox
      Left = 200
      Top = 152
      Width = 193
      Height = 21
      ShowButton = True
      Style = csDropDown
      MapList = True
      AllowClearKey = False
      DropDownCount = 8
      Enabled = False
      HistoryList.FileName = 'LabMaster.ini.ini'
      ItemHeight = 0
      Items.Strings = (
        'um'#9'1'
        'dois'#9'2')
      Sorted = False
      TabOrder = 6
      UnboundDataType = wwDefault
    end
    object chkTexto: TCheckBox
      Left = 16
      Top = 176
      Width = 177
      Height = 17
      Caption = 'Texto da mensagem contendo:'
      TabOrder = 7
      OnClick = chkTextoClick
    end
    object edtTextoBusca: TEdit
      Left = 200
      Top = 176
      Width = 193
      Height = 21
      Enabled = False
      TabOrder = 8
    end
    object chkPeriodo: TCheckBox
      Left = 16
      Top = 40
      Width = 97
      Height = 17
      Caption = 'Per'#237'odo:'
      TabOrder = 9
      OnClick = chkPeriodoClick
    end
    inline FramePeriodo: TFramePeriodo
      Left = 200
      Top = 32
      Width = 250
      Height = 55
      TabOrder = 10
    end
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 15
    Width = 559
    Height = 456
    Align = alClient
    TabOrder = 1
    object wwDBGrid1: TwwDBGrid
      Left = 1
      Top = 1
      Width = 557
      Height = 454
      DisableThemes = False
      Selected.Strings = (
        'DATAHORA'#9'22'#9'Data e Hora'#9'F'#9
        'Usuario'#9'20'#9'Usuario'#9'F'#9
        'Evento'#9'20'#9'Evento'#9#9)
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsLogs
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
      OnDblClick = wwDBGrid1DblClick
    end
  end
  inherited ActionList: TosActionList
    Left = 504
    Top = 56
  end
  inherited ImageList: TImageList
    Left = 504
    Top = 24
  end
  object MainMenu1: TMainMenu
    Left = 472
    Top = 24
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object EnviarresultadosporMail1: TMenuItem
        Caption = 'Enviar resultados por Mail'
      end
      object LimparLog1: TMenuItem
        Caption = 'Limpar Log'
      end
      object ImprimirResultados1: TMenuItem
        Caption = 'Imprimir Resultados'
      end
    end
  end
  object cdsLogs: TosClientDataset
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    OnCalcFields = cdsLogsCalcFields
    DataProvider = logger.MasterProvider
    Left = 376
    Top = 200
    object cdsLogsDATAHORA: TSQLTimeStampField
      DisplayLabel = 'Data e Hora'
      DisplayWidth = 22
      FieldName = 'DATAHORA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsLogsUsuario: TWideStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Usuario'
      Calculated = True
    end
    object cdsLogsEvento: TWideStringField
      DisplayWidth = 200
      FieldKind = fkCalculated
      FieldName = 'Evento'
      Size = 200
      Calculated = True
    end
    object cdsLogsIDUSUARIO: TIntegerField
      DisplayWidth = 10
      FieldName = 'IDUSUARIO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsLogsIDLOG: TIntegerField
      DisplayWidth = 10
      FieldName = 'IDLOG'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsLogsIDREGISTRO: TIntegerField
      DisplayWidth = 11
      FieldName = 'IDREGISTRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsLogsCLASSE: TIntegerField
      DisplayWidth = 10
      FieldName = 'CLASSE'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsLogsTIPO: TIntegerField
      DisplayWidth = 10
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsLogsDESCRICAO: TBlobField
      DisplayWidth = 10
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 1
    end
  end
  object dsLogs: TDataSource
    DataSet = cdsLogs
    Left = 408
    Top = 200
  end
end
