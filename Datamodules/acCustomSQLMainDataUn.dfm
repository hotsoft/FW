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
  object SQLConnectionArquivos: TSQLConnection
    ConnectionName = 'IBArquivos'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver180.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=18.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver180.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=18.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Database=c:\db\arquivos.fdb'
      'User_Name=sysdba'
      'Password=masterkey'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'RoleName=RoleName'
      'ServerCharSet='
      'Trim Char=False')
    Left = 100
    Top = 225
  end
end
