inherited RelatorioLookupData: TRelatorioLookupData
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Left = 62
  Top = 195
  Height = 324
  Width = 486
  object TipoRelatorioClientDataSet: TosClientDataset
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    DataProvider = TipoRelatorioLookupProvider
    Left = 380
    Top = 40
    object TipoRelatorioClientDataSetNOME: TWideStringField
      FieldName = 'NOME'
      Size = 40
    end
    object TipoRelatorioClientDataSetIDTIPORELATORIO: TIntegerField
      FieldName = 'IDTIPORELATORIO'
      Required = True
    end
  end
  object TipoRelatorioLookupDataSet: TosSQLDataSet
    CommandText = 
      'SELECT'#13#10'  IDTipoRelatorio,'#13#10'  Nome'#13#10'FROM'#13#10'  TipoRelatorio'#13#10'ORDER' +
      ' BY'#13#10'  Nome'#13#10
    MaxBlobSize = 32
    Params = <>
    SQLConnection = acCustomSQLMainData.SQLConnection
    Left = 68
    Top = 40
  end
  object TipoRelatorioLookupProvider: TosSQLDataSetProvider
    DataSet = TipoRelatorioLookupDataSet
    Options = [poNoReset]
    Left = 228
    Top = 40
  end
  object TemplateClientDataset: TosClientDataset
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NOME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ITEM_ID'
        DataType = ftInteger
      end>
    IndexDefs = <>
    FetchOnDemand = False
    Params = <
      item
        DataType = ftInteger
        Name = 'ITEM_ID'
        ParamType = ptInput
      end>
    StoreDefs = True
    DataProvider = TemplateLookupProvider
    ClosedLookup = True
    Left = 380
    Top = 112
    object TemplateClientDatasetNOME: TWideStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object TemplateClientDatasetITEM_ID: TIntegerField
      FieldName = 'ITEM_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
  end
  object TemplateLookupDataSet: TosSQLDataSet
    CommandText = 
      'SELECT'#13#10'  Name as Nome,'#13#10'  ITEM_ID'#13#10'FROM '#13#10'  RB_ITEM'#13#10'WHERE'#13#10'  I' +
      'TEM_ID = :ITEM_ID'
    MaxBlobSize = 32
    Params = <
      item
        DataType = ftInteger
        Name = 'ITEM_ID'
        ParamType = ptInput
      end>
    SQLConnection = acCustomSQLMainData.SQLConnection
    Left = 68
    Top = 108
    object TemplateLookupDataSetNOME: TWideStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object TemplateLookupDataSetITEM_ID: TIntegerField
      FieldName = 'ITEM_ID'
    end
  end
  object TemplateLookupProvider: TosSQLDataSetProvider
    DataSet = TemplateLookupDataSet
    Options = [poIncFieldProps, poNoReset]
    Left = 228
    Top = 108
  end
  object FilterDefClientDataSet: TosClientDataset
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NAME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'IDXFILTERDEF'
        Attributes = [faRequired]
        DataType = ftInteger
      end>
    IndexDefs = <>
    FetchOnDemand = False
    Params = <
      item
        DataType = ftInteger
        Name = 'IDXFILTERDEF'
        ParamType = ptInput
      end>
    StoreDefs = True
    DataProvider = FilterDefLookupProvider
    ClosedLookup = True
    Left = 380
    Top = 176
    object FilterDefClientDataSetNAME: TWideStringField
      FieldName = 'NAME'
      Size = 50
    end
    object FilterDefClientDataSetIDXFILTERDEF: TIntegerField
      FieldName = 'IDXFILTERDEF'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object FilterDefLookupDataSet: TosSQLDataSet
    CommandText = 
      'select '#13#10'  IDXFILTERDEF,'#13#10'  NAME '#13#10'from '#13#10'  XFILTERDEF'#13#10'WHERE'#13#10' ' +
      ' IDXFILTERDEF = :IDXFILTERDEF'
    MaxBlobSize = 32
    Params = <
      item
        DataType = ftInteger
        Name = 'IDXFILTERDEF'
        ParamType = ptInput
      end>
    SQLConnection = acCustomSQLMainData.SQLConnection
    Left = 68
    Top = 172
    object FilterDefLookupDataSetNAME: TWideStringField
      FieldName = 'NAME'
      Size = 50
    end
    object FilterDefLookupDataSetIDXFILTERDEF: TIntegerField
      FieldName = 'IDXFILTERDEF'
      Required = True
    end
  end
  object FilterDefLookupProvider: TosSQLDataSetProvider
    DataSet = FilterDefLookupDataSet
    Options = [poIncFieldProps, poNoReset]
    Left = 228
    Top = 172
  end
  object RelatorioClientDataset: TosClientDataset
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    DataProvider = RelatorioDataSetProvider
    Left = 380
    Top = 232
    object RelatorioClientDatasetIDRELATORIO: TIntegerField
      FieldName = 'IDRELATORIO'
      Required = True
    end
    object RelatorioClientDatasetTITULO: TWideStringField
      FieldName = 'TITULO'
      Size = 50
    end
  end
  object RelatorioDataSet: TosSQLDataSet
    CommandText = 
      'SELECT'#13#10'  IDRelatorio,'#13#10'  Titulo'#13#10'FROM'#13#10'  Relatorio'#13#10'ORDER BY'#13#10' ' +
      ' Titulo'#13#10
    MaxBlobSize = 32
    Params = <>
    SQLConnection = acCustomSQLMainData.SQLConnection
    Left = 68
    Top = 232
  end
  object RelatorioDataSetProvider: TosSQLDataSetProvider
    DataSet = RelatorioDataSet
    Options = [poNoReset]
    Left = 228
    Top = 232
  end
end
