unit osCIC;

interface

uses SysUtils;

function CharToInt(PChar: char): integer;
function CalcDV_CNPJ(PCNPJ: string): integer;
function CalcDV_CNPJ_Alfanumerico(PCNPJ: string): integer;
function CalcDV_CPF(PCPF: string): integer;
function CalcDV_Modulo11(PNumero: integer): integer;

implementation

function CalcDV_CNPJ(PCNPJ: string): integer;
var
	i : integer;
	Num : integer;
	Soma : integer;
	Peso : integer;
  DV1 : integer;
  DV2 : integer;
begin
	if Length(PCNPJ) <> 14 then
		Result := -1
  else
	if Copy(PCNPJ, 1, 7) = Copy(PCNPJ, 8, 7) then
		Result := -1
  else
  begin
  	Soma := 0;
  	Peso := 9;

	  for i := 12 downto 1 do
  	begin
	  	Num := CharToInt(PCNPJ[i]);
  		Soma := Soma + (Num * Peso);
  		if Peso = 2 then
	  		Peso := 9
		  else
			  Dec(Peso);
  	end;

	  if (Soma Mod 11) = 10 then
		  DV1 := 0
  	else
	  	DV1 := (Soma Mod 11);

    Soma := 0;
    Peso := 9;
    for i := 13 downto 1 do
    begin
      Num := CharToInt(PCNPJ[i]);
      Soma := Soma + (Num * Peso);
      if Peso = 2 then
        Peso := 9
      else
        Dec(Peso);
    end;

    if (Soma Mod 11) = 10 then
      DV2 := 0
    else
      DV2 := (Soma Mod 11);

    Result := DV1 * 10 + DV2;
  end;
end;

function CalcDV_CNPJ_Alfanumerico(PCNPJ: string): integer;
var
	i : integer;
	Num : integer;
	Soma : integer;
	Peso : integer;
  DV1 : integer;
  DV2 : integer;
begin
	if Length(PCNPJ) <> 14 then
		Result := -1
  else
	if Copy(PCNPJ, 1, 7) = Copy(PCNPJ, 8, 7) then
		Result := -1
  else
  begin
  	Soma := 0;
  	Peso := 2;

	  for i := 12 downto 1 do
  	begin

	  	Num := CharToInt(PCNPJ[i]);
  		Soma := Soma + (Num * Peso);
  		if Peso = 9 then
	  		Peso := 2
		  else
			  Inc(Peso);
  	end;

	  if (Soma Mod 11) < 2 then
		  DV1 := 0
  	else
	  	DV1 := 11 - (Soma Mod 11);

    Soma := 0;
    Peso := 2;
    for i := 13 downto 1 do
    begin
      Num := CharToInt(PCNPJ[i]);
      Soma := Soma + (Num * Peso);
      if Peso = 9 then
        Peso := 2
      else
        Inc(Peso);
    end;

    if (Soma Mod 11) < 2 then
      DV2 := 0
    else
      DV2 := 11 - (Soma Mod 11);

    Result := DV1 * 10 + DV2;
  end;
end;

function CalcDV_CPF(PCPF: string): integer;
var
	i : integer;
	Num : integer;
  Peso : integer;
	Soma : integer;
  DV1 : integer;
  DV2 : integer;
begin
	if Length(PCPF) <> 11 then
		Result := -1
  else
  begin
  	Soma := 0;
    Peso := 2;
    for i := 9 downto 1 do
    begin
      Num := CharToInt(PCPF[i]);
      Soma := Soma + (Num * Peso);
      Inc(Peso);
    end;

    if (11 - (Soma Mod 11)) >= 10 then
      DV1 := 0
    else
      DV1 := (11 - (Soma Mod 11));

    Soma := 0;
    Peso := 2;
    for i := 10 downto 1 do
    begin
      Num := CharToInt(PCPF[i]);
      Soma := Soma + (Num * Peso);
      Inc(Peso);
    end;

    if (11 - (Soma Mod 11)) >= 10 then
      DV2 := 0
    else
      DV2 := (11 - (Soma Mod 11));

    Result := DV1 * 10 + DV2
  end;
end;

function CalcDV_Modulo11(PNumero: integer): integer;
var
  s : string;
  Num : integer;
  Soma : integer;
  Peso : integer;
  i : integer;
begin
  s := IntToStr(PNumero);
 	Soma := 0;
  Peso := 9;

	for i := Length(s) downto 1 do
	begin
  	Num := CharToInt(s[i]);
 		Soma := Soma + (Num * Peso);
 		if Peso = 2 then
  		Peso := 9
	  else
		  Dec(Peso);
 	end;

  if (Soma Mod 11) = 10 then
    Result := 0
 	else
    Result := (Soma Mod 11);
end;


function CharToInt(PChar: char): integer;
begin
  Result := byte(PChar) - 48;
end;

end.





