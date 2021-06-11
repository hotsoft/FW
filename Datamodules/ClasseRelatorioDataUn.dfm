object ClasseRelatorioData: TClasseRelatorioData
  OldCreateOrder = False
  Left = 666
  Top = 251
  Height = 176
  Width = 245
  object MasterDataSet: TosSQLDataSet
    SQLConnection = MainData.SQLConnection
    CommandText = 
      'SELECT'#13#10'  IDClasseRelatorio,'#13#10'  Nome,'#13#10'  Descricao'#13#10'FROM '#13#10'  Cla' +
      'sseRelatorio'#13#10'WHERE'#13#10'  IDClasseRelatorio = :ID'#13#10
    MaxBlobSize = 32
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    Left = 40
    Top = 24
    object MasterDataSetIDCLASSERELATORIO: TIntegerField
      DisplayLabel = 'Classe Relat'#243'rio'
      FieldName = 'IDCLASSERELATORIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
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
  end
  object MasterProvider: TosSQLDataSetProvider
    DataSet = MasterDataSet
    Constraints = True
    Options = [poNoReset]
    Left = 136
    Top = 24
  end
end
