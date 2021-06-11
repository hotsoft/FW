inherited UsuarioEditForm: TUsuarioEditForm
  Left = 352
  Top = 258
  VertScrollBar.Range = 0
  ActiveControl = ApelidoEdit
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  BorderWidth = 4
  Caption = 'Cadastro de Usu'#225'rio'
  ClientHeight = 364
  ClientWidth = 374
  OnClose = FormClose
  DesignSize = (
    374
    364)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 66
    Width = 31
    Height = 13
    Caption = '&Nome:'
    FocusControl = NomeEdit
  end
  object Label2: TLabel [1]
    Left = 8
    Top = 90
    Width = 31
    Height = 13
    Caption = '&Cargo:'
  end
  object Label3: TLabel [2]
    Left = 8
    Top = 42
    Width = 38
    Height = 13
    Caption = '&Apelido:'
    FocusControl = ApelidoEdit
  end
  inherited MainControlBar: TControlBar
    Width = 374
    inherited ControlBarPanel: TPanel
      Width = 357
      AutoSize = False
      inherited PararButton: TSpeedButton
        Left = 298
        Width = 57
      end
    end
  end
  object NomeEdit: TDBEdit [4]
    Left = 56
    Top = 64
    Width = 313
    Height = 21
    DataField = 'NOME'
    DataSource = MasterDataSource
    TabOrder = 2
  end
  object ApelidoEdit: TDBEdit [5]
    Left = 56
    Top = 40
    Width = 313
    Height = 21
    DataField = 'APELIDO'
    DataSource = MasterDataSource
    TabOrder = 1
  end
  object MudarSenhaButton: TButton [6]
    Left = 269
    Top = 338
    Width = 97
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Mudar Senha ...'
    TabOrder = 5
    OnClick = MudarSenhaButtonClick
  end
  object DesativarUsuarioButton: TButton [7]
    Left = 169
    Top = 338
    Width = 97
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Desativar'
    TabOrder = 4
    OnClick = DesativarUsuarioButtonClick
  end
  object NomeCargoCombo: TosComboSearch [8]
    Left = 56
    Top = 88
    Width = 313
    Height = 21
    ShowButton = True
    Style = csDropDown
    DataField = 'NomeCargo'
    DataSource = MasterDataSource
    TabOrder = 3
    WordWrap = False
    UnboundDataType = wwDefault
    FilterDataProvider = MainData.prvFilter
    FilterDefName = 'CargoLookup'
    ReturnField = 'IDCargo'
    AllowClearKey = False
  end
  object DualTree: TosDBDualTree [9]
    Left = 0
    Top = 124
    Width = 374
    Height = 177
    AssociationDataSet = GrupoUsuarioClientDataSet
    AssociationFieldName = 'IDGRUPO'
    SourceDataSet = GrupoClientDataSet
    SourceFieldName = 'IDGRUPO'
    SourceDescFieldNames.Strings = (
      'NOME')
    AssociationCaption = 'Grupos designados'
    SourceCaption = 'Grupos dispon'#237'veis'
    BevelOuter = bvNone
    TabOrder = 6
    DesignSize = (
      374
      177)
  end
  inherited ActionList: TosActionList
    Left = 284
    Top = 12
    object TestarAction: TAction
      Caption = 'TestarAction'
    end
  end
  inherited MasterDataSource: TDataSource
    DataSet = UsuarioClientDataSet
    Left = 184
    Top = 28
  end
  inherited ImageList: TImageList
    Left = 276
  end
  inherited MainMenu: TMainMenu
    Left = 240
    Top = 4
  end
  object UsuarioClientDataSet: TosClientDataset
    Aggregates = <>
    FetchOnDemand = False
    Params = <
      item
        DataType = ftInteger
        Precision = 10
        Name = 'ID'
        ParamType = ptInput
        Size = 4
        Value = Null
      end>
    AfterInsert = UsuarioClientDataSetAfterInsert
    BeforePost = UsuarioClientDataSetBeforePost
    AfterApplyUpdates = UsuarioClientDataSetAfterApplyUpdates
    DataProvider = UsuarioData.MasterProvider
    BizDatamoduleName = 'BizFilterDef'
    Left = 212
    Top = 28
    object UsuarioClientDataSetIDUSUARIO: TIntegerField
      FieldName = 'IDUSUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object UsuarioClientDataSetNOME: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object UsuarioClientDataSetIDCARGO: TIntegerField
      DisplayLabel = 'Cargo'
      FieldName = 'IDCARGO'
      ProviderFlags = [pfInUpdate]
    end
    object UsuarioClientDataSetAPELIDO: TWideStringField
      DisplayLabel = 'Apelido'
      FieldName = 'APELIDO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object UsuarioClientDataSetSENHA: TWideStringField
      DisplayLabel = 'Senha'
      FieldName = 'SENHA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 32
    end
    object UsuarioClientDataSetSTATUS: TWideStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object UsuarioClientDataSetNomeCargo: TWideStringField
      DisplayLabel = 'Cargo'
      FieldKind = fkLookup
      FieldName = 'NomeCargo'
      LookupDataSet = AdministracaoLookupData.CargoClientDataSet
      LookupKeyFields = 'IDCARGO'
      LookupResultField = 'NOME'
      KeyFields = 'IDCARGO'
      ProviderFlags = [pfInUpdate]
      Size = 50
      Lookup = True
    end
    object UsuarioClientDataSetGrupoUsuarioDataSet: TDataSetField
      DisplayLabel = 'Grupo'
      FieldName = 'GrupoUsuarioDataSet'
      ProviderFlags = [pfInUpdate]
    end
  end
  object GrupoClientDataSet: TosClientDataset
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    DataProvider = UsuarioData.GrupoProvider
    Left = 284
    Top = 56
    object GrupoClientDataSetIDGRUPO: TIntegerField
      FieldName = 'IDGRUPO'
      Required = True
    end
    object GrupoClientDataSetNOME: TWideStringField
      FieldName = 'NOME'
      Size = 40
    end
  end
  object GrupoUsuarioClientDataSet: TosClientDataset
    Aggregates = <>
    DataSetField = UsuarioClientDataSetGrupoUsuarioDataSet
    FetchOnDemand = False
    Params = <
      item
        DataType = ftInteger
        Precision = 10
        Name = 'IDUsuario'
        ParamType = ptInput
        Size = 4
        Value = Null
      end>
    Left = 216
    Top = 56
    object GrupoUsuarioClientDataSetIDGRUPOUSUARIO: TIntegerField
      FieldName = 'IDGRUPOUSUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object GrupoUsuarioClientDataSetIDGRUPO: TIntegerField
      FieldName = 'IDGRUPO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object GrupoUsuarioClientDataSetIDUSUARIO: TIntegerField
      FieldName = 'IDUSUARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
end
