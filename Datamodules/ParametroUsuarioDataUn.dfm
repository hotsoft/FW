object ParametroUsuarioData: TParametroUsuarioData
  OldCreateOrder = False
  Left = 534
  Top = 131
  Height = 116
  Width = 237
  object MasterDataSet: TosSQLDataSet
    SQLConnection = MainData.SQLConnection
    CommandText = 
      'SELECT'#13#10'  IDParametroUsuario,'#13#10'  NomeParametro,'#13#10'  Descricao,'#13#10' ' +
      ' Conteudo,'#13#10'  TipoDado'#13#10'FROM '#13#10'  ParametroUsuario'#13#10'WHERE'#13#10'  IDPa' +
      'rametroUsuario = :ID'#13#10
    MaxBlobSize = 32
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = '-1'
      end>
    Left = 40
    Top = 24
    object MasterDataSetIDPARAMETROUSUARIO: TIntegerField
      FieldName = 'IDPARAMETROUSUARIO'
      Required = True
    end
    object MasterDataSetNOMEPARAMETRO: TWideStringField
      FieldName = 'NOMEPARAMETRO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 40
    end
    object MasterDataSetDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object MasterDataSetCONTEUDO: TWideStringField
      DisplayWidth = 1000
      FieldName = 'CONTEUDO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object MasterDataSetTIPODADO: TWideStringField
      FieldName = 'TIPODADO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object MasterProvider: TosSQLDataSetProvider
    DataSet = MasterDataSet
    Constraints = True
    Options = [poNoReset]
    Left = 156
    Top = 24
  end
end
