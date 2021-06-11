object ReportBaseData: TReportBaseData
  OldCreateOrder = False
  Left = 402
  Top = 195
  Height = 207
  Width = 327
  object MasterDataSource: TDataSource
    DataSet = MasterClientDataset
    Left = 40
    Top = 64
  end
  object MasterDBPipeline: TppDBPipeline
    DataSource = MasterDataSource
    UserName = 'MasterDBPipeline'
    Left = 40
    Top = 112
  end
  object Report: TppReport
    AutoStop = False
    DataPipeline = MasterDBPipeline
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 - 21 x 29,7 cm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14552
    PrinterSetup.mmMarginLeft = 14552
    PrinterSetup.mmMarginRight = 14552
    PrinterSetup.mmMarginTop = 14552
    PrinterSetup.mmPaperHeight = 297128
    PrinterSetup.mmPaperWidth = 210080
    PrinterSetup.PaperSize = 9
    Units = utScreenPixels
    DeviceType = 'Screen'
    OnPreviewFormCreate = ReportPreviewFormCreate
    Left = 256
    Top = 16
    Version = '6.03'
    mmColumnWidth = 188914
    DataPipelineName = 'MasterDBPipeline'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26458
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 20108
        mmWidth = 180976
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NOMEFANTASIA'
        DataPipeline = ParametroDBPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ParametroDBPipeline'
        mmHeight = 5292
        mmLeft = 24342
        mmTop = 0
        mmWidth = 111125
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'ENDERECO'
        DataPipeline = ParametroDBPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ParametroDBPipeline'
        mmHeight = 4233
        mmLeft = 24342
        mmTop = 6350
        mmWidth = 111125
        BandType = 0
      end
      object BairroCidadeUFVariable: TppVariable
        UserName = 'BairroCidadeUFVariable'
        AutoSize = False
        CalcOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 24342
        mmTop = 11642
        mmWidth = 111125
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'TELEFONE'
        DataPipeline = ParametroDBPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ParametroDBPipeline'
        mmHeight = 4233
        mmLeft = 39158
        mmTop = 16933
        mmWidth = 96309
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Fone(s):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 24342
        mmTop = 16933
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'OR'#199'AMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 7673
        mmLeft = 137584
        mmTop = 0
        mmWidth = 41540
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'LOGO'
        DataPipeline = MasterDBPipeline
        GraphicType = 'Bitmap'
        DataPipelineName = 'MasterDBPipeline'
        mmHeight = 21167
        mmLeft = 2117
        mmTop = 0
        mmWidth = 20108
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 9790
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 0
        mmTop = 2646
        mmWidth = 180976
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 157163
        mmTop = 3704
        mmWidth = 21960
        BandType = 8
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65061C
        42616972726F43696461646555465661726961626C654F6E43616C630B50726F
        6772616D54797065070B747450726F63656475726506536F7572636506D97072
        6F6365647572652042616972726F43696461646555465661726961626C654F6E
        43616C63287661722056616C75653A2056617269616E74293B0D0A626567696E
        0D0A202056616C7565203A3D20506172616D6574726F4442506970656C696E65
        5B2742414952524F275D202B2027202D2027202B0D0A20202020202020202020
        20506172616D6574726F4442506970656C696E655B27434944414445275D202B
        2027202D2027202B0D0A2020202020202020202020506172616D6574726F4442
        506970656C696E655B275546275D3B0D0A656E643B0D0A0D436F6D706F6E656E
        744E616D65061642616972726F43696461646555465661726961626C65094576
        656E744E616D6506064F6E43616C63074576656E74494402210000}
    end
  end
  object ParametroDataSource: TDataSource
    DataSet = ParametroClientDataset
    Left = 152
    Top = 64
  end
  object ParametroDBPipeline: TppDBPipeline
    DataSource = ParametroDataSource
    UserName = 'ParametroDBPipeline'
    Left = 152
    Top = 112
    object ParametroDBPipelineppField1: TppField
      FieldAlias = 'NOMEFANTASIA'
      FieldName = 'NOMEFANTASIA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ParametroDBPipelineppField2: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 1
    end
    object ParametroDBPipelineppField3: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 2
    end
    object ParametroDBPipelineppField4: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 40
      DisplayWidth = 40
      Position = 3
    end
    object ParametroDBPipelineppField5: TppField
      FieldAlias = 'UF'
      FieldName = 'UF'
      FieldLength = 2
      DisplayWidth = 2
      Position = 4
    end
    object ParametroDBPipelineppField6: TppField
      FieldAlias = 'TELEFONE'
      FieldName = 'TELEFONE'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ParametroDBPipelineppField7: TppField
      FieldAlias = 'LOGO'
      FieldName = 'LOGO'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 6
      Searchable = False
      Sortable = False
    end
  end
  object MasterClientDataset: TosClientDataset
    Aggregates = <>
    FetchOnDemand = False
    Params = <
      item
        DataType = ftInteger
        Precision = 10
        Name = 'ID'
        ParamType = ptInput
        Size = 4
      end>
    Left = 40
    Top = 16
  end
  object ParametroClientDataset: TosClientDataset
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    Left = 152
    Top = 16
    object ParametroClientDatasetNOMEFANTASIA: TWideStringField
      FieldName = 'NOMEFANTASIA'
      Size = 40
    end
    object ParametroClientDatasetENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Size = 40
    end
    object ParametroClientDatasetBAIRRO: TWideStringField
      FieldName = 'BAIRRO'
      Size = 40
    end
    object ParametroClientDatasetCIDADE: TWideStringField
      FieldName = 'CIDADE'
      Size = 40
    end
    object ParametroClientDatasetUF: TWideStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object ParametroClientDatasetTELEFONE: TWideStringField
      FieldName = 'TELEFONE'
    end
    object ParametroClientDatasetLOGO: TBlobField
      FieldName = 'LOGO'
      Size = 1
    end
  end
end
