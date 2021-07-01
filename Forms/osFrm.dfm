object osForm: TosForm
  Left = 259
  Top = 277
  Caption = 'osForm'
  ClientHeight = 240
  ClientWidth = 385
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ActionList: TosActionList
    Left = 8
    Top = 8
    object OnCheckActionsAction: TAction
      Category = 'DefEvents'
      Caption = 'OnCheckActionsAction'
      Visible = False
    end
  end
  object ImageList: TImageList
    Left = 40
    Top = 8
  end
end
