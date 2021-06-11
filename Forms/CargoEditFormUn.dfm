inherited CargoEditForm: TCargoEditForm
  Left = 429
  Top = 218
  VertScrollBar.Range = 0
  ActiveControl = NomeEdit
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  BorderWidth = 4
  Caption = 'Cadastro de Cargos dos usu'#225'rios do sistema'
  ClientHeight = 166
  ClientWidth = 447
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 8
    Top = 42
    Width = 95
    Height = 13
    Caption = '&Nome ou descri'#231#227'o:'
    FocusControl = NomeEdit
  end
  object Label1: TLabel [1]
    Left = 8
    Top = 72
    Width = 82
    Height = 13
    Caption = '&'#193'rea de atua'#231#227'o:'
    FocusControl = AreaAtuacaoComboBox
    WordWrap = True
  end
  inherited MainControlBar: TControlBar
    Width = 447
  end
  object NomeEdit: TDBEdit [3]
    Left = 112
    Top = 40
    Width = 325
    Height = 21
    DataField = 'NOME'
    DataSource = MasterDataSource
    TabOrder = 1
  end
  object AreaAtuacaoComboBox: TwwDBComboBox [4]
    Left = 112
    Top = 68
    Width = 189
    Height = 21
    ShowButton = True
    Style = csDropDown
    MapList = False
    AllowClearKey = False
    AutoDropDown = True
    ShowMatchText = True
    DataField = 'AREAATUACAO'
    DataSource = MasterDataSource
    DropDownCount = 8
    HistoryList.FileName = 'LabMaster.ini.ini'
    ItemHeight = 0
    Items.Strings = (
      'Atendimento'
      'T'#233'cnica'
      'Administrativa'
      'Financeira'
      'Sistemas')
    Sorted = False
    TabOrder = 2
    UnboundDataType = wwDefault
  end
  inherited ActionList: TosActionList
    Left = 308
    Top = 4
  end
  inherited MasterDataSource: TDataSource
    DataSet = CargoClientDataSet
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
  object CargoClientDataSet: TosClientDataset
    Aggregates = <>
    FetchOnDemand = False
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
        Value = '-1'
      end>
    BeforePost = CargoClientDataSetBeforePost
    AfterApplyUpdates = CargoClientDataSetAfterApplyUpdates
    DataProvider = CargoData.MasterProvider
    BizDatamoduleName = 'BizFilterDef'
    Left = 296
    Top = 36
    object CargoClientDataSetIDCARGO: TIntegerField
      FieldName = 'IDCARGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CargoClientDataSetNOME: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 40
    end
    object CargoClientDataSetAREAATUACAO: TWideStringField
      FieldName = 'AREAATUACAO'
      Size = 40
    end
  end
end
