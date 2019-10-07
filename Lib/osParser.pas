unit osParser;

interface

uses osLex, Classes, SysUtils, osParserErrorHand, System.Types;

type
  // representa uma pilha generica
  TStack = class (TList)
  public
    procedure push(const E: Pointer);
    function pop: Pointer;
  end;

  // Representa um programa de expressoes a ser executado por uma maquina  
  TExprPrograma = class
    FFonte: AnsiString;
    FnLinhas: Integer;

  private
    function LeLinha(Index: Integer): String;

  public
    constructor Create;

    procedure emit_Func(NomeFunc: String);
    procedure emit_FuncArg(NumArgumentos: Integer);
    procedure emit_ConstNum(Num: String);
    procedure emit_ConstBool(Num: String);
    procedure emit_ConstString(str: String);    
    procedure emit_RValor(NomeVariavel: String);
    procedure emit_LValor(NomeVariavel: String);
    procedure emit_Operador(Operador: String);
    procedure emit_OperadorUnario(Operador: String);

    procedure Clear;

    property Fonte: AnsiString read FFonte;
    property Linhas[Index: Integer]: String read LeLinha;
    property nLinhas: Integer read FnLinhas;
  end;

  { Classe que representa o Parser }
  TosParser = class
    FTokenAnterior: TToken;
    FLookAhead: TToken;
    FLex: TosLexico;

    FPrograma: TExprPrograma; // Programa compilado pelo parser
    FListaErros: TListErro;       // Erros ocorridos durante a compilacao
    FCompilado: Boolean;      // Indica se a expressao ja foi compilada

    FListaVariaveis: TStringList; // Lista de nomes de variaveis encontrados
    FListaFuncoes: TStringList; // Lista de nomes de variaveis encontrados
  private
    procedure NovaExpressao(Expr: AnsiString);
    function ObtemExpressao: AnsiString;

    function RecuperaErro(Index: Integer): TNodoErro;
    function RecuperaNumeroErros: Integer;
    function LeNomeVariavel(Index: Integer): String;
    function RecuperaNumeroVariaveis: Integer;

    function Match(TokenID: Integer): Boolean;

    // Gramatica; Forma: ExprN; N precedencia; N maior, prec. maior
    procedure Expr;           // relacionais
    procedure Expr0;          // aditivos, OR logico
    procedure Expr1;          // multiplicativos, AND logico
    procedure Expr2;          // unarios
    procedure Fator;          // variaveis e numeros
    procedure ListaArg;       // lista de argumentos passados para funcao

  public
    constructor Create;

    function Compile: Boolean;

    // Retorna true se o identificador e valido segundo os padroes do parser
    function ValidaIdentificador(pIdent: String): Boolean;

    property Expressao: AnsiString read ObtemExpressao write NovaExpressao;
    property Programa: TExprPrograma read FPrograma;
    property Compilado: Boolean read FCompilado;
    property ListaVariaveis: TStringList read FListaVariaveis;
    property ListaFuncoes: TStringList read FListaFuncoes;
    property ListaErros: TListErro read FListaErros;
    property Erros[Index: integer]: TNodoErro read RecuperaErro;
    property nErros: Integer read RecuperaNumeroErros;
    property Variavel[Index: Integer]: String read LeNomeVariavel;
    property nVariaveis: Integer read RecuperaNumeroVariaveis;
  end;

  EParserError = class (Exception);

  EPEUnrecoverable = class(EParserError);
  EPEInternal = class(EParserError);
  EPETokenInvalido = class(EParserError);

  { Tokens reconhecidos pelo parser }
  TTokenID = (
    tIdentificador = 1,
    tOperadorUnario,
    tOperadorMultiplicativo,
    tOperadorAditivo,
    tOperadorRelacional,
    tOperadorLogicoConjuntivo,
    tOperadorLogicoDisjuntivo,
    tAbrePar,
    tFechaPar,
    tVirgula,
    tConstNumero,
    tConstBooleano,
    tString);  //adicionado tString MS0001

  { Erros detectaveis pelo parser }
  TerrParser =
    ( epNone = 0,
      epErrParsing,         // erro generico
      epErrParentesis,      // falta parentesis
      epErrTokenInvalido,   // token desconhecido ou invalido
      epErrTokenInesperado  // encontrado um token qdo esperava-se outro
     );
const
  { Textos dos erros }
  CerrParserTexto: Array [0..Ord(High(TerrParser))] of String =
    (('Nenhum erro de parsing'),
     ('Erro de parsing.'),
     ('Falta um '')'''),
     ('Token Invalido'),
     ('Esperava-se %s, mas encontrado %s')
    );

    { Texto dos tokens }
  CTokenTexto: Array [1..Ord(High(TTokenID))] of String =
    (('identificador'),
     ('operador unário'),
     ('operador multiplicativo(div. ou mult.)'),
     ('operador aditivo(soma ou sub.)'),
     ('operador relacional(comparações)'),
     ('operador lógico conjuntivo'),
     ('operador lógico disjuntivo'),
     ('abre parêntesis'),
     ('fecha parêntesis'),
     ('vírgula'),
     ('constante numérica'),
     ('constante booleana'),
     ('constante string')); //MS0001

implementation

{ TosParser }

constructor TosParser.Create;
begin
  FPrograma := TExprPrograma.Create;
  FListaErros := TListErro.Create;
  FListaVariaveis := TStringList.Create;
  FListaFuncoes := TStringList.Create;
  FTokenAnterior := TToken.Create;
  FLookAhead := nil;

  FListaVariaveis.Sorted := True;
  FListaFuncoes.Sorted := True;

  // indica que expressao atual (vazia) jah foi compilada
  FCompilado := True;

  // Criacao dos tokens
  FLex := TosLexico.Create;

  // Op. Logicos

  FLex.AdicionaToken('"([^"]*)"', ord(tString));

  FLex.AdicionaToken('NOT', ord(tOperadorUnario));
  FLex.AdicionaToken('(OR|XOR)', ord(tOperadorLogicoDisjuntivo));
  FLex.AdicionaToken('AND', ord(tOperadorLogicoConjuntivo));

  // Op. Aritmeticos e relacionais
  FLex.AdicionaToken('([*/]|MOD|DIV)', ord(tOperadorMultiplicativo));
  FLex.AdicionaToken('[+-]', ord(tOperadorAditivo));
  FLex.AdicionaToken('(>=|<=|<>|<|>|=)', ord(tOperadorRelacional));

  // constantes
  FLex.AdicionaToken('[0-9]+(\,[0-9]+)?', ord(tConstNumero));
  FLex.AdicionaToken('(TRUE|FALSE)', ord(tConstBooleano));

  // meta caracteres
  FLex.AdicionaToken('\(', ord(tAbrePar));
  FLex.AdicionaToken('\)', ord(tFechaPar));
  FLex.AdicionaToken(',', ord(tVirgula));

  // identificadores de variavel e funcao
  FLex.AdicionaToken('[a-zA-Z_][a-zA-Z_0-9]*', ord(tIdentificador));

end;

{ Auxiliares  }

procedure TosParser.NovaExpressao(Expr: AnsiString);
begin
  FCompilado := False;
  FLex.Expressao := AnsiUpperCase(String(Expr));
end;

function TosParser.ObtemExpressao: AnsiString;
begin
  Result := AnsiString(FLex.Expressao);
end;

{ Confere token atual e le o proximo token }
function TosParser.Match(TokenID: Integer): Boolean;
begin
  Result := True;

  FTokenAnterior.ID := FLookAhead.ID;
  FTokenAnterior.Value := FLookAhead.Value;

  if TokenID <> FLookAhead.ID then
  begin
    // Tratamento de erros
    case TokenID of
      Ord(tFechaPar):
        begin
          // Erro de parentesis
          FListaErros.Add(epError, Ord(epErrParentesis),
                          'Fórmula inválida: faltou fechar um parêntesis.', []);
        end;
    else
      FListaErros.Add(epError, Ord(epErrTokenInesperado),
                      'Fórmula inválida: esperava-se "%s", mas "%s" encontrado.',
                      [ CTokenTexto[TokenID] , CTokenTexto[FLookAhead.ID] ]);
    end;
    Result := False;
  end;

  // remove o token anterior, se existir
  if FLookAhead <> nil then
  begin
    FLookAhead.Free;
    FLookAhead := nil;
  end;

  FLookAhead := FLex.ObtemToken;

  if FLookAhead.ID = -1 then
  begin
    // Token desconhecido: erro irrecuperavel, levanta excessao
    FListaErros.Add(epError, Ord(epErrTokenInvalido),
                    'Fórmula inválida: símbolo "%s" inválido.', [ FLex.Recupera ]);

    if FLookAhead <> nil then
    begin
      FLookAhead.Free;
      FLookAhead := nil;
    end;

    raise EPETokenInvalido.Create('Fórmula inválida: símbolo desconhecido.');
    Result := False;
  end;

end;

{ Chamada Principal }
function TosParser.Compile: Boolean;
begin
  { Se o parser jah compilou, sai fora }
  if FCompilado then
  begin
    Result := FListaErros.Count = 0;
    Exit;
  end;

  // Esvazia lista de variaveis, funcoes e erros e inicializa programa de saida
  FListaVariaveis.Clear;
  FListaFuncoes.Clear;
  FListaErros.Clear;
  FPrograma.Clear;

  // obtem o primeiro token
  FLex.Reinicializa;
  FLookAhead := FLex.ObtemToken;

  if FLookAhead.ID <> 0 then
  begin
    // Tenta fazer parsing da expressao
    try
      Expr;
    except
      on EPETokenInvalido do
      begin
        Result := False;
        Exit;
      end;
    end;

    if FLookAhead.ID <> 0 then
      // Erro: nao terminou de processar string, erro de parsing
      FListaErros.Add(epError, Ord(epErrParsing), 'Fórmula inválida: erro na expressão.', []);

  end;

  FCompilado := True; // expressao atual foi compilada, mesmo que tenha erros  
  Result := FListaErros.Count = 0;
end;

{ Gramatica }

// Operadores relacionais
procedure TosParser.Expr;
var
  Operador: String;
begin
  Expr0;

  while (FLookAhead.ID = ord(tOperadorRelacional)) do
  begin
    Operador := FLookAhead.Value;
    Match(ord(tOperadorRelacional));

    Expr0;

    // coloca o operador no programa
    FPrograma.emit_Operador(Operador);
  end;

end;

// Operadores aditivos e logicos disjuntivos
procedure TosParser.Expr0;
var
  Operador: String;
begin
  Expr1;
  while (FLookAhead.ID = ord(tOperadorAditivo)) OR
        (FLookAhead.ID = ord(tOperadorLogicoDisjuntivo)) do
  begin
    Operador := FLookAhead.Value;
    if FLookAhead.ID = ord(tOperadorAditivo) then
      Match(ord(tOperadorAditivo))
    else
      Match(ord(tOperadorLogicoDisjuntivo));

    Expr1;

    // coloca o operador no programa
    FPrograma.emit_Operador(Operador);
  end;
end;

// Operadores multiplicativos e logicos conjuntivos
procedure TosParser.Expr1;
var
  Operador: String;
begin
  Expr2;
  while (FLookAhead.ID = ord(tOperadorMultiplicativo)) OR
        (FLookAhead.ID = ord(tOperadorLogicoConjuntivo)) do
  begin
    Operador := FLookAhead.Value;
    if FLookAhead.ID = ord(tOperadorMultiplicativo) then
      Match(ord(tOperadorMultiplicativo))
    else
      Match(ord(tOperadorLogicoConjuntivo));

    Expr2;

    // coloca o operador no programa
    FPrograma.emit_Operador(Operador);
  end;
end;

// Operadores unarios
procedure TosParser.Expr2;
var
  OperadorUn: String;
begin
  if (FLookAhead.ID = ord(tOperadorAditivo)) or
     (FLookAhead.ID = ord(tOperadorUnario)) then
  begin
    OperadorUn := FLookAhead.Value;

    if (FLookAhead.ID = ord(tOperadorAditivo)) then
      Match(ord(tOperadorAditivo))
    else
      Match(ord(tOperadorUnario));

    Fator;

    FPrograma.emit_OperadorUnario(OperadorUn);
  end
  else
    Fator;

end;

// variaveis e constantes (numericas e booleanas)
procedure TosParser.Fator;
var
  Rotulo: String;
begin
  case FLookAhead.ID of
    // expressao entre parentesis
    ord(tAbrePar):
      begin
        Match(ord(tAbrePar));
        Expr;
        Match(ord(tFechaPar));
      end;

    // identificador (variavel ou funcao)
    ord(tIdentificador):
      begin
        Rotulo := FLookAhead.Value;

        Match(ord(tIdentificador));

        if (FLookAhead.ID = Ord(tAbrePar)) then
        begin
          // funcao
          Match(Ord(tAbrePar));
          ListaArg;
          Match(Ord(tFechaPar));

          FPrograma.emit_Func(Rotulo);

          // coloca funcao na lista, se nao existir
          if FListaFuncoes.IndexOf(Rotulo) < 0 then
            FListaFuncoes.Add(Rotulo);

        end
        else
        begin
          // variavel
          FPrograma.emit_RValor(Rotulo);

          // coloca variavel na lista, se nao existir
          if FListaVariaveis.IndexOf(Rotulo) < 0 then
            FListaVariaveis.Add(Rotulo);
        end;

      end;

    // constante numerica
    ord(tConstNumero):
      begin
        FPrograma.emit_ConstNum(FLookAhead.Value);
        Match(ord(tConstNumero));
      end;

    // constante booleana
    ord(tConstBooleano):
      begin
        FPrograma.emit_ConstBool(FLookAhead.Value);
        Match(ord(tConstBooleano));
      end;

      //MS0001 aqui vai peghar a string mesmo
    ord(tString):
      begin
        FPrograma.emit_ConstString(FLookAhead.Value);
        Match(ord(tString));
      end;

  else
    begin
      FListaErros.Add(epError, Ord(epErrTokenInesperado),
        'Fórmula inválida: esperava-se uma expressao depois de `%s´ ", mas `%s´ " encontrado',
        [ FTokenAnterior.Value, FLookAhead.Value ]);

    end;
  end;
end;

procedure TosParser.ListaArg;
var
  nParam: Integer;
begin
  Expr;
  nParam := 1;  
  while FLookAhead.ID = Ord(tVirgula) do
  begin
    Match(ord(tVirgula));
    Expr;
    Inc(nParam);
  end;
  FPrograma.emit_FuncArg(nParam);  
end;

function TosParser.ValidaIdentificador(pIdent: String): Boolean;
var
  tExpr: WideString;
begin
  tExpr := FLex.Expressao;
  FLex.Expressao := pIdent;

  Result := (FLex.ObtemToken).ID = Ord(tIdentificador);
  FLex.Expressao := tExpr;
end;

function TosParser.RecuperaErro(Index: Integer): TNodoErro;
begin
  Result := FListaErros.Items[Index];
end;

function TosParser.RecuperaNumeroErros: Integer;
begin
  Result := FListaErros.Count;
end;

function TosParser.LeNomeVariavel(Index: Integer): String;
begin
  Result := FListaVariaveis[Index];
end;

function TosParser.RecuperaNumeroVariaveis: Integer;
begin
  Result := FListaVariaveis.Count;
end;

{ TExprPrograma }

constructor TExprPrograma.Create;
begin
  FFonte := '';
  FnLinhas := 0;
end;

procedure TExprPrograma.Clear;
begin
  FFonte := '';
  FnLinhas := 0;
end;

procedure TExprPrograma.emit_ConstBool(Num: String);
begin
  FFonte := FFonte + 'constbool:' + AnsiString(Num) + #13#10;
  inc(FnLinhas);
end;

procedure TExprPrograma.emit_ConstNum(Num: String);
begin
  FFonte := FFonte + 'constnum:' + AnsiString(Num) + #13#10;
  inc(FnLinhas);
end;

procedure TExprPrograma.emit_Func(NomeFunc: String);
begin
  FFonte := FFonte + 'func:' + AnsiString(Nomefunc) + #13#10;
  inc(FnLinhas);
end;

procedure TExprPrograma.emit_FuncArg(NumArgumentos: Integer);
begin
  FFonte := FFonte + 'arg:' + AnsiString(IntToStr(NumArgumentos)) + #13#10;
  inc(FnLinhas);
end;

procedure TExprPrograma.emit_LValor(NomeVariavel: String);
begin
  FFonte := FFonte + 'lvalue:' + AnsiString(NomeVariavel) + #13#10;
  inc(FnLinhas);
end;

procedure TExprPrograma.emit_Operador(Operador: String);
begin
  FFonte := FFonte + 'op:' + AnsiString(Operador) + #13#10;
  inc(FnLinhas);
end;

procedure TExprPrograma.emit_OperadorUnario(Operador: String);
begin
  FFonte := FFonte + 'opun:' + AnsiString(Operador) + #13#10;
  inc(FnLinhas);
end;

procedure TExprPrograma.emit_RValor(NomeVariavel: String);
begin
  FFonte := FFonte + 'rvalue:' + AnsiString(NomeVariavel) + #13#10;
  inc(FnLinhas);  
end;

function TExprPrograma.LeLinha(Index: Integer): String;
var
  i: Integer;
  PosI, PosF, Tamanho: Integer;

begin
  i := 0;
  PosI := 1;
  PosF := AnsiPos(#13#10, String(FFonte));;
  Tamanho := Length(FFonte);

  while i < Index do
  begin
    PosI := PosF + 2;
    PosF := PosI + AnsiPos(#13#10, Copy(String(FFonte), PosI, Tamanho - PosI + 1)) - 1;

    inc(i);
  end;

  Result := Copy(String(FFonte), PosI, PosF-PosI);
end;

procedure TExprPrograma.emit_ConstString(str: String);
begin
  FFonte := FFonte + 'conststring:' + AnsiString(str) + #13#10;
  inc(FnLinhas);
end;

{ TStack }

function TStack.pop: Pointer;
begin
  Result := Last;
  Remove(Last);
end;

procedure TStack.push(const E: Pointer);
begin
  Add(E);
end;

end.
