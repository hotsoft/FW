object acCustomSQLMainData: TacCustomSQLMainData
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 365
  Width = 631
  object prvFilter: TosSQLDataSetProvider
    DataSet = FilterQuery
    Options = [poReadOnly, poNoReset, poAllowCommandText]
    Left = 348
    Top = 96
  end
  object SQLConnection: TosSQLConnection
    ConnectionName = 'IBConnection'
    DriverName = 'DevartMySQL'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=DbxDevartMySql'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXCommonDriver180.' +
        'bpl'
      
        'MetaDataPackageLoader=TDBXDevartMySqlMetaDataCommandFactory,DbxD' +
        'evartMySqlDriver180.bpl'
      'ProductName=DevartMySQL'
      'GetDriverFunc=getSQLDriverMySQL'
      'LibraryName=dbexpmda40.dll'
      'VendorLib=libmysql.dll'
      'LibraryNameOsx=libdbexpmda40.dylib'
      'VendorLibOsx=libmysql.dylib'
      'MaxBlobSize=-1'
      'FetchAll=True'
      'EnableBoolean=False'
      'UseUnicode=True'
      'IPVersion=IPv4'
      'BlobSize=-1'
      'HostName=localhost'
      'DataBase=labmaster'
      'User_Name=root'
      'Password=senhaMySql')
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
    Left = 100
    Top = 152
  end
end
