inherited DominioEditForm: TDominioEditForm
  Left = 461
  Top = 250
  VertScrollBar.Range = 0
  ActiveControl = DescricaoEdit
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  BorderWidth = 4
  Caption = 'Cadastro de Dom'#237'nios do Sistema'
  ClientHeight = 166
  ClientWidth = 402
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 8
    Top = 42
    Width = 51
    Height = 13
    Caption = '&Descri'#231#227'o:'
    FocusControl = DescricaoEdit
  end
  object Label1: TLabel [1]
    Left = 8
    Top = 72
    Width = 34
    Height = 13
    Caption = '&Ordem:'
    FocusControl = NumOrdemSpinEdit
  end
  inherited MainControlBar: TControlBar
    Width = 402
  end
  object DescricaoEdit: TDBEdit [3]
    Left = 64
    Top = 40
    Width = 330
    Height = 21
    DataField = 'DESCRICAO'
    DataSource = MasterDataSource
    TabOrder = 1
  end
  object NumOrdemSpinEdit: TwwDBSpinEdit [4]
    Left = 64
    Top = 68
    Width = 77
    Height = 21
    Increment = 1.000000000000000000
    MaxValue = 15.000000000000000000
    MinValue = 1.000000000000000000
    Value = 1.000000000000000000
    DataField = 'NUMORDEM'
    DataSource = MasterDataSource
    TabOrder = 2
    UnboundDataType = wwDefault
  end
  inherited ActionList: TosActionList
    Left = 308
    Top = 4
  end
  inherited MasterDataSource: TDataSource
    DataSet = DominioClientDataSet
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
  object DominioClientDataSet: TosClientDataset
    Aggregates = <>
    FetchOnDemand = False
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
        Value = '-1'
      end>
    BeforePost = DominioClientDataSetBeforePost
    AfterApplyUpdates = DominioClientDataSetAfterApplyUpdates
    DataProvider = DominioData.MasterProvider
    BizDatamoduleName = 'BizFilterDef'
    Left = 296
    Top = 36
    object DominioClientDataSetIDDOMINIO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'IDDOMINIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object DominioClientDataSetDESCRICAO: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object DominioClientDataSetNUMORDEM: TIntegerField
      DisplayLabel = 'Ordem'
      FieldName = 'NUMORDEM'
      ProviderFlags = [pfInUpdate]
    end
  end
end
