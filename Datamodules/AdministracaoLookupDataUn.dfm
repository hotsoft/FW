inherited AdministracaoLookupData: TAdministracaoLookupData
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Left = 30
  Top = 110
  Height = 580
  Width = 486
  object UsuarioClientDataSet: TosClientDataset
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    DataProvider = UsuarioLookupProvider
    Left = 352
    Top = 48
    object UsuarioClientDataSetIDUSUARIO: TIntegerField
      FieldName = 'IDUSUARIO'
      Required = True
    end
    object UsuarioClientDataSetNOME: TWideStringField
      FieldName = 'NOME'
      Size = 50
    end
  end
  object RecursoClientDataset: TosClientDataset
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    DataProvider = RecursoLookupProvider
    Left = 352
    Top = 120
    object RecursoClientDatasetIDRECURSO: TIntegerField
      FieldName = 'IDRECURSO'
      Required = True
    end
    object RecursoClientDatasetNOME: TWideStringField
      FieldName = 'NOME'
      Size = 40
    end
  end
  object AcaoClientDataSet: TosClientDataset
    Aggregates = <>
    FetchOnDemand = False
    Params = <
      item
        DataType = ftInteger
        Name = 'IDRecurso'
        ParamType = ptInput
        Value = 0
      end>
    DataProvider = AcaoLookupProvider
    Left = 352
    Top = 192
    object AcaoClientDataSetIDACAO: TIntegerField
      FieldName = 'IDACAO'
    end
    object AcaoClientDataSetIDRECURSO: TIntegerField
      FieldName = 'IDRECURSO'
    end
    object AcaoClientDataSetNOME: TWideStringField
      FieldName = 'NOME'
      Size = 42
    end
  end
  object DominioClientDataset: TosClientDataset
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    DataProvider = DominioLookupProvider
    Left = 352
    Top = 248
    object DominioClientDatasetIDDOMINIO: TIntegerField
      FieldName = 'IDDOMINIO'
      Required = True
    end
    object DominioClientDatasetDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
  object TipoRecursoClientDataSet: TosClientDataset
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    DataProvider = TipoRecursoLookupProvider
    Left = 352
    Top = 300
    object TipoRecursoClientDataSetIDTIPORECURSO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'IDTIPORECURSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TipoRecursoClientDataSetDESCRICAO: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
  end
  object CargoClientDataSet: TosClientDataset
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    DataProvider = CargoLookupProvider
    Left = 352
    Top = 352
    object CargoClientDataSetIDCARGO: TIntegerField
      FieldName = 'IDCARGO'
      Required = True
    end
    object CargoClientDataSetNOME: TWideStringField
      FieldName = 'NOME'
      Size = 40
    end
  end
  object CargoLookupDataSet: TosSQLDataSet
    CommandText = 'SELECT'#13#10'  IdCargo,'#13#10'  Nome'#13#10'FROM'#13#10'  Cargo'#13#10'ORDER BY'#13#10'  Nome'
    MaxBlobSize = 32
    Params = <>
    SQLConnection = acCustomSQLMainData.SQLConnection
    Left = 68
    Top = 352
    object IntegerField1: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'IDCARGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object StringField1: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
  end
  object CargoLookupProvider: TosSQLDataSetProvider
    DataSet = CargoLookupDataSet
    Options = [poNoReset]
    Left = 208
    Top = 352
  end
  object TipoRecursoLookupDataSet: TosSQLDataSet
    CommandText = 
      'SELECT'#13#10'  IDTipoRecurso,'#13#10'  Descricao'#13#10'FROM '#13#10'  TipoRecurso'#13#10'ORD' +
      'ER BY'#13#10'  Descricao'#13#10
    MaxBlobSize = 32
    Params = <>
    SQLConnection = acCustomSQLMainData.SQLConnection
    Left = 68
    Top = 300
    object IntegerField2: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'IDTIPORECURSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField2: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
  end
  object TipoRecursoLookupProvider: TosSQLDataSetProvider
    DataSet = TipoRecursoLookupDataSet
    Options = [poNoReset]
    Left = 208
    Top = 300
  end
  object DominioLookupDataSet: TosSQLDataSet
    CommandText = 
      'SELECT'#13#10'  IDDominio,'#13#10'  Descricao'#13#10'FROM '#13#10'  Dominio'#13#10'ORDER BY'#13#10' ' +
      ' Descricao'
    MaxBlobSize = 32
    Params = <>
    SQLConnection = acCustomSQLMainData.SQLConnection
    Left = 68
    Top = 248
    object DominioLookupDataSetIDDOMINIO: TIntegerField
      FieldName = 'IDDOMINIO'
      Required = True
    end
    object DominioLookupDataSetDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
  object DominioLookupProvider: TosSQLDataSetProvider
    DataSet = DominioLookupDataSet
    Options = [poIncFieldProps, poNoReset]
    Left = 208
    Top = 248
  end
  object AcaoLookupDataSet: TosSQLDataSet
    CommandText = 
      'SELECT'#13#10'  IDAcao,'#13#10'  IDRecurso,'#13#10'  Nome'#13#10'FROM '#13#10'  Acao'#13#10'WHERE'#13#10' ' +
      ' IDRecurso=:IDRecurso'#13#10
    MaxBlobSize = 32
    Params = <
      item
        DataType = ftInteger
        Name = 'IDRecurso'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = acCustomSQLMainData.SQLConnection
    Left = 68
    Top = 192
    object AcaoLookupDataSetIDACAO: TIntegerField
      FieldName = 'IDACAO'
    end
    object AcaoLookupDataSetIDRECURSO: TIntegerField
      FieldName = 'IDRECURSO'
    end
    object AcaoLookupDataSetNOME: TWideStringField
      FieldName = 'NOME'
      Size = 42
    end
  end
  object AcaoLookupProvider: TosSQLDataSetProvider
    DataSet = AcaoLookupDataSet
    Options = [poIncFieldProps, poNoReset]
    Left = 208
    Top = 192
  end
  object RecursoLookupDataSet: TSQLDataSet
    CommandText = 'SELECT'#13#10'  IDRecurso,'#13#10'  Nome'#13#10'FROM '#13#10'  Recurso'#13#10'ORDER BY'#13#10'  Nome'
    MaxBlobSize = 32
    Params = <>
    SQLConnection = acCustomSQLMainData.SQLConnection
    Left = 68
    Top = 120
    object RecursoLookupDataSetIDRECURSO: TIntegerField
      FieldName = 'IDRECURSO'
      Required = True
    end
    object RecursoLookupDataSetNOME: TWideStringField
      FieldName = 'NOME'
      Size = 40
    end
  end
  object RecursoLookupProvider: TosSQLDataSetProvider
    DataSet = RecursoLookupDataSet
    Options = [poNoReset]
    Left = 212
    Top = 120
  end
  object UsuarioLookupDataSet: TSQLDataSet
    CommandText = 'SELECT'#13#10'  IDUsuario,'#13#10'  Nome'#13#10'FROM '#13#10'  Usuario'#13#10'ORDER BY'#13#10'  Nome'
    MaxBlobSize = 32
    Params = <>
    SQLConnection = acCustomSQLMainData.SQLConnection
    Left = 68
    Top = 48
    object UsuarioLookupDataSetIDUSUARIO: TIntegerField
      FieldName = 'IDUSUARIO'
      Required = True
    end
    object UsuarioLookupDataSetNOME: TWideStringField
      FieldName = 'NOME'
      Size = 50
    end
  end
  object UsuarioLookupProvider: TosSQLDataSetProvider
    DataSet = UsuarioLookupDataSet
    Options = [poNoReset]
    Left = 212
    Top = 48
  end
  object GrupoClientDataSet: TosClientDataset
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    DataProvider = GrupoLookupProvider
    Left = 356
    Top = 412
    object GrupoClientDataSetIDGRUPO: TIntegerField
      FieldName = 'IDGRUPO'
      Required = True
    end
    object GrupoClientDataSetNOME: TWideStringField
      FieldName = 'NOME'
      Size = 40
    end
  end
  object GrupoLookupDataSet: TosSQLDataSet
    CommandText = 'SELECT'#13#10'  IdGrupo,'#13#10'  Nome'#13#10'FROM'#13#10'  Grupo'#13#10
    MaxBlobSize = 32
    Params = <>
    SQLConnection = acCustomSQLMainData.SQLConnection
    Left = 72
    Top = 412
    object GrupoLookupDataSetIDGRUPO: TIntegerField
      FieldName = 'IDGRUPO'
      Required = True
    end
    object GrupoLookupDataSetNOME: TWideStringField
      FieldName = 'NOME'
      Size = 40
    end
  end
  object GrupoLookupProvider: TosSQLDataSetProvider
    DataSet = GrupoLookupDataSet
    Options = [poNoReset]
    Left = 212
    Top = 412
  end
end
