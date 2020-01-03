object osWizForm: TosWizForm
  Left = 290
  Top = 185
  BorderStyle = bsDialog
  Caption = 'Assistente para'
  ClientHeight = 360
  ClientWidth = 496
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    496
    360)
  PixelsPerInch = 96
  TextHeight = 13
  object lbLog: TListBox
    Left = 40
    Top = 64
    Width = 453
    Height = 245
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clScrollBar
    ItemHeight = 13
    TabOrder = 2
  end
  object pgcWizard: TPageControl
    Left = 0
    Top = 56
    Width = 497
    Height = 259
    ActivePage = TabSheet1
    Style = tsFlatButtons
    TabHeight = 1
    TabOrder = 1
    OnChanging = pgcWizardChanging
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        489
        248)
      object lblPag1Det: TLabel
        Left = 36
        Top = 4
        Width = 447
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'Detalhes'
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 314
    Width = 496
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Bevel1: TBevel
      Left = 0
      Top = 0
      Width = 496
      Height = 3
      Align = alTop
      Shape = bsTopLine
    end
    object Panel1: TPanel
      Left = 236
      Top = 3
      Width = 260
      Height = 43
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object btnCancelar: TButton
        Left = 168
        Top = 12
        Width = 75
        Height = 23
        Caption = 'Cancelar'
        TabOrder = 0
        OnClick = btnCancelarClick
      end
      object btnAvancar: TButton
        Left = 76
        Top = 12
        Width = 75
        Height = 23
        Caption = '&Avan'#231'ar >'
        Default = True
        TabOrder = 1
        OnClick = btnAvancarClick
      end
      object btnVoltar: TButton
        Left = 1
        Top = 12
        Width = 75
        Height = 23
        Caption = '< &Voltar'
        TabOrder = 2
        OnClick = btnVoltarClick
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 497
    Height = 57
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 3
    object lblTitulo: TLabel
      Left = 20
      Top = 12
      Width = 95
      Height = 13
      Caption = 'T'#237'tulo da p'#225'gina'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTituloDetalhe: TLabel
      Left = 40
      Top = 27
      Width = 83
      Height = 13
      Caption = 'Detalhe do T'#237'tulo'
    end
    object memTitulos: TMemo
      Left = 432
      Top = 4
      Width = 61
      Height = 21
      Lines.Strings = (
        'Titulo da p'#225'gina|Detalhe'
        'Titulo conclus'#227'o|Detalhe')
      TabOrder = 0
      Visible = False
      WordWrap = False
    end
  end
  object ActionList2: TosActionList
    Left = 376
    Top = 11
    object OnConclusion: TAction
      Caption = 'OnConclusion'
    end
    object OnEnterPage: TAction
      Caption = 'OnEnterPage'
    end
    object OnLeavePage: TAction
      Caption = 'OnLeavePage'
    end
    object OnInit: TAction
      Caption = 'OnInit'
    end
  end
end
