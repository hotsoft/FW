unit osFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, osUtils, ImgList, osActionList, System.Actions {$IFDEF VER320} , System.ImageList {$ENDIF};

type
  TOperacao  = (oInserir, oEditar, oExcluir, oVisualizar, oImprimir);
  TOperacoes = set of TOperacao;

  TosForm = class(TForm)
    ActionList: TosActionList;
    OnCheckActionsAction: TAction;
    ImageList: TImageList;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FOperacoes: TOperacoes;
    procedure SetOperacoes(const Value: TOperacoes);
  protected
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Operacoes: TOperacoes read FOperacoes write SetOperacoes;
  end;

var
  osForm: TosForm;

implementation

{$R *.DFM}

{ TBizForm }


constructor TosForm.Create(AOwner: TComponent);
begin                     
  inherited;
  //CheckDefaultParams; // Carrega os parâmetros empresa/estabelecimento se necessário
end;


procedure TosForm.FormShow(Sender: TObject);
begin
  OnCheckActionsAction.Execute;
end;


procedure TosForm.SetOperacoes(const Value: TOperacoes);
begin
  FOperacoes := Value;
end;

procedure TosForm.FormCreate(Sender: TObject);
begin
  Operacoes := [oInserir, oEditar, oExcluir, oVisualizar]; // operações Defaults
end;

end.
