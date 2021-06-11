object TipoRecursoData: TTipoRecursoData
  OldCreateOrder = False
  Left = 669
  Top = 267
  Height = 150
  Width = 249
  object MasterDataSet: TosSQLDataSet
    CommandText = 
      'SELECT'#13#10'  IdTipoRecurso,'#13#10'  Descricao'#13#10'FROM '#13#10'  TipoRecurso'#13#10'WHE' +
      'RE'#13#10'  IDTipoRecurso = :ID'#13#10
    MaxBlobSize = 32
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = MainData.SQLConnection
    Left = 40
    Top = 20
    object MasterDataSetIDTIPORECURSO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'IDTIPORECURSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object MasterDataSetDESCRICAO: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
  end
  object MasterProvider: TosSQLDataSetProvider
    DataSet = MasterDataSet
    Options = [poNoReset]
    Left = 156
    Top = 20
  end
end
