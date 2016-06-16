object osCustomLoginForm: TosCustomLoginForm
  Left = 490
  Top = 262
  BorderStyle = bsToolWindow
  BorderWidth = 4
  Caption = 'Login'
  ClientHeight = 105
  ClientWidth = 227
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 4
    Top = 8
    Width = 39
    Height = 13
    Caption = '&Usu'#225'rio:'
    FocusControl = UsernameEdit
  end
  object Label2: TLabel
    Left = 4
    Top = 36
    Width = 34
    Height = 13
    Caption = '&Senha:'
    FocusControl = PasswordEdit
  end
  object UsernameEdit: TEdit
    Left = 60
    Top = 4
    Width = 161
    Height = 21
    TabOrder = 0
  end
  object btnOK: TButton
    Left = 60
    Top = 76
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object PasswordEdit: TEdit
    Left = 60
    Top = 32
    Width = 161
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object btnCancelar: TButton
    Left = 146
    Top = 76
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 3
  end
end
