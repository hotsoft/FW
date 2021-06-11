inherited GrupoEditForm: TGrupoEditForm
  Left = 444
  Top = 163
  VertScrollBar.Range = 0
  ActiveControl = NomeEdit
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  BorderWidth = 4
  Caption = 'Cadastro de Grupos'
  ClientHeight = 358
  ClientWidth = 441
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 67
    Width = 51
    Height = 13
    Caption = '&Descri'#231#227'o:'
    FocusControl = DescricaoEdit
  end
  object Label2: TLabel [1]
    Left = 8
    Top = 41
    Width = 31
    Height = 13
    Caption = '&Nome:'
    FocusControl = NomeEdit
  end
  inherited MainControlBar: TControlBar
    Width = 441
  end
  object DescricaoEdit: TDBEdit [3]
    Left = 68
    Top = 65
    Width = 292
    Height = 21
    DataField = 'DESCRICAO'
    DataSource = MasterDataSource
    TabOrder = 2
  end
  object NomeEdit: TDBEdit [4]
    Left = 68
    Top = 37
    Width = 292
    Height = 21
    DataField = 'NOME'
    DataSource = MasterDataSource
    TabOrder = 1
  end
  object PageControl: TPageControl [5]
    Left = 0
    Top = 96
    Width = 441
    Height = 262
    ActivePage = ParticipantesTabSheet
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    object ParticipantesTabSheet: TTabSheet
      Caption = '&Participantes'
      object ParticipantesDualTree: TosDBDualTree
        Left = 0
        Top = 0
        Width = 433
        Height = 234
        AssociationDataSet = GrupoUsuarioClientDataSet
        AssociationFieldName = 'IDUSUARIO'
        SourceDataSet = UsuarioClientDataSet
        SourceFieldName = 'IDUSUARIO'
        SourceDescFieldNames.Strings = (
          'NOME')
        AssociationCaption = 'Usu'#225'rios designados'
        SourceCaption = 'Usu'#225'rios dispon'#237'veis'
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          433
          234)
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Direitos de &uso'
      ImageIndex = 1
      object Splitter1: TSplitter
        Left = 0
        Top = 117
        Width = 433
        Height = 7
        Cursor = crVSplit
        Align = alBottom
        AutoSnap = False
        MinSize = 57
      end
      object clbAcao: TCheckListBox
        Left = 0
        Top = 124
        Width = 433
        Height = 110
        OnClickCheck = clbAcaoClickCheck
        Align = alBottom
        ItemHeight = 13
        TabOrder = 0
      end
      object DireitoUsoDualTree: TosDBDualTree
        Left = 0
        Top = 0
        Width = 433
        Height = 117
        AssociationDataSet = DireitoUsoClientDataSet
        AssociationFieldName = 'IDRECURSO'
        SourceDataSet = RecursoClientDataSet
        SourceFieldName = 'IDRECURSO'
        SourceDescFieldNames.Strings = (
          'NOMEDOMINIO'
          'NOMERECURSO')
        OnNodeSelect = DireitoUsoDualTreeNodeSelect
        AssociationCaption = 'Recursos designados'
        SourceCaption = 'Recursos dispon'#237'veis'
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          433
          117)
      end
    end
  end
  inherited ActionList: TosActionList
    Left = 200
    Top = 4
    object TestarAction: TAction
      Caption = 'TestarAction'
    end
  end
  inherited MasterDataSource: TDataSource
    DataSet = GrupoDataSet
    Left = 76
    Top = 32
  end
  inherited ImageList: TImageList
    Left = 168
  end
  inherited MainMenu: TMainMenu
    Left = 132
    Top = 4
  end
  object GrupoDataSet: TosClientDataset
    Aggregates = <>
    FetchOnDemand = False
    Params = <
      item
        DataType = ftInteger
        Precision = 10
        Name = 'ID'
        ParamType = ptInput
        Size = 4
      end>
    BeforePost = GrupoDataSetBeforePost
    AfterApplyUpdates = GrupoDataSetAfterApplyUpdates
    DataProvider = GrupoData.MasterProvider
    Left = 48
    Top = 32
    object GrupoDataSetIDGRUPO: TIntegerField
      FieldName = 'IDGRUPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object GrupoDataSetNOME: TWideStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object GrupoDataSetDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object GrupoDataSetGrupoUsuarioDataSet: TDataSetField
      FieldName = 'GrupoUsuarioDataSet'
      ProviderFlags = [pfInUpdate]
    end
    object GrupoDataSetDireitoUsoDataSet: TDataSetField
      FieldName = 'DireitoUsoDataSet'
      ProviderFlags = [pfInUpdate]
    end
  end
  object GrupoUsuarioClientDataSet: TosClientDataset
    Aggregates = <>
    DataSetField = GrupoDataSetGrupoUsuarioDataSet
    FetchOnDemand = False
    Params = <
      item
        DataType = ftInteger
        Precision = 10
        Name = 'IDGRUPO'
        ParamType = ptInput
        Size = 4
      end>
    Left = 76
    Top = 60
    object GrupoUsuarioClientDataSetIDGRUPOUSUARIO: TIntegerField
      FieldName = 'IDGRUPOUSUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object GrupoUsuarioClientDataSetIDGRUPO: TIntegerField
      FieldName = 'IDGRUPO'
      ProviderFlags = [pfInUpdate]
    end
    object GrupoUsuarioClientDataSetIDUSUARIO: TIntegerField
      FieldName = 'IDUSUARIO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object UsuarioClientDataSet: TosClientDataset
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    DataProvider = GrupoData.UsuarioProvider
    Left = 160
    Top = 60
    object UsuarioClientDataSetIDUSUARIO: TIntegerField
      FieldName = 'IDUSUARIO'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object UsuarioClientDataSetNOME: TWideStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 50
    end
  end
  object DireitoUsoClientDataSet: TosClientDataset
    Aggregates = <>
    DataSetField = GrupoDataSetDireitoUsoDataSet
    FetchOnDemand = False
    Params = <
      item
        DataType = ftInteger
        Precision = 10
        Name = '\'
        ParamType = ptInput
        Size = 4
      end>
    OnNewRecord = DireitoUsoClientDataSetNewRecord
    Left = 76
    Top = 88
    object DireitoUsoClientDataSetIDGRUPO: TIntegerField
      FieldName = 'IDGRUPO'
      ProviderFlags = [pfInWhere]
    end
    object DireitoUsoClientDataSetIDRECURSO: TIntegerField
      FieldName = 'IDRECURSO'
      ProviderFlags = [pfInWhere]
    end
    object DireitoUsoClientDataSetDireitoUsoAcaoDataSet: TDataSetField
      FieldName = 'DireitoUsoAcaoDataSet'
      ProviderFlags = [pfInUpdate]
    end
  end
  object DireitoUsoAcaoClientDataSet: TosClientDataset
    Aggregates = <>
    DataSetField = DireitoUsoClientDataSetDireitoUsoAcaoDataSet
    FetchOnDemand = False
    Params = <
      item
        DataType = ftInteger
        Precision = 10
        Name = 'IDGRUPO'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftInteger
        Precision = 10
        Name = 'IDRECURSO'
        ParamType = ptInput
        Size = 4
      end>
    Left = 104
    Top = 116
    object DireitoUsoAcaoClientDataSetIDDIREITOUSO: TIntegerField
      FieldName = 'IDDIREITOUSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object DireitoUsoAcaoClientDataSetIDGRUPO: TIntegerField
      FieldName = 'IDGRUPO'
      ProviderFlags = [pfInUpdate]
    end
    object DireitoUsoAcaoClientDataSetIDRECURSO: TIntegerField
      FieldName = 'IDRECURSO'
      ProviderFlags = [pfInUpdate]
    end
    object DireitoUsoAcaoClientDataSetIDACAO: TIntegerField
      FieldName = 'IDACAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object RecursoClientDataSet: TosClientDataset
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    DataProvider = GrupoData.RecursoProvider
    Left = 160
    Top = 88
    object RecursoClientDataSetIDRECURSO: TIntegerField
      FieldName = 'IDRECURSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object RecursoClientDataSetNOMERECURSO: TWideStringField
      FieldName = 'NOMERECURSO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object RecursoClientDataSetNOMEDOMINIO: TWideStringField
      FieldName = 'NOMEDOMINIO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
  end
  object AcaoClientDataSet: TosClientDataset
    Aggregates = <>
    FetchOnDemand = False
    Params = <
      item
        DataType = ftInteger
        Precision = 10
        Name = 'IDRECURSO'
        ParamType = ptInput
        Size = 4
        Value = Null
      end>
    DataProvider = GrupoData.AcaoProvider
    Left = 160
    Top = 116
    object AcaoClientDataSetIDACAO: TIntegerField
      FieldName = 'IDACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object AcaoClientDataSetNOME: TWideStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
  end
end
