object RecursoData: TRecursoData
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 491
  Width = 305
  object MasterDataSet: TosSQLDataSet
    CommandText = 
      'SELECT'#13#10'  IDRecurso,'#13#10'  IDDominio,'#13#10'  IDTipoRecurso,'#13#10'  Nome,'#13#10' ' +
      ' Descricao,'#13#10'  FilterDefName,'#13#10'  DataClassName,'#13#10'  ResClassName,' +
      #13#10'  ReportClassName,'#13#10'  IndiceImagem,'#13#10'  NumOrdem,'#13#10'  habilitaEd' +
      'itarTodos,'#13#10'  forcaReExecucaoFiltro'#13#10'FROM '#13#10'  Recurso'#13#10'WHERE'#13#10'  ' +
      'IDRecurso=:ID'
    MaxBlobSize = 32
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = acCustomSQLMainData.SQLConnection
    Left = 40
    Top = 24
    object MasterDataSetIDRECURSO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'IDRECURSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object MasterDataSetIDTIPORECURSO: TIntegerField
      DisplayLabel = 'Tipo do recurso'
      FieldName = 'IDTIPORECURSO'
      ProviderFlags = [pfInUpdate]
    end
    object MasterDataSetDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 255
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object MasterDataSetIDDOMINIO: TIntegerField
      FieldName = 'IDDOMINIO'
      ProviderFlags = [pfInUpdate]
    end
    object MasterDataSetNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object MasterDataSetFILTERDEFNAME: TStringField
      FieldName = 'FILTERDEFNAME'
      Size = 50
    end
    object MasterDataSetDATACLASSNAME: TStringField
      FieldName = 'DATACLASSNAME'
      Size = 50
    end
    object MasterDataSetRESCLASSNAME: TStringField
      FieldName = 'RESCLASSNAME'
      Size = 50
    end
    object MasterDataSetREPORTCLASSNAME: TStringField
      FieldName = 'REPORTCLASSNAME'
      Size = 50
    end
    object MasterDataSetINDICEIMAGEM: TIntegerField
      DisplayLabel = 'Imagem:'
      FieldName = 'INDICEIMAGEM'
    end
    object MasterDataSetNUMORDEM: TIntegerField
      DisplayLabel = 'Ordem'
      FieldName = 'NUMORDEM'
    end
    object MasterDataSetHABILITAEDITARTODOS: TStringField
      FieldName = 'HABILITAEDITARTODOS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object MasterDataSetFORCAREEXECUCAOFILTRO: TStringField
      FieldName = 'FORCAREEXECUCAOFILTRO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object MasterProvider: TosSQLDataSetProvider
    DataSet = MasterDataSet
    Options = [poIncFieldProps, poNoReset]
    Left = 216
    Top = 24
  end
  object MasterDataSource: TDataSource
    DataSet = MasterDataSet
    Left = 132
    Top = 24
  end
  object RecursosUsuarioDataSet: TosSQLDataSet
    CommandText = 
      'SELECT DISTINCT'#13#10'  R.Nome,'#13#10'  R.Descricao,'#13#10'  R.FilterDefName,'#13#10 +
      '  R.ResClassName,'#13#10'  R.DataClassName,'#13#10'  R.ReportClassName,'#13#10'  R' +
      '.IDTipoRecurso,'#13#10'  R.NumOrdem OrdemRecurso,'#13#10'  R.IndiceImagem In' +
      'diceImagem,'#13#10'  Dom.Descricao NomeDominio,'#13#10'  Dom.NumOrdem OrdemD' +
      'ominio'#13#10'FROM'#13#10'  Usuario U'#13#10'  INNER JOIN GrupoUsuario GU'#13#10'    ON ' +
      'U.IdUsuario = GU.IdUsuario'#13#10'  INNER JOIN Grupo G'#13#10'    ON GU.IdGr' +
      'upo = G.IdGrupo'#13#10'  INNER JOIN DireitoUso D'#13#10'    ON G.IdGrupo = D' +
      '.IdGrupo'#13#10'  INNER JOIN Recurso R'#13#10'    ON D.IdRecurso = R.IdRecur' +
      'so'#13#10'  INNER JOIN Dominio Dom'#13#10'    ON R.IdDominio = Dom.IdDominio' +
      #13#10'WHERE'#13#10'   UPPER(U.Apelido) LIKE UPPER(:UserName)'#13#10'ORDER BY'#13#10'  ' +
      'Dom.Descricao,'#13#10'  R.Nome'
    MaxBlobSize = 32
    Params = <
      item
        DataType = ftUnknown
        Name = 'UserName'
        ParamType = ptInput
      end>
    SQLConnection = acCustomSQLMainData.SQLConnection
    Left = 60
    Top = 192
  end
  object RecursosUsuarioProvider: TosSQLDataSetProvider
    DataSet = RecursosUsuarioDataSet
    Options = [poNoReset]
    Left = 192
    Top = 192
  end
  object AcaoDataSet: TosSQLDataSet
    CommandText = 
      'select'#13#10'  DESCRICAO,'#13#10'  IDACAO,'#13#10'  IDRECURSO,'#13#10'  INDICEIMAGEM,'#13#10 +
      '  NOME,'#13#10'  NOMECOMPONENTE'#13#10'from'#13#10'  ACAO'#13#10'where'#13#10'  IDRECURSO = :I' +
      'DRECURSO'
    DataSource = MasterDataSource
    MaxBlobSize = 32
    Params = <
      item
        DataType = ftInteger
        Name = 'IDRECURSO'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = acCustomSQLMainData.SQLConnection
    Left = 104
    Top = 80
    object AcaoDataSetDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object AcaoDataSetIDACAO: TIntegerField
      FieldName = 'IDACAO'
      Required = True
    end
    object AcaoDataSetIDRECURSO: TIntegerField
      FieldName = 'IDRECURSO'
    end
    object AcaoDataSetINDICEIMAGEM: TIntegerField
      FieldName = 'INDICEIMAGEM'
    end
    object AcaoDataSetNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object AcaoDataSetNOMECOMPONENTE: TStringField
      FieldName = 'NOMECOMPONENTE'
      Size = 40
    end
  end
  object AcoesUsuarioDataSet: TosSQLDataSet
    CommandText = 
      'SELECT DISTINCT'#13#10'  A.NomeComponente'#13#10'FROM'#13#10'  Usuario U'#13#10'  JOIN G' +
      'rupoUsuario GU'#13#10'    ON U.IdUsuario = GU.IdUsuario'#13#10'  JOIN Grupo ' +
      'G'#13#10'    ON GU.IdGrupo = G.IdGrupo'#13#10'  JOIN DireitoUso D'#13#10'    ON G.' +
      'IdGrupo = D.IdGrupo'#13#10'  JOIN Recurso R'#13#10'    ON D.IdRecurso = R.Id' +
      'Recurso'#13#10'  JOIN Acao A'#13#10'    ON D.IdAcao = A.IdAcao'#13#10'WHERE'#13#10'  UPP' +
      'ER(U.Apelido) LIKE UPPER(:UserName)'#13#10'  AND UPPER(R.Nome) = UPPER' +
      '(:NomeRecurso)'
    MaxBlobSize = 32
    Params = <
      item
        DataType = ftUnknown
        Name = 'UserName'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'NomeRecurso'
        ParamType = ptInput
      end>
    SQLConnection = acCustomSQLMainData.SQLConnection
    Left = 60
    Top = 148
    object AcoesUsuarioDataSetNOMECOMPONENTE: TStringField
      FieldName = 'NOMECOMPONENTE'
      Size = 40
    end
  end
  object AcoesUsuarioProvider: TosSQLDataSetProvider
    DataSet = AcoesUsuarioDataSet
    Options = [poNoReset]
    Left = 192
    Top = 144
  end
  object UsuarioDataSet: TosSQLDataSet
    CommandText = 
      'SELECT'#13#10'  Apelido,'#13#10'  Nome,'#13#10'  Senha,'#13#10'  Status,'#13#10'  DataSenha'#13#10'F' +
      'ROM'#13#10'  Usuario'#13#10'WHERE'#13#10'  UPPER(Apelido) = UPPER(:Username)'
    MaxBlobSize = 32
    Params = <
      item
        DataType = ftString
        Name = 'Username'
        ParamType = ptInput
      end>
    SQLConnection = acCustomSQLMainData.SQLConnection
    Left = 60
    Top = 244
    object UsuarioDataSetAPELIDO: TStringField
      FieldName = 'APELIDO'
      Size = 40
    end
    object UsuarioDataSetSENHA: TStringField
      FieldName = 'SENHA'
      FixedChar = True
      Size = 32
    end
    object UsuarioDataSetNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object UsuarioDataSetSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object UsuarioDataSetDATASENHA: TDateField
      FieldName = 'DATASENHA'
    end
  end
  object UsuarioProvider: TosSQLDataSetProvider
    DataSet = UsuarioDataSet
    Options = [poNoReset]
    Left = 192
    Top = 244
  end
end
