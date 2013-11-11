object acCustomSQLMainData: TacCustomSQLMainData
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 589
  Top = 132
  Height = 365
  Width = 631
  object spGetNewSequence: TStoredProc
    StoredProcName = 'dbo.cc_GetNewSequence'
    Left = 100
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@Name'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@Value'
        ParamType = ptOutput
      end>
  end
  object prvFilter: TosSQLDataSetProvider
    DataSet = FilterQuery
    Options = [poReadOnly, poNoReset, poAllowCommandText]
    Left = 348
    Top = 96
  end
  object SQLConnection: TosSQLConnection
    ConnectionName = 'IBLocal'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'BlobSize=32'
      'CommitRetain='
      
        'Database=localhost:C:\projetos\clientes\labmaster\DB\cli\LabMast' +
        'er.GDB'
      'DriverName=Interbase'
      'ErrorResourceFile='
      'LocaleCode='
      'Password=masterkey'
      'RoleName='
      'ServerCharSet='
      'SQLDialect=3'
      'Interbase TransIsolation='
      'User_Name=SYSDBA'
      'WaitOnLocks=')
    VendorLib = 'GDS32.dll'
    Left = 100
    Top = 80
  end
  object FilterQuery: TosSQLDataSet
    MaxBlobSize = 32
    Params = <>
    SQLConnection = SQLConnection
    Left = 292
    Top = 96
  end
  object SQLMonitor: TSQLMonitor
    FileName = 'c:\logdolm.txt'
    SQLConnection = SQLConnection
    Left = 192
    Top = 80
  end
  object SQLConnectionMeta: TosSQLConnection
    ConnectionName = 'IBLocal'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'BlobSize=32'
      'CommitRetain='
      
        'Database=localhost:C:\projetos\clientes\labmaster\DB\cli\LabMast' +
        'er.GDB'
      'DriverName=Interbase'
      'ErrorResourceFile='
      'LocaleCode='
      'Password=masterkey'
      'RoleName='
      'ServerCharSet='
      'SQLDialect=3'
      'Interbase TransIsolation='
      'User_Name=SYSDBA'
      'WaitOnLocks=')
    VendorLib = 'GDS32.dll'
    Left = 100
    Top = 152
  end
end
