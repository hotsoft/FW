inherited TipoRecursoEditForm: TTipoRecursoEditForm
  Left = 476
  Top = 272
  VertScrollBar.Range = 0
  ActiveControl = DescricaoEdit
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  BorderWidth = 4
  Caption = 'Cadastro de Tipos de Recursos do Sistema'
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
  inherited MainControlBar: TControlBar
    Width = 402
  end
  object DescricaoEdit: TDBEdit [2]
    Left = 64
    Top = 40
    Width = 330
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
    DataProvider = TipoRecursoData.MasterProvider
    BizDatamoduleName = 'BizFilterDef'
    Left = 296
    Top = 36
    object DominioClientDataSetIDTIPORECURSO: TIntegerField
      FieldName = 'IDTIPORECURSO'
      Required = True
    end
    object DominioClientDataSetDESCRICAO: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
end
