unit osCalculaFormulas;

interface
                    
uses
  SysUtils, Classes, osParser, osMaquina, osGrafo, Controls, RegExpr,
  osParserErrorHand;

type
  {Classe Principal : TosCalculaFormulas }
  TosCalculaFormulas = class(TGrafo)
    Parser: TosParser;
    Maquina: TosMaquina;
    FListaErros : TListErro;

  private
    FTextoErro: TCaption;
    FArestasInicializadas: boolean;

    // Erros
    function RecuperaErro(Index: Integer): TNodoErro;
    function RecuperaNumeroErros: Integer;

    // calcula nodos e arestas para o grafo usado para calcular resultados
    function Inicializa : boolean;
  public
    constructor Create;

    function Calcula: Boolean; override;    

    procedure AdicionaFormula(Conteudo: TConteudoGrafoDep; pChave: String);

    // Funcoes auxiliares
    function Imprime : TCaption;

    // Propriedades
    property TextoErro: TCaption read FTextoErro;
    property ListaErros: TListErro read FListaErros;
    property Erros[Index: integer]: TNodoErro read RecuperaErro;
    property nErros: Integer read RecuperaNumeroErros;

  end;

  { Representa uma variavel }
  TosFormulaVariavel = class
    FNome: String;
    FValor: Double;
  public
    property Nome: String read FNome write FNome;
    property Valor: Double read FValor write FValor;
  end;

  { Representa uma formula de um sistema de formulas que nao e calculada }
  TosFormula = class(TConteudoGrafoDep)
    // Parser
    FParser: TosParser;

    // Informacoes sobre formula
    FRotulo: WideString;
    FVariavel: TosFormulaVariavel;  // Variavel armazenada no nodo
    FFormula: WideString;   // Formula para calcular resultado

    // Erros de parsing da expressao
    FListaErrosExpr: TListErro;
  private
    // Recupera n-esimo erro de parsing e a quantidade de erros
    function LeErrosExpr(Index: Integer): TNodoErro;
    function NumErrosExpr: Integer;

  public
    constructor Create(MathParser: TosParser); virtual;

    function Processa(Dependencias: TListaElementos): Boolean; override;

    // erros de parsing (expressao mal formada)
    property ListaErrosExpr: TListErro read FListaErrosExpr;
    property nErrosExpr: Integer read NumErrosExpr;
    property ErrosExpr[Index: Integer]: TNodoErro read LeErrosExpr;
    // formula e nome da variavel
    property Formula: WideString read FFormula write FFormula;
    property Variavel: TosFormulaVariavel read FVariavel write FVariavel;
    property Rotulo: WideString read FRotulo write FRotulo;    
  end;

  { Representa uma formula que tem seu valor determinado }
  TosFormulaCalc = class(TosFormula)
    FMaquina: TosMaquina;
    FResultadoCalc: Double;

    // Erros de parsing da expressao
    FListaErrosCalc: TListErro;
  private
    // Recupera n-esimo erro de calculo e a quantidade de erros
    function NumErrosCalc: Integer;
    function LeErrosCalc(Index: Integer): TNodoErro;
  public
    constructor Create(MathParser: TosParser); override;

    function Processa(Dependencias: TListaElementos): Boolean; override;

    // erros de calculo
    property ListaErrosCalc: TListErro read FListaErrosCalc;
    property nErrosCalc: Integer read NumErrosCalc;
    property ErrosCalc[Index: Integer]: TNodoErro read LeErrosCalc;
    // resultado do calculo da formula
    property Resultado: Double read FResultadoCalc;
  end;

  TerrFormula =
      (efErroParsing = 1,
       efDivisaoPorZero);

  { Funcao para imprimir conteudo de uma lista de formulas }
  function ImprimeLista(Lista: TListaElementos): TCaption;

implementation

{ Funcao para imprimir conteudo de uma lista de elementos }

function ImprimeLista(Lista: TListaElementos): TCaption;
var i: Integer;
    TextoR: TCaption;
begin
  TextoR := '';
  i := 0;
  while i < Lista.Count do
  begin
    TextoR :=
      TextoR + TosFormula(Lista.Elementos[i]).Variavel.Nome;
    if (i+1)<Lista.Count then
      TextoR := TextoR + ', ';
    i := i + 1;
  end;
  TextoR := TextoR + #13#10;
  ImprimeLista := TextoR;
end;


{ TosCalculaFormulas }

constructor TosCalculaFormulas.Create;
begin
  inherited;
  Parser := TosParser.Create;
  FListaErros := TListErro.Create;
  FArestasInicializadas := False;  
end;

// Obtencao de erros
function TosCalculaFormulas.RecuperaErro(Index: Integer): TNodoErro;
begin
  Result := FListaErros.Items[Index];
end;

function TosCalculaFormulas.RecuperaNumeroErros: Integer;
begin
  Result := FListaErros.Count;
end;

// baseado nos vertices atuais, cria as arestas necessarias
// gera lista de erros de valiaveis não existentes
// Retorna False se ocorreu algum erro
function TosCalculaFormulas.Inicializa : boolean;
var
  Index, i: Integer;
  DestVert: Integer;
begin
  Index := 0;
  while Index < Count do
  begin
    // atribui expressao para que o parser processe-a
    Parser.Expressao := AnsiString(String(TosFormula(Elementos[Index]).Formula));
    if Parser.Expressao <> '' then
    begin
      // compila a expressao
      Parser.Compile;

      for i := 0 to Parser.nVariaveis-1 do
      begin
        DestVert := IndexOf(Parser.Variavel[i]);
        // se DestVert for -1, significa que a variavel nao existe
        if (DestVert = -1) then
          FListaErros.Add(epWarning, i, 'Atributo ''%s'', Variável ''%s'' não definida.',
            [TosFormula(Elementos[Index]).Rotulo,  Parser.Variavel[i]])
        else
          if (DestVert <> Index) then
            AdicionaAresta(Index, DestVert);
      end;
    end;

    Inc(Index);
  end;

  FArestasInicializadas := True;
  Result := (FListaErros.Count = 0);
end;

// Adiciona nova formula no sistema
procedure TosCalculaFormulas.AdicionaFormula(Conteudo: TConteudoGrafoDep;
  pChave: String);
var
  Vertice: TVertice;
begin
  FArestasInicializadas := False;

  Vertice := TVertice.Create(Conteudo, pChave);
  Self.AddObject(pChave, Vertice);
end;

// "imprime" o grafo de calculo; somente para debug 
function TosCalculaFormulas.Imprime: TCaption;
var i, j: Integer;
    Arestas : TListaElementos;
    TextoR: TCaption;
begin
  TextoR := '';
  i := 0;
  while i < Count do
  begin
    Arestas := TVertice(Objects[i]).Arestas;
    TextoR :=
      TextoR + TosFormula(Elementos[i]).Variavel.Nome + ': ';
    j := 0;
    while j < Arestas.Count do
    begin
      TextoR :=
        TextoR +
        TosFormula(TVertice(Arestas.Objects[j]).Conteudo).Variavel.Nome;
      if (j+1) < Arestas.Count then
        TextoR := TextoR + ', ';

      j := j + 1;
    end;
    TextoR := TextoR + #13#10;
    i := i + 1;
  end;
  Imprime := TextoR;
end;

function TosCalculaFormulas.Calcula: Boolean;
begin
  if not(FArestasInicializadas) then
    Result := Inicializa      // inicializa arestas verifica Variaveis
  else
    Result := True;

  // se não houve erros na inicialização então Calcula
  if Result then
    Result := inherited Calcula;
end;

{ TosFormula }

constructor TosFormula.Create(MathParser: TosParser);
begin
  FParser := MathParser;

  FVariavel := TosFormulaVariavel.Create;
  FVariavel.Nome := '';
  FVariavel.Valor := 0;
  FListaErrosExpr := TListErro.Create;
end;

function TosFormula.LeErrosExpr(Index: Integer): TNodoErro;
begin
  Result := FListaErrosExpr.Items[Index];
end;

function TosFormula.NumErrosExpr: Integer;
begin
  Result := FListaErrosExpr.Count;
end;

function TosFormula.Processa(Dependencias: TListaElementos): Boolean;
begin
  FParser.Expressao := AnsiString(String(FFormula));

  if not(FParser.Compile) then
    FListaErrosExpr.Assign(FParser.ListaErros);

  Result := FListaErrosExpr.Count = 0;
end;

{ TosFormulaCalc }

constructor TosFormulaCalc.Create(MathParser: TosParser);
begin
  inherited;

  FResultadoCalc := 0;
  FMaquina := TosMaquina.Create;
  FMaquina.Parser := MathParser;
  FListaErrosCalc := TListErro.Create;  
end;

function TosFormulaCalc.LeErrosCalc(Index: Integer): TNodoErro;
begin
  Result := FListaErrosCalc.Items[Index];
end;

function TosFormulaCalc.NumErrosCalc: Integer;
begin
  Result := FListaErrosCalc.Count;
end;

function TosFormulaCalc.Processa(Dependencias: TListaElementos): Boolean;
var
  Index : Integer;
  VariavelAdj : TosFormulaVariavel;
begin
  // avaliacao da expressao
  FParser.Expressao := AnsiString(String(FFormula));

  if not(FParser.Compile) then
    FListaErrosExpr.Assign(FParser.ListaErros);

  Result := FListaErrosExpr.Count = 0;

  if not(Result) then
    Exit;

  FResultadoCalc := Variavel.Valor;

  if Formula <> '' then
  begin
    // Seta variaveis na formula com respectivos valores dos vertices adj.
    Index := 0;
    while Index < Dependencias.Count do
    begin
      VariavelAdj := TosFormulaCalc(Dependencias.Elementos[Index]).Variavel;
      FResultadoCalc := TosFormulaCalc(Dependencias.Elementos[Index]).Resultado;
      FMaquina.SetaVariavel(AnsiUpperCase(VariavelAdj.Nome), FResultadoCalc);

      Index := Index + 1;
    end;

    // Atribui o valor a variavel
    FMaquina.SetaVariavel(AnsiUpperCase(Variavel.Nome), Variavel.Valor);

    // tenta calcular o resultado
    try
      if not(FMaquina.Exec) then
        FListaErrosCalc.Assign(FMaquina.ListaErros)
      else
        FResultadoCalc := FMaquina.Resultado;
    except
      // Excecoes em operacoes matematicas
      on EZeroDivide do FListaErrosCalc.Add(epError, Ord(efDivisaoPorZero),
                                            'Erro de divisão por zero.', []);
    end;

    Result := (FMaquina.nErros = 0);
  end;

end;

end.
