inherited osCustomEditForm: TosCustomEditForm
  Left = 40
  Top = 351
  Caption = 'osCustomEditForm'
  ClientHeight = 297
  ClientWidth = 457
  Menu = MainMenu
  OldCreateOrder = True
  OnCloseQuery = FormCloseQuery
  ExplicitWidth = 473
  ExplicitHeight = 356
  PixelsPerInch = 96
  TextHeight = 13
  object MainControlBar: TControlBar [0]
    Left = 0
    Top = 14
    Width = 457
    Height = 30
    Align = alTop
    AutoDrag = False
    AutoSize = True
    TabOrder = 0
    ExplicitTop = 0
    ExplicitWidth = 486
    object ControlBarPanel: TPanel
      Left = 11
      Top = 2
      Width = 358
      Height = 22
      Align = alLeft
      Alignment = taLeftJustify
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 0
      object SalvarFecharButton: TSpeedButton
        Left = 0
        Top = 0
        Width = 113
        Height = 22
        Action = SaveCloseAction
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
          00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
          00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
          00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
          0003737FFFFFFFFF7F7330099999999900333777777777777733}
        NumGlyphs = 2
      end
      object ImprimirButton: TSpeedButton
        Tag = 1
        Left = 115
        Top = 0
        Width = 60
        Height = 22
        Action = ImprimirAction
        Flat = True
      end
      object ExcluirButton: TSpeedButton
        Tag = 2
        Left = 177
        Top = 0
        Width = 60
        Height = 22
        Action = DeleteAction
        Flat = True
      end
      object FecharButton: TSpeedButton
        Tag = 3
        Left = 239
        Top = 0
        Width = 59
        Height = 22
        Action = CloseAction
        Flat = True
      end
      object PararButton: TSpeedButton
        Tag = 4
        Left = 300
        Top = 0
        Width = 58
        Height = 22
        Caption = '&Parar'
        Flat = True
        Visible = False
        OnClick = PararButtonClick
      end
    end
  end
  object AdvSmoothMegaMenu1: TAdvSmoothMegaMenu [1]
    Left = 0
    Top = 0
    Width = 457
    Height = 14
    DefaultMenuContentFill.Color = 15984090
    DefaultMenuContentFill.ColorTo = 15785680
    DefaultMenuContentFill.ColorMirror = clNone
    DefaultMenuContentFill.ColorMirrorTo = clNone
    DefaultMenuContentFill.GradientType = gtVertical
    DefaultMenuContentFill.GradientMirrorType = gtSolid
    DefaultMenuContentFill.BorderColor = clBlack
    DefaultMenuContentFill.BorderOpacity = 50
    DefaultMenuContentFill.Rounding = 0
    DefaultMenuContentFill.ShadowOffset = 0
    DefaultMenuContentFill.Glow = gmNone
    DefaultMenuTearOffFill.Color = 16773091
    DefaultMenuTearOffFill.ColorTo = 16765615
    DefaultMenuTearOffFill.ColorMirror = clNone
    DefaultMenuTearOffFill.ColorMirrorTo = clNone
    DefaultMenuTearOffFill.GradientType = gtVertical
    DefaultMenuTearOffFill.GradientMirrorType = gtSolid
    DefaultMenuTearOffFill.BorderColor = 16765615
    DefaultMenuTearOffFill.Rounding = 0
    DefaultMenuTearOffFill.ShadowOffset = 0
    DefaultMenuTearOffFill.Glow = gmNone
    DefaultSectionItemAppearance.SeparatorFill.ColorMirror = clNone
    DefaultSectionItemAppearance.SeparatorFill.ColorMirrorTo = clNone
    DefaultSectionItemAppearance.SeparatorFill.GradientType = gtVertical
    DefaultSectionItemAppearance.SeparatorFill.GradientMirrorType = gtSolid
    DefaultSectionItemAppearance.SeparatorFill.BorderColor = clNone
    DefaultSectionItemAppearance.SeparatorFill.Rounding = 0
    DefaultSectionItemAppearance.SeparatorFill.ShadowOffset = 0
    DefaultSectionItemAppearance.SeparatorFill.Glow = gmNone
    DefaultSectionItemAppearance.BreakFill.ColorMirror = clNone
    DefaultSectionItemAppearance.BreakFill.ColorMirrorTo = clNone
    DefaultSectionItemAppearance.BreakFill.GradientType = gtVertical
    DefaultSectionItemAppearance.BreakFill.GradientMirrorType = gtSolid
    DefaultSectionItemAppearance.BreakFill.BorderColor = clNone
    DefaultSectionItemAppearance.BreakFill.Rounding = 0
    DefaultSectionItemAppearance.BreakFill.ShadowOffset = 0
    DefaultSectionItemAppearance.BreakFill.Glow = gmNone
    DefaultSectionItemAppearance.FillSelected.Color = 11196927
    DefaultSectionItemAppearance.FillSelected.ColorTo = 7257087
    DefaultSectionItemAppearance.FillSelected.ColorMirror = 4370174
    DefaultSectionItemAppearance.FillSelected.ColorMirrorTo = 8053246
    DefaultSectionItemAppearance.FillSelected.GradientType = gtVertical
    DefaultSectionItemAppearance.FillSelected.GradientMirrorType = gtVertical
    DefaultSectionItemAppearance.FillSelected.BorderColor = 4370174
    DefaultSectionItemAppearance.FillSelected.Rounding = 0
    DefaultSectionItemAppearance.FillSelected.ShadowOffset = 0
    DefaultSectionItemAppearance.FillSelected.Glow = gmNone
    DefaultSectionItemAppearance.FillDisabled.Color = 15921906
    DefaultSectionItemAppearance.FillDisabled.ColorTo = 11974326
    DefaultSectionItemAppearance.FillDisabled.ColorMirror = 11974326
    DefaultSectionItemAppearance.FillDisabled.ColorMirrorTo = 15921906
    DefaultSectionItemAppearance.FillDisabled.GradientType = gtVertical
    DefaultSectionItemAppearance.FillDisabled.GradientMirrorType = gtVertical
    DefaultSectionItemAppearance.FillDisabled.BorderColor = clNone
    DefaultSectionItemAppearance.FillDisabled.Rounding = 0
    DefaultSectionItemAppearance.FillDisabled.ShadowOffset = 0
    DefaultSectionItemAppearance.FillDisabled.Glow = gmNone
    DefaultSectionItemAppearance.FillHover.Color = 15465983
    DefaultSectionItemAppearance.FillHover.ColorTo = 11332863
    DefaultSectionItemAppearance.FillHover.ColorMirror = 5888767
    DefaultSectionItemAppearance.FillHover.ColorMirrorTo = 10807807
    DefaultSectionItemAppearance.FillHover.GradientType = gtVertical
    DefaultSectionItemAppearance.FillHover.GradientMirrorType = gtVertical
    DefaultSectionItemAppearance.FillHover.BorderColor = 10079963
    DefaultSectionItemAppearance.FillHover.Rounding = 0
    DefaultSectionItemAppearance.FillHover.ShadowOffset = 0
    DefaultSectionItemAppearance.FillHover.Glow = gmNone
    DefaultSectionItemAppearance.Fill.Color = clNone
    DefaultSectionItemAppearance.Fill.ColorMirror = clNone
    DefaultSectionItemAppearance.Fill.ColorMirrorTo = clNone
    DefaultSectionItemAppearance.Fill.GradientType = gtVertical
    DefaultSectionItemAppearance.Fill.GradientMirrorType = gtSolid
    DefaultSectionItemAppearance.Fill.BorderColor = clNone
    DefaultSectionItemAppearance.Fill.Rounding = 0
    DefaultSectionItemAppearance.Fill.ShadowOffset = 0
    DefaultSectionItemAppearance.Fill.Glow = gmNone
    DefaultSectionItemAppearance.FontSelected.Charset = DEFAULT_CHARSET
    DefaultSectionItemAppearance.FontSelected.Color = clBlack
    DefaultSectionItemAppearance.FontSelected.Height = -11
    DefaultSectionItemAppearance.FontSelected.Name = 'Tahoma'
    DefaultSectionItemAppearance.FontSelected.Style = []
    DefaultSectionItemAppearance.FontDisabled.Charset = DEFAULT_CHARSET
    DefaultSectionItemAppearance.FontDisabled.Color = clGray
    DefaultSectionItemAppearance.FontDisabled.Height = -11
    DefaultSectionItemAppearance.FontDisabled.Name = 'Tahoma'
    DefaultSectionItemAppearance.FontDisabled.Style = []
    DefaultSectionItemAppearance.FontHover.Charset = DEFAULT_CHARSET
    DefaultSectionItemAppearance.FontHover.Color = clBlack
    DefaultSectionItemAppearance.FontHover.Height = -11
    DefaultSectionItemAppearance.FontHover.Name = 'Tahoma'
    DefaultSectionItemAppearance.FontHover.Style = []
    DefaultSectionItemAppearance.Font.Charset = DEFAULT_CHARSET
    DefaultSectionItemAppearance.Font.Color = clBlack
    DefaultSectionItemAppearance.Font.Height = -11
    DefaultSectionItemAppearance.Font.Name = 'Tahoma'
    DefaultSectionItemAppearance.Font.Style = []
    DefaultSectionItemAppearance.ShortCutFont.Charset = DEFAULT_CHARSET
    DefaultSectionItemAppearance.ShortCutFont.Color = clWindowText
    DefaultSectionItemAppearance.ShortCutFont.Height = -11
    DefaultSectionItemAppearance.ShortCutFont.Name = 'Tahoma'
    DefaultSectionItemAppearance.ShortCutFont.Style = []
    DefaultSectionItemAppearance.DetailFont.Charset = DEFAULT_CHARSET
    DefaultSectionItemAppearance.DetailFont.Color = clWindowText
    DefaultSectionItemAppearance.DetailFont.Height = -11
    DefaultSectionItemAppearance.DetailFont.Name = 'Tahoma'
    DefaultSectionItemAppearance.DetailFont.Style = []
    DefaultSection.CaptionFont.Charset = DEFAULT_CHARSET
    DefaultSection.CaptionFont.Color = clWindowText
    DefaultSection.CaptionFont.Height = -11
    DefaultSection.CaptionFont.Name = 'Tahoma'
    DefaultSection.CaptionFont.Style = []
    DefaultSection.CaptionFill.Color = 16773091
    DefaultSection.CaptionFill.ColorTo = 16768452
    DefaultSection.CaptionFill.ColorMirror = 16765357
    DefaultSection.CaptionFill.ColorMirrorTo = 16767936
    DefaultSection.CaptionFill.GradientType = gtVertical
    DefaultSection.CaptionFill.GradientMirrorType = gtVertical
    DefaultSection.CaptionFill.BorderColor = clNone
    DefaultSection.CaptionFill.Rounding = 0
    DefaultSection.CaptionFill.ShadowOffset = 0
    DefaultSection.CaptionFill.Glow = gmNone
    DefaultSection.BackGroundFill.Color = 15984090
    DefaultSection.BackGroundFill.ColorTo = 15785680
    DefaultSection.BackGroundFill.ColorMirror = clNone
    DefaultSection.BackGroundFill.ColorMirrorTo = clNone
    DefaultSection.BackGroundFill.GradientType = gtVertical
    DefaultSection.BackGroundFill.GradientMirrorType = gtSolid
    DefaultSection.BackGroundFill.BorderColor = clNone
    DefaultSection.BackGroundFill.Rounding = 0
    DefaultSection.BackGroundFill.ShadowOffset = 0
    DefaultSection.BackGroundFill.Glow = gmNone
    DefaultSection.Items = <>
    DefaultSection.AutoItemHeight = True
    DefaultSection.ItemRectangleMargin.Left = 3
    DefaultSection.ItemRectangleMargin.Top = 3
    DefaultSection.ItemRectangleMargin.Bottom = 3
    DefaultSection.ItemRectangleMargin.Right = 3
    DefaultSection.ItemSpacing = 0
    DefaultTopLayerItem.Fill.ColorMirror = clNone
    DefaultTopLayerItem.Fill.ColorMirrorTo = clNone
    DefaultTopLayerItem.Fill.GradientType = gtVertical
    DefaultTopLayerItem.Fill.GradientMirrorType = gtSolid
    DefaultTopLayerItem.Fill.BorderColor = clNone
    DefaultTopLayerItem.Fill.Rounding = 0
    DefaultTopLayerItem.Fill.ShadowOffset = 0
    DefaultTopLayerItem.Fill.Glow = gmNone
    DefaultTopLayerItem.HTMLTextFont.Charset = DEFAULT_CHARSET
    DefaultTopLayerItem.HTMLTextFont.Color = clWindowText
    DefaultTopLayerItem.HTMLTextFont.Height = -11
    DefaultTopLayerItem.HTMLTextFont.Name = 'Tahoma'
    DefaultTopLayerItem.HTMLTextFont.Style = []
    ItemAppearance.MenuItemFill.Color = 16773091
    ItemAppearance.MenuItemFill.ColorTo = 16768452
    ItemAppearance.MenuItemFill.ColorMirror = 16765357
    ItemAppearance.MenuItemFill.ColorMirrorTo = 16767936
    ItemAppearance.MenuItemFill.GradientType = gtVertical
    ItemAppearance.MenuItemFill.GradientMirrorType = gtVertical
    ItemAppearance.MenuItemFill.BorderColor = 16765357
    ItemAppearance.MenuItemFill.Rounding = 0
    ItemAppearance.MenuItemFill.ShadowOffset = 0
    ItemAppearance.MenuItemFill.Glow = gmNone
    ItemAppearance.MenuItemFillSelected.Color = 11196927
    ItemAppearance.MenuItemFillSelected.ColorTo = 7257087
    ItemAppearance.MenuItemFillSelected.ColorMirror = 4370174
    ItemAppearance.MenuItemFillSelected.ColorMirrorTo = 8053246
    ItemAppearance.MenuItemFillSelected.GradientType = gtVertical
    ItemAppearance.MenuItemFillSelected.GradientMirrorType = gtVertical
    ItemAppearance.MenuItemFillSelected.BorderColor = 4370174
    ItemAppearance.MenuItemFillSelected.Rounding = 0
    ItemAppearance.MenuItemFillSelected.ShadowOffset = 0
    ItemAppearance.MenuItemFillSelected.Glow = gmNone
    ItemAppearance.MenuItemFillHover.Color = 15465983
    ItemAppearance.MenuItemFillHover.ColorTo = 11332863
    ItemAppearance.MenuItemFillHover.ColorMirror = 5888767
    ItemAppearance.MenuItemFillHover.ColorMirrorTo = 10807807
    ItemAppearance.MenuItemFillHover.GradientType = gtVertical
    ItemAppearance.MenuItemFillHover.GradientMirrorType = gtVertical
    ItemAppearance.MenuItemFillHover.BorderColor = 10079963
    ItemAppearance.MenuItemFillHover.Rounding = 0
    ItemAppearance.MenuItemFillHover.ShadowOffset = 0
    ItemAppearance.MenuItemFillHover.Glow = gmNone
    ItemAppearance.MenuItemFillDisabled.Color = 15921906
    ItemAppearance.MenuItemFillDisabled.ColorTo = 11974326
    ItemAppearance.MenuItemFillDisabled.ColorMirror = 11974326
    ItemAppearance.MenuItemFillDisabled.ColorMirrorTo = 15921906
    ItemAppearance.MenuItemFillDisabled.GradientType = gtVertical
    ItemAppearance.MenuItemFillDisabled.GradientMirrorType = gtVertical
    ItemAppearance.MenuItemFillDisabled.BorderColor = clNone
    ItemAppearance.MenuItemFillDisabled.Rounding = 0
    ItemAppearance.MenuItemFillDisabled.ShadowOffset = 0
    ItemAppearance.MenuItemFillDisabled.Glow = gmNone
    ItemAppearance.MenuItemFont.Charset = DEFAULT_CHARSET
    ItemAppearance.MenuItemFont.Color = clWindowText
    ItemAppearance.MenuItemFont.Height = -11
    ItemAppearance.MenuItemFont.Name = 'Tahoma'
    ItemAppearance.MenuItemFont.Style = []
    ItemAppearance.MenuItemFontSelected.Charset = DEFAULT_CHARSET
    ItemAppearance.MenuItemFontSelected.Color = clWindowText
    ItemAppearance.MenuItemFontSelected.Height = -11
    ItemAppearance.MenuItemFontSelected.Name = 'Tahoma'
    ItemAppearance.MenuItemFontSelected.Style = []
    ItemAppearance.MenuItemFontHover.Charset = DEFAULT_CHARSET
    ItemAppearance.MenuItemFontHover.Color = clWindowText
    ItemAppearance.MenuItemFontHover.Height = -11
    ItemAppearance.MenuItemFontHover.Name = 'Tahoma'
    ItemAppearance.MenuItemFontHover.Style = []
    ItemAppearance.MenuItemFontDisabled.Charset = DEFAULT_CHARSET
    ItemAppearance.MenuItemFontDisabled.Color = clGray
    ItemAppearance.MenuItemFontDisabled.Height = -11
    ItemAppearance.MenuItemFontDisabled.Name = 'Tahoma'
    ItemAppearance.MenuItemFontDisabled.Style = []
    ItemAppearance.MenuItemSeparatorFill.ColorMirror = clNone
    ItemAppearance.MenuItemSeparatorFill.ColorMirrorTo = clNone
    ItemAppearance.MenuItemSeparatorFill.GradientType = gtVertical
    ItemAppearance.MenuItemSeparatorFill.GradientMirrorType = gtSolid
    ItemAppearance.MenuItemSeparatorFill.BorderColor = clNone
    ItemAppearance.MenuItemSeparatorFill.Rounding = 0
    ItemAppearance.MenuItemSeparatorFill.ShadowOffset = 0
    ItemAppearance.MenuItemSeparatorFill.Glow = gmNone
    ItemAppearance.Margin.Left = 0
    ItemAppearance.Margin.Top = 0
    ItemAppearance.Margin.Bottom = 0
    ItemAppearance.Margin.Right = 0
    MenuItems = <
      item
        Menu.ItemAppearance.SeparatorFill.ColorMirror = clNone
        Menu.ItemAppearance.SeparatorFill.ColorMirrorTo = clNone
        Menu.ItemAppearance.SeparatorFill.GradientType = gtVertical
        Menu.ItemAppearance.SeparatorFill.GradientMirrorType = gtSolid
        Menu.ItemAppearance.SeparatorFill.BorderColor = clNone
        Menu.ItemAppearance.SeparatorFill.Rounding = 0
        Menu.ItemAppearance.SeparatorFill.ShadowOffset = 0
        Menu.ItemAppearance.SeparatorFill.Glow = gmNone
        Menu.ItemAppearance.BreakFill.ColorMirror = clNone
        Menu.ItemAppearance.BreakFill.ColorMirrorTo = clNone
        Menu.ItemAppearance.BreakFill.GradientType = gtVertical
        Menu.ItemAppearance.BreakFill.GradientMirrorType = gtSolid
        Menu.ItemAppearance.BreakFill.BorderColor = clNone
        Menu.ItemAppearance.BreakFill.Rounding = 0
        Menu.ItemAppearance.BreakFill.ShadowOffset = 0
        Menu.ItemAppearance.BreakFill.Glow = gmNone
        Menu.ItemAppearance.FillSelected.Color = 11196927
        Menu.ItemAppearance.FillSelected.ColorTo = 7257087
        Menu.ItemAppearance.FillSelected.ColorMirror = 4370174
        Menu.ItemAppearance.FillSelected.ColorMirrorTo = 8053246
        Menu.ItemAppearance.FillSelected.GradientType = gtVertical
        Menu.ItemAppearance.FillSelected.GradientMirrorType = gtVertical
        Menu.ItemAppearance.FillSelected.BorderColor = 4370174
        Menu.ItemAppearance.FillSelected.Rounding = 0
        Menu.ItemAppearance.FillSelected.ShadowOffset = 0
        Menu.ItemAppearance.FillSelected.Glow = gmNone
        Menu.ItemAppearance.FillDisabled.Color = 15921906
        Menu.ItemAppearance.FillDisabled.ColorTo = 11974326
        Menu.ItemAppearance.FillDisabled.ColorMirror = 11974326
        Menu.ItemAppearance.FillDisabled.ColorMirrorTo = 15921906
        Menu.ItemAppearance.FillDisabled.GradientType = gtVertical
        Menu.ItemAppearance.FillDisabled.GradientMirrorType = gtVertical
        Menu.ItemAppearance.FillDisabled.BorderColor = clNone
        Menu.ItemAppearance.FillDisabled.Rounding = 0
        Menu.ItemAppearance.FillDisabled.ShadowOffset = 0
        Menu.ItemAppearance.FillDisabled.Glow = gmNone
        Menu.ItemAppearance.FillHover.Color = 15465983
        Menu.ItemAppearance.FillHover.ColorTo = 11332863
        Menu.ItemAppearance.FillHover.ColorMirror = 5888767
        Menu.ItemAppearance.FillHover.ColorMirrorTo = 10807807
        Menu.ItemAppearance.FillHover.GradientType = gtVertical
        Menu.ItemAppearance.FillHover.GradientMirrorType = gtVertical
        Menu.ItemAppearance.FillHover.BorderColor = 10079963
        Menu.ItemAppearance.FillHover.Rounding = 0
        Menu.ItemAppearance.FillHover.ShadowOffset = 0
        Menu.ItemAppearance.FillHover.Glow = gmNone
        Menu.ItemAppearance.Fill.Color = clNone
        Menu.ItemAppearance.Fill.ColorMirror = clNone
        Menu.ItemAppearance.Fill.ColorMirrorTo = clNone
        Menu.ItemAppearance.Fill.GradientType = gtVertical
        Menu.ItemAppearance.Fill.GradientMirrorType = gtSolid
        Menu.ItemAppearance.Fill.BorderColor = clNone
        Menu.ItemAppearance.Fill.Rounding = 0
        Menu.ItemAppearance.Fill.ShadowOffset = 0
        Menu.ItemAppearance.Fill.Glow = gmNone
        Menu.ItemAppearance.FontSelected.Charset = DEFAULT_CHARSET
        Menu.ItemAppearance.FontSelected.Color = clBlack
        Menu.ItemAppearance.FontSelected.Height = -11
        Menu.ItemAppearance.FontSelected.Name = 'Tahoma'
        Menu.ItemAppearance.FontSelected.Style = []
        Menu.ItemAppearance.FontDisabled.Charset = DEFAULT_CHARSET
        Menu.ItemAppearance.FontDisabled.Color = clGray
        Menu.ItemAppearance.FontDisabled.Height = -11
        Menu.ItemAppearance.FontDisabled.Name = 'Tahoma'
        Menu.ItemAppearance.FontDisabled.Style = []
        Menu.ItemAppearance.FontHover.Charset = DEFAULT_CHARSET
        Menu.ItemAppearance.FontHover.Color = clBlack
        Menu.ItemAppearance.FontHover.Height = -11
        Menu.ItemAppearance.FontHover.Name = 'Tahoma'
        Menu.ItemAppearance.FontHover.Style = []
        Menu.ItemAppearance.Font.Charset = DEFAULT_CHARSET
        Menu.ItemAppearance.Font.Color = clBlack
        Menu.ItemAppearance.Font.Height = -11
        Menu.ItemAppearance.Font.Name = 'Tahoma'
        Menu.ItemAppearance.Font.Style = []
        Menu.ItemAppearance.ShortCutFont.Charset = DEFAULT_CHARSET
        Menu.ItemAppearance.ShortCutFont.Color = clWindowText
        Menu.ItemAppearance.ShortCutFont.Height = -11
        Menu.ItemAppearance.ShortCutFont.Name = 'Tahoma'
        Menu.ItemAppearance.ShortCutFont.Style = []
        Menu.ItemAppearance.DetailFont.Charset = DEFAULT_CHARSET
        Menu.ItemAppearance.DetailFont.Color = clWindowText
        Menu.ItemAppearance.DetailFont.Height = -11
        Menu.ItemAppearance.DetailFont.Name = 'Tahoma'
        Menu.ItemAppearance.DetailFont.Style = []
        Menu.TearOffFill.Color = 16773091
        Menu.TearOffFill.ColorTo = 16765615
        Menu.TearOffFill.ColorMirror = clNone
        Menu.TearOffFill.ColorMirrorTo = clNone
        Menu.TearOffFill.GradientType = gtVertical
        Menu.TearOffFill.GradientMirrorType = gtSolid
        Menu.TearOffFill.BorderColor = 16765615
        Menu.TearOffFill.Rounding = 0
        Menu.TearOffFill.ShadowOffset = 0
        Menu.TearOffFill.Glow = gmNone
        Menu.ContentFill.Color = 15984090
        Menu.ContentFill.ColorTo = 15785680
        Menu.ContentFill.ColorMirror = clNone
        Menu.ContentFill.ColorMirrorTo = clNone
        Menu.ContentFill.GradientType = gtVertical
        Menu.ContentFill.GradientMirrorType = gtSolid
        Menu.ContentFill.BorderColor = clBlack
        Menu.ContentFill.BorderOpacity = 50
        Menu.ContentFill.Rounding = 0
        Menu.ContentFill.ShadowOffset = 0
        Menu.ContentFill.Glow = gmNone
        Menu.Sections = <
          item
            CaptionFont.Charset = DEFAULT_CHARSET
            CaptionFont.Color = clWindowText
            CaptionFont.Height = -11
            CaptionFont.Name = 'Tahoma'
            CaptionFont.Style = []
            CaptionFill.Color = 16773091
            CaptionFill.ColorTo = 16768452
            CaptionFill.ColorMirror = 16765357
            CaptionFill.ColorMirrorTo = 16767936
            CaptionFill.GradientType = gtVertical
            CaptionFill.GradientMirrorType = gtVertical
            CaptionFill.BorderColor = clNone
            CaptionFill.Rounding = 0
            CaptionFill.ShadowOffset = 0
            CaptionFill.Glow = gmNone
            BackGroundFill.Color = 15984090
            BackGroundFill.ColorTo = 15785680
            BackGroundFill.ColorMirror = clNone
            BackGroundFill.ColorMirrorTo = clNone
            BackGroundFill.GradientType = gtVertical
            BackGroundFill.GradientMirrorType = gtSolid
            BackGroundFill.BorderColor = clNone
            BackGroundFill.Rounding = 0
            BackGroundFill.ShadowOffset = 0
            BackGroundFill.Glow = gmNone
            Items = <
              item
                Control = AdvSmoothMegaMenu1
                Text = '&Novo'
                GraphicLeftName = 'None'
                GraphicRightName = 'None'
              end
              item
                ItemType = itLineSeparator
                Text = 'Item 1'
              end
              item
                Text = 'Salvar'
                ShortCut = 16467
              end
              item
                Text = '&Salvar e Fechar'
              end
              item
                Text = 'Salvar e Novo'
                ShortCut = 16462
              end
              item
                ItemType = itLineSeparator
                Text = 'Item 5'
              end
              item
                Text = '&Fechar'
              end>
            AutoItemHeight = True
            ItemRectangleMargin.Left = 3
            ItemRectangleMargin.Top = 3
            ItemRectangleMargin.Bottom = 3
            ItemRectangleMargin.Right = 3
            ItemSpacing = 0
          end>
        Menu.TopLayerItems = <>
        MenuAutoSize = True
        Caption = '&Arquivo'
        CaptionLocation = mlBottomLeft
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Height = 10
        Tag = 0
      end
      item
        Menu.ItemAppearance.SeparatorFill.ColorMirror = clNone
        Menu.ItemAppearance.SeparatorFill.ColorMirrorTo = clNone
        Menu.ItemAppearance.SeparatorFill.GradientType = gtVertical
        Menu.ItemAppearance.SeparatorFill.GradientMirrorType = gtSolid
        Menu.ItemAppearance.SeparatorFill.BorderColor = clNone
        Menu.ItemAppearance.SeparatorFill.Rounding = 0
        Menu.ItemAppearance.SeparatorFill.ShadowOffset = 0
        Menu.ItemAppearance.SeparatorFill.Glow = gmNone
        Menu.ItemAppearance.BreakFill.ColorMirror = clNone
        Menu.ItemAppearance.BreakFill.ColorMirrorTo = clNone
        Menu.ItemAppearance.BreakFill.GradientType = gtVertical
        Menu.ItemAppearance.BreakFill.GradientMirrorType = gtSolid
        Menu.ItemAppearance.BreakFill.BorderColor = clNone
        Menu.ItemAppearance.BreakFill.Rounding = 0
        Menu.ItemAppearance.BreakFill.ShadowOffset = 0
        Menu.ItemAppearance.BreakFill.Glow = gmNone
        Menu.ItemAppearance.FillSelected.Color = 11196927
        Menu.ItemAppearance.FillSelected.ColorTo = 7257087
        Menu.ItemAppearance.FillSelected.ColorMirror = 4370174
        Menu.ItemAppearance.FillSelected.ColorMirrorTo = 8053246
        Menu.ItemAppearance.FillSelected.GradientType = gtVertical
        Menu.ItemAppearance.FillSelected.GradientMirrorType = gtVertical
        Menu.ItemAppearance.FillSelected.BorderColor = 4370174
        Menu.ItemAppearance.FillSelected.Rounding = 0
        Menu.ItemAppearance.FillSelected.ShadowOffset = 0
        Menu.ItemAppearance.FillSelected.Glow = gmNone
        Menu.ItemAppearance.FillDisabled.Color = 15921906
        Menu.ItemAppearance.FillDisabled.ColorTo = 11974326
        Menu.ItemAppearance.FillDisabled.ColorMirror = 11974326
        Menu.ItemAppearance.FillDisabled.ColorMirrorTo = 15921906
        Menu.ItemAppearance.FillDisabled.GradientType = gtVertical
        Menu.ItemAppearance.FillDisabled.GradientMirrorType = gtVertical
        Menu.ItemAppearance.FillDisabled.BorderColor = clNone
        Menu.ItemAppearance.FillDisabled.Rounding = 0
        Menu.ItemAppearance.FillDisabled.ShadowOffset = 0
        Menu.ItemAppearance.FillDisabled.Glow = gmNone
        Menu.ItemAppearance.FillHover.Color = 15465983
        Menu.ItemAppearance.FillHover.ColorTo = 11332863
        Menu.ItemAppearance.FillHover.ColorMirror = 5888767
        Menu.ItemAppearance.FillHover.ColorMirrorTo = 10807807
        Menu.ItemAppearance.FillHover.GradientType = gtVertical
        Menu.ItemAppearance.FillHover.GradientMirrorType = gtVertical
        Menu.ItemAppearance.FillHover.BorderColor = 10079963
        Menu.ItemAppearance.FillHover.Rounding = 0
        Menu.ItemAppearance.FillHover.ShadowOffset = 0
        Menu.ItemAppearance.FillHover.Glow = gmNone
        Menu.ItemAppearance.Fill.Color = clNone
        Menu.ItemAppearance.Fill.ColorMirror = clNone
        Menu.ItemAppearance.Fill.ColorMirrorTo = clNone
        Menu.ItemAppearance.Fill.GradientType = gtVertical
        Menu.ItemAppearance.Fill.GradientMirrorType = gtSolid
        Menu.ItemAppearance.Fill.BorderColor = clNone
        Menu.ItemAppearance.Fill.Rounding = 0
        Menu.ItemAppearance.Fill.ShadowOffset = 0
        Menu.ItemAppearance.Fill.Glow = gmNone
        Menu.ItemAppearance.FontSelected.Charset = DEFAULT_CHARSET
        Menu.ItemAppearance.FontSelected.Color = clBlack
        Menu.ItemAppearance.FontSelected.Height = -11
        Menu.ItemAppearance.FontSelected.Name = 'Tahoma'
        Menu.ItemAppearance.FontSelected.Style = []
        Menu.ItemAppearance.FontDisabled.Charset = DEFAULT_CHARSET
        Menu.ItemAppearance.FontDisabled.Color = clGray
        Menu.ItemAppearance.FontDisabled.Height = -11
        Menu.ItemAppearance.FontDisabled.Name = 'Tahoma'
        Menu.ItemAppearance.FontDisabled.Style = []
        Menu.ItemAppearance.FontHover.Charset = DEFAULT_CHARSET
        Menu.ItemAppearance.FontHover.Color = clBlack
        Menu.ItemAppearance.FontHover.Height = -11
        Menu.ItemAppearance.FontHover.Name = 'Tahoma'
        Menu.ItemAppearance.FontHover.Style = []
        Menu.ItemAppearance.Font.Charset = DEFAULT_CHARSET
        Menu.ItemAppearance.Font.Color = clBlack
        Menu.ItemAppearance.Font.Height = -11
        Menu.ItemAppearance.Font.Name = 'Tahoma'
        Menu.ItemAppearance.Font.Style = []
        Menu.ItemAppearance.ShortCutFont.Charset = DEFAULT_CHARSET
        Menu.ItemAppearance.ShortCutFont.Color = clWindowText
        Menu.ItemAppearance.ShortCutFont.Height = -11
        Menu.ItemAppearance.ShortCutFont.Name = 'Tahoma'
        Menu.ItemAppearance.ShortCutFont.Style = []
        Menu.ItemAppearance.DetailFont.Charset = DEFAULT_CHARSET
        Menu.ItemAppearance.DetailFont.Color = clWindowText
        Menu.ItemAppearance.DetailFont.Height = -11
        Menu.ItemAppearance.DetailFont.Name = 'Tahoma'
        Menu.ItemAppearance.DetailFont.Style = []
        Menu.TearOffFill.Color = 16773091
        Menu.TearOffFill.ColorTo = 16765615
        Menu.TearOffFill.ColorMirror = clNone
        Menu.TearOffFill.ColorMirrorTo = clNone
        Menu.TearOffFill.GradientType = gtVertical
        Menu.TearOffFill.GradientMirrorType = gtSolid
        Menu.TearOffFill.BorderColor = 16765615
        Menu.TearOffFill.Rounding = 0
        Menu.TearOffFill.ShadowOffset = 0
        Menu.TearOffFill.Glow = gmNone
        Menu.ContentFill.Color = 15984090
        Menu.ContentFill.ColorTo = 15785680
        Menu.ContentFill.ColorMirror = clNone
        Menu.ContentFill.ColorMirrorTo = clNone
        Menu.ContentFill.GradientType = gtVertical
        Menu.ContentFill.GradientMirrorType = gtSolid
        Menu.ContentFill.BorderColor = clBlack
        Menu.ContentFill.BorderOpacity = 50
        Menu.ContentFill.Rounding = 0
        Menu.ContentFill.ShadowOffset = 0
        Menu.ContentFill.Glow = gmNone
        Menu.Sections = <
          item
            CaptionFont.Charset = DEFAULT_CHARSET
            CaptionFont.Color = clWindowText
            CaptionFont.Height = -11
            CaptionFont.Name = 'Tahoma'
            CaptionFont.Style = []
            CaptionFill.Color = 16773091
            CaptionFill.ColorTo = 16768452
            CaptionFill.ColorMirror = 16765357
            CaptionFill.ColorMirrorTo = 16767936
            CaptionFill.GradientType = gtVertical
            CaptionFill.GradientMirrorType = gtVertical
            CaptionFill.BorderColor = clNone
            CaptionFill.Rounding = 0
            CaptionFill.ShadowOffset = 0
            CaptionFill.Glow = gmNone
            BackGroundFill.Color = 15984090
            BackGroundFill.ColorTo = 15785680
            BackGroundFill.ColorMirror = clNone
            BackGroundFill.ColorMirrorTo = clNone
            BackGroundFill.GradientType = gtVertical
            BackGroundFill.GradientMirrorType = gtSolid
            BackGroundFill.BorderColor = clNone
            BackGroundFill.Rounding = 0
            BackGroundFill.ShadowOffset = 0
            BackGroundFill.Glow = gmNone
            Items = <
              item
                Text = '&Desfazer altera'#231#245'es'
              end>
            AutoItemHeight = True
            ItemRectangleMargin.Left = 3
            ItemRectangleMargin.Top = 3
            ItemRectangleMargin.Bottom = 3
            ItemRectangleMargin.Right = 3
            ItemSpacing = 0
          end>
        Menu.TopLayerItems = <>
        MenuAutoSize = True
        Caption = '&Edi'#231#227'o'
        CaptionLocation = mlBottomLeft
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Height = 20
        Tag = 0
      end
      item
        Menu.ItemAppearance.SeparatorFill.ColorMirror = clNone
        Menu.ItemAppearance.SeparatorFill.ColorMirrorTo = clNone
        Menu.ItemAppearance.SeparatorFill.GradientType = gtVertical
        Menu.ItemAppearance.SeparatorFill.GradientMirrorType = gtSolid
        Menu.ItemAppearance.SeparatorFill.BorderColor = clNone
        Menu.ItemAppearance.SeparatorFill.Rounding = 0
        Menu.ItemAppearance.SeparatorFill.ShadowOffset = 0
        Menu.ItemAppearance.SeparatorFill.Glow = gmNone
        Menu.ItemAppearance.BreakFill.ColorMirror = clNone
        Menu.ItemAppearance.BreakFill.ColorMirrorTo = clNone
        Menu.ItemAppearance.BreakFill.GradientType = gtVertical
        Menu.ItemAppearance.BreakFill.GradientMirrorType = gtSolid
        Menu.ItemAppearance.BreakFill.BorderColor = clNone
        Menu.ItemAppearance.BreakFill.Rounding = 0
        Menu.ItemAppearance.BreakFill.ShadowOffset = 0
        Menu.ItemAppearance.BreakFill.Glow = gmNone
        Menu.ItemAppearance.FillSelected.Color = 11196927
        Menu.ItemAppearance.FillSelected.ColorTo = 7257087
        Menu.ItemAppearance.FillSelected.ColorMirror = 4370174
        Menu.ItemAppearance.FillSelected.ColorMirrorTo = 8053246
        Menu.ItemAppearance.FillSelected.GradientType = gtVertical
        Menu.ItemAppearance.FillSelected.GradientMirrorType = gtVertical
        Menu.ItemAppearance.FillSelected.BorderColor = 4370174
        Menu.ItemAppearance.FillSelected.Rounding = 0
        Menu.ItemAppearance.FillSelected.ShadowOffset = 0
        Menu.ItemAppearance.FillSelected.Glow = gmNone
        Menu.ItemAppearance.FillDisabled.Color = 15921906
        Menu.ItemAppearance.FillDisabled.ColorTo = 11974326
        Menu.ItemAppearance.FillDisabled.ColorMirror = 11974326
        Menu.ItemAppearance.FillDisabled.ColorMirrorTo = 15921906
        Menu.ItemAppearance.FillDisabled.GradientType = gtVertical
        Menu.ItemAppearance.FillDisabled.GradientMirrorType = gtVertical
        Menu.ItemAppearance.FillDisabled.BorderColor = clNone
        Menu.ItemAppearance.FillDisabled.Rounding = 0
        Menu.ItemAppearance.FillDisabled.ShadowOffset = 0
        Menu.ItemAppearance.FillDisabled.Glow = gmNone
        Menu.ItemAppearance.FillHover.Color = 15465983
        Menu.ItemAppearance.FillHover.ColorTo = 11332863
        Menu.ItemAppearance.FillHover.ColorMirror = 5888767
        Menu.ItemAppearance.FillHover.ColorMirrorTo = 10807807
        Menu.ItemAppearance.FillHover.GradientType = gtVertical
        Menu.ItemAppearance.FillHover.GradientMirrorType = gtVertical
        Menu.ItemAppearance.FillHover.BorderColor = 10079963
        Menu.ItemAppearance.FillHover.Rounding = 0
        Menu.ItemAppearance.FillHover.ShadowOffset = 0
        Menu.ItemAppearance.FillHover.Glow = gmNone
        Menu.ItemAppearance.Fill.Color = clNone
        Menu.ItemAppearance.Fill.ColorMirror = clNone
        Menu.ItemAppearance.Fill.ColorMirrorTo = clNone
        Menu.ItemAppearance.Fill.GradientType = gtVertical
        Menu.ItemAppearance.Fill.GradientMirrorType = gtSolid
        Menu.ItemAppearance.Fill.BorderColor = clNone
        Menu.ItemAppearance.Fill.Rounding = 0
        Menu.ItemAppearance.Fill.ShadowOffset = 0
        Menu.ItemAppearance.Fill.Glow = gmNone
        Menu.ItemAppearance.FontSelected.Charset = DEFAULT_CHARSET
        Menu.ItemAppearance.FontSelected.Color = clBlack
        Menu.ItemAppearance.FontSelected.Height = -11
        Menu.ItemAppearance.FontSelected.Name = 'Tahoma'
        Menu.ItemAppearance.FontSelected.Style = []
        Menu.ItemAppearance.FontDisabled.Charset = DEFAULT_CHARSET
        Menu.ItemAppearance.FontDisabled.Color = clGray
        Menu.ItemAppearance.FontDisabled.Height = -11
        Menu.ItemAppearance.FontDisabled.Name = 'Tahoma'
        Menu.ItemAppearance.FontDisabled.Style = []
        Menu.ItemAppearance.FontHover.Charset = DEFAULT_CHARSET
        Menu.ItemAppearance.FontHover.Color = clBlack
        Menu.ItemAppearance.FontHover.Height = -11
        Menu.ItemAppearance.FontHover.Name = 'Tahoma'
        Menu.ItemAppearance.FontHover.Style = []
        Menu.ItemAppearance.Font.Charset = DEFAULT_CHARSET
        Menu.ItemAppearance.Font.Color = clBlack
        Menu.ItemAppearance.Font.Height = -11
        Menu.ItemAppearance.Font.Name = 'Tahoma'
        Menu.ItemAppearance.Font.Style = []
        Menu.ItemAppearance.ShortCutFont.Charset = DEFAULT_CHARSET
        Menu.ItemAppearance.ShortCutFont.Color = clWindowText
        Menu.ItemAppearance.ShortCutFont.Height = -11
        Menu.ItemAppearance.ShortCutFont.Name = 'Tahoma'
        Menu.ItemAppearance.ShortCutFont.Style = []
        Menu.ItemAppearance.DetailFont.Charset = DEFAULT_CHARSET
        Menu.ItemAppearance.DetailFont.Color = clWindowText
        Menu.ItemAppearance.DetailFont.Height = -11
        Menu.ItemAppearance.DetailFont.Name = 'Tahoma'
        Menu.ItemAppearance.DetailFont.Style = []
        Menu.TearOffFill.Color = 16773091
        Menu.TearOffFill.ColorTo = 16765615
        Menu.TearOffFill.ColorMirror = clNone
        Menu.TearOffFill.ColorMirrorTo = clNone
        Menu.TearOffFill.GradientType = gtVertical
        Menu.TearOffFill.GradientMirrorType = gtSolid
        Menu.TearOffFill.BorderColor = 16765615
        Menu.TearOffFill.Rounding = 0
        Menu.TearOffFill.ShadowOffset = 0
        Menu.TearOffFill.Glow = gmNone
        Menu.ContentFill.Color = 15984090
        Menu.ContentFill.ColorTo = 15785680
        Menu.ContentFill.ColorMirror = clNone
        Menu.ContentFill.ColorMirrorTo = clNone
        Menu.ContentFill.GradientType = gtVertical
        Menu.ContentFill.GradientMirrorType = gtSolid
        Menu.ContentFill.BorderColor = clBlack
        Menu.ContentFill.BorderOpacity = 50
        Menu.ContentFill.Rounding = 0
        Menu.ContentFill.ShadowOffset = 0
        Menu.ContentFill.Glow = gmNone
        Menu.Sections = <
          item
            CaptionFont.Charset = DEFAULT_CHARSET
            CaptionFont.Color = clWindowText
            CaptionFont.Height = -11
            CaptionFont.Name = 'Tahoma'
            CaptionFont.Style = []
            Caption = 'Section on MenuItem 2'
            CaptionFill.Color = 16773091
            CaptionFill.ColorTo = 16768452
            CaptionFill.ColorMirror = 16765357
            CaptionFill.ColorMirrorTo = 16767936
            CaptionFill.GradientType = gtVertical
            CaptionFill.GradientMirrorType = gtVertical
            CaptionFill.BorderColor = clNone
            CaptionFill.Rounding = 0
            CaptionFill.ShadowOffset = 0
            CaptionFill.Glow = gmNone
            BackGroundFill.Color = 15984090
            BackGroundFill.ColorTo = 15785680
            BackGroundFill.ColorMirror = clNone
            BackGroundFill.ColorMirrorTo = clNone
            BackGroundFill.GradientType = gtVertical
            BackGroundFill.GradientMirrorType = gtSolid
            BackGroundFill.BorderColor = clNone
            BackGroundFill.Rounding = 0
            BackGroundFill.ShadowOffset = 0
            BackGroundFill.Glow = gmNone
            Items = <
              item
                Text = 'Item 0'
              end
              item
                Text = 'Item 1'
              end
              item
                Text = 'Item 2'
              end
              item
                Text = 'Item 3'
              end
              item
                Text = 'Item 4'
              end>
            AutoItemHeight = True
            ItemRectangleMargin.Left = 3
            ItemRectangleMargin.Top = 3
            ItemRectangleMargin.Bottom = 3
            ItemRectangleMargin.Right = 3
            ItemSpacing = 0
          end>
        Menu.TopLayerItems = <>
        MenuAutoSize = True
        Caption = 'Aj&uda'
        CaptionLocation = mlCenterLeft
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Tag = 0
      end>
    BackGroundFill.Color = 15984090
    BackGroundFill.ColorTo = 15785680
    BackGroundFill.ColorMirror = clNone
    BackGroundFill.ColorMirrorTo = clNone
    BackGroundFill.GradientType = gtVertical
    BackGroundFill.GradientMirrorType = gtSolid
    BackGroundFill.BorderColor = clNone
    BackGroundFill.Rounding = 0
    BackGroundFill.ShadowOffset = 0
    BackGroundFill.Glow = gmNone
    Version = '1.3.5.2'
    Align = alTop
    Visible = False
    ExplicitLeft = 8
  end
  inherited ActionList: TosActionList
    Left = 184
    Top = 40
    inherited OnCheckActionsAction: TAction
      OnExecute = OnCheckActionsActionExecute
    end
    object SaveAction: TAction
      Category = 'File'
      Caption = 'Salvar'
      Enabled = False
      Hint = 'Salvar'
      ShortCut = 16467
      OnExecute = SaveActionExecute
    end
    object SaveCloseAction: TAction
      Category = 'File'
      Caption = '&Salvar e Fechar'
      Enabled = False
      Hint = 'Salvar e Fechar'
      OnExecute = SaveCloseActionExecute
    end
    object NewAction: TAction
      Category = 'File'
      Caption = '&Novo'
      Enabled = False
      Hint = 'Inclui um novo'
      OnExecute = NewActionExecute
    end
    object CloseAction: TAction
      Category = 'File'
      Caption = '&Fechar'
      OnExecute = CloseActionExecute
    end
    object SaveNewAction: TAction
      Category = 'File'
      Caption = 'Salvar e Novo'
      Enabled = False
      Hint = 'Salvar e abrir um novo'
      ShortCut = 16462
      OnExecute = SaveNewActionExecute
    end
    object CancelUpdatesAction: TAction
      Category = 'Edit'
      Caption = '&Desfazer altera'#231#245'es'
      Hint = 'Desfaz as '#250'ltimas altera'#231#245'es'
      OnExecute = CancelUpdatesActionExecute
    end
    object ContentAction: TAction
      Category = 'Help'
      Caption = '&Conte'#250'do...'
      Hint = 'Mostra como usar a opera'#231#227'o atual'
    end
    object IndexAction: TAction
      Category = 'Help'
      Caption = '&'#205'ndice...'
      Hint = 'Mostra o '#237'ndice da ajuda'
    end
    object DeleteAction: TAction
      Category = 'File'
      Caption = 'E&xcluir'
      OnExecute = DeleteActionExecute
    end
    object ImprimirAction: TAction
      Category = 'File'
      Caption = '&Imprimir'
    end
  end
  object MasterDataSource: TDataSource [3]
    OnDataChange = MasterDataSourceDataChange
    Left = 248
    Top = 40
  end
  inherited ImageList: TImageList
    Left = 216
    Top = 40
    Bitmap = {
      494C010101000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6BD00BDB5AD009C9C94008C84
      84008C8484008C8484008C8484008C8484008C8484008C8484008C8484008C84
      84008C84840094948C00B5ADA500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063312900633129006331
      2900633129006331290063312900633129006331290063312900633129006331
      2900633129007B73730094948C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C635A00AD847300DEB5A500DEB5
      A500D6ADA500D6AD9C00CEA59C00CE9C9400CE9C8C00C6948C00C6948400C694
      84008C524200633129008C848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C635A00B58C7B00FFF7F700FFF7
      F700F7EFEF00F7EFE700EFDED600DEC6B500DEBDAD00D6B5A500D6B5A500DEB5
      A5008C524200633121008C848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C635A00B58C7B00FFF7F700DEDE
      D600DED6CE00DECEC600DECEBD00D6BDAD00CEB5A500CEAD9C00C6A59400DEBD
      AD008C524200633121008C848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C635A00BD948400FFF7F700FFF7
      F700F7F7EF00F7EFEF00F7EFE700EFE7DE00E7D6CE00DEBDAD00D6BDAD00DEBD
      B5008C524200633121008C848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C635A00BD9C8400FFF7F700FFF7
      F700FFF7F700F7F7EF00F7EFEF00F7EFE700EFE7DE00DEC6BD00DEC6B500E7CE
      BD008C5A4200633121008C848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C635A00C69C8C00FFFFF700FFFF
      F700FFF7F700FFF7F700F7F7EF00F7EFE700F7EFE700EFD6CE00EFD6C600E7D6
      C600945A4200633121008C848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C635A00C6A59400C6A59400C69C
      8C00BD948400BD948400BD947B00B58C7B00B5847300AD7B6B009C634A00945A
      4A00945A4A00633121008C848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C635A00CEAD9C00C6A59400C6A5
      9400BD9C8C00BD9C8400BD948400B58C7B00B58C7B00AD8473009C6352009C63
      4A00945A4A00633121008C848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C635A00CEAD9C00CEAD9C00C6A5
      9400C6A58C00BD9C8C00BD9C8400BD947B00B58C7B00B5847300AD7B6B009C63
      5200945A4A00633121008C848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C6B5A00D6B5A500FFFFFF009C63
      4A00D6BDAD00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFEFEF00F7EFE700F7E7
      DE009C635200633121008C848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000946B5A00D6BDAD00FFFFFF009C63
      4A00D6BDAD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7EF00FFEF
      EF00A56B5A00633121008C848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000946B5A00D6BDB500FFFFFF009C63
      4A009C634A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7
      F700B58473006331290094948C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000946B5A00946B5A008C6B
      5A008C635A008C635A008C635A008C6352008C6352008C6352008C6352008C5A
      5200845A5200BDBDB500CEC6BD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF0000000000000001000000000000
      8001000000000000000100000000000000010000000000000001000000000000
      0001000000000000000100000000000000010000000000000001000000000000
      0001000000000000000100000000000000010000000000000001000000000000
      0001000000000000800100000000000000000000000000000000000000000000
      000000000000}
  end
  object MainMenu: TMainMenu
    Left = 152
    Top = 40
    object Arquivo1: TMenuItem
      Caption = '&Arquivo'
      object Novo1: TMenuItem
        Action = NewAction
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Salvar1: TMenuItem
        Action = SaveAction
      end
      object SalvareFechar1: TMenuItem
        Action = SaveCloseAction
      end
      object SalvareNovo1: TMenuItem
        Action = SaveNewAction
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Fechar1: TMenuItem
        Action = CloseAction
      end
    end
    object Edio1: TMenuItem
      Caption = '&Edi'#231#227'o'
      object Desfazeralteraes1: TMenuItem
        Action = CancelUpdatesAction
      end
    end
    object Ajuda1: TMenuItem
      Caption = 'Aj&uda'
      object Contedo1: TMenuItem
        Action = ContentAction
      end
      object ndice1: TMenuItem
        Action = IndexAction
      end
    end
  end
end
