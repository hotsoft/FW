unit osFuncoesParser;

interface

uses sysUtils, Classes, Math;

function seno(Parametros: TList): Double; forward;
function cosen(Parametros: TList): Double; forward;
function potencia(Parametros: TList): Double; forward;
function raiz(Parametros: TList): Double; forward;
function teste(Parametros: TList): Double; forward;
function iif(Parametros: TList): Double; forward;
function sub(Parametros: TList): string; forward;
function sif(Parametros: TList): string; forward;
function sel(Parametros: TList): string; forward;
function num(Parametros: TList): Double; forward;
function concat(Parametros: TList): string; forward;
function str(Parametros: TList): string; forward;
function round(Parametros: TList): Double; forward;
function masc(Parametros: TList): string; forward;
function equal(Parametros: TList): Double; forward;
function trimstr(Parametros: TList): string; forward;
function maiusculo(Parametros: TList): string; forward;
function minusculo(Parametros: TList): string; forward;
function inicial(Parametros: TList): string; forward;
function logaritmo(Parametros: TList): double; forward;


implementation

function seno(Parametros: TList): Double;
begin
  Result := Sin(Double(Parametros.Items[0]^));
end;

function cosen(Parametros: TList): Double;
begin
  Result := cos(Double(Parametros.Items[0]^));
end;

function potencia(Parametros: TList): Double;
begin
  Result := Power(Double(Parametros.Items[0]^), Double(Parametros.Items[1]^));
end;

function raiz(Parametros: TList): Double;
begin
  Result := Sqrt(Double(Parametros.Items[0]^));
end;

function teste(Parametros: TList): Double;
begin
  Result := Double(Parametros.Items[0]^);
  if Result <> 1 then
    raise Exception.Create('Teste inválido');
end;

function iif(Parametros: TList): Double;
var
  ExpLogica: double;
begin
  ExpLogica := Double(Parametros.Items[2]^);
  if ExpLogica <> 1 then
    Result := Double(Parametros.Items[0]^)
  else
    Result := Double(Parametros.Items[1]^);
end;

function sub(Parametros: TList): string;
var
  valor, antigo, novo: String;
  dvalor: Double;
begin
  valor := PChar(Parametros.Items[2]);
  if valor = '' then
  begin
    dvalor := Double(Parametros.Items[2]^);
    valor := FloatToStr(dvalor);
  end;
  antigo := PChar(Parametros.Items[1]);
  novo := PChar(Parametros.Items[0]);
  Result := StringReplace(valor,antigo,novo,[rfReplaceAll, rfIgnoreCase]);
end;

function sif(Parametros: TList): string;
var
  ExpLogica: double;
begin
  ExpLogica := Double(Parametros.Items[2]^);
  if ExpLogica <> 1 then
    Result := PChar(Parametros.Items[0])
  else
    Result := PChar(Parametros.Items[1]);
end;

function sel(Parametros: TList): string;
var
  valor: String;
  inicio, qtde: Integer;
begin
  valor := PChar(Parametros.Items[2]);
  inicio := trunc(Double(Parametros.Items[1]^));
  qtde := trunc(Double(Parametros.Items[0]^));
  Result := Copy(valor, inicio, qtde);
end;

function num(Parametros: TList): Double;
begin
  try
    Result := StrToFloat(PChar(Parametros.Items[0]));
  except
    Result := 0;
  end;
end;

function concat(Parametros: TList): string;
var
  v1,v2: string;
begin
  v1 := PChar(Parametros.Items[1]);
  v2 := PChar(Parametros.Items[0]);
  Result := v1 + v2;
end;

function str(Parametros: TList): string;
begin
  Result := FloatToStr(Double(Parametros.Items[0]^));
end;

function round(Parametros: TList): Double;
begin
  Result := Trunc(Double(Parametros.Items[0]^));
end;

function masc(Parametros: TList): string;
begin
  Result := FormatFloat(PChar(Parametros.Items[1]), Double(Parametros.Items[0]^));
end;

function equal(Parametros: TList): Double;
var
  s1, s2: string;
begin
  s1 := PChar(Parametros.Items[1]);
  s2 := PChar(Parametros.Items[0]);
  if (AnsiUpperCase(s1) = AnsiUpperCase(s2)) then
    Result := 1
  else
    Result := 2;
end;

function trimstr(Parametros: TList): string;
begin
  Result := Trim(PChar(Parametros.Items[0]));
end;

function maiusculo(Parametros: TList): string;
begin
  Result := AnsiUpperCase(PChar(Parametros.Items[0]));
end;

function minusculo(Parametros: TList): string;
begin
  Result := AnsiLowerCase(PChar(Parametros.Items[0]));
end;

function inicial(Parametros: TList): string;
var
  texto: string;
begin
  texto := AnsiUpperCase(PChar(Parametros.Items[0]));
  Result := AnsiUpperCase(Copy(texto,1,1))+AnsiLowerCase(Copy(texto,2, Length(texto)));
end;

function logaritmo(Parametros: TList): double;
begin
  Result := Math.LogN(double(Parametros.Items[0]^), double(Parametros.Items[1]^));
end;

end.
