unit UMensagemAguarde;

interface

uses
  SysUtils,  Classes, Variants,  Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  TFrmMensagemAguarde = class(TForm)
    MensagemPanel: TPanel;
    procedure FormActivate(Sender: TObject);
  private
    procedure SetPositionScreean(ControlLock: TWinControl);
  public
    procedure setMensagem(Texto: String; useProcessMessages: Boolean = False); virtual;
    procedure msgShow;
    procedure msgClose;
    procedure ShowTop(Parent : TWinControl);
    function  getIsCancelled: Boolean; virtual;
  end;

implementation

{$R *.dfm}

{ TFrmMensagemAguarde }

procedure TFrmMensagemAguarde.FormActivate(Sender: TObject);
begin
  Self.Refresh; // p/ atualizar a tela
  MensagemPanel.Refresh;
  Application.ProcessMessages;
end;

function TFrmMensagemAguarde.getIsCancelled: Boolean;
begin
  result := False;
end;

procedure TFrmMensagemAguarde.msgClose;
begin
  self.close;
end;

procedure TFrmMensagemAguarde.msgShow;
begin
  self.show;
end;

procedure TFrmMensagemAguarde.setMensagem(Texto: String; useProcessMessages: Boolean = False);
var
  LarguraTexto : Integer;
begin
  if (Texto = '') then
    Texto := 'Aguarde, Carregando...';
  MensagemPanel.Caption := Texto;

  LarguraTexto := Trunc(Self.Canvas.TextWidth('M') * (Length(Texto) * 1.2));
  if Self.Width < LarguraTexto then
    Self.Width := LarguraTexto;

  if useProcessMessages then
    Application.ProcessMessages;
  MensagemPanel.Update;
  MensagemPanel.Refresh;
  Refresh;
end;

procedure TFrmMensagemAguarde.ShowTop(Parent: TWinControl);
begin
  Self.SetPositionScreean(Parent);
  Self.Update
end;

procedure TFrmMensagemAguarde.SetPositionScreean(ControlLock: TWinControl);
begin
  if trunc((ControlLock.Width - self.Width) / 2) > 0 then
    self.Left   := trunc((ControlLock.Width - self.Width) / 2)
  else
    self.Left := 10;
  if trunc((ControlLock.Height - self.Height) / 25) > 0 then
    self.Top    := trunc((ControlLock.Height - self.Height) / 2)
  else
    self.Top := 25;
end;

end.
