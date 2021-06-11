unit ParametroUsuarioDataUn;

interface

uses
  SysUtils, Classes, FMTBcd, DB, Provider, osSQLDataSetProvider, SqlExpr,
  osCustomDataSetProvider, osUtils, osSQLDataSet;

type
  TParametroUsuarioData = class(TDataModule)
    MasterDataSet: TosSQLDataset;
    MasterProvider: TosSQLDataSetProvider;
    MasterDataSetIDPARAMETROUSUARIO: TIntegerField;
    MasterDataSetNOMEPARAMETRO: TWideStringField;
    MasterDataSetDESCRICAO: TWideStringField;
    MasterDataSetCONTEUDO: TWideStringField;
    MasterDataSetTIPODADO: TWideStringField;
  private

  public
    procedure Validate(PDataSet: TDataSet);
  end;

var
  ParametroUsuarioData: TParametroUsuarioData;

implementation

uses osErrorHandler, SQLMainData;

{$R *.dfm}

procedure TParametroUsuarioData.Validate(PDataSet: TDataSet);
var
  sTipoDado : string;
  sConteudo : string;
{
  i : integer;
  d : double;
}
begin
  with PDataSet, HError do
  begin
    Clear;
    CheckEmpty(FieldByName('NomeParametro'));
    WarningEmpty(FieldByName('Descricao'));
    sTipoDado := FieldByName('TipoDado').AsString;
    if IsEmpty(sTipoDado) then
      Add('Falta informar o Tipo de Dado')
    else if sTipoDado[1] in ['C', 'I', 'V', 'M', 'D'] then
    begin
      sConteudo := FieldByName('Conteudo').AsString;
      CheckEmpty(sConteudo, 'Conteudo');
      try
        if sTipoDado = 'I' then
          {i :=} StrToInt(sConteudo)
        else if sTipoDado = 'V' then
          {d :=} StrToFloat(sConteudo);
      except
        Add('Conteúdo incompatível com o tipo de dado');
      end;
    end
    else
      Add('Tipo de dado deve ser: I = inteiro, V = valor, M = memorando ou D = data');

    Check;
  end;
end;

initialization
  OSRegisterClass(TParametroUsuarioData);

end.
