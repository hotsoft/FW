inherited RecursoEditForm: TRecursoEditForm
  Left = 448
  Top = 172
  ActiveControl = DescricaoDominioCombo
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  BorderWidth = 4
  Caption = 'Cadastro de Recursos'
  ClientHeight = 443
  ClientWidth = 478
  ExplicitWidth = 492
  ExplicitHeight = 480
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 62
    Width = 24
    Height = 13
    Caption = 'Ti&po:'
    FocusControl = DescricaoTipoRecursoCombo
  end
  object Label2: TLabel [1]
    Left = 8
    Top = 142
    Width = 51
    Height = 13
    Caption = 'Des&cri'#231#227'o:'
    FocusControl = DescricaoEdit
  end
  object Label3: TLabel [2]
    Left = 8
    Top = 38
    Width = 43
    Height = 13
    Caption = '&Dom'#237'nio:'
  end
  object Label4: TLabel [3]
    Left = 8
    Top = 86
    Width = 31
    Height = 13
    Caption = '&Nome:'
    FocusControl = NomeEdit
  end
  object Label9: TLabel [4]
    Left = 372
    Top = 88
    Width = 34
    Height = 13
    Caption = '&Ordem:'
    FocusControl = NumOrdemSpinEdit
  end
  object Label10: TLabel [5]
    Left = 372
    Top = 62
    Width = 40
    Height = 13
    Caption = '&Imagem:'
    FocusControl = ImagemEdit
  end
  inherited MainControlBar: TControlBar
    Width = 478
    ExplicitWidth = 478
  end
  object NomeEdit: TDBEdit [7]
    Left = 60
    Top = 84
    Width = 297
    Height = 21
    DataField = 'NOME'
    DataSource = MasterDataSource
    TabOrder = 4
  end
  object DescricaoEdit: TDBMemo [8]
    Left = 8
    Top = 160
    Width = 461
    Height = 45
    DataField = 'DESCRICAO'
    DataSource = MasterDataSource
    MaxLength = 255
    TabOrder = 6
  end
  object DescricaoDominioCombo: TosComboSearch [9]
    Left = 60
    Top = 36
    Width = 297
    Height = 21
    ShowButton = True
    Style = csDropDown
    DataField = 'DescricaoDominio'
    DataSource = MasterDataSource
    TabOrder = 1
    WordWrap = False
    UnboundDataType = wwDefault
    FilterDataProvider = MainData.prvFilter
    FilterDefName = 'DominioLookup'
    ReturnField = 'IDDominio'
    AllowClearKey = False
  end
  object DescricaoTipoRecursoCombo: TosComboSearch [10]
    Left = 60
    Top = 60
    Width = 297
    Height = 21
    ShowButton = True
    Style = csDropDown
    DataField = 'DescricaoTipoRecurso'
    DataSource = MasterDataSource
    TabOrder = 2
    WordWrap = False
    UnboundDataType = wwDefault
    FilterDataProvider = MainData.prvFilter
    FilterDefName = 'TipoRecursoLookup'
    ReturnField = 'IDTipoRecurso'
    AllowClearKey = False
  end
  object PageControl: TPageControl [11]
    Left = 8
    Top = 212
    Width = 461
    Height = 209
    ActivePage = ClassesTabSheet
    TabOrder = 7
    object ClassesTabSheet: TTabSheet
      Caption = '&1 Classes'
      object Label5: TLabel
        Left = 4
        Top = 8
        Width = 129
        Height = 13
        Caption = 'No&me da defini'#231#227'o de Filtro'
        FocusControl = FilterDefNameEdit
      end
      object Label6: TLabel
        Left = 4
        Top = 48
        Width = 125
        Height = 13
        Caption = 'Nome da c&lasse de Dados'
        FocusControl = DataClassNameEdit
      end
      object Label7: TLabel
        Left = 4
        Top = 88
        Width = 134
        Height = 13
        Caption = 'Nome da classe do &Recurso'
        FocusControl = ResClassNameDBEdit
      end
      object Label8: TLabel
        Left = 4
        Top = 128
        Width = 136
        Height = 13
        Caption = 'Nome da classe do Rela&t'#243'rio'
        FocusControl = ReportClassNameEdit
      end
      object FilterDefNameEdit: TDBEdit
        Left = 4
        Top = 22
        Width = 205
        Height = 21
        DataField = 'FILTERDEFNAME'
        DataSource = MasterDataSource
        TabOrder = 0
      end
      object DataClassNameEdit: TDBEdit
        Left = 4
        Top = 62
        Width = 440
        Height = 21
        DataField = 'DATACLASSNAME'
        DataSource = MasterDataSource
        TabOrder = 1
      end
      object ResClassNameDBEdit: TDBEdit
        Left = 4
        Top = 102
        Width = 440
        Height = 21
        DataField = 'RESCLASSNAME'
        DataSource = MasterDataSource
        TabOrder = 2
      end
      object ReportClassNameEdit: TDBEdit
        Left = 4
        Top = 142
        Width = 440
        Height = 21
        DataField = 'REPORTCLASSNAME'
        DataSource = MasterDataSource
        TabOrder = 3
      end
      object DBCheckBox1: TDBCheckBox
        Left = 216
        Top = 24
        Width = 225
        Height = 17
        Caption = 'For'#231'ar execu'#231#227'o ap'#243's registro modificado'
        DataField = 'FORCAREEXECUCAOFILTRO'
        DataSource = MasterDataSource
        TabOrder = 4
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    object AcoesTabSheet: TTabSheet
      Caption = '&2 A'#231#245'es'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object AcaoGrid: TwwDBGrid
        Left = 0
        Top = 0
        Width = 453
        Height = 181
        Selected.Strings = (
          'NOME'#9'15'#9'Nome'#9'F'
          'NOMECOMPONENTE'#9'20'#9'Componente'#9'F'
          'DESCRICAO'#9'35'#9'Descri'#231#227'o'#9'F'
          'INDICEIMAGEM'#9'6'#9'Imagem'#9#9)
        IniAttributes.Delimiter = ';;'
        IniAttributes.UnicodeIniFile = False
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = AcaoDataSource
        PopupMenu = PopupMenu
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
      end
    end
  end
  object NumOrdemSpinEdit: TwwDBSpinEdit [12]
    Left = 416
    Top = 84
    Width = 53
    Height = 21
    Increment = 1.000000000000000000
    MaxValue = 1000.000000000000000000
    MinValue = 1.000000000000000000
    DataField = 'NUMORDEM'
    DataSource = MasterDataSource
    TabOrder = 5
    UnboundDataType = wwDefault
  end
  object ImagemEdit: TDBEdit [13]
    Left = 416
    Top = 60
    Width = 53
    Height = 21
    DataField = 'INDICEIMAGEM'
    DataSource = MasterDataSource
    TabOrder = 3
  end
  object DBCheckBox2: TDBCheckBox [14]
    Left = 59
    Top = 114
    Width = 190
    Height = 17
    Caption = 'Habilita '#39'Editar Todos'#39
    DataField = 'HABILITAEDITARTODOS'
    DataSource = MasterDataSource
    TabOrder = 8
    ValueChecked = 'S'
    ValueUnchecked = 'N'
  end
  inherited ActionList: TosActionList
    Left = 272
    object TestarAction: TAction
      Caption = 'TestarAction'
    end
  end
  inherited MasterDataSource: TDataSource
    DataSet = RecursoClientDataSource
    Left = 332
  end
  inherited ImageList: TImageList
    Left = 244
  end
  object RecursoClientDataSource: TosClientDataset
    Aggregates = <>
    FetchOnDemand = False
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
        Value = '-1'
      end>
    BeforePost = RecursoClientDataSourceBeforePost
    AfterApplyUpdates = RecursoClientDataSourceAfterApplyUpdates
    DataProvider = RecursoData.MasterProvider
    BizDatamoduleName = 'BizFilterDef'
    Left = 304
    object RecursoClientDataSourceIDRECURSO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'IDRECURSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object RecursoClientDataSourceIDTIPORECURSO: TIntegerField
      DisplayLabel = 'Tipo do recurso'
      FieldName = 'IDTIPORECURSO'
      ProviderFlags = [pfInUpdate]
    end
    object RecursoClientDataSourceDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 255
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object RecursoClientDataSourceIDDOMINIO: TIntegerField
      DisplayLabel = 'Dom'#237'nio'
      FieldName = 'IDDOMINIO'
      ProviderFlags = [pfInUpdate]
    end
    object RecursoClientDataSourceNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object RecursoClientDataSourceINDICEIMAGEM: TIntegerField
      FieldName = 'INDICEIMAGEM'
    end
    object RecursoClientDataSourceNUMORDEM: TIntegerField
      FieldName = 'NUMORDEM'
    end
    object RecursoClientDataSourceDescricaoDominio: TStringField
      DisplayLabel = 'Descri'#231#227'o do Dom'#237'nio'
      FieldKind = fkLookup
      FieldName = 'DescricaoDominio'
      LookupDataSet = AdministracaoLookupData.DominioClientDataset
      LookupKeyFields = 'IDDOMINIO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'IDDOMINIO'
      Size = 50
      Lookup = True
    end
    object RecursoClientDataSourceDescricaoTipoRecurso: TStringField
      DisplayLabel = 'Descri'#231#227'o do Tipo de Recurso'
      FieldKind = fkLookup
      FieldName = 'DescricaoTipoRecurso'
      LookupDataSet = AdministracaoLookupData.TipoRecursoClientDataSet
      LookupKeyFields = 'IDTIPORECURSO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'IDTIPORECURSO'
      Size = 50
      Lookup = True
    end
    object RecursoClientDataSourceFILTERDEFNAME: TStringField
      DisplayLabel = 'Nome da defini'#231#227'o de Filtro'
      FieldName = 'FILTERDEFNAME'
      Size = 50
    end
    object RecursoClientDataSourceDATACLASSNAME: TStringField
      DisplayLabel = 'Nome da classe de Dados'
      FieldName = 'DATACLASSNAME'
      Size = 50
    end
    object RecursoClientDataSourceRESCLASSNAME: TStringField
      DisplayLabel = 'Nome da classe do Recurso'
      FieldName = 'RESCLASSNAME'
      Size = 50
    end
    object RecursoClientDataSourceREPORTCLASSNAME: TStringField
      DisplayLabel = 'Nome da classe do Relat'#243'rio'
      FieldName = 'REPORTCLASSNAME'
      Size = 50
    end
    object RecursoClientDataSourceAcaoDataSet: TDataSetField
      FieldName = 'AcaoDataSet'
    end
    object RecursoClientDataSourceHABILITAEDITARTODOS: TStringField
      FieldName = 'HABILITAEDITARTODOS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object RecursoClientDataSourceFORCAREEXECUCAOFILTRO: TStringField
      FieldName = 'FORCAREEXECUCAOFILTRO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object AcaoClientDataSet: TosClientDataset
    Aggregates = <>
    DataSetField = RecursoClientDataSourceAcaoDataSet
    FetchOnDemand = False
    Params = <>
    BeforePost = AcaoClientDataSetBeforePost
    AfterApplyUpdates = AcaoClientDataSetAfterApplyUpdates
    Left = 364
    object AcaoClientDataSetNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 15
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object AcaoClientDataSetNOMECOMPONENTE: TStringField
      DisplayLabel = 'Componente'
      DisplayWidth = 20
      FieldName = 'NOMECOMPONENTE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object AcaoClientDataSetDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object AcaoClientDataSetINDICEIMAGEM: TIntegerField
      DisplayLabel = 'Imagem'
      DisplayWidth = 6
      FieldName = 'INDICEIMAGEM'
      ProviderFlags = [pfInUpdate]
    end
    object AcaoClientDataSetIDACAO: TIntegerField
      DisplayWidth = 10
      FieldName = 'IDACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object AcaoClientDataSetIDRECURSO: TIntegerField
      DisplayWidth = 10
      FieldName = 'IDRECURSO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
  end
  object AcaoDataSource: TDataSource
    DataSet = AcaoClientDataSet
    Left = 392
  end
  object PopupMenu: TPopupMenu
    Left = 424
    object Novo2: TMenuItem
      Caption = 'Novo'
    end
    object Excluir1: TMenuItem
      Caption = 'Excluir'
    end
  end
  object AntibioticoPopupMenu: TPopupMenu
    Left = 388
    Top = 188
    object EditarAcaoMenu: TMenuItem
      Action = AcaoEdit
    end
    object InserirAcaoMenu: TMenuItem
      Action = AcaoInsert
    end
    object SalvarAcaoMenu: TMenuItem
      Action = AcaoPost
    end
    object CancelarAcaoMenu: TMenuItem
      Action = AcaoCancel
    end
    object ExcluirAcaoMenu: TMenuItem
      Action = AcaoDelete
    end
  end
  object AcaoActionList: TosActionList
    Left = 420
    Top = 187
    object AcaoEdit: TDataSetEdit
      Category = 'Dataset'
      Caption = '&Editar'
      Hint = 'Edit'
      ImageIndex = 6
      DataSource = AcaoDataSource
    end
    object AcaoInsert: TDataSetInsert
      Category = 'Dataset'
      Caption = '&Inserir'
      Hint = 'Insert'
      ImageIndex = 4
      DataSource = AcaoDataSource
    end
    object AcaoPost: TDataSetPost
      Category = 'Dataset'
      Caption = '&Salvar'
      Hint = 'Post'
      ImageIndex = 7
      ShortCut = 16467
      DataSource = AcaoDataSource
    end
    object AcaoCancel: TDataSetCancel
      Category = 'Dataset'
      Caption = '&Cancelar'
      Hint = 'Cancel'
      ImageIndex = 8
      ShortCut = 16472
      DataSource = AcaoDataSource
    end
    object AcaoDelete: TDataSetDelete
      Category = 'Dataset'
      Caption = 'E&xcluir'
      Hint = 'Delete'
      ImageIndex = 5
      ShortCut = 16452
      DataSource = AcaoDataSource
    end
  end
end
