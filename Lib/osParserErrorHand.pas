unit osParserErrorHand;

interface

uses Classes, SysUtils;

type
  TClasseErr = (epNone, epWarning, epError);

  TNodoErro = class
    FClasse : TClasseErr;         // tipo de erro
    FIDErro : Integer;            // identificador de erro provido pelo 'usuario'
    FTexto : AnsiString;          // texto a ser apresentado na msg de erro

  public
    constructor Create(pClasse: TClasseErr; pIDErro: Integer;
      pTexto: AnsiString; ListaDeComplementos: Array of Const);

    property Classe: TClasseErr read FClasse;
    property IDErro: Integer read FIDErro;
    property MsgErro: AnsiString read FTexto;

  end;

  TListErro = class (Tlist)
  public
    procedure Add(TipoErro: TClasseErr; IDErro: Integer;
      Texto: AnsiString; ListaDeComplementos: Array of Const); overload;
  end;

implementation

{ TNodoErro }

constructor TNodoErro.Create(pClasse: TClasseErr; pIDErro: Integer;
  pTexto: AnsiString; ListaDeComplementos: Array of Const);
begin
  FClasse := pClasse;
  FIDErro := pIDErro;
  FTexto := AnsiString(Format(String(pTexto), ListaDeComplementos));
end;

{ TListErro }

procedure TListErro.Add(TipoErro: TClasseErr; IDErro: Integer;
  Texto: AnsiString; ListaDeComplementos: Array of Const);
begin
  Self.Add(TNodoErro.Create(TipoErro, IDErro, Texto, ListaDeComplementos));
end;

end.
