object UsuarioData: TUsuarioData
  OldCreateOrder = False
  Left = 508
  Top = 235
  Height = 416
  Width = 325
  object MasterDataSet: TosSQLDataSet
    CommandText = 
      'SELECT'#13#10'  IDUsuario,'#13#10'  Nome,'#13#10'  IDCargo,'#13#10'  Apelido,'#13#10'  Senha,'#13 +
      #10'  Status'#13#10'FROM '#13#10'  USUARIO'#13#10'WHERE'#13#10'  IDUsuario=:ID'#13#10
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
    object MasterDataSetIDUSUARIO: TIntegerField
      FieldName = 'IDUSUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object MasterDataSetNOME: TWideStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object MasterDataSetIDCARGO: TIntegerField
      FieldName = 'IDCARGO'
      ProviderFlags = [pfInUpdate]
    end
    object MasterDataSetAPELIDO: TWideStringField
      FieldName = 'APELIDO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object MasterDataSetSENHA: TWideStringField
      FieldName = 'SENHA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 32
    end
    object MasterDataSetSTATUS: TWideStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object MasterProvider: TosSQLDataSetProvider
    DataSet = MasterDataSet
    Options = [poIncFieldProps, poNoReset]
    Left = 256
    Top = 24
  end
  object MasterDataSource: TDataSource
    DataSet = MasterDataSet
    Left = 144
    Top = 24
  end
  object GrupoDataSet: TosSQLDataSet
    CommandText = 'SELECT'#13#10'  IDGrupo,'#13#10'  Nome'#13#10'FROM'#13#10'  GRUPO'#13#10
    MaxBlobSize = 32
    Params = <>
    SQLConnection = MainData.SQLConnection
    Left = 40
    Top = 224
  end
  object GrupoProvider: TosSQLDataSetProvider
    DataSet = GrupoDataSet
    Options = [poNoReset]
    Left = 140
    Top = 224
  end
  object GrupoUsuarioDataSet: TosSQLDataSet
    CommandText = 
      'SELECT'#13#10'  *'#13#10'FROM'#13#10'  GRUPOUSUARIO'#13#10'WHERE'#13#10'  IDUSUARIO = :IDUsuar' +
      'io'#13#10
    DataSource = MasterDataSource
    MaxBlobSize = 32
    Params = <
      item
        DataType = ftInteger
        Name = 'IDUSUARIO'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = MainData.SQLConnection
    Left = 40
    Top = 80
    object GrupoUsuarioDataSetIDGRUPOUSUARIO: TIntegerField
      FieldName = 'IDGRUPOUSUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object GrupoUsuarioDataSetIDGRUPO: TIntegerField
      FieldName = 'IDGRUPO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object GrupoUsuarioDataSetIDUSUARIO: TIntegerField
      FieldName = 'IDUSUARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
end
