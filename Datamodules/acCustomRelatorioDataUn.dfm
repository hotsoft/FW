object acCustomRelatorioData: TacCustomRelatorioData
  OldCreateOrder = False
  Left = 472
  Top = 341
  Height = 182
  Width = 238
  object MasterDataSet: TosSQLDataSet
    CommandText = 
      'SELECT'#13#10'  IDRelatorio,'#13#10'  IDTipoRelatorio,'#13#10'  ITEM_ID,'#13#10'  Titulo' +
      ','#13#10'  Descricao,'#13#10'  ClasseImpressora,'#13#10'  ClasseRelatorio,'#13#10'  Comp' +
      'ativelAPartirDaVersao,'#13#10'  CompativelAteVersao,'#13#10'  DataImportacao' +
      ','#13#10'  ArquivoOrigem,'#13#10'  IDUsuarioImportacao,'#13#10'  IDXFilterDef'#13#10'FRO' +
      'M '#13#10'  Relatorio R'#13#10'WHERE'#13#10'  IDRelatorio = :ID'#13#10
    MaxBlobSize = 32
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    Left = 40
    Top = 24
    object MasterDataSetIDRELATORIO: TIntegerField
      FieldName = 'IDRELATORIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object MasterDataSetTITULO: TWideStringField
      FieldName = 'TITULO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object MasterDataSetDESCRICAO: TWideMemoField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object MasterDataSetCOMPATIVELAPARTIRDAVERSAO: TWideStringField
      FieldName = 'COMPATIVELAPARTIRDAVERSAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object MasterDataSetCOMPATIVELATEVERSAO: TWideStringField
      FieldName = 'COMPATIVELATEVERSAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object MasterDataSetDATAIMPORTACAO: TSQLTimeStampField
      FieldName = 'DATAIMPORTACAO'
      ProviderFlags = [pfInUpdate]
    end
    object MasterDataSetARQUIVOORIGEM: TWideStringField
      FieldName = 'ARQUIVOORIGEM'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object MasterDataSetIDUSUARIOIMPORTACAO: TIntegerField
      FieldName = 'IDUSUARIOIMPORTACAO'
      ProviderFlags = [pfInUpdate]
    end
    object MasterDataSetITEM_ID: TIntegerField
      FieldName = 'ITEM_ID'
      Required = True
    end
    object MasterDataSetIDXFILTERDEF: TIntegerField
      FieldName = 'IDXFILTERDEF'
      ProviderFlags = [pfInUpdate]
    end
    object MasterDataSetCLASSEIMPRESSORA: TWideStringField
      FieldName = 'CLASSEIMPRESSORA'
      Size = 30
    end
    object MasterDataSetIDTIPORELATORIO: TIntegerField
      FieldName = 'IDTIPORELATORIO'
      Required = True
    end
    object MasterDataSetCLASSERELATORIO: TWideStringField
      FieldName = 'CLASSERELATORIO'
      Size = 30
    end
  end
  object MasterProvider: TosSQLDataSetProvider
    DataSet = MasterDataSet
    Options = [poIncFieldProps, poNoReset]
    Left = 136
    Top = 24
  end
end
