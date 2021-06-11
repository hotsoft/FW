object DominioData: TDominioData
  OldCreateOrder = False
  Left = 480
  Top = 116
  Height = 147
  Width = 270
  object MasterDataSet: TosSQLDataSet
    CommandText = 
      'SELECT'#13#10'  IdDominio,'#13#10'  Descricao,'#13#10'  NumOrdem'#13#10'FROM '#13#10'  Dominio' +
      #13#10'WHERE'#13#10'  IDDominio = :ID'
    MaxBlobSize = 32
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = '-1'
      end>
    SQLConnection = MainData.SQLConnection
    Left = 40
    Top = 20
    object MasterDataSetIDDOMINIO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'IDDOMINIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object MasterDataSetDESCRICAO: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object MasterDataSetNUMORDEM: TIntegerField
      FieldName = 'NUMORDEM'
      ProviderFlags = [pfInUpdate]
    end
  end
  object MasterProvider: TosSQLDataSetProvider
    DataSet = MasterDataSet
    Options = [poIncFieldProps, poNoReset]
    Left = 156
    Top = 20
  end
end
