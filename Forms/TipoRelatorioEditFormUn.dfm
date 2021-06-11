inherited TipoRelatorioEditForm: TTipoRelatorioEditForm
  Left = 358
  Top = 220
  VertScrollBar.Range = 0
  ActiveControl = DescricaoEdit
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  BorderWidth = 4
  Caption = 'Cadastro de Classes de Relatorios'
  ClientHeight = 166
  ClientWidth = 405
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 8
    Top = 62
    Width = 31
    Height = 13
    Caption = '&Nome:'
    FocusControl = NomeEdit
  end
  object Label1: TLabel [1]
    Left = 8
    Top = 38
    Width = 51
    Height = 13
    Caption = '&Descri'#231#227'o:'
    FocusControl = DescricaoEdit
  end
  inherited MainControlBar: TControlBar
    Width = 405
  end
  object NomeEdit: TDBEdit [3]
    Left = 76
    Top = 60
    Width = 318
    Height = 21
    DataField = 'NOME'
    DataSource = MasterDataSource
    TabOrder = 2
  end
  object DescricaoEdit: TDBEdit [4]
    Left = 76
    Top = 36
    Width = 318
    Height = 21
    DataField = 'DESCRICAO'
    DataSource = MasterDataSource
    TabOrder = 1
  end
  inherited ActionList: TosActionList
    Left = 308
    Top = 4
  end
  inherited MasterDataSource: TDataSource
    DataSet = TipoRelatorioClientDataSet
    Left = 344
    Top = 4
  end
  inherited ImageList: TImageList
    Left = 276
  end
  inherited MainMenu: TMainMenu
    Left = 240
    Top = 4
  end
  object TipoRelatorioClientDataSet: TosClientDataset
    Aggregates = <>
    FetchOnDemand = False
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
        Value = '-1'
      end>
    BeforePost = TipoRelatorioClientDataSetBeforePost
    AfterApplyUpdates = TipoRelatorioClientDataSetAfterApplyUpdates
    DataProvider = TipoRelatorioData.MasterProvider
    BizDatamoduleName = 'BizFilterDef'
    Left = 376
    Top = 4
    object TipoRelatorioClientDataSetNOME: TWideStringField
      DisplayLabel = 'Nome da Classe'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object TipoRelatorioClientDataSetDESCRICAO: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object TipoRelatorioClientDataSetIDTIPORELATORIO: TIntegerField
      FieldName = 'IDTIPORELATORIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
end
