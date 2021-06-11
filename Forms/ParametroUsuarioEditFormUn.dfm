inherited ParametroUsuarioEditForm: TParametroUsuarioEditForm
  Left = 333
  Top = 218
  VertScrollBar.Range = 0
  ActiveControl = NomeParametroEdit
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  BorderWidth = 4
  Caption = 'Cadastro de Parametros do Usu'#225'rio'
  ClientHeight = 226
  ClientWidth = 402
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 8
    Top = 42
    Width = 31
    Height = 13
    Caption = '&Nome:'
    FocusControl = NomeParametroEdit
  end
  object Label1: TLabel [1]
    Left = 8
    Top = 72
    Width = 51
    Height = 13
    Caption = '&Descri'#231#227'o:'
  end
  object Label3: TLabel [2]
    Left = 8
    Top = 135
    Width = 49
    Height = 13
    Caption = '&Conte'#250'do:'
    FocusControl = ConteudoMemo
  end
  object Label4: TLabel [3]
    Left = 8
    Top = 96
    Width = 39
    Height = 26
    Caption = 'Tipo de Dado:'
    FocusControl = TipoDadoComboBox
    WordWrap = True
  end
  inherited MainControlBar: TControlBar
    Width = 402
  end
  object NomeParametroEdit: TDBEdit [5]
    Left = 64
    Top = 40
    Width = 330
    Height = 21
    DataField = 'NOMEPARAMETRO'
    DataSource = MasterDataSource
    TabOrder = 1
  end
  object ConteudoMemo: TDBMemo [6]
    Left = 64
    Top = 133
    Width = 329
    Height = 80
    DataField = 'CONTEUDO'
    DataSource = MasterDataSource
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object TipoDadoComboBox: TwwDBComboBox [7]
    Left = 64
    Top = 102
    Width = 121
    Height = 21
    ShowButton = True
    Style = csDropDown
    MapList = True
    AllowClearKey = False
    AutoDropDown = True
    DataField = 'TIPODADO'
    DataSource = MasterDataSource
    DropDownCount = 8
    HistoryList.FileName = 'LabMaster.ini.ini'
    ItemHeight = 0
    Items.Strings = (
      'Caractere'#9'C'
      'Inteiro'#9'I'
      'Valor'#9'V'
      'Memorando'#9'M'
      'Data'#9'D')
    Sorted = False
    TabOrder = 3
    UnboundDataType = wwDefault
  end
  object DescricaoDBEdit: TDBEdit [8]
    Left = 64
    Top = 70
    Width = 330
    Height = 21
    DataField = 'DESCRICAO'
    DataSource = MasterDataSource
    TabOrder = 2
  end
  inherited ActionList: TosActionList
    Left = 308
    Top = 4
  end
  inherited MasterDataSource: TDataSource
    DataSet = ParametroClientDataSet
    Left = 264
    Top = 36
  end
  inherited ImageList: TImageList
    Left = 276
  end
  inherited MainMenu: TMainMenu
    Left = 240
    Top = 4
  end
  object ParametroClientDataSet: TosClientDataset
    Aggregates = <>
    FetchOnDemand = False
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
        Value = '-1'
      end>
    BeforePost = ParametroClientDataSetBeforePost
    DataProvider = ParametroUsuarioData.MasterProvider
    BizDatamoduleName = 'BizFilterDef'
    IDName = 'IDParametroUsuario'
    Left = 296
    Top = 36
    object ParametroClientDataSetIDPARAMETROUSUARIO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'IDPARAMETROUSUARIO'
      ProviderFlags = [pfInWhere, pfInKey]
      Required = True
    end
    object ParametroClientDataSetNOMEPARAMETRO: TWideStringField
      DisplayLabel = 'Nome do Par'#226'metro'
      FieldName = 'NOMEPARAMETRO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 40
    end
    object ParametroClientDataSetDESCRICAO: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object ParametroClientDataSetCONTEUDO: TWideStringField
      DisplayLabel = 'Conte'#250'do'
      DisplayWidth = 1000
      FieldName = 'CONTEUDO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object ParametroClientDataSetTIPODADO: TWideStringField
      DisplayLabel = 'Tipo de Dado'
      FieldName = 'TIPODADO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
end
