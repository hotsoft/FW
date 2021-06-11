object CargoData: TCargoData
  OldCreateOrder = False
  Left = 700
  Top = 375
  Height = 160
  Width = 219
  object MasterDataSet: TosSQLDataSet
    CommandText = 
      'SELECT'#13#10'  IdCargo,'#13#10'  Nome,'#13#10'  AreaAtuacao'#13#10'FROM '#13#10'  Cargo'#13#10'WHER' +
      'E'#13#10'  IDCargo = :ID'#13#10
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
    object MasterDataSetIDCARGO: TIntegerField
      FieldName = 'IDCARGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object MasterDataSetNOME: TWideStringField
      FieldName = 'NOME'
      Size = 40
    end
    object MasterDataSetAREAATUACAO: TWideStringField
      FieldName = 'AREAATUACAO'
      Size = 40
    end
  end
  object MasterProvider: TosSQLDataSetProvider
    DataSet = MasterDataSet
    Options = [poNoReset]
    Left = 144
    Top = 20
  end
end
