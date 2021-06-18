object FilterDefData: TFilterDefData
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 376
  Width = 569
  object MasterDatasource: TDataSource
    DataSet = MasterDataset
    Left = 68
    Top = 92
  end
  object MasterProvider: TosSQLDataSetProvider
    DataSet = MasterDataset
    Options = [poNoReset]
    Left = 180
    Top = 24
  end
  object MasterDataset: TosSQLDataSet
    CommandText = 
      'SELECT'#13#10'  IDXFilterDef,'#13#10'  Name,'#13#10'  FilterType,'#13#10'  Titulo'#13#10'FROM'#13 +
      #10'  XFilterDef'#13#10'WHERE'#13#10'  IDXFilterDef = :ID'
    MaxBlobSize = 32
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = '-1'
      end>
    SQLConnection = MainData.SQLConnection
    Left = 56
    Top = 20
    object MasterDatasetIDXFilterDef: TIntegerField
      FieldName = 'IDXFilterDef'
    end
    object MasterDatasetName: TWideStringField
      FieldName = 'Name'
      Size = 50
    end
    object MasterDatasetFilterType: TWideStringField
      FieldName = 'FilterType'
      Size = 3
    end
    object MasterDatasetTitulo: TWideStringField
      FieldName = 'Titulo'
      Size = 100
    end
  end
  object FilterDefDetailDataset: TosSQLDataSet
    CommandText = 
      'SELECT'#13#10'  IDXFilterDefDetail,'#13#10'  IDXFilterDef,'#13#10'  Number,'#13#10'  Des' +
      'cription,'#13#10'  QueryText,'#13#10'  AttributeList,'#13#10'  ExpressionList,'#13#10'  ' +
      'ConstraintList,'#13#10'  OrderList,'#13#10'  OrderColumn,'#13#10'  OrderType'#13#10'FROM' +
      #13#10'  XFilterDefDetail'#13#10'WHERE'#13#10'  IDXFilterDef = :IDXFilterDef'
    DataSource = MasterDatasource
    MaxBlobSize = 32
    Params = <
      item
        DataType = ftInteger
        Name = 'IDXFilterDef'
        ParamType = ptInput
      end>
    SQLConnection = MainData.SQLConnection
    Left = 188
    Top = 92
    object FilterDefDetailDatasetIDXFilterDefDetail: TIntegerField
      FieldName = 'IDXFilterDefDetail'
    end
    object FilterDefDetailDatasetIDXFilterDef: TIntegerField
      FieldName = 'IDXFilterDef'
    end
    object FilterDefDetailDatasetNumber: TIntegerField
      FieldName = 'Number'
    end
    object FilterDefDetailDatasetDescription: TWideStringField
      FieldName = 'Description'
      Size = 200
    end
    object FilterDefDetailDatasetQueryText: TWideMemoField
      FieldName = 'QueryText'
      BlobType = ftWideMemo
      Size = -1
    end
    object FilterDefDetailDatasetAttributeList: TWideMemoField
      FieldName = 'AttributeList'
      BlobType = ftWideMemo
      Size = -1
    end
    object FilterDefDetailDatasetExpressionList: TWideMemoField
      FieldName = 'ExpressionList'
      BlobType = ftWideMemo
      Size = -1
    end
    object FilterDefDetailDatasetConstraintList: TWideMemoField
      FieldName = 'ConstraintList'
      BlobType = ftWideMemo
      Size = -1
    end
    object FilterDefDetailDatasetOrderList: TWideMemoField
      FieldName = 'OrderList'
      BlobType = ftWideMemo
      Size = -1
    end
    object FilterDefDetailDatasetOrderColumn: TWideStringField
      FieldName = 'OrderColumn'
      Size = 50
    end
    object FilterDefDetailDatasetOrderType: TWideStringField
      FieldName = 'OrderType'
      Size = 1
    end
  end
end
