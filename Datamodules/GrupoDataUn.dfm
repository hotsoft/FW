object GrupoData: TGrupoData
  OldCreateOrder = False
  Left = 450
  Top = 177
  Height = 435
  Width = 415
  object MasterDataSet: TosSQLDataSet
    CommandText = 
      'SELECT'#13#10'  IdGrupo,'#13#10'  Nome,'#13#10'  Descricao'#13#10'FROM '#13#10'  GRUPO'#13#10'WHERE'#13 +
      #10'  IDGrupo = :ID'#13#10
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
    object MasterDataSetIDGRUPO: TIntegerField
      FieldName = 'IDGRUPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object MasterDataSetNOME: TWideStringField
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
    Options = [poCascadeUpdates, poNoReset]
    BeforeUpdateRecord = MasterProviderBeforeUpdateRecord
    Left = 220
    Top = 20
  end
  object MasterDataSource: TDataSource
    DataSet = MasterDataSet
    Left = 128
    Top = 20
  end
  object GrupoUsuarioDataSet: TosSQLDataSet
    CommandText = 'SELECT'#13#10'  *'#13#10'FROM'#13#10'  GRUPOUSUARIO'#13#10'WHERE'#13#10'  IDGRUPO = :IDGRUPO'#13#10
    DataSource = MasterDataSource
    MaxBlobSize = 32
    Params = <
      item
        DataType = ftInteger
        Precision = 10
        Name = 'IDGRUPO'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = MainData.SQLConnection
    Left = 40
    Top = 72
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
  object UsuarioDataSet: TosSQLDataSet
    CommandText = 'SELECT'#13#10'  IDUSUARIO,'#13#10'  NOME'#13#10'FROM'#13#10'  USUARIO'
    MaxBlobSize = 32
    Params = <>
    SQLConnection = MainData.SQLConnection
    Left = 40
    Top = 328
    object UsuarioDataSetIDUSUARIO: TIntegerField
      FieldName = 'IDUSUARIO'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object UsuarioDataSetNOME: TWideStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 50
    end
  end
  object UsuarioProvider: TosSQLDataSetProvider
    DataSet = UsuarioDataSet
    Options = [poNoReset]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = UsuarioProviderBeforeUpdateRecord
    Left = 224
    Top = 328
  end
  object DireitoUsoDataSet: TosSQLDataSet
    CommandText = 
      'SELECT DISTINCT'#13#10'  IDGRUPO,'#13#10'  IDRECURSO'#13#10'FROM'#13#10'  DIREITOUSO'#13#10'WH' +
      'ERE'#13#10'  IDGRUPO = :IDGRUPO'#13#10'ORDER BY'#13#10'  IDRECURSO'
    DataSource = MasterDataSource
    MaxBlobSize = 32
    Params = <
      item
        DataType = ftInteger
        Precision = 10
        Name = 'IDGRUPO'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = MainData.SQLConnection
    Left = 40
    Top = 124
    object DireitoUsoDataSetIDGRUPO: TIntegerField
      FieldName = 'IDGRUPO'
      ProviderFlags = [pfInWhere]
    end
    object DireitoUsoDataSetIDRECURSO: TIntegerField
      FieldName = 'IDRECURSO'
      ProviderFlags = [pfInWhere]
    end
  end
  object RecursoDataSet: TosSQLDataSet
    CommandText = 
      'SELECT'#13#10'  R.IDRECURSO,'#13#10'  R.NOME NomeRecurso,'#13#10'  D.DESCRICAO Nom' +
      'eDominio'#13#10'FROM'#13#10'  RECURSO R'#13#10'  JOIN DOMINIO D'#13#10'    ON R.IDDOMINI' +
      'O = D.IDDOMINIO'#13#10'ORDER BY'#13#10'  D.DESCRICAO'
    MaxBlobSize = 32
    Params = <>
    SQLConnection = MainData.SQLConnection
    Left = 40
    Top = 280
    object RecursoDataSetIDRECURSO: TIntegerField
      FieldName = 'IDRECURSO'
      ProviderFlags = [pfInWhere, pfInKey]
      Required = True
    end
    object RecursoDataSetNOMERECURSO: TWideStringField
      FieldName = 'NOMERECURSO'
      ProviderFlags = []
      Size = 40
    end
    object RecursoDataSetNOMEDOMINIO: TWideStringField
      FieldName = 'NOMEDOMINIO'
      ProviderFlags = []
      Size = 50
    end
  end
  object RecursoProvider: TosSQLDataSetProvider
    DataSet = RecursoDataSet
    Options = [poNoReset]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = RecursoProviderBeforeUpdateRecord
    Left = 224
    Top = 276
  end
  object DireitoUsoDataSource: TDataSource
    DataSet = DireitoUsoDataSet
    Left = 128
    Top = 124
  end
  object DireitoUsoAcaoDataSet: TosSQLDataSet
    CommandText = 
      'SELECT'#13#10'  IDDIREITOUSO,'#13#10'  IDGRUPO,'#13#10'  IDRECURSO,'#13#10'  IDACAO'#13#10'FRO' +
      'M'#13#10'  DIREITOUSO'#13#10'WHERE'#13#10'  IDGRUPO = :IDGRUPO'#13#10'  AND IDRECURSO = ' +
      ':IDRECURSO'
    DataSource = DireitoUsoDataSource
    MaxBlobSize = 32
    Params = <
      item
        DataType = ftInteger
        Name = 'IDGRUPO'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'IDRECURSO'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = MainData.SQLConnection
    Left = 40
    Top = 176
    object DireitoUsoAcaoDataSetIDDIREITOUSO: TIntegerField
      FieldName = 'IDDIREITOUSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object DireitoUsoAcaoDataSetIDGRUPO: TIntegerField
      FieldName = 'IDGRUPO'
      ProviderFlags = [pfInUpdate]
    end
    object DireitoUsoAcaoDataSetIDRECURSO: TIntegerField
      FieldName = 'IDRECURSO'
      ProviderFlags = [pfInUpdate]
    end
    object DireitoUsoAcaoDataSetIDACAO: TIntegerField
      FieldName = 'IDACAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object AcaoDataSet: TosSQLDataSet
    CommandText = 
      'SELECT'#13#10'  IDACAO,'#13#10'  NOME'#13#10'FROM'#13#10'  ACAO'#13#10'WHERE'#13#10'  IDRECURSO IS N' +
      'ULL'#13#10'  OR IDRECURSO = :IDRECURSO'
    MaxBlobSize = 32
    Params = <
      item
        DataType = ftInteger
        Precision = 10
        Name = 'IDRECURSO'
        ParamType = ptInput
        Size = 4
        Value = Null
      end>
    SQLConnection = MainData.SQLConnection
    Left = 40
    Top = 232
    object AcaoDataSetIDACAO: TIntegerField
      FieldName = 'IDACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object AcaoDataSetNOME: TWideStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
  end
  object AcaoProvider: TosSQLDataSetProvider
    DataSet = AcaoDataSet
    Options = [poNoReset]
    UpdateMode = upWhereKeyOnly
    Left = 224
    Top = 224
  end
end
