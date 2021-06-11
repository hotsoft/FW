object LogData: TLogData
  OldCreateOrder = False
  Left = 555
  Top = 181
  Height = 189
  Width = 240
  object MasterDataSet: TosSQLDataSet
    CommandText = 
      'SELECT'#13#10'  IDLog,'#9#13#10'  IDRecurso,'#13#10'  IDUsuario,'#13#10'  DataHora,'#13#10'  De' +
      'scricao'#13#10'FROM '#13#10'  Log'#13#10'WHERE'#13#10'  IDLog= :ID'#13#10
    MaxBlobSize = 32
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = MainData.SQLConnection
    Left = 40
    Top = 24
    object MasterDataSetIDLOG: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'IDLOG'
      Required = True
    end
    object MasterDataSetIDRECURSO: TIntegerField
      DisplayLabel = 'Recurso'
      FieldName = 'IDRECURSO'
      Required = True
    end
    object MasterDataSetIDUSUARIO: TIntegerField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'IDUSUARIO'
      Required = True
    end
    object MasterDataSetDATAHORA: TSQLTimeStampField
      DisplayLabel = 'Data e hora'
      FieldName = 'DATAHORA'
    end
    object MasterDataSetDESCRICAO: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
  object MasterProvider: TosSQLDataSetProvider
    DataSet = MasterDataSet
    Options = [poIncFieldProps, poNoReset]
    Left = 136
    Top = 24
  end
end
