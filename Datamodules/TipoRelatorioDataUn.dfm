object TipoRelatorioData: TTipoRelatorioData
  OldCreateOrder = False
  Left = 666
  Top = 251
  Height = 176
  Width = 245
  object MasterDataSet: TosSQLDataSet
    CommandText = 
      'SELECT'#13#10'  IDTipoRelatorio,'#13#10'  Nome,'#13#10'  Descricao'#13#10'FROM '#13#10'  TipoR' +
      'elatorio'#13#10'WHERE'#13#10'  IDTipoRelatorio = :ID'#13#10
    MaxBlobSize = 32
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = MainData.SQLConnection
    Left = 40
    Top = 24
    object MasterDataSetNOME: TWideStringField
      DisplayLabel = 'Nome da Classe'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object MasterDataSetDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object MasterDataSetIDTIPORELATORIO: TIntegerField
      FieldName = 'IDTIPORELATORIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object MasterProvider: TosSQLDataSetProvider
    DataSet = MasterDataSet
    Options = [poNoReset]
    Left = 136
    Top = 24
  end
end
