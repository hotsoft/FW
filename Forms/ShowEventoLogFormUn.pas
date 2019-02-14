unit ShowEventoLogFormUn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TShowEventoLogForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button1: TButton;
    lblData: TLabel;
    lblUsuario: TLabel;
    lblEvento: TLabel;
    lblDescricao: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure execute(Usuario: string; datahora: TDateTime;
      Evento: string; detalhes: string);
  end;

var
  ShowEventoLogForm: TShowEventoLogForm;

implementation

{$R *.dfm}

{ TShowEventoLogForm }

class procedure TShowEventoLogForm.execute(Usuario: string;
  datahora: TDateTime; Evento, detalhes: string);
begin
  with TShowEventoLogForm.create(nil) do
  begin
    lblData.Caption := FormatDateTime('dd/mm/yyyy hh:nn', datahora);
    lblUsuario.Caption := Usuario;
    lblEvento.Caption := Evento;
    lblDescricao.Caption := detalhes;
    ShowModal;
  end
end;

end.
