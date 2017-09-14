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
    DriverName = 'Interbase'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=database.gdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
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
