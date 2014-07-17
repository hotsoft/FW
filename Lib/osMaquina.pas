unit osMaquina;

interface

uses  Classes, SysUtils, OsParser, osFuncoesParser, osParserErrorHand;

type
  { Item a ser usado em listas de busca por nome }
  TItemLookup = class
    FNome: String;
  public
    property Nome: String read FNome write FNome;
  end;

  { Listas de busca de item por nome }
  TListLookup = class(TList)

  public
    function LookUp(Nome: String): Pointer;
  end;

  { Representa uma variavel da maquina }
  TVariavelMaquina = class (TItemLookup)
    FValor: Variant;
  public
    constructor Create; overload;
    constructor Create(pNome: String; pValor: Variant); overload;

    property Nome: String read FNome write FNome;
    property Valor: Variant read FValor write FValor;
  end;

  { Representa funcao da maquina }
  TFuncaoCallback = function (Parametros: TList) : Double;
  TFuncaoStrCallback = function (Parametros: TList) : String;

  TFuncaoMaquina = class (TItemLookup)
    FNumeroParametros: Integer;
    FTipo: Char;
    FCallBack: TFuncaoCallback;
    FCallBackStr: TFuncaoStrCallback;
  public
    constructor Create(NomeFunc: String; NumParam: Integer;
                       Func: TFuncaoCallback); overload;
    constructor Create(NomeFunc: String; NumParam: Integer;
                       Func: TFuncaoStrCallback); overload;

    property Nome: String read FNome;
    property Tipo: Char read FTipo;    
    property CallBack: TFuncaoCallback read FCallBack;
    property CallBackStr: TFuncaoStrCallback read FCallBackStr;
  end;

  { Maquina virtual para processamento de expressoes aritmeticas }
  TosMaquina = class
    FpilhaExec: TStack;       // Pilha de execucao
    FParser: TosParser;
    FVariaveis: TListLookUp;  // Listas de variaveis e funcoes definidas
    FFuncoes: TListLookUp;
    FResultado: Double;       // Resultado do processamento
    FResultadoStr: string;       // Resultado do processamento    
    FnLinhaProc: Integer;     // Linha atual sendo processada
    FnNumArg: Integer;  // Linha de inicio de leitura de argumento
    FListaErros: TListErro;   // Lista de Erros ocorridos
    FStrings: TStringList;

  private
    procedure ProcessaInstrucao(bytecode: Integer; Parametro: String);
    procedure ProcessaFuncao(NomeFuncao: String);
    procedure ProcessaOperador(Operador: String);
    procedure ProcessaOperadorUnario(Operador: String);

    function RecuperaErro(Index: Integer): TNodoErro;
    function RecuperaNumeroErros: Integer;
    function LeVariavel(NomeVar: String): Double;

    procedure pSetaVariavel(NomeVar: String; Value: Double);    
  public
    constructor Create;
    destructor Destroy; override;
    function Exec: Boolean;

    // registra funçoes do usuario

    procedure RegisterUserFunction(Name: string; NumParams: integer; FunctionPointer: TFuncaoCallback);

    // Cria/atribui valores aa variaveis
    function SetaVariavel(NomeVar: String; Value: Variant): Boolean;

    // propriedades
    property Resultado: Double read FResultado;
    property ResultadoStr: string read FResultadoStr;    
    property Parser: TosParser read FParser write FParser;
    property Variavel[NomeVar: String]: Double read LeVariavel write pSetaVariavel;
    property ListaVariavel: TListLookup read FVariaveis;

    property ListaErros: TListErro read FListaErros;
    property Erros[Index: integer]: TNodoErro read RecuperaErro;
    property nErros: Integer read RecuperaNumeroErros;

  end;

  { Tipos possiveis de instrucao da maquina }
  TTipoInstrucao =
    (tiFunc = 0, tiArg, tiConstNum, tiConstBool, tiConstString, tiRValue, tiOp, tiOpUn);

  { Erros possiveis }
  TerrMaquina =
    ( emNone = 0,
      emFaltaParser,
      emFaltaOperandos,
      emSobraOperandos,
      emVariavelIndefinida,
      emFuncaoIndefinida,
      emNumParametIncorreto,
      emErroDoParser,
      emNomeInvalido,
      emInstrucaoInvalida,
      emFaltaResultado,
      emErroInternoFuncao
    );

const
  { Estampas do programa na maquina }
  Estampas : Array [0..Ord(High(TTipoInstrucao))] of String =
    (('func'),
     ('arg'),
     ('constnum'),
     ('constbool'),
     ('conststring'),
     ('rvalue'),
     ('op'),
     ('opun'));

implementation

uses Variants;

{ TVariavelMaquina }

constructor TVariavelMaquina.Create;
begin
  FNome := '';
  FValor := 0;
end;

constructor TVariavelMaquina.Create(pNome: String; pValor: Variant);
begin
  FNome := pNome;
  FValor := pValor;
end;

{ TosMaquina }

constructor TosMaquina.Create;
begin
  FVariaveis := TListLookup.Create;
  FFuncoes := TListLookup.Create;
  FListaErros := TListErro.Create;  
  FParser := nil;
  FPilhaExec := TStack.Create;

  // Cria funcoes internas
  FFuncoes.Add(TFuncaoMaquina.Create('SIN', 1, seno));
  FFuncoes.Add(TFuncaoMaquina.Create('COS', 1, cosen));
  FFuncoes.Add(TFuncaoMaquina.Create('POW', 2, potencia));
  FFuncoes.Add(TFuncaoMaquina.Create('SQRT', 1, raiz));
  FFuncoes.Add(TFuncaoMaquina.Create('TEST', 1, teste));
  FFuncoes.Add(TFuncaoMaquina.Create('IIF', 3, iif));
  FFuncoes.Add(TFuncaoMaquina.Create('SUB', 3, sub));
  FFuncoes.Add(TFuncaoMaquina.Create('SIF', 3, sif));
  FFuncoes.Add(TFuncaoMaquina.Create('SEL', 3, sel));
  FFuncoes.Add(TFuncaoMaquina.Create('NUM', 1, num));
  FFuncoes.Add(TFuncaoMaquina.Create('STR', 1, str));
  FFuncoes.Add(TFuncaoMaquina.Create('CONCAT', 2, concat));
  FFuncoes.Add(TFuncaoMaquina.Create('ROUND', 1, round));
  FFuncoes.Add(TFuncaoMaquina.Create('MASC', 2, masc));
  FFuncoes.Add(TFuncaoMaquina.Create('EQUAL', 2, equal));
  FFuncoes.Add(TFuncaoMaquina.Create('TRIM', 1, trimstr));
  FFuncoes.Add(TFuncaoMaquina.Create('MAIUSCULO', 1, maiusculo));  
end;

destructor TosMaquina.Destroy;
begin
  FPilhaExec.Free;
  FVariaveis.Free;
  FFuncoes.Free;
  FStrings.Free;
end;


procedure TosMaquina.RegisterUserFunction(Name: string; NumParams: integer; FunctionPointer: TFuncaoCallback);
begin
  FFuncoes.Add(TFuncaoMaquina.Create(Name, NumParams, FunctionPointer));
end;

function TosMaquina.SetaVariavel(NomeVar: String; Value: Variant): Boolean;
var
  Variavel: TVariavelMaquina;
begin
  FListaErros.Clear;

  { Obrigatorio parser definido porque eh o parser que valida o nome do
    identificador }
  if Parser = nil then
  begin
    FListaErros.Add(epError, Ord(emFaltaParser), 'Parser indefinido', []);
    Result := False;
    Exit;
  end;

  Variavel := FVariaveis.LookUp(NomeVar);
  if Variavel = nil then
  begin
    if FFuncoes.LookUp(NomeVar) <> nil then
    begin
      FListaErros.Add(epError, Ord(emNomeInvalido),
                      'Nome dado a variável é nome de uma função.', []);
      Result := False;
      Exit;
    end;

    if not(Parser.ValidaIdentificador(NomeVar)) then
    begin
      FListaErros.Add(epError, Ord(emNomeInvalido),
                      'Nome invalido para variavel', []);
      Result := False;
      Exit;
    end;
    FVariaveis.Add(TVariavelMaquina.Create(NomeVar, Value));
  end
  else
    Variavel.Valor := Value;

  Result := True;
end;

{ Rotina principal de execucao da maquina virtual }
function TosMaquina.Exec: Boolean;
var
  Linha: String;
  PosInstrucao: Integer;
  Instrucao: String;
  bytecode: Integer;
begin
  if Parser = nil then
  begin
    // E obrigatorio definir o parser
    Result := False;
    FListaErros.Add(epError, Ord(emFaltaParser), 'Parser indefinido.', []);
    Exit;
  end;

  // Remove os erros registrados anteriormente e esvazia pilha de execucao
  FListaErros.Clear;
  FPilhaExec.Clear;

  // Se parser indicar que expressao nao foi compilada, compila-a
  if not(Parser.Compilado) then
  begin
    if not(Parser.Compile) then
    begin
      // Erro de parsing
      FListaErros.Add(epError, Ord(emErroDoParser), 'Erro do parser.', []);
      Result := False;
      Exit;
    end;
  end;

  if FParser.Programa.nLinhas = 0 then
  begin
    // Programa com 0 linhas, resultado default eh 0
    FResultado := 0;
    Result := True;
    Exit;
  end;  

  FnLinhaProc := 0;
  FnNumArg := 0; // nenhum argumento lido

  // processa as linhas do programa
  while FnLinhaProc < FParser.Programa.nLinhas do
  begin
    Linha := FParser.Programa.Linhas[FnLinhaProc];
    Inc(FnLinhaProc);

    PosInstrucao := AnsiPos(':', Linha);
    Instrucao := Copy(Linha, 1, PosInstrucao-1);

    // determina codigo da instrucao
    bytecode := 0;
    while (bytecode <= Ord(High(TTipoInstrucao))) and (Instrucao <> Estampas[bytecode]) do
      Inc(bytecode);

    if bytecode > Ord(High(TTipoInstrucao)) then
    begin
      FListaErros.Add(epError, Ord(emInstrucaoInvalida),
                      'Instrucao "%s" invalida encontrada!', [ Instrucao ]);
      Result := False;
      Exit;
    end
    else
    begin
      // copia parametro da instrucao e a processa
      Instrucao := Copy(Linha, PosInstrucao + 1, Length(Linha) - PosInstrucao);
      ProcessaInstrucao(bytecode, Instrucao);
    end;
  end;

  if FpilhaExec.Count = 0 then
  begin
    // Faltou o resultado na pilha
    FListaErros.Add(epError, Ord(emFaltaResultado),
                    'Erro interno: faltou resultado na pilha!', []);
    Result := False;
    Exit;
  end;

  // Ultimo elemento da pilha deve ser o resultado
  if FResultadoStr <> '' then
  begin
    FpilhaExec.pop;
  end
  else
  begin
    FResultado := Double(FpilhaExec.pop^);
  end;


  if FpilhaExec.Count <> 0 then
  begin
    // nao pode sobrar operandos na pilha
    Result := False;
    Exit;
  end;

  Result := FListaErros.Count = 0;
end;

procedure TosMaquina.ProcessaInstrucao(bytecode: Integer; Parametro: String);
var
  ValorVar: ^Double;
  ValorString: PChar;
  stringVar: string;
  doubleAux: Double;
  Variavel: TVariavelMaquina;
begin
    case bytecode of
      ord(tiArg): // numero de argumentos lidos
        begin
          // marca a linha onde comeca a leitura de argumentos
          FnNumArg := StrToInt(Parametro);
        end;

      ord(tiFunc): // funcoes
        begin
          ProcessaFuncao(Parametro);
        end;

      ord(tiOp): // operadores binarios
        begin
          ProcessaOperador(Parametro);
        end;

      ord(tiOpUn): // operadores unarios
        begin
          ProcessaOperadorUnario(Parametro);
        end;

      ord(tiConstNum): // constantes numericas
        begin
          New(ValorVar);
          ValorVar^ := StrToFloat(Parametro);
          FpilhaExec.push(ValorVar);
        end;

     ord(tiConstBool): // constantes booleanas
        begin
          New(ValorVar);
          if Parametro = 'TRUE' then
            ValorVar^ := 1
          else
            ValorVar^ := 0;
          FpilhaExec.push(ValorVar);
        end;

     ord(tiConstString): // constantes string
        begin
          if FStrings = nil then
            FStrings := TStringList.Create;
          ValorString := PChar(FStrings.Strings[
            FStrings.Add(StringReplace(Parametro,'"','',[rfReplaceAll]))]);
          FpilhaExec.push(ValorString);
        end;

     ord(tiRValue): // variaveis
        begin
          // obter valor variavel
          Variavel := FVariaveis.LookUp(Parametro);
          New(ValorVar);

          if Variavel = nil then
          begin
            // variavel inexistente
            FListaErros.Add(epError, Ord(emVariavelIndefinida),
                'Variavel %s nao foi definida', [ Parametro ]);

            // empilha um valor falso para poder continuar a processar
            ValorVar^ := 1;
          end
          else
          begin
            if (not VarIsNull(Variavel.Valor)) then
            begin
              if (TryStrToFloat(Variavel.Valor,doubleAux)) and
                 (Pos('ST_', UpperCase(Parametro)) = 0) then
              begin
                ValorVar^ := Variavel.Valor;
                FpilhaExec.push(ValorVar);
              end
              else
              begin
                ValorString := PChar(string(Variavel.Valor));
                FpilhaExec.push(ValorString);
              end;
            end
            else
            begin
              if FStrings = nil then
                FStrings := TStringList.Create;
              ValorString := PChar(FStrings.Strings[FStrings.Add(' ')]);
              FpilhaExec.push(ValorString);
            end;
          end;
        end;

    end;
end;

procedure TosMaquina.ProcessaFuncao(NomeFuncao: String);
var
  Funcao : TFuncaoMaquina;
  Argumentos : TList;
  i: Integer;
  Res: ^Double;
  PStr: PChar;
begin
  // Procura funcao em questao
  Funcao := FFuncoes.LookUp(NomeFuncao);

  // Variavel com resultado a ser empilhado
  New(Res);
  if Funcao = nil then
  begin
    // Funcao inexistente
    FListaErros.Add(epError, Ord(emFuncaoIndefinida),
        'Funcao %s nao foi definida', [ NomeFuncao ]);

    // empilha 1 para que possa continuar
    Res^ := 1;
    FpilhaExec.push(Res);
    Exit;
  end;

  // confere se numero de argumentos passados esta correto
  if Funcao.FNumeroParametros <> FnNumArg then
  begin
    // Numero incorreto de parametros
    FListaErros.Add(epError, Ord(emNumParametIncorreto),
        'Numero incorreto de parametros para funcao %s. ' +
        'Esperava-se %d parametros, mas foram encontrados %d.',
        [ NomeFuncao, Funcao.FNumeroParametros, FnNumArg ]);

    // empilha 1 para que possa continuar
    Res^ := 1;
    FpilhaExec.push(Res);
    Exit;
  end;

  // desempilha N operandos, sendo N o numero de argumentos
  i := 0;
  Argumentos := TList.Create;
  Argumentos.Capacity := Funcao.FNumeroParametros;
  while (i < Funcao.FNumeroParametros) and (FpilhaExec.Count > 0) do
  begin
    Argumentos.Add(FPilhaExec.pop);
    inc(i);
  end;

  if i < Funcao.FNumeroParametros then
  begin
    // Erro interno na pilha: nao foi acumulado qtde correta de parametros
    FListaErros.Add(epError, Ord(emFaltaOperandos),
        'Erro interno executando funcao "%s". Faltaram operandos',
        [ NomeFuncao ]);
    Exit;
  end;

  // Finalmente, chama a callback e executa a funcao
  try
    if Funcao.Tipo = 'D' then
    begin
      Res^ := Funcao.CallBack(Argumentos);
      FpilhaExec.push(Res);
    end
    else
    begin
      if FStrings = nil then
        FStrings := TStringList.Create;
      PStr := PChar(FStrings.Strings[FStrings.Add(Funcao.CallBackStr(Argumentos))]);
      FpilhaExec.push(PStr);
      FResultadoStr := PStr;
    end;
  except
    on E: Exception do
    // Erro interno na chamada da função
    begin
      if Copy(E.Message, 1, 1) = '*' then
        FListaErros.Add(epError, Ord(emErroInternoFuncao), '%s', [E.Message] )
      else
        FListaErros.Add(epError, Ord(emErroInternoFuncao),
          'Erro interno executando funcao "%s": %s',
          [ NomeFuncao, E.Message ]);
    end;
  end;

  Argumentos.Free;
end;

procedure TosMaquina.ProcessaOperador(Operador: String);
var
  Arg1, Arg2: Double;
  Aux: double;
  Res: ^Double;
begin
  New(Res);
  if (FPilhaExec.Count < 2) then
  begin
    // Erro interno na pilha: nao foi acumulado qtde correta de parametros
    FListaErros.Add(epError, Ord(emFaltaOperandos),
        'Erro interno executando operacao "%s". Operandos insuficientes.',
        [ Operador ]);

    // empilha 1 para que seja possivel continuar
    Res^ := 1;
    FpilhaExec.push(Res);
    Exit;
  end;

  Arg2 := Double(FPilhaExec.pop^);
  Arg1 := Double(FPilhaExec.pop^);

  if Operador = '+' then
  begin
    Res^ := Arg1+Arg2;
    FpilhaExec.push(Res);
  end
  else
  if Operador = '-' then
  begin
    Res^ := Arg1-Arg2;
    FpilhaExec.push(Res);
  end
  else
  if Operador = '/' then
  begin
    Res^ := Arg1/Arg2;
    FpilhaExec.push(Res);
  end
  else
  if Operador = '*' then
  begin
    Res^ := Arg1*Arg2;
    FpilhaExec.push(Res);
  end
  else
  if Operador = '>' then
  begin
    if Arg1 > Arg2 then
      Res^ := 1
    else
      Res^ := 0;
    FpilhaExec.push(Res);
  end
  else
  if Operador = '<' then
  begin
    if Arg1 < Arg2 then
      Res^ := 1
    else
      Res^ := 0;
    FpilhaExec.push(Res);
  end
  else
  if Operador = '<=' then
  begin
    if Arg1 <= Arg2 then
      Res^ := 1
    else
      Res^ := 0;
    FpilhaExec.push(Res);
  end
  else
  if Operador = '>=' then
  begin
    if Arg1 >= Arg2 then
      Res^ := 1
    else
      Res^ := 0;
    FpilhaExec.push(Res);
  end
  else
  if Operador = '=' then
  begin
    if Arg1 = Arg2 then
      Res^ := 1
    else
      Res^ := 0;

    FpilhaExec.push(Res);
  end
  else
  if Operador = '<>' then
  begin
    if Arg1 <> Arg2 then
      Res^ := 1
    else
      Res^ := 0;
    FpilhaExec.push(Res);
  end
  else
  if Operador = 'AND' then
  begin
    if (Arg1 <> 0) and (Arg2 <> 0) then
      Res^ := 1
    else
      Res^ := 0;
    FpilhaExec.push(Res);
  end
  else
  if Operador = 'OR' then
  begin
    if (Arg1 <> 0) or (Arg2 <> 0) then
      Res^ := 1
    else
      Res^ := 0;
    FpilhaExec.push(Res);
  end
  else
  if Operador = 'XOR' then
  begin
    if (Arg1 <> 0) xor (Arg2 <> 0) then
      Res^ := 1
    else
      Res^ := 0;
    FpilhaExec.push(Res);
  end
  else
  if Operador = 'MOD' then
  begin
    Aux := Trunc(Arg1 / Trunc(Arg2));
    Res^ := Trunc(Arg1) - (Aux * Trunc(Arg2));
    FpilhaExec.push(Res);
  end
  else
  if Operador = 'DIV' then
  begin
    Res^ := Trunc(Arg1 / Trunc(Arg2));
    FpilhaExec.push(Res);
  end;


end;

procedure TosMaquina.ProcessaOperadorUnario(Operador: String);
var
  Arg: Double;
  Res: ^Double;
begin
  New(Res);
  if (FPilhaExec.Count < 1) then
  begin
    // Erro interno na pilha: nao foi acumulado qtde correta de parametros
    FListaErros.Add(epError, Ord(emFaltaOperandos),
        'Erro interno executando operacao unaria "%s". Operandos insuficientes.',
        [ Operador ]);

    // empilha 1 para que seja possivel continuar
    Res^ := 1;
    FpilhaExec.push(Res);
    Exit;
  end;

  Arg := Double(FPilhaExec.pop^);

  if Operador = 'NOT' then
  begin
    if (Arg = 0) then
      Res^ := 1
    else
      Res^ := 0;
    FpilhaExec.push(Res);
  end
  else
  if Operador = '+' then
  begin
    Res^ := Arg;
    FpilhaExec.push(Res);
  end
  else
  if Operador = '-' then
  begin
    Res^ := -Arg;
    FpilhaExec.push(Res);
  end;
end;

function TosMaquina.RecuperaErro(Index: Integer): TNodoErro;
begin
  Result := FListaErros.Items[Index];
end;

function TosMaquina.RecuperaNumeroErros: Integer;
begin
  Result := FListaErros.Count;
end;

function TosMaquina.LeVariavel(NomeVar: String): Double;
var
  Variavel: TVariavelMaquina;
begin
  Variavel := FVariaveis.LookUp(NomeVar);
  if Variavel = nil then
  begin
    SetaVariavel(NomeVar, 0);
    Result := 0;
  end
  else
    Result := Variavel.Valor;
end;

procedure TosMaquina.pSetaVariavel(NomeVar: String; Value: Double);
begin
  if not(SetaVariavel(NomeVar, Value)) then
    raise Exception.Create('Nome inválido para variável!');
end;

{ TFuncaoMaquina }

constructor TFuncaoMaquina.Create(NomeFunc: String; NumParam: Integer;
  Func: TFuncaoCallback);
begin
  // tratar nomes invalidos de funcoes
  FNome := NomeFunc;
  FNumeroParametros := NumParam;
  FCallBack := @Func;
  FTipo := 'D';
end;

constructor TFuncaoMaquina.Create(NomeFunc: String; NumParam: Integer;
  Func: TFuncaoStrCallback);
begin
  FNome := NomeFunc;
  FNumeroParametros := NumParam;
  FCallBackStr := @Func;
  FTipo := 'S';  
end;

{ TListLookup }

function TListLookup.LookUp(Nome: String): Pointer;
var
  i: Integer;
begin
  i := 0;
  while (i < Self.Count) and (Nome <> TItemLookUp(Items[i]).Nome) do
    inc(i);

  if i >= Self.Count then
    Result := nil
  else
    Result := Items[i];
end;

end.
