unit osWizFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, osUtils, ActnList, osActionList, osFrm,
  System.Actions;

type
  TosWizForm = class(TosForm)
    Panel2: TPanel;
    Panel1: TPanel;
    btnCancelar: TButton;
    btnAvancar: TButton;
    btnVoltar: TButton;
    pgcWizard: TPageControl;
    Bevel1: TBevel;
    TabSheet1: TTabSheet;
    lblPag1Det: TLabel;
    lbLog: TListBox;
    Panel3: TPanel;
    lblTitulo: TLabel;
    lblTituloDetalhe: TLabel;
    memTitulos: TMemo;
    ActionList2: TosActionList;
    OnConclusion: TAction;
    OnEnterPage: TAction;
    OnLeavePage: TAction;
    OnInit: TAction;
    procedure btnVoltarClick(Sender: TObject);
    procedure btnAvancarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pgcWizardChanging(Sender: TObject; var AllowChange: Boolean);
  private
    FShowLogPage: boolean;
    FMovingForward: boolean;
    FCompleteAction: boolean;
    FMudarTela: Boolean;
    function GetIndexLastPage: integer;
  protected
    procedure UpdatePage; virtual;
  public
    procedure WizardConclusion; virtual;
    procedure NextPage; virtual;
    procedure PreviousPage; virtual;
    procedure FirstPage; virtual;
    procedure LastPage; virtual;
    procedure GotoPage(index : integer); virtual;
    function PageIndex : integer;
    function PageCount : integer;
    procedure Log(const PMessage: string; const Args: array of const; const PTime: boolean = True);
    property IndexLastPage: integer read GetIndexLastPage;
    property ShowLogPage: boolean read FShowLogPage write FShowLogPage;
    property MovingForward: boolean read FMovingForward;
    property CompleteAction: boolean read FCompleteAction write FCompleteAction;
  end;

const
  constConcluirCaption = 'C&oncluir';
  constFecharCaption = '&Fechar';
  constAvancarCaption = '&Avançar >';
  constCancelarCaption = '&Cancelar';

implementation

uses acCustomSQLMainDataUn;

{$R *.DFM}

procedure TosWizForm.UpdatePage;
var
  iLinha: integer;
begin
  if pgcWizard.Visible then
  begin
    if PageIndex < IndexLastPage then
      btnAvancar.Caption := constAvancarCaption
    else
      btnAvancar.Caption := constConcluirCaption;
    btnVoltar.Enabled := not(PageIndex = 0);
    iLinha := PageIndex;
  end
  else
    iLinha := PageIndex + 1;
  lblTitulo.Caption := GetWord(memTitulos.Lines[iLinha], 1, '|');
  lblTituloDetalhe.Caption := GetWord(memTitulos.Lines[iLinha], 2, '|');
end;

procedure TosWizForm.btnVoltarClick(Sender: TObject);
begin
  inherited;
  FMudarTela := True;
  CompleteAction := True;
  FMovingForward := False;
  OnLeavePage.Execute;
  if CompleteAction then
    PreviousPage;
end;

procedure TosWizForm.btnAvancarClick(Sender: TObject);
begin
  inherited;
  FMudarTela := True;
  CompleteAction := True;
  FMovingForward := True;
  OnLeavePage.Execute;
  if CompleteAction then
  begin
    if btnAvancar.Caption = constConcluirCaption then
    begin
        pgcWizard.Visible := False;
        try
          btnVoltar.Enabled := False;
          NextPage;
          UpdatePage;
          btnAvancar.Enabled := False;
          btnCancelar.Caption := constFecharCaption;
          btnCancelar.Enabled := False;
          WizardConclusion;
        except
          pgcWizard.Visible := True;
          raise;
        end;
        if FShowLogPage then
          btnCancelar.Enabled := True
        else
          Close;
    end
    else
      NextPage;
  end;
end;

procedure TosWizForm.btnCancelarClick(Sender: TObject);
begin
  inherited;
  if btnCancelar.Caption = constFecharCaption then
  begin
    ModalResult := mrOK;
    Close;
  end
  else if Application.MessageBox(PChar('Cancelar o ' + Caption + '?') , 'Cancelar', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
  begin
    ModalResult := mrCancel;
    Close;
  end;
end;

procedure TosWizForm.FirstPage;
begin
  pgcWizard.ActivePage := pgcWizard.Pages[0];
  UpdatePage;
end;

procedure TosWizForm.LastPage;
begin
  pgcWizard.ActivePage := pgcWizard.Pages[IndexLastPage];
  UpdatePage;
end;

procedure TosWizForm.NextPage;
begin
  if pgcWizard.Visible then
  begin
    pgcWizard.SelectNextPage(True);
    UpdatePage;
    OnEnterPage.Execute;
  end;
end;

procedure TosWizForm.PreviousPage;
begin
  pgcWizard.SelectNextPage(False);
  UpdatePage;
  OnEnterPage.Execute;
end;

function TosWizForm.PageIndex: integer;
begin
  Result := pgcWizard.ActivePage.PageIndex;
end;

function TosWizForm.PageCount: integer;
begin
  Result := pgcWizard.PageCount;
end;


procedure TosWizForm.GotoPage(index : integer);
begin
  if index > PageCount then exit;
  if index < 0 then exit;
  OnLeavePage.Execute;
  pgcWizard.ActivePage := pgcWizard.Pages[index];
  UpdatePage;
  OnEnterPage.Execute;
end;

procedure TosWizForm.WizardConclusion;
begin
  OnConclusion.Execute;
end;

function TosWizForm.GetIndexLastPage: integer;
begin
  with pgcWizard do
  begin
    Result := PageCount - 1;
    while (not Pages[Result].TabVisible) and (Result > 0) do
      Dec(Result);
  end;
end;

procedure TosWizForm.FormShow(Sender: TObject);
begin
  FMudarTela := False;
  ShowLogPage := True;
  btnAvancar.Enabled := True;
  btnCancelar.Caption := constCancelarCaption;
  btnCancelar.Enabled := True;
  btnAvancar.Default := False;
  pgcWizard.Visible := True;
  FirstPage;
  OnInit.Execute;
end;


procedure TosWizForm.Log(const PMessage: string;
  const Args: array of const; const PTime: boolean);
var
  sAux: string;
begin
  if PTime then
    sAux := FormatDateTime('hh:nn:ss', acCustomSQLMainData.GetServerDatetime) + ' - '
  else
    sAux := '';
  lbLog.Items.Add(sAux + Format(PMessage, Args));
  Application.ProcessMessages;
end;

procedure TosWizForm.pgcWizardChanging(Sender: TObject; var AllowChange: Boolean);
begin
  if not FMudarTela then
    AllowChange := False;
  FMudarTela := False;
end;

end.

