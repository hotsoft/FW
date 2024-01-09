inherited osCustomMainForm: TosCustomMainForm
  Left = 233
  Top = 311
  Caption = 'osCustomMainForm'
  ClientHeight = 645
  ClientWidth = 1008
  DoubleBuffered = True
  KeyPreview = True
  Menu = MainMenu
  Visible = True
  WindowState = wsMaximized
  ExplicitWidth = 1024
  ExplicitHeight = 704
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TStatusBar [0]
    Left = 0
    Top = 626
    Width = 1008
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Width = 60
      end
      item
        Width = 150
      end
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 0
    Width = 1008
    Height = 626
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 141
      Top = 34
      Width = 4
      Height = 592
      ExplicitLeft = 165
      ExplicitTop = 33
      ExplicitHeight = 556
    end
    object WebBrowser: TWebBrowser
      Left = 145
      Top = 34
      Width = 863
      Height = 592
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 185
      ExplicitTop = 33
      ExplicitWidth = 823
      ExplicitHeight = 556
      ControlData = {
        4C000000325900002F3D00000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E12620A000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
    object Panel1: TPanel
      Left = 0
      Top = 34
      Width = 141
      Height = 592
      Align = alLeft
      TabOrder = 1
      object TreeView1: TTreeView
        Left = 1
        Top = 1
        Width = 44
        Height = 569
        Align = alLeft
        Color = clBtnFace
        HotTrack = True
        Images = BarSmallImages
        Indent = 19
        MultiSelectStyle = [msControlSelect, msShiftSelect]
        ShowLines = False
        ShowRoot = False
        StateImages = BarSmallImages
        TabOrder = 0
        Visible = False
        OnChange = TreeView1Change
        OnCustomDrawItem = TreeView1CustomDrawItem
      end
      object EdtPesquisa: TEdit
        Left = 1
        Top = 570
        Width = 139
        Height = 21
        Align = alBottom
        AutoSelect = False
        TabOrder = 1
        OnChange = EdtPesquisaChange
        OnEnter = EdtPesquisaEnter
        OnKeyDown = EdtPesquisaKeyDown
      end
      object AdvSmoothMegaMenu: TAdvSmoothMegaMenu
        Left = 45
        Top = 1
        Width = 95
        Height = 569
        OpenMenusOnClick = True
        AutoOpenMenus = False
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
        DefaultSection.Height = 50
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
        DefaultSection.AutoItemHeight = False
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
        AutoSize = asCustom
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
                Caption = 'Section on MenuItem 0'
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
                Height = 50
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
            Menu.ImageList = BarLargeImages
            MenuAutoSize = True
            MenuHeight = 10
            Caption = 'MenuItem 0'
            CaptionFont.Charset = DEFAULT_CHARSET
            CaptionFont.Color = clWindowText
            CaptionFont.Height = -11
            CaptionFont.Name = 'Tahoma'
            CaptionFont.Style = [fsBold]
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
        Direction = mdVertical
        Transparent = True
        ImageList = BarLargeImages
        Version = '1.3.5.2'
        Align = alClient
      end
    end
    object AbasPrincipalTS: TPageControl
      Left = 145
      Top = 34
      Width = 863
      Height = 592
      ActivePage = PesquisaTS
      Align = alClient
      TabOrder = 2
      OnChange = AbasPrincipalTSChange
      object PesquisaTS: TTabSheet
        Caption = 'Pesquisa'
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 855
          Height = 564
          Align = alClient
          Caption = 'Selecione o recurso no menu para pesquisar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object Grid: TcxGrid
          Left = 24
          Top = 20
          Width = 338
          Height = 187
          Align = alCustom
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          LookAndFeel.NativeStyle = False
          object TvGrid: TcxGridDBTableView
            OnDblClick = TvGridDblClick
            OnKeyDown = TvGridKeyDown
            OnKeyPress = TvGridKeyPress
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = FilterDatasource
            DataController.Options = [dcoImmediatePost]
            DataController.Summary.DefaultGroupSummaryItems = <
              item
                Kind = skCount
              end>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skCount
                DisplayText = 'Total: '
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.AlwaysShowEditor = True
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsSelection.MultiSelect = True
            OptionsView.Footer = True
            OptionsView.GroupFooterMultiSummaries = True
            OptionsView.GroupFooters = gfVisibleWhenExpanded
            Styles.Background = cxStyle1
            Styles.Content = cxStyle2
            Styles.ContentEven = cxStyle3
            Styles.ContentOdd = cxStyle3
            Styles.FilterBox = cxStyle4
            Styles.IncSearch = cxStyle10
            Styles.Footer = cxStyle5
            Styles.Group = cxStyle6
            Styles.GroupByBox = cxStyle7
            Styles.Header = cxStyle8
            Styles.Inactive = cxStyle14
            Styles.Indicator = cxStyle11
            Styles.Preview = cxStyle12
            Styles.Selection = cxStyle16
            OnColumnHeaderClick = TvGridColumnHeaderClick
          end
          object LvGrid: TcxGridLevel
            GridView = TvGrid
          end
        end
      end
    end
    object MainFormBotoesPanel: TPanel
      Left = 0
      Top = 0
      Width = 1008
      Height = 34
      Align = alTop
      TabOrder = 3
      object MainFormBotoesPanel2: TPanel
        Left = 1
        Top = 1
        Width = 344
        Height = 32
        Align = alLeft
        BevelOuter = bvNone
        DoubleBuffered = False
        ParentDoubleBuffered = False
        TabOrder = 0
        object AdvGlassButton1: TAdvGlassButton
          Left = 0
          Top = 0
          Width = 44
          Height = 32
          Action = NewAction
          BackColor = clSilver
          ButtonDirection = bdLeft
          ButtonShape = btsCurvedRectangle
          CornerRadius = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ForeColor = clWhite
          GlowColor = 16760205
          InnerBorderColor = clBlack
          OuterBorderColor = clWhite
          Picture.Data = {
            424D0E0600000000000036000000280000001600000016000000010018000000
            0000D805000000000000000000000000000000000000FF00FFDED6CE7B6B6B7B
            6B6B7B6B6B7B6B6B7B6B6B7B6B6B7B6B6B7B6B6B7B6B6B7B6B6B7B6B6B7B6B6B
            7B6B6B7B6B6B7B6B6B7B6B6BFF00FFFF00FFFF00FFFF00FF0000FF00FFDECECE
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7FFF7F7FFF7F7F7F7EFF7F7
            EFF7EFEFF7EFEFF7EFE7EFE7E77B6B6BFF00FFFF00FFFF00FFFF00FF0000FF00
            FFDECECEFFFFFFFFF7F7FFF7F7FFF7F7FFF7F7FFF7F7F7F7EFF7F7EFF7F7EFF7
            EFEFF7EFEFF7EFE7EFE7E7EFE7E7EFE7DE7B6B6BFF00FFFF00FFFF00FFFF00FF
            0000FF00FFDECECEFFFFFFFFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7F7F7EF
            F7F7EFF7EFEFF7EFEFF7EFEFEFE7E7EFE7E7EFE7E77B6B6BFF00FFFF00FFFF00
            FFFF00FF0000FF00FFDECECEFFFFFFFFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7
            F7F7F7EFF7F7EFF7EFEFF7EFEFF7EFEFF7E7E7EFE7E7EFE7E77B6B6BFF00FFFF
            00FFFF00FFFF00FF0000FF00FFDECECEFFFFFFFFF7F7FFF7F7FFF7F7FFF7F7FF
            F7F7FFF7F7F7F7EFF7F7EFF7EFEFF7EFEFF7EFEFF7E7E7EFE7E7EFE7E77B6B6B
            FF00FFFF00FFFF00FFFF00FF0000FF00FFDECECEFFFFFFFFF7F7FFF7F7FFF7F7
            FFF7F7FFF7F7FFF7F7F7F7EFF7F7EFF7EFEFF7EFEFF7EFEFF7E7E7EFE7E7EFE7
            E77B6B6BFF00FFFF00FFFF00FFFF00FF0000FF00FFDECECEFFFFFFFFF7F7FFF7
            F7FFF7F7FFF7F7FFF7F7FFF7F7F7F7EFF7F7EFF7EFEFF7EFEFF7EFE7EFE7E7EF
            E7E7EFE7DE7B6B6BFF00FFFF00FFFF00FFFF00FF0000FF00FFDECECEFFFFFFFF
            F7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7F7F7EFF7F7EFF7EFEFF7EFEFF7EFE7
            EFE7E7EFE7E7EFE7E77B6B6BFF00FFFF00FFFF00FFFF00FF0000FF00FFDECECE
            FFFFFFFFFFFFFFFFFFFFFFFFFFF7F7FFF7F7F7F7EFF7F7EFF7EFEFF7EFEFF7E7
            E7EFE7E7EFE7E7EFE7DEEFE7DE7B6B6BFF00FFFF00FFFF00FFFF00FF0000FF00
            FFDECECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7EFEFF7EFEFF7EFEFEF
            E7E7EFE7E7EFE7E7EFE7DEEFE7DEEFDEDE7B6B6BFF00FFFF00FFFF00FFFF00FF
            0000FF00FFDECECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7EFF7EFEF
            F7EFE7EFE7E7EFE7E7EFE7DEEFDEDEEFDEDEE7DEDE7B6B6BFF00FFFF00FFFF00
            FFFF00FF0000FF00FFDECECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F7FFF7F7F7F7EFEFE7E7EFDEDEE7DED6E7DED6E7DED6E7D6D67B6B6BFF00FFFF
            00FFFF00FFFF00FF0000FF00FFDECECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFF7F7EFE7E7EFDEDEE7DED6DED6D6DED6CEDED6CE7B6B6B
            FF00FFFF00FFFF00FFFF00FF0000FF00FFDECECEFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7EFF7EFEFEFDEDEDECEC6DECEC6D6CE
            C67B6B6BFF00FFFF00FFFF00FFFF00FF0000FF00FFDECECEFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7EFEFF7EFEFF7EFEFDECECED6
            C6C6D6C6C67B6B6BFF00FFFF00FFFF00FFFF00FF0000FF00FFDECECEFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F79C84849C84849C8484
            9C84849C84849C84849C8484FF00FFFF00FFFF00FFFF00FF0000FF00FFDECECE
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFF7F7DECECEFFFF
            F7FFFFFFFFF7F7EFE7E7C6ADADFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00
            FFDECECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7FFF7F7DE
            CECEF7F7EFFFFFFFE7DEDEC6ADADFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            0000FF00FFDECECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFF7F7
            F7EFEFDECECEEFE7E7EFE7E7C6ADADFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FF0000FF00FFDECECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
            F7F7F7EFF7EFEFDECECEEFDEDEC6ADADFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FF0000FF00FFDECEC6DECECEDECECEDECECEDECECEDECECEDE
            CECED6CEC6D6C6BDCEBDBDC6ADADC6ADADFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF0000}
          ParentFont = False
          ParentShowHint = False
          ShineColor = clWhite
          ShowHint = True
          TabOrder = 0
          Version = '1.3.0.0'
        end
        object AdvGlassButton2: TAdvGlassButton
          Left = 43
          Top = 0
          Width = 44
          Height = 32
          Action = EditAction
          BackColor = clSilver
          ButtonDirection = bdLeft
          ButtonShape = btsCurvedRectangle
          CornerRadius = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ForeColor = clWhite
          GlowColor = 16760205
          InnerBorderColor = clBlack
          OuterBorderColor = clWhite
          Picture.Data = {
            424D0E0600000000000036000000280000001600000016000000010018000000
            0000D805000000000000000000000000000000000000FF00FF7B6B6B7B6B6B7B
            6B6B7B6B6B7B6B6B7B6B6B7B6B6B7B6B6B7B6B6B7B6B6B7B6B6B7B6B6B7B6B6B
            7B6B6B7B6B6B7B6B6BCECEC6CECEC6CECEC6CECEC6CECEC60000DECECEFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7FFF7F7FFF7F7F7F7EFF7F7EFF7EF
            EFF7EFEFF7EFE7EFE7E77B6B6BCECEC6CECEC6CECEC6CECEC6CECEC60000DECE
            CEFFFFFFFFF7F7FFF7F7FFF7F7A5A5D6EFE7E7EFE7E7EFE7E7EFE7E7E7DEDEEF
            E7E7F7EFE7EFE7E7EFE7E7EFE7DE7B6B6BCECEC6CECEC6CECEC6CECEC6CECEC6
            0000DECECEFFFFFFFFF7F7FFF7F7FFF7F75263945263A5DEDED6DED6D6DED6D6
            DED6D6DED6D6DED6D6E7DEDEEFE7E7EFE7E77B6B6BCECEC6CECEC6CECEC6CECE
            C6CECEC60000DECECEFFFFFFFFF7F7FFF7F7FFF7F75A739473849C5A73BDDED6
            D6DED6D6DED6D6DED6D6DED6CEDECECEDED6CEE7DED67B6B63CECEC6CECEC6CE
            CEC6CECEC6CECEC60000DECECEFFFFFFFFF7F7FFF7F7FFF7F77BADDEC6E7FFAD
            D6F72952ADCECECEDED6D6DED6D6DED6CEDECECED6CECED6CECE6B635AC6BDB5
            CEC6BDCECEC6CECEC6CECEC60000DECECEFFFFFFFFF7F7FFF7F7FFF7F784BDEF
            C6E7FF9CDEFF7BC6F7315AB5DED6D6DED6D6DED6CEDECECED6CECED6CECE6B63
            5ABDB5ADBDB5ADBDBDB5C6C6BDCECEC60000DECECEFFFFFFFFF7F7FFF7F7FFF7
            F77BC6F76BDEFF4ACEFF52C6FF3184E7A5ADC6DED6D6DED6CED6CECED6CECED6
            CEC66B635ABDB5ADBDB5ADBDB5ADBDB5ADBDB5AD0000DECECEFFFFFFFFF7F7FF
            F7F7FFF7F763C6F752EFFF42CEFF42C6FF52B5FF5A84CEF7EFEFEFE7E7DED6D6
            D6CECED6CECE6B635ABDB5ADBDB5ADBDB5ADBDB5ADBDB5AD0000DECECEFFFFFF
            FFFFFFFFFFFFFFFFFFA5CEF739DEFF39D6FF31C6FF39B5FF216BDECECEDEEFE7
            E7EFE7E7EFDEDEDED6CE6B635ABDB5ADBDB5ADBDB5ADBDB5ADBDBDB50000DECE
            CEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF29BDFF31E7FF29BDFF29BDFF399CFF52
            6BBDEFE7E7EFE7DEEFE7DEEFDEDE7B6B63C6C6BDBDB5ADBDB5ADBDB5ADCEC6BD
            0000DECECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF94CEFF21DEFF21CEFF21BDFF
            299CFF2163DEDED6DEEFDEDEEFDEDEE7DEDE7B6B6BCECEC6CECEC6C6C6BDCEC6
            BDCECEC60000DECECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF10ADF718DE
            FF18B5FF18A5FF218CFF6B7BBDE7DED6E7DED6E7D6D67B6B6BCECEC6CECEC6CE
            CEC6CECEC6CECEC60000DECECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF73
            BDF710E7FF10BDFF10ADFF188CFF104ACEDED6D6DED6CEDED6CE7B6B6BCECEC6
            CECEC6CECEC6CECEC6CECEC60000DECECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFEFF7FF00ADF708D6FF08ADFF0894FF106BF77B8CBDDECEC6D6CEC67B6B
            6BCECEC6CECEC6CECEC6CECEC6CECEC60000DECECEFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF52ADF700DEFF00ADFF00A5FF0873FF1042BDD6C6C6D6
            C6C67B6B6BCECEC6CECEC6CECEC6CECEC6CECEC60000DECECEFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFDEE7F700BDF700C6FF009CFF0084FF005AF7
            6363849C84849C8484CECEC6CECEC6CECEC6CECEC6CECEC60000DECECEFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF742ADEF00DEFF009CFF0094
            FF086BFF3163CEC6ADADCECEC6CECEC6CECEC6CECEC6CECEC6CECEC60000DECE
            CEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7B5CEEF00BDF700
            BDFF0094FF007BFF004AE7949CB5CECEC6CECEC6CECEC6CECEC6CECEC6CECEC6
            0000DECECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFF7F7F7EFEF
            29A5E700D6FF009CFF0094FF2184FF4A63B5CECEC6CECEC6CECEC6CECEC6CECE
            C6CECEC60000DECECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7
            EFF7EFEF7BA5D600CEFF42D6FFC6E7FF84B5E7526BADCECEC6CECEC6CECEC6CE
            CEC6CECEC6CECEC60000DECEC6DECECEDECECEDECECEDECECEDECECEDECECED6
            CEC6D6C6BDCEBDBDC6ADAD187BDE528CDE3963BD7B84ADCECEC6CECEC6CECEC6
            CECEC6CECEC6CECEC6CECEC60000}
          ParentFont = False
          ParentShowHint = False
          ShineColor = clWhite
          ShowHint = True
          TabOrder = 1
          Version = '1.3.0.0'
        end
        object AdvGlassButton3: TAdvGlassButton
          Left = 85
          Top = 0
          Width = 44
          Height = 32
          Action = DeleteAction
          BackColor = clSilver
          ButtonDirection = bdLeft
          ButtonShape = btsCurvedRectangle
          CornerRadius = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ForeColor = clWhite
          GlowColor = 16760205
          InnerBorderColor = clBlack
          OuterBorderColor = clWhite
          Picture.Data = {
            424D0E0600000000000036000000280000001600000016000000010018000000
            0000D805000000000000000000000000000000000000FF00FFDED6CE7B6B6B7B
            6B6B7B6B6B7B6B6B7B6B6B7B6B6B7B6B6B7B6B6B7B6B6B7B6B6B7B6B6B7B6B6B
            7B6B6B7B6B6B7B6B6B7B6B6BFF00FFFF00FFFF00FFFF00FF0000FF00FFDECECE
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7FFF7F7FFF7F7F7F7EFF7F7
            EFF7EFEFF7EFEFF7EFE7EFE7E77B6B6BFF00FFFF00FFFF00FFFF00FF0000FF00
            FFDECECEFFFFFFFFF7F7FFF7F7FFF7F7FFF7F7FFF7F7F7F7EFF7F7EFF7F7EFF7
            EFEFF7EFEFF7EFE7EFE7E7EFE7E7EFE7DE7B6B6BFF00FFFF00FFFF00FFFF00FF
            0000FF00FFDECECEFFFFFFFFF7F7EFEFF7394AFF9CA5FFFFF7F7FFF7F7F7F7EF
            F7F7EFC6BDEF0808FF8C8CF7EFE7E7EFE7E7EFE7E77B6B6BFF00FFFF00FFFF00
            FFFF00FF0000FF00FFDECECEFFFFFFFFF7F74A6BFF1839FF1029FF9CA5FFFFF7
            F7F7F7EFC6BDF70808FF0000FF0000FF9C94EFEFE7E7EFE7E77B6B6BFF00FFFF
            00FFFF00FFFF00FF0000FF00FFDECECEFFFFFFFFF7F7ADBDFF294AFF1839FF10
            29FF9CA5F7C6C6F70810FF0000FF0000FF2121FFDED6E7EFE7E7EFE7E77B6B6B
            FF00FFFF00FFFF00FFFF00FF0000FF00FFDECECEFFFFFFFFF7F7FFF7F7ADBDFF
            294AFF1839FF1029FF1029FF0010FF0000FF2121FFE7DEEFF7E7E7EFE7E7EFE7
            E77B6B6BFF00FFFF00FFFF00FFFF00FF0000FF00FFDECECEFFFFFFFFF7F7FFF7
            F7FFF7F7ADBDFF294AFF1839FF1029FF0818FF2931FFE7DEEFF7EFE7EFE7E7EF
            E7E7EFE7DE7B6B6BFF00FFFF00FFFF00FFFF00FF0000FF00FFDECECEFFFFFFFF
            F7F7FFF7F7FFF7F7D6DEF74263FF294AFF1839FF1029FF8C94F7F7EFEFF7EFE7
            EFE7E7EFE7E7EFE7E77B6B6BFF00FFFF00FFFF00FFFF00FF0000FF00FFDECECE
            FFFFFFFFFFFFFFFFFFE7E7FF6384FF4A6BFF395AFF294AFF1839FF1029FF949C
            EFEFE7E7EFE7E7EFE7DEEFE7DE7B6B6BFF00FFFF00FFFF00FFFF00FF0000FF00
            FFDECECEFFFFFFFFFFFFEFEFFF849CFF6B8CFF5A7BFF6384FF9CADF7294AFF18
            39FF1029FF949CEFEFE7DEEFE7DEEFDEDE7B6B6BFF00FFFF00FFFF00FFFF00FF
            0000FF00FFDECECEFFFFFFFFFFFFA5BDFF8CA5FF7B9CFF849CFFEFEFF7F7EFEF
            A5B5F7294AFF1839FF1029FFA5A5E7EFDEDEE7DEDE7B6B6BFF00FFFF00FFFF00
            FFFF00FF0000FF00FFDECECEFFFFFFFFFFFFDEE7FF9CB5FF9CB5FFF7F7FFFFFF
            F7FFF7F7F7F7EFA5ADEF294AFF4252F7D6CED6E7DED6E7D6D67B6B6BFF00FFFF
            00FFFF00FFFF00FF0000FF00FFDECECEFFFFFFFFFFFFFFFFFFE7EFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFF7F7EFE7E7ADB5E7DED6DEDED6D6DED6CEDED6CE7B6B6B
            FF00FFFF00FFFF00FFFF00FF0000FF00FFDECECEFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7EFF7EFEFEFDEDEDECEC6DECEC6D6CE
            C67B6B6BFF00FFFF00FFFF00FFFF00FF0000FF00FFDECECEFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7EFEFF7EFEFF7EFEFDECECED6
            C6C6D6C6C67B6B6BFF00FFFF00FFFF00FFFF00FF0000FF00FFDECECEFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F79C84849C84849C8484
            9C84849C84849C84849C8484FF00FFFF00FFFF00FFFF00FF0000FF00FFDECECE
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFF7F7DECECEFFFF
            F7FFFFFFFFF7F7EFE7E7C6ADADFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00
            FFDECECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7FFF7F7DE
            CECEF7F7EFFFFFFFE7DEDEC6ADADFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            0000FF00FFDECECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFF7F7
            F7EFEFDECECEEFE7E7EFE7E7C6ADADFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FF0000FF00FFDECECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
            F7F7F7EFF7EFEFDECECEEFDEDEC6ADADFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FF0000FF00FFDECEC6DECECEDECECEDECECEDECECEDECECEDE
            CECED6CEC6D6C6BDCEBDBDC6ADADC6ADADFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF0000}
          ParentFont = False
          ParentShowHint = False
          ShineColor = clWhite
          ShowHint = True
          TabOrder = 2
          Version = '1.3.0.0'
        end
        object AdvGlassButton4: TAdvGlassButton
          Left = 128
          Top = 0
          Width = 44
          Height = 32
          Action = ViewAction
          BackColor = clSilver
          ButtonDirection = bdLeft
          ButtonShape = btsCurvedRectangle
          CornerRadius = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ForeColor = clWhite
          GlowColor = 16760205
          InnerBorderColor = clBlack
          OuterBorderColor = clWhite
          Picture.Data = {
            424D0E0600000000000036000000280000001600000016000000010018000000
            0000D805000000000000000000000000000000000000FF00FFDED6CEA59494A5
            948CA5948CA5948CA5948CA5948CA5948CA5948CA5948CA5948CA5948CA5948C
            A5948C9C8C84FF00FFFF00FF526B9410427B6B636B8C73730000FF00FFDECECE
            FFFFFFFFFFFFFFFFFFFFFFFFFFF7F7FFF7F7FFF7F7F7F7EFF7F7EFF7EFEFF7EF
            EFF7EFE7EFE7E79C8484FF00FF8494AD2173AD8CDEF7295A947B73840000FF00
            FFDECECEFFFFFFFFF7F7FFF7F7FFF7F7F7F7EFF7F7EFF7F7EFF7EFEFF7EFEFF7
            EFE7EFE7E7EFE7E7EFE7DE9C8484849CAD2173B594EFFF7BCEF72194E710528C
            0000FF00FFDECECEFFFFFFFFF7F7FFF7F7FFF7F7FFF7F7F7F7EFF7F7EFF7EFEF
            F7EFEFF7EFEFEFE7E7EFE7E7EFE7E763738C217BBD94E7FF7BD6F7299CEF086B
            C6527BA50000FF00FFDECECEFFFFFFFFF7F7FFF7F7FFF7F7FFF7F7F7F7EFF7F7
            EFF7EFEFF7EFEFF7EFEFF7E7E7EFE7E794ADCE217BBD94E7FF7BD6F7299CEF08
            6BCE5284ADFF00FF0000FF00FFDECECEFFFFFFFFF7F7FFF7F7FFF7F7FFF7F7F7
            F7EFF7F7EFF7EFEFF7EFEFF7EFE7EFE7E794B5CE2184CE94E7FF7BD6F7299CEF
            0873CE5284B5FF00FFFF00FF0000FF00FFDECECEFFFFFFFFF7F7FFF7F7FFF7F7
            FFF7F7F7F7EFF7F7EFF7EFEFF7EFEFF7EFE7EFE7E7186BBD73CEEF84D6F7299C
            EF0873D6528CBDFF00FFFF00FFFF00FF0000FF00FFDECECEFFFFFFF7F7F7A594
            94846B6384635A84635A84635A7B6363B5A5A5DECECED6C6C69494A51873BD29
            94E7087BD6528CBDFF00FFFF00FFFF00FFFF00FF0000FF00FFDECECED6CECE94
            7363DECEA5FFF7CEFFF7D6FFF7D6FFF7DEF7F7DEC6B5A56B5252947B7BAD9C9C
            848C9C1073CE5294C6FF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFBDADAD
            AD8C73FFEFBDFFF7D6FFF7D6FFF7D6FFF7D6FFF7DEF7F7DEF7F7E7E7DED68463
            638C7373C6B5B59C8484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000CEC6
            BD9C7B73FFE7B5FFF7CEFFF7CEFFF7D6FFFFDEFFFFDEFFFFE7F7F7E7F7EFE7F7
            EFE7DEDED6735252D6C6C69C8484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            0000AD9C94DEB58CFFEFCEFFEFC6FFEFCEFFF7D6FFFFDEFFFFE7FFFFE7F7F7E7
            F7EFE7F7EFE7EFEFDEB59C94CEBDB59C8484FF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FF0000AD8C84EFCE9CFFEFC6FFE7BDFFF7CEFFFFD6FFFFDEFFFFDEFFFF
            E7FFFFE7FFF7E7F7EFE7EFE7D6DED6C69C84849C8484FF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FF0000BD9473EFCEA5FFEFC6FFF7CEFFF7D6FFF7D6FFFFDEFF
            FFE7FFFFDEFFF7DEFFF7E7FFF7E7EFE7D6EFE7CE947B739C847BFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF0000CE9473E7CEA5FFEFC6FFEFC6FFEFCEFFF7D6
            FFF7D6FFFFDEFFFFE7DECEB5DECEB5DECEB5DECEB5DECEB58C7373B5A59CFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FF0000C69C84EFCEA5FFEFC6FFF7D6FFFF
            E7FFFFF7FFFFE7FFF7D6FFFFE7EFE7C6FFFFDEFFFFE7FFFFDEF7F7D69C847BFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000C6ADA5EFC694FFE7C6FF
            F7D6FFFFE7FFFFEFFFFFF7FFEFCEFFF7DEEFE7BDFFF7D6FFFFDEF7EFCEDECEAD
            AD9C9CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000CEBDBDE7BD8C
            FFE7BDFFEFCEFFFFDEFFFFE7FFFFE7FFEFCEFFF7D6EFDEB5F7E7C6F7EFC6DED6
            ADC6B59CC6BDB5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000CECE
            C6D6B5A5FFD6A5FFE7C6FFF7CEFFF7D6FFF7D6FFEFCEF7E7BDEFD6ADF7DEBDDE
            CEA5DECEADB5A59CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            0000FF00FFD6CECEDEB59CEFBD94E7CEA5EFD6ADE7D6ADE7CEA5E7CEA5DEC69C
            DEC6A5E7CEA5C6ADA5CEC6BDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FF0000FF00FFFF00FFD6CEC6DEBDA5E7BD8CE7C694E7CEA5E7CEA5E7CE
            A5E7CE9CDEBD9CC6B5ADCEC6BDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFD6CEC6DED6CEDEC6B5E7BD9CE7
            B58CDEBDADD6C6BDCEC6BDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF0000}
          ParentFont = False
          ParentShowHint = False
          ShineColor = clWhite
          ShowHint = True
          TabOrder = 3
          Version = '1.3.0.0'
        end
        object AdvGlassButton5: TAdvGlassButton
          Left = 170
          Top = 0
          Width = 44
          Height = 32
          Action = PrintAction
          BackColor = clSilver
          ButtonDirection = bdLeft
          ButtonShape = btsCurvedRectangle
          CornerRadius = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ForeColor = clWhite
          GlowColor = 16760205
          InnerBorderColor = clBlack
          OuterBorderColor = clWhite
          Picture.Data = {
            424D0E0600000000000036000000280000001600000016000000010018000000
            0000D805000000000000000000000000000000000000FF00FFFF00FFFF00FFFF
            00FFFF00FFC6948CBD6B5AC6A59CFF00FFFF00FFFF00FFCEBDADC69473CE9C84
            BD947BCEBDB5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FF
            FF00FFFF00FFC68C7BC66B52E7AD9CC66352BD6352C69484CEB5A5CEA584FFEF
            EFFFFFFFE7D6C6BD8463B58463CEBDADFF00FFFF00FFFF00FFFF00FF0000FF00
            FFFF00FFCEC6BDC67B63D6846BFFEFE7FFE7E7FFDECEDEADADC6846BE7BDA5FF
            FFFFFFFFFFFFFFFFFFF7F7FFEFEFE7CEC6C68C73AD7352C6AD9CFF00FFFF00FF
            0000FF00FFCEB5ADC6735ADE9484FFEFEFFFF7EFFFE7E7FFDED6E7AD9CE7C6AD
            FFFFFFFFFFFFFFFFFFFFFFFFFFF7F7FFEFEFF7EFEFF7E7E7E7CEC6BD8C6BAD73
            52BDA5940000CEB5A5CE7352EFB5A5FFEFE7FFEFE7FFE7DEF7CEC6FFDED6F7CE
            C6DEAD9CD6A58CEFD6C6FFF7F7FFFFFFFFF7F7FFEFEFF7EFEFF7E7E7EFDEDEEF
            DEDEE7C6BDAD6B420000CE6B4AFFCEBDFFE7DEFFE7DEFFDED6E7BDB5F7D6CEE7
            BDB5E7BDB5FFD6CEF7CEC6D6A59CC68C7BD6AD94F7E7DEFFEFEFF7EFEFF7E7E7
            EFDEDED6B5A5B58463CEC6BD0000CE6B4AFFDED6FFDED6F7CEC6EFC6BDFFDEDE
            FFEFE7FFEFE7FFE7DEEFBDBDE7B5ADF7CEC6F7CECEDEADA5B57363BD846BDEBD
            ADE7D6CEBD8463A53929FF00FFFF00FF0000D6734AFFD6CEF7C6BDF7C6BDFFDE
            D6FFE7DEFFF7EFFFF7EFFFEFEFFFEFEFFFEFE7F7CECEDEADADEFC6BDF7D6CEDE
            ADA5B56B63A55A39FFD6CEA52921FF00FFFF00FF0000D67352EFBDBDFFCEC6FF
            D6CEFFDECEFFEFDEFFF7E7FFF7F7FFF7F7FFF7EFFFF7EFFFF7EFFFF7EFF7DED6
            E7B5B5E7B5B5F7D6CEE7BDBD9CDE8CA52921FF00FFFF00FF0000D67B52FFCEBD
            FFCEC6FFD6C6FFEFD6FFDE9CFFCE7BFFD69CFFE7CEFFFFF7FFFFF7FFFFF7FFF7
            F7FFF7F7FFF7F7FFEFE7EFC6C6DEADAD9CCE84A53121FF00FFFF00FF0000D694
            7BE78C6BFFD6BDFFFFDEFFFFC6FFE7A5FFCE7BFFBD6BFFAD5AFFAD63FFCEADFF
            FFEFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFF7EFF7D6D6AD3929FF00FFFF00FF
            0000FF00FFD6B5A5D69C84E7BD94FFFFD6FFF7BDFFE7A5FFC67BFFAD63F79C52
            F78C42EF8C39FFAD73FFEFD6FFFFFFFFFFFFFFFFFFFFFFFFEFBDB5B56352FF00
            FFFF00FF0000FF00FFFF00FFCEBDADDEB59CFFFFFFFFF7E7FFEFC6FFE79CFFCE
            84FFB56BF79C4AEF8439E77329E76318EF8442FFC69CFFFFFFFFFFFFBD6352C6
            9C94FF00FFFF00FF0000FF00FFFF00FFC6A584FFF7EFFFFFFFFFF7F7FFEFEFFF
            EFE7FFDEBDFFD684FFC66BFFAD52EF8431E76B21DE5A10DE4A00E77329D68C7B
            BD7363FF00FFFF00FFFF00FF0000FF00FFCEC6B5DEAD9CFFFFFFFFFFFFFFF7F7
            FFEFEFF7EFEFF7E7E7EFDEDEFFD6B5FFC684FFB552E76B21E76318DE6B29C65A
            39C6846BFF00FFFF00FFFF00FFFF00FF0000FF00FFCEA58CF7E7DEFFFFFFFFFF
            FFFFF7F7FFEFEFF7EFEFF7E7E7EFDEDEEFDEDED6AD9CBD7B52D66B39C67352C6
            8473CEBDADFF00FFFF00FFFF00FFFF00FFFF00FF0000CEC6BDDEAD94FFFFFFFF
            FFFFFFFFFFFFF7F7FFEFEFF7EFEFF7E7E7EFDEDEEFDEDEAD6B4ACEC6BDFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000CEAD94FFEFE7
            FFFFFFFFFFFFFFFFFFFFF7F7FFEFEFF7EFEFF7E7E7EFDEDED6AD9CB58C73FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000DEAD
            8CFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7FFEFEFF7EFEFF7E7E7EFDEDEB57B5ACE
            C6BDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            0000CEBDADCEA58CDEB59CEFCEC6FFF7F7FFF7F7FFEFEFF7EFEFF7E7E7DEC6B5
            B58C73FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FF0000FF00FFFF00FFFF00FFCEB5A5BD947BCE9C7BDEBDADF7E7DEF7E7
            E7BD7B5ACEBDADFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00FFCEC6BDC6A58CB5
            7B5ABD7B5AB58463FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF0000}
          ParentFont = False
          ParentShowHint = False
          ShineColor = clWhite
          ShowHint = True
          TabOrder = 4
          Version = '1.3.0.0'
        end
        object PrintAllToolButton: TAdvGlassButton
          Left = 212
          Top = 0
          Width = 85
          Height = 32
          Action = PrintAction
          BackColor = clSilver
          ButtonDirection = bdLeft
          ButtonShape = btsCurvedRectangle
          Caption = 'Todos'
          CornerRadius = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ForeColor = clWhite
          GlowColor = 16760205
          InnerBorderColor = clBlack
          OuterBorderColor = clWhite
          Picture.Data = {
            424D0E0600000000000036000000280000001600000016000000010018000000
            0000D805000000000000000000000000000000000000FF00FFFF00FFFF00FFFF
            00FFFF00FFC6948CBD6B5AC6A59CFF00FFFF00FFFF00FFCEBDADC69473CE9C84
            BD947BCEBDB5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FF
            FF00FFFF00FFC68C7BC66B52E7AD9CC66352BD6352C69484CEB5A5CEA584FFEF
            EFFFFFFFE7D6C6BD8463B58463CEBDADFF00FFFF00FFFF00FFFF00FF0000FF00
            FFFF00FFCEC6BDC67B63D6846BFFEFE7FFE7E7FFDECEDEADADC6846BE7BDA5FF
            FFFFFFFFFFFFFFFFFFF7F7FFEFEFE7CEC6C68C73AD7352C6AD9CFF00FFFF00FF
            0000FF00FFCEB5ADC6735ADE9484FFEFEFFFF7EFFFE7E7FFDED6E7AD9CE7C6AD
            FFFFFFFFFFFFFFFFFFFFFFFFFFF7F7FFEFEFF7EFEFF7E7E7E7CEC6BD8C6BAD73
            52BDA5940000CEB5A5CE7352EFB5A5FFEFE7FFEFE7FFE7DEF7CEC6FFDED6F7CE
            C6DEAD9CD6A58CEFD6C6FFF7F7FFFFFFFFF7F7FFEFEFF7EFEFF7E7E7EFDEDEEF
            DEDEE7C6BDAD6B420000CE6B4AFFCEBDFFE7DEFFE7DEFFDED6E7BDB5F7D6CEE7
            BDB5E7BDB5FFD6CEF7CEC6D6A59CC68C7BD6AD94F7E7DEFFEFEFF7EFEFF7E7E7
            EFDEDED6B5A5B58463CEC6BD0000CE6B4AFFDED6FFDED6F7CEC6EFC6BDFFDEDE
            FFEFE7FFEFE7FFE7DEEFBDBDE7B5ADF7CEC6F7CECEDEADA5B57363BD846BDEBD
            ADE7D6CEBD8463A53929FF00FFFF00FF0000D6734AFFD6CEF7C6BDF7C6BDFFDE
            D6FFE7DEFFF7EFFFF7EFFFEFEFFFEFEFFFEFE7F7CECEDEADADEFC6BDF7D6CEDE
            ADA5B56B63A55A39FFD6CEA52921FF00FFFF00FF0000D67352EFBDBDFFCEC6FF
            D6CEFFDECEFFEFDEFFF7E7FFF7F7FFF7F7FFF7EFFFF7EFFFF7EFFFF7EFF7DED6
            E7B5B5E7B5B5F7D6CEE7BDBD9CDE8CA52921FF00FFFF00FF0000D67B52FFCEBD
            FFCEC6FFD6C6FFEFD6FFDE9CFFCE7BFFD69CFFE7CEFFFFF7FFFFF7FFFFF7FFF7
            F7FFF7F7FFF7F7FFEFE7EFC6C6DEADAD9CCE84A53121FF00FFFF00FF0000D694
            7BE78C6BFFD6BDFFFFDEFFFFC6FFE7A5FFCE7BFFBD6BFFAD5AFFAD63FFCEADFF
            FFEFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFF7EFF7D6D6AD3929FF00FFFF00FF
            0000FF00FFD6B5A5D69C84E7BD94FFFFD6FFF7BDFFE7A5FFC67BFFAD63F79C52
            F78C42EF8C39FFAD73FFEFD6FFFFFFFFFFFFFFFFFFFFFFFFEFBDB5B56352FF00
            FFFF00FF0000FF00FFFF00FFCEBDADDEB59CFFFFFFFFF7E7FFEFC6FFE79CFFCE
            84FFB56BF79C4AEF8439E77329E76318EF8442FFC69CFFFFFFFFFFFFBD6352C6
            9C94FF00FFFF00FF0000FF00FFFF00FFC6A584FFF7EFFFFFFFFFF7F7FFEFEFFF
            EFE7FFDEBDFFD684FFC66BFFAD52EF8431E76B21DE5A10DE4A00E77329D68C7B
            BD7363FF00FFFF00FFFF00FF0000FF00FFCEC6B5DEAD9CFFFFFFFFFFFFFFF7F7
            FFEFEFF7EFEFF7E7E7EFDEDEFFD6B5FFC684FFB552E76B21E76318DE6B29C65A
            39C6846BFF00FFFF00FFFF00FFFF00FF0000FF00FFCEA58CF7E7DEFFFFFFFFFF
            FFFFF7F7FFEFEFF7EFEFF7E7E7EFDEDEEFDEDED6AD9CBD7B52D66B39C67352C6
            8473CEBDADFF00FFFF00FFFF00FFFF00FFFF00FF0000CEC6BDDEAD94FFFFFFFF
            FFFFFFFFFFFFF7F7FFEFEFF7EFEFF7E7E7EFDEDEEFDEDEAD6B4ACEC6BDFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000CEAD94FFEFE7
            FFFFFFFFFFFFFFFFFFFFF7F7FFEFEFF7EFEFF7E7E7EFDEDED6AD9CB58C73FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000DEAD
            8CFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7FFEFEFF7EFEFF7E7E7EFDEDEB57B5ACE
            C6BDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            0000CEBDADCEA58CDEB59CEFCEC6FFF7F7FFF7F7FFEFEFF7EFEFF7E7E7DEC6B5
            B58C73FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FF0000FF00FFFF00FFFF00FFCEB5A5BD947BCE9C7BDEBDADF7E7DEF7E7
            E7BD7B5ACEBDADFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00FFCEC6BDC6A58CB5
            7B5ABD7B5AB58463FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF0000}
          ParentFont = False
          ParentShowHint = False
          ShineColor = clWhite
          ShowHint = True
          TabOrder = 5
          Version = '1.3.0.0'
        end
        object AdvGlassButton7: TAdvGlassButton
          Left = 303
          Top = 0
          Width = 40
          Height = 32
          BackColor = clSilver
          ButtonDirection = bdLeft
          CornerRadius = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ForeColor = clWhite
          GlowColor = 16760205
          InnerBorderColor = clBlack
          OuterBorderColor = clWhite
          Picture.Data = {
            424D0E0600000000000036000000280000001600000016000000010018000000
            0000D805000000000000000000000000000000000000FF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFCEBDB5AD7B738C39317B18106B00006300007310
            10843131A57373C6BDB5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00
            FFFF00FFFF00FFFF00FFFF00FFB58473841810841008B54218D66B29DE7331DE
            7331CE6B29A539186B00006B0808A57373FF00FFFF00FFFF00FFFF00FFFF00FF
            0000FF00FFFF00FFFF00FFFF00FFA55A4A8C2108BD5218FF9439FF9439FF9439
            FF9439FF9439FF9439FF9439FF9439B542186B00008C4239FF00FFFF00FFFF00
            FFFF00FF0000FF00FFFF00FFFF00FFA5634A942908E77B21FF8C29FF8C29FF8C
            29FF8C29FF8C29FF8C29FF8C29FF8C29FF8C29FF8C29E76B216B00008C4239FF
            00FFFF00FFFF00FF0000FF00FFFF00FFBD8C7B942908EF7310FF8418FF8418FF
            8418FF8418FF8418FF8418FF8418FF8418FF8418FF8418FF8418FF8418E76B10
            6B0000A57373FF00FFFF00FF0000FF00FFCEC6B59C3918CE5208FF7B08FF7B08
            FF9431FFDEBDFFDEBDFFDEBDFFDEBDFFDEBDFFDEBDFFDEBDFFDEBDFFA552FF7B
            08FF7B08B531006B0808C6BDB5FF00FF0000FF00FFBD947BA53910FF7300FF73
            00FF7300FFBD73FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            BD73FF7300FF7300FF73006B0000A57373FF00FF0000FF00FFAD6342CE5208FF
            7300FF7B00FF7300FFBD73FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFBD73FF7300FF7300FF7300A52900843131FF00FF0000FF00FFAD5229
            E76300FF7B00FF7B00FF7B00FFBD7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFBD73FF7B00FF7B00FF7B00CE4A00731010FF00FF0000FF00
            FFAD4210EF7310FF8C18FF8C18FF9C31FFE7C6FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFDEBDFF9C31FF7B00FF7B00DE5A00630000FF00FF
            0000FF00FFAD4A18EF7B10FF9C31FF9C31F7D6C6FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7EFFF7B00FF7B00DE5A006300
            00FF00FF0000FF00FFB55A29E77318FFA552FFA552EFAD7BFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7AD63FF7B00FF7B00D6
            5200731010FF00FF0000FF00FFBD734AD66308FFB563FFB56BFFB56BEFA56BF7
            EFE7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7C694FFA542FF8C18
            FF7B00AD31008C3931FF00FF0000FF00FFC69C7BB55218FFA542FFC684FFC684
            FFC684F7B57BEFCEBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6A5FFC6
            84FFC684FFAD527B1000AD7B73FF00FF0000FF00FFCEC6B5B55A21DE6B10FFCE
            94FFD6A5FFD6A5FFD6A5FFCE9CE7BD9CFFF7EFFFFFFFFFDECEFFEFD6FFEFD6FF
            D6ADFFD6A5FFD6A5BD52187B1008CEBDB5FF00FF0000FF00FFFF00FFC69C84BD
            5218F78421FFDEADFFDEBDFFDEBDFFDEBDFFDEBDEFBD9CF7CEADFFDEBDFFDEBD
            FFDEBDFFDEBDFFDEBDE78C39841800AD8473FF00FFFF00FF0000FF00FFFF00FF
            FF00FFBD8452BD5218F78421FFDEB5FFEFD6FFEFD6FFEFD6FFEFD6FFEFD6FFEF
            D6FFEFD6FFEFD6FFE7C6E794428C21089C5242FF00FFFF00FFFF00FF0000FF00
            FFFF00FFFF00FFFF00FFBD8452BD5218DE6B10FFB56BFFE7CEFFF7EFFFF7EFFF
            F7EFFFF7EFFFEFDEFFC68CC65A18942908A55A4AFF00FFFF00FFFF00FFFF00FF
            0000FF00FFFF00FFFF00FFFF00FFFF00FFC69C7BB55A21B55210D65A08E77B18
            EF8C39E78C39DE7B29C652089C3108943110B58C7BFF00FFFF00FFFF00FFFF00
            FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCEC6B5C69C7BBD73
            4AAD5229A54210A53910A54A21AD6342BD8C7BCEBDB5FF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF0000}
          ParentFont = False
          ParentShowHint = False
          ShineColor = clWhite
          ShowHint = True
          TabOrder = 6
          Version = '1.3.0.0'
        end
      end
      object SeparadorPanel1: TPanel
        Left = 345
        Top = 1
        Width = 5
        Height = 32
        Align = alLeft
        Color = clGray
        ParentBackground = False
        TabOrder = 1
      end
      object MainFormBotoesPanel3: TPanel
        Left = 350
        Top = 1
        Width = 331
        Height = 32
        Align = alLeft
        TabOrder = 2
        object ConsultaLabel: TLabel
          Left = 3
          Top = 11
          Width = 46
          Height = 13
          Caption = 'Pesquisa:'
        end
        object ConsultaCombo: TosComboFilter
          Left = 56
          Top = 7
          Width = 228
          Height = 21
          ShowButton = True
          Style = csDropDownList
          MapList = False
          AllowClearKey = False
          DropDownCount = 8
          HistoryList.FileName = 'LabMaster.ini.ini'
          ItemHeight = 0
          Sorted = False
          TabOrder = 0
          UnboundDataType = wwDefault
          OnCloseUp = ConsultaComboCloseUp
          ClientDS = FilterDataset
          Params = <>
          ViewDefault = 0
        end
        object AdvGlassButton8: TAdvGlassButton
          Left = 287
          Top = 0
          Width = 40
          Height = 32
          BackColor = clSilver
          ButtonDirection = bdLeft
          CornerRadius = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ForeColor = clWhite
          GlowColor = 16760205
          InnerBorderColor = clBlack
          OuterBorderColor = clWhite
          Picture.Data = {
            89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
            F8000000097048597300000EC400000EC401952B0E1B00000279494441544889
            C595BB6B145118C57F67C90E22122C4444C52AA4100B0B898216331324A28285
            2268632D6A7C61612141051FD8082A8882FE0B82F8029919D04224C5122C424A
            0B8B10C292426427E458ECAECE6E76B26A0A4F732FDCEF9EF39D3373EF15AB40
            94E5C38283C0FD24ACF6ACA9AC46003B06AE03236525AB1310478041E0519CE5
            03BD4BFA20CEF2F586C3C018B01D18C45E02E610BB04810D9226801BDD51950A
            343BF231D04D6008F76BC70BC0681206937D05E22CAF00F78071A0C37A5BC705
            825F73FB23D2581256BFB7EB97E516A78D0A701BB844D3FB3C30637B16A982BD
            1969187BDD320FB04F7001B8552A8074B8D9B96B480FB0DF22CDA651B00810A5
            7980D925290582620C3675CC96225D87409CE5EB80ABE009D0C3A2D536D2A8DA
            88D2C6464150A0AE831E4B7E6E6BA654003C043A9D84416D99B30E931AB38DF0
            34D253D0B324ACD67BD57609A85676220B2E2BC05AE094E185F04212062BEEF9
            2B44694ED9A1FA2FF89393BCC676286914B8D237C2B44112FD8EACD46A9CE501
            F671E00C3062FC24ED937594E53B8179E06BA9409CE51B8093C69705DB002401
            7EB342336B81B3C05EE068714D5D85E3C065CCB6AEF01AC06EF05412064BADDA
            8A6103F60149E78161607F12563F1537763BA8005BAD651F2700DE81BEC459FE
            0DA86036227648DAD4BA52AE803F77BBEBE089D246007A838805B43636175B73
            DBA83502486AD8BE9346C1448FF43A1F9C340A1A121705F5D6EE422B6A13B6C7
            2549D3C00935AFF49EE8F5174D017769DEA8003F801AB089665473E029D02BF0
            EB240C16CAC8A1FC3D18003E60EF417A9D84D5432B91AC849E6F721256176DCE
            21D58197FF4A5E2AD0C2A4ED6BC0FBD508FC044052E8D77E6672B40000000049
            454E44AE426082}
          ParentFont = False
          ParentShowHint = False
          ShineColor = clWhite
          ShowHint = True
          TabOrder = 1
          Version = '1.3.0.0'
          OnClick = FilterActionExecute
        end
      end
      object Panel4: TPanel
        Left = 681
        Top = 1
        Width = 5
        Height = 32
        Align = alLeft
        Color = clGray
        ParentBackground = False
        TabOrder = 3
      end
      object MainFormBotoesPanel4: TPanel
        Left = 686
        Top = 1
        Width = 86
        Height = 32
        Align = alLeft
        TabOrder = 4
        object EditarTodosButton: TAdvGlassButton
          Left = 3
          Top = 0
          Width = 80
          Height = 32
          BackColor = clSilver
          ButtonDirection = bdLeft
          Caption = 'Editar Todos'
          CornerRadius = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ForeColor = clWhite
          GlowColor = 16760205
          InnerBorderColor = clBlack
          OuterBorderColor = clWhite
          ParentFont = False
          ParentShowHint = False
          ShineColor = clWhite
          ShowHint = True
          TabOrder = 0
          Version = '1.3.0.0'
          OnClick = EditarTodosButtonClick
        end
      end
    end
  end
  object RelatPanel: TPanel [2]
    Left = 485
    Top = 140
    Width = 473
    Height = 389
    BevelInner = bvRaised
    BevelOuter = bvNone
    TabOrder = 2
    Visible = False
    object ReportViewer: TppViewer
      Left = 1
      Top = 42
      Width = 471
      Height = 326
      Align = alClient
      BevelOuter = bvNone
      Color = clMenuBar
      DeadSpace = 30
      PageColor = clWindow
      Report = Report
      ZoomPercentage = 100
      ZoomSetting = zsWholePage
      OnPageChange = ReportViewerPageChange
      OnPrintStateChange = ReportViewerPrintStateChange
      OnStatusChange = ReportViewerStatusChange
    end
    object pnlStatusBar: TPanel
      Left = 1
      Top = 368
      Width = 471
      Height = 20
      Align = alBottom
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      TabOrder = 1
    end
    object pnlPreviewBar: TPanel
      Left = 1
      Top = 1
      Width = 471
      Height = 41
      Align = alTop
      TabOrder = 2
      object spbPreviewPrint: TSpeedButton
        Left = 4
        Top = 6
        Width = 29
        Height = 29
        Hint = 'Print Report'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Glyph.Data = {
          0E060000424D0E06000000000000360000002800000016000000160000000100
          180000000000D805000000000000000000000000000000000000CFCAC1CFCAC1
          CFCAC1CFCAC1CFCAC1C59689BB6C5BC7A69ACFCAC1CFCAC1CFCAC1CBBCAFC493
          77CA9981BD957BCABDB0CFCAC1CFCAC1CFCAC1CFCAC1CFCAC1CFCAC10000CFCA
          C1CFCAC1CFCAC1CFCAC1C48A7AC66A57E7A99BC66555B96354C19386CBB2A0CF
          A186F9EEEAFEF9F9E7D0C6BE8566B38567C8BBAECFCAC1CFCAC1CFCAC1CFCAC1
          0000CFCAC1CFCAC1CEC3B9C47964D4826FFFECE6FFE7E2FFD8CEDAABA8C6836F
          E1BBA6FFFCF9FFFEFEFEF9F9FCF4F4F8EFEFE6CFC6C08D70AC7351C3AC9ACFCA
          C1CFCAC10000CFCAC1CDB5A8C57058DE9785FFEFEAFFF1EDFFE7E2FFDCD4E1AF
          9FE4C0ADFFFFFFFFFFFFFFFEFEFEF9F9FCF4F4F8EFEFF5E8E8F1E4E4E5CEC7BE
          896DAC7351BFA5910000CEB0A2CD7155EEB3A3FFE8E3FFEAE4FFE5DEF1C9C4FF
          DAD2F1CDC7D8A99FD1A18DECD4C6FEF5F3FEF9F9FCF4F4F8EFEFF5E8E8F1E4E4
          EFDEDEEFDEDEE1C5BCAB69430000CD6B4AFCC9BBFFE3DAFFE4DCFDD9D2E6B9B5
          F7D1CBE5B8B3E7B9B4FCD4CEF1CBC7D4A29AC48C78D5AD97F1E3DCF8EFEFF5E8
          E8F1E4E4EFDEDED7B3A5B38264CBC3B80000CF6E4DFFDBD2FFDDD4F5CAC4EDC0
          BAFFDED8FFECE5FFECE5FFE3DCEABFBBE1B0ADF4CDC7F3CEC9DAA9A5B77763BF
          876BDBBBAEE7D1CBBA8163A23F2DCFCAC1CFCAC10000D1724FFFD5CBF0C1BAF5
          C6BFFFDBD1FFE6DEFFF1ECFFF0ECFFEFEAFFEFEAFFEAE4F1CEC9DEAFACEAC0BB
          F7D4CFDAA9A6B36F60A45B3FFAD7CBA12B20CFCAC1CFCAC10000D47651EFBEB8
          FDCAC0FFD5CAFFD9CFFFEFDEFFF3E6FFF5F1FFF4F0FFF4EFFFF3EFFFF3EEFFF1
          EDF7D9D4E1B3B0E3B7B3F4D1CEE5BBB89ED989A32E23CFCAC1CFCAC10000D779
          54FFCABFFFCEC1FFD2C7FFEFD5FFDC98FFC97BFFD098FFE5C9FFF9F5FFF8F4FF
          F8F4FFF7F3FFF7F1FFF5F1FFEAE6E8C3C0DAABA99ECA81A53024CFCAC1CFCAC1
          0000D3977DE38D6DFDD0BBFFFEDEFFF8C6FFE5A6FFCA7EFFBA6DFAA95DFAAD66
          FFCFA8FFF8EEFFFCF9FFFCF8FFFAF8FFF9F7FFF9F5FFF3EFF1D4D1A8392CCFCA
          C1CFCAC10000CFCAC1D0B5A5D59E83E1B893FFFCD4FFF1BCFFE1A0FFC67DFCAF
          63F79F53F08E41EF893FF9AE77FFE8D2FFFFFDFFFEFDFFFEFCFFFDFAEABCB5B5
          6355CFCAC1CFCAC10000CFCAC1CFCAC1CBBCAFD9B19AFFFAFAFFF5E5FFECC4FF
          E29FFFCF85FEB568F4984DED8338E77329E2641BED8746FCC39EFFFFFFFFFFFF
          BF6051C49A90CFCAC1CFCAC10000CFCAC1CFCAC1C7A087FCF1EDFFFAFAFCF5F5
          F9EFEFF8E8E1FDDDBAFFD087FFC56FFFAB55EE8235E36920DD5A12D84A06E776
          2ED28A7DBC7263CFCAC1CFCAC1CFCAC10000CFCAC1CEC1B7D9AF98FFFFFFFFFA
          FAFCF5F5F9EFEFF5EAEAF1E4E4EFDEDEF8D7B7FFC682FFB053E56E25E4661BDC
          6C2EC15A3FC0806ECFCAC1CFCAC1CFCAC1CFCAC10000CFCAC1CBA58EF5E5DCFF
          FFFFFFFAFAFCF5F5F9EFEFF5EAEAF1E4E4EFDEDEEFDEDED1AB99BE7A52D46D3F
          C67054C48573CBBAAFCFCAC1CFCAC1CFCAC1CFCAC1CFCAC10000CFC3B8DAAF97
          FFFFFFFFFFFFFFFAFAFCF5F5F9EFEFF5EAEAF1E4E4EFDEDEEFDEDEAE6E4BCBC3
          B8CFCAC1CFCAC1CFCAC1CFCAC1CFCAC1CFCAC1CFCAC1CFCAC1CFCAC10000CFAB
          94F8EAE2FFFFFFFFFFFFFFFAFAFCF5F5F9EFEFF5EAEAF1E4E4EFDEDED1AB99B7
          8F75CFCAC1CFCAC1CFCAC1CFCAC1CFCAC1CFCAC1CFCAC1CFCAC1CFCAC1CFCAC1
          0000D8A88EFFFFFEFFFFFFFFFFFFFFFAFAFCF5F5F9EFEFF5EAEAF1E4E4EFDEDE
          B27A59CBC3B8CFCAC1CFCAC1CFCAC1CFCAC1CFCAC1CFCAC1CFCAC1CFCAC1CFCA
          C1CFCAC10000CFBAABCBA68FD9B19DE8CFC1FCF1F0FCF5F5F9EFEFF5EAEAF1E4
          E4DEC1B5B78F75CFCAC1CFCAC1CFCAC1CFCAC1CFCAC1CFCAC1CFCAC1CFCAC1CF
          CAC1CFCAC1CFCAC10000CFCAC1CFCAC1CFCAC1C9B2A1BF957BCA997FDCBBACF1
          E3DEF1E4E4B87E5DC8BBAECFCAC1CFCAC1CFCAC1CFCAC1CFCAC1CFCAC1CFCAC1
          CFCAC1CFCAC1CFCAC1CFCAC10000CFCAC1CFCAC1CFCAC1CFCAC1CFCAC1CDC4B9
          C0A38EB17F5DB87E5DB18163CFCAC1CFCAC1CFCAC1CFCAC1CFCAC1CFCAC1CFCA
          C1CFCAC1CFCAC1CFCAC1CFCAC1CFCAC10000}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = spbPreviewPrintClick
      end
      object spbPreviewWhole: TSpeedButton
        Left = 39
        Top = 3
        Width = 22
        Height = 24
        Hint = 'Whole Page'
        AllowAllUp = True
        GroupIndex = 1
        Down = True
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Glyph.Data = {
          6E030000424D6E03000000000000760000002800000050000000130000000100
          040000000000F802000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777777777777777777777777777777777777777F7F7F7F7F7F7F7F
          7F7F777777777777777777777777777777777777777777777777777777777777
          F7F7F7F7F7F7F7F7F7F777000000000000000077770000000000000000777700
          00000000000000777F00000000000000007F7706868686868686807777068686
          86868686807777068686868686868077F70080808080808080F7770868000000
          0068607777086800000000686077770868000000006860777F08080000000008
          007F7706860FFFFFF08680777706860FFFFFF08680777706860FFFFFF0868077
          F70080087878708080F77708680FFFFFF06860777708680FFFFFF06860777708
          680FFFFFF06860777F08080787878008007F7706860F00F0F08680777706860F
          00F0F08680777706860F00F0F0868077F70080080070708080F77708680FFFFF
          F06860777708680FFFFFF06860777708680FFFFFF06860777F08080787878008
          007F7706860F00F0F08680777706860F00F0F08680777706860F00F0F0868077
          F70080080070708080F77708680FFFFFF06860777708680FFFFFF06860777708
          680FFFFFF06860777F08080787878008007F7706860F00F0F08680777706860F
          00F0F08680777706860F00F0F0868077F70080080070708080F77708680FFFFF
          F06860777708680FFFFFF06860777708680FFFFFF06860777F08080787878008
          007F7706860FFFFFF08680777706860FFFFFF08680777706860FFFFFF0868077
          F70080087878708080F777086800000000686077770868000000006860777708
          68000000006860777F08080000000008007F7706868686868686807777068686
          86868686807777068686868686868077F70080808080808080F7770000000000
          0000007777000000000000000077770000000000000000777F00000000000000
          007F777777777777777777777777777777777777777777777777777777777777
          F7F7F7F7F7F7F7F7F7F777777777777777777777777777777777777777777777
          77777777777777777F7F7F7F7F7F7F7F7F7F}
        NumGlyphs = 4
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = spbPreviewWholeClick
      end
      object spbPreviewWidth: TSpeedButton
        Left = 62
        Top = 4
        Width = 22
        Height = 24
        Hint = 'Page Width'
        AllowAllUp = True
        GroupIndex = 1
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Glyph.Data = {
          6E030000424D6E03000000000000760000002800000050000000130000000100
          040000000000F802000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777777777777777777777777777777777777777F7F7F7F7F7F7F7F
          7F7F777777777777777777777777777777777777777777777777777777777777
          F7F7F7F7F7F7F7F7F7F777000000000000000077770000000000000000777700
          00000000000000777F00000000000000007F77060FFFFFFFFFF0807777060FFF
          FFFFFFF0807777060FFFFFFFFFF08077F70000787878787080F777080F00000F
          00F0607777080F00000F00F0607777080F00000F00F060777F08008000070080
          007F77060FFFFFFFFFF0807777060FFFFFFFFFF0807777060FFFFFFFFFF08077
          F70000787878787080F777080F00000F00F0607777080F00000F00F060777708
          0F00000F00F060777F08008000070080007F77060FFFFFFFFFF0807777060FFF
          FFFFFFF0807777060FFFFFFFFFF08077F70000787878787080F777080F00000F
          00F0607777080F00000F00F0607777080F00000F00F060777F08008000070080
          007F77060FFFFFFFFFF0807777060FFFFFFFFFF0807777060FFFFFFFFFF08077
          F70000787878787080F777080F00000F00F0607777080F00000F00F060777708
          0F00000F00F060777F08008000070080007F77060FFFFFFFFFF0807777060FFF
          FFFFFFF0807777060FFFFFFFFFF08077F70000787878787080F777080FFFFFFF
          FFF0607777080FFFFFFFFFF0607777080FFFFFFFFFF060777F08008787878780
          007F770600000000000080777706000000000000807777060000000000008077
          F70000000000000080F777086868686868686077770868686868686860777708
          68686868686860777F08080808080808007F7706868686868686807777068686
          86868686807777068686868686868077F70080808080808080F7770000000000
          0000007777000000000000000077770000000000000000777F00000000000000
          007F777777777777777777777777777777777777777777777777777777777777
          F7F7F7F7F7F7F7F7F7F777777777777777777777777777777777777777777777
          77777777777777777F7F7F7F7F7F7F7F7F7F}
        NumGlyphs = 4
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = spbPreviewWidthClick
      end
      object spbPreview100Percent: TSpeedButton
        Left = 86
        Top = 4
        Width = 22
        Height = 24
        Hint = '100 %'
        AllowAllUp = True
        GroupIndex = 1
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Glyph.Data = {
          BA030000424DBA03000000000000760000002800000051000000130000000100
          0400000000004403000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          77777777777777777777777777777777777777777777777777F7F7F7F7F7F7F7
          F7F7F00000007777777777777777777777777777777777777777777777777777
          777777777F7F7F7F7F7F7F7F7F7F700000007700000000000000007777700000
          0000000000077770000000000000000777F00000000000000007F00000007706
          80FFFFFFFFFFF0777770680FFFFFFFFFFF077770680FFFFFFFFFFF077F700807
          87878787870F70000000770860FFFFFFFFFFF0777770860FFFFFFFFFFF077770
          860FFFFFFFFFFF0777F08008787878787807F0000000770680FF000F00000077
          7770680FF000F00000077770680FF000F00000077F70080780008000000F7000
          0000770860FF000F000000777770860FF000F00000077770860FF000F0000007
          77F08008700070000007F0000000770680FFFFFFFFFFF0777770680FFFFFFFFF
          FF077770680FFFFFFFFFFF077F70080787878787870F70000000770860FFFFFF
          FFFFF0777770860FFFFFFFFFFF077770860FFFFFFFFFFF0777F0800878787878
          7807F0000000770680FF000F000000777770680FF000F00000077770680FF000
          F00000077F70080780008000000F70000000770860FF000F000000777770860F
          F000F00000077770860FF000F000000777F08008700070000007F00000007706
          80FFFFFFFFFFF0777770680FFFFFFFFFFF077770680FFFFFFFFFFF077F700807
          87878787870F70000000770860FFFFFFFFFFF0777770860FFFFFFFFFFF077770
          860FFFFFFFFFFF0777F08008787878787807F000000077068000000000000077
          77706800000000000007777068000000000000077F70080000000000000F7000
          0000770868686868686860777770868686868686860777708686868686868607
          77F08080808080808007F0000000770686868686868680777770686868686868
          6807777068686868686868077F70080808080808080F70000000770000000000
          00000077777000000000000000077770000000000000000777F0000000000000
          0007F00000007777777777777777777777777777777777777777777777777777
          777777777F7F7F7F7F7F7F7F7F7F700000007777777777777777777777777777
          7777777777777777777777777777777777F7F7F7F7F7F7F7F7F7F0000000}
        NumGlyphs = 4
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = spbPreview100PercentClick
      end
      object spbPreviewFirst: TSpeedButton
        Left = 120
        Top = 4
        Width = 22
        Height = 24
        Hint = 'First Page'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Glyph.Data = {
          5A010000424D5A01000000000000760000002800000014000000130000000100
          040000000000E400000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777700007777777777777777777700007777777777777777777700007777
          7777777777777777000077778877777778777777000077770077777780777777
          0000777700777778007777770000777700777780007777770000777700777800
          0077777700007777007780000077777700007777007778000077777700007777
          0077778000777777000077770077777800777777000077770077777780777777
          0000777788777777787777770000777777777777777777770000777777777777
          777777770000777777777777777777770000777777777777777777770000}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = spbPreviewFirstClick
      end
      object spbPreviewPrior: TSpeedButton
        Left = 144
        Top = 4
        Width = 22
        Height = 24
        Hint = 'Prior Page'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Glyph.Data = {
          5A010000424D5A01000000000000760000002800000014000000130000000100
          040000000000E400000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777700007777777777777777777700007777777777777777777700007777
          7777777777777777000077777777777877777777000077777777778077777777
          0000777777777800777777770000777777778000777777770000777777780000
          7777777700007777778000007777777700007777777800007777777700007777
          7777800077777777000077777777780077777777000077777777778077777777
          0000777777777778777777770000777777777777777777770000777777777777
          777777770000777777777777777777770000777777777777777777770000}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = spbPreviewPriorClick
      end
      object spbPreviewNext: TSpeedButton
        Left = 211
        Top = 4
        Width = 23
        Height = 24
        Hint = 'Next Page'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Glyph.Data = {
          5A010000424D5A01000000000000760000002800000014000000130000000100
          040000000000E400000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777700007777777777777777777700007777777777777777777700007777
          7777777777777777000077777778777777777777000077777770877777777777
          0000777777700877777777770000777777700087777777770000777777700008
          7777777700007777777000008777777700007777777000087777777700007777
          7770008777777777000077777770087777777777000077777770877777777777
          0000777777787777777777770000777777777777777777770000777777777777
          777777770000777777777777777777770000777777777777777777770000}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = spbPreviewNextClick
      end
      object spbPreviewLast: TSpeedButton
        Left = 235
        Top = 4
        Width = 23
        Height = 24
        Hint = 'Last Page'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Glyph.Data = {
          5A010000424D5A01000000000000760000002800000014000000130000000100
          040000000000E400000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777700007777777777777777777700007777777777777777777700007777
          7777777777777777000077777877777778877777000077777087777770077777
          0000777770087777700777770000777770008777700777770000777770000877
          7007777700007777700000877007777700007777700008777007777700007777
          7000877770077777000077777008777770077777000077777087777770077777
          0000777778777777788777770000777777777777777777770000777777777777
          777777770000777777777777777777770000777777777777777777770000}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = spbPreviewLastClick
      end
      object spbPreviewCancel: TSpeedButton
        Left = 403
        Top = 4
        Width = 47
        Height = 24
        Caption = 'Cancel'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object mskPreviewPage: TMaskEdit
        Left = 170
        Top = 6
        Width = 36
        Height = 21
        TabStop = False
        AutoSelect = False
        EditMask = '99999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Text = ''
        OnKeyPress = mskPreviewPageKeyPress
      end
      object mskPreviewPercentage: TMaskEdit
        Left = 268
        Top = 6
        Width = 37
        Height = 21
        TabStop = False
        AutoSelect = False
        EditMask = '999\ %;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Text = ''
        OnExit = mskPreviewPercentageExit
        OnKeyPress = mskPreviewPercentageKeyPress
      end
    end
  end
  inherited ActionList: TosActionList
    Left = 784
    Top = 112
    object CloseAction: TAction [0]
      Tag = 1
      Category = 'File'
      Caption = '&Sair'
      OnExecute = CloseActionExecute
    end
    object FilterAction: TAction [1]
      Tag = 1
      Category = 'Edit'
      Caption = 'Executar Filtro'
      Hint = 'Executa o filtro selecionado (F10)'
      ImageIndex = 5
      ShortCut = 121
      OnExecute = FilterActionExecute
    end
    inherited OnCheckActionsAction: TAction
      Tag = 1
      Visible = True
      OnExecute = CheckActionsExecute
    end
    object EditAction: TAction
      Category = 'File'
      Hint = 'Alterar'
      ImageIndex = 1
      OnExecute = EditActionExecute
    end
    object NewAction: TAction
      Category = 'File'
      Hint = 'Novo'
      ImageIndex = 0
      OnExecute = NewActionExecute
    end
    object ViewAction: TAction
      Category = 'File'
      Hint = 'Visualizar'
      ImageIndex = 3
      OnExecute = ViewActionExecute
    end
    object DeleteAction: TAction
      Category = 'File'
      Hint = 'Excluir'
      ImageIndex = 2
      OnExecute = DeleteActionExecute
    end
    object PrintFilterAction: TAction
      Category = 'File'
      Hint = 'Imprimir Filtro'
    end
    object ShowQueryAction: TAction
      Tag = 1
      Category = 'Debug'
      Caption = 'Mostrar query'
      OnExecute = ShowQueryActionExecute
    end
    object PrintAction: TAction
      Category = 'File'
      Hint = 'Imprimir'
      ImageIndex = 4
      OnExecute = PrintActionExecute
    end
    object MoveFirstAction: TAction
      Tag = 1
      Category = 'Edit'
      Caption = 'Primeiro'
      Hint = 'Move para o primeiro registro'
    end
    object MoveNextAction: TAction
      Tag = 1
      Category = 'Edit'
      Caption = 'Pr'#243'ximo'
      Hint = 'Move para o pr'#243'ximo registro'
    end
    object MovePrevious: TAction
      Tag = 1
      Category = 'Edit'
      Caption = 'Anterior'
      Hint = 'Move para o registro anterior'
    end
    object MoveLastAction: TAction
      Tag = 1
      Category = 'Edit'
      Caption = #218'ltimo'
      Hint = 'Move para o '#250'ltimo registro'
    end
    object AdvanceAction: TAction
      Category = 'File'
      Caption = 'Avan'#231'ar'
      Hint = 'Avan'#231'ar'
      ImageIndex = 8
    end
    object RetrocedeAction: TAction
      Category = 'File'
      Caption = 'Voltar'
      Hint = 'Voltar'
      ImageIndex = 7
    end
    object OnSelectResourceAction: TAction
      Tag = 1
      Category = 'DefEvents'
      Caption = 'OnSelectResourceAction'
      OnExecute = OnSelectResourceActionExecute
    end
    object LoginAction: TAction
      Tag = 1
      Category = 'File'
      Caption = 'Login'
      OnExecute = LoginActionExecute
    end
    object LogoutAction: TAction
      Tag = 1
      Category = 'File'
      Caption = 'Logout'
      OnExecute = LogoutActionExecute
    end
    object Action1: TAction
      Caption = 'Action1'
    end
  end
  object MainMenu: TMainMenu [4]
    Left = 812
    Top = 72
    object Arquivo: TMenuItem
      Caption = 'Arquivo'
      object Novo: TMenuItem
        Action = NewAction
      end
      object Alterar: TMenuItem
        Action = EditAction
      end
      object Visualizar: TMenuItem
        Action = ViewAction
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Excluir: TMenuItem
        Action = DeleteAction
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Imprimir: TMenuItem
        Action = PrintAction
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Login1: TMenuItem
        Action = LoginAction
      end
      object Logout1: TMenuItem
        Action = LogoutAction
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object Sair: TMenuItem
        Action = CloseAction
      end
    end
    object Editar: TMenuItem
      Caption = 'Editar'
      object Filter: TMenuItem
        Action = FilterAction
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object MostrarQuery: TMenuItem
        Action = ShowQueryAction
      end
    end
    object Exibir: TMenuItem
      Caption = 'Exibir'
      object ExibirPaginaInicial: TMenuItem
        Caption = 'P'#225'gina Inicial'
        ImageIndex = 9
        OnClick = PaginaInicial
      end
    end
    object Backup1: TMenuItem
      Caption = 'Backup'
      object EfetuarBackupemarquivolocal1: TMenuItem
        Caption = 'Efetuar Backup em arquivo local'
        OnClick = EfetuarBackupemarquivolocal1Click
      end
    end
    object Ajuda: TMenuItem
      Caption = 'Ajuda'
    end
  end
  object FilterDatasource: TDataSource [5]
    DataSet = FilterDataset
    Left = 724
    Top = 112
  end
  object FilterDataset: TosClientDataset [6]
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ReadOnly = True
    BeforeOpen = FilterDatasetBeforeOpen
    AfterOpen = FilterDatasetAfterOpen
    BeforeClose = FilterDatasetBeforeClose
    AfterScroll = FilterDatasetAfterScroll
    DataProvider = acCustomSQLMainData.prvFilter
    Left = 696
    Top = 112
  end
  object PopupMenu: TPopupMenu [7]
    Left = 812
    Top = 112
    object Novo1: TMenuItem
      Action = NewAction
    end
    object Alterar1: TMenuItem
      Action = EditAction
    end
    object Excluir1: TMenuItem
      Action = DeleteAction
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Visualizar1: TMenuItem
      Action = ViewAction
    end
    object Imprimir1: TMenuItem
      Action = PrintFilterAction
    end
  end
  inherited ImageList: TImageList
    Left = 704
    Top = 48
  end
  object Manager: TosAppResourceManager
    Resources = <
      item
        ImageIndex = 0
        ResType = rtEdit
      end>
    Left = 732
    Top = 48
  end
  object BarLargeImages: TImageList
    Height = 32
    Width = 32
    Left = 116
    Top = 104
    Bitmap = {
      494C010101000500040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000002000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CECEBD00C6C6BD00C6BDB500C6BDB500C6BD
      B500C6BDB500C6BDB500C6BDB500C6BDB500C6BDB500C6BDB500C6BDB500C6BD
      B500C6BDB500C6BDB500C6BDB500C6BDB500C6BDB500C6BDB500C6BDB500C6BD
      B500C6BDB500C6BDB500CEC6BD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CEC6BD00B5B5AD00A59C94009C9C94009C9C
      94009C9C94009C9C94009C9C94009C9C94009C9C94009C9C94009C9C94009C9C
      94009C9C94009C9C94009C9C94009C9C94009C9C94009C9C94009C9C94009C9C
      94009C9C9400A5A59C00BDB5AD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDB5009C846B009C846B009C846B009C84
      6B009C846B009C846B009C846B009C846B009C846B009C846B009C846B009C84
      6B009C846B009C846B009C846B009C846B009C846B009C846B009C846B009C84
      6B009C846B009C846B00ADADA500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDB500FFF7E700FFFFFF00FFFFF700FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFEFE700FFEFE700F7EFE700F7EFE700F7EF
      E700F7E7DE00F7E7DE00F7E7DE00EFDEDE00EFDED600EFDED600EFDED600EFDE
      D600F7DED6009C846B00ADADA500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDB500FFF7F700FFFFFF00FFFFF700FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFEFE700FFEFE700F7EFE700CEBDAD00CEBD
      AD00F7E7DE00F7E7DE00F7E7DE00EFDEDE00EFDED600EFDED600EFDED600EFDE
      D600F7DED6009C846B00ADADA500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDB500FFF7F700FFFFFF00FFFFF700FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFEFE700FFEFE700F7EFE700F7EFE700F7EF
      E700F7E7DE00F7E7DE00F7E7DE00EFDEDE00EFDED600EFDED600EFDED600EFDE
      D600F7DED6009C846B00ADADA500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDB500FFF7F700FFFFFF00FFFFFF00FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFEFEF00FFEFE700F7EFE700F7EFE700F7EF
      E700F7E7DE00F7E7DE00F7E7DE00EFE7DE00EFDEDE00EFDED600EFDED600EFDE
      D600EFDED6009C846B00ADADA500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDB500FFF7F700FFFFFF00FFFFFF00C6BD
      B500C6B5B500C6B5AD00C6B5AD00C6B5AD00C6BDAD00C6B5AD00C6B5AD00C6B5
      AD00C6B5A500C6B5A500CEB5A500CEB5A500CEB5A500CEB5A500CEB5A500EFDE
      D600EFDED6009C846B00ADADA500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDB500FFF7F700FFFFFF00FFFFFF00FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFEFEF00FFEFEF00F7EFE700F7EFE700F7EF
      E700F7E7E700F7E7DE00F7E7DE00EFE7DE00EFDEDE00EFDED600EFDED600EFDE
      D600EFDED6009C846B00ADADA500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDB500FFF7F700FFFFFF00FFFFFF00C6BD
      B500C6B5AD00C6B5AD00C6B5AD00C6B5AD00C6B5AD00C6B5AD00C6B5AD00C6B5
      A500C6B5A500C6B5A500C6B5A500C6B5A500C6B5A500C6B5A500C6B59C00EFDE
      D600EFDED6009C846B00ADADA500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDB500FFF7F700FFFFFF00FFFFFF00FFFF
      FF00FFF7F700FFF7EF00FFF7EF00FFEFEF00FFEFE700F7EFE700F7EFE700F7EF
      E700F7E7DE00F7E7DE00F7E7DE00EFE7DE00EFDEDE00EFDED600EFDED600EFDE
      D600EFDED6009C846B00ADADA500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDB500FFF7F700FFFFFF00FFFFFF00BDBD
      BD00BDB5AD00BDB5AD00C6B5AD00BDB5AD00BDB5AD00BDB5AD00BDB5A500BDB5
      A500BDADA500C6B5A500C6ADA500C6ADA500C6AD9C00C6AD9C00C6AD9C00EFDE
      D600EFDED6009C846B00ADADA500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDB500FFF7F700FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7EF00FFF7EF00FFEFEF00FFEFE700F7EFE700F7EFE700F7E7
      E700F7E7DE00F7E7DE00EFE7DE00EFDEDE00EFDED600EFDED600EFDED600EFDE
      D600EFDECE009C846B00ADADA500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDB500FFF7F700FFFFFF00FFFFFF00BDBD
      BD00BDBDBD00BDB5AD00BDB5AD00BDADAD00BDADA500BDADA500BDADA500BDAD
      A500BDADA500BDAD9C00BDAD9C00BDAD9C00BDAD9C00BDAD9C00C6AD9C00EFDE
      D600EFDECE009C846B00ADADA500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDB500FFF7F700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFEFEF00FFEFE700F7EFE700F7E7E700F7E7E700F7E7
      DE00F7E7DE00EFE7DE00EFDED600EFDED600EFDED600EFDED600EFDECE00E7DE
      CE00EFD6CE009C846B00ADADA500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDB500FFF7F700FFFFFF00FFFFFF00BDBD
      BD00BDBDBD00BDBDBD00BDB5AD00B5ADA500B5ADA500B5AD9C00B5AD9C00B5A5
      9C00BDA59C00B5A59C00B5A59400BDA59400BDA59400BDA59C00BDA59400E7D6
      CE00EFD6CE009C846B00ADADA500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDB500FFF7F700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700F7EFE700F7E7DE00F7E7DE00EFDE
      DE00EFDED600EFDED600EFDED600EFDECE00E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6C6009C846B00ADADA500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDB500FFF7F700FFFFFF00FFFFFF00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDB500BDB5B500B5ADA500B5A59C00AD9C
      9400B59C9400B59C9400AD9C9400AD9C8C00B5A59400B59C8C00B59C8C00E7CE
      C600E7CEC6009C846B00ADADA500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDB500FFF7F700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7F700F7EFE700F7E7
      DE00EFDED600E7D6CE00E7D6CE00E7D6C600E7D6C600E7CEC600DECEBD00DECE
      BD00E7CEBD009C846B00ADADA500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDB500FFF7F700FFFFFF00FFFFFF00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDB500BDB5AD00B5AD
      A500B5A59C00AD948C00AD948400AD948400AD948400AD948400AD948400DEC6
      BD00DEC6B5009C846B00ADADA500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDB500FFF7F700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7
      F700FFEFEF00F7E7DE00E7D6CE00DECEBD00DEC6BD00DEC6BD00DEC6B500DEC6
      B500DEBDB5009C846B00ADADA500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDB500FFF7F700FFFFFF00FFFFFF00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDB500FFF7F700FFF7
      EF00FFEFE700F7EFE700EFE7DE00E7D6C600DEC6B500DEC6B500D6BDB500D6BD
      AD00D6BDAD009C846B00ADADA500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDB500FFF7F700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7
      EF00F7EFE700F7E7DE00EFDED600EFDED600DEC6BD00D6BDAD00D6BDAD00D6B5
      A500D6B5A5009C846B00B5ADA500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDB500FFF7F700FFFFFF00FFFFFF00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDB500BDB5AD00BDAD
      AD00F7EFE700F7E7DE00EFDED600EFDED600E7D6C600D6BDAD00CEB5A500CEB5
      A500CEAD9C009C846B00BDBDB500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDB500FFF7F700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7F700FFEF
      EF00F7EFE700F7E7DE00DEC6B500B5948400B5948400B5948400B5948400B594
      8400B5948400B594840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDB500FFF7F700FFFFFF00FFFFFF00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDB500BDB5AD00B5AD
      A500F7E7DE00EFDED600D6BDAD00EFEFE700EFE7DE00EFDED600E7D6CE00E7CE
      BD00B59C9400ADADA50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDB500FFF7F700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7EF00F7EF
      E700F7E7DE00EFDED600D6C6B500FFFFFF00FFF7F700F7E7DE00EFDECE00BDA5
      9C00B5ADA5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDB500FFF7F700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7F700FFF7EF00F7EF
      E700F7E7DE00E7D6CE00DEBDB500FFF7F700EFE7DE00EFD6CE00BDA59400B5AD
      A500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDB500FFF7F700FFFFFF00FFFFFF00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDB500FFF7EF00FFEFEF00F7E7
      DE00EFDEDE00E7D6CE00D6BDB500F7EFE700EFDECE00BDA59400B5B5AD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDB500FFF7F700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00F7EFE700F7E7
      DE00EFDED600E7D6C600D6BDAD00FFE7DE00B5A59400B5ADA500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDB500FFF7EF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFEFEF00F7E7
      DE00EFDED600E7D6CE00DEBDB500BDAD9C00B5B5AD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDB500D6BDB500D6BDB500D6BDB500D6BD
      B500D6BDB500D6BDB500D6BDB500D6BDB500D6BDB500D6BDB500D6BDB500D6BD
      B500D6BDB500D6BDB500B59C8C00B5B5AD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000200000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00FE000001000000000000000000000000
      FE000001000000000000000000000000FE000001000000000000000000000000
      FE000001000000000000000000000000FE000001000000000000000000000000
      FE000001000000000000000000000000FE000001000000000000000000000000
      FE000001000000000000000000000000FE000001000000000000000000000000
      FE000001000000000000000000000000FE000001000000000000000000000000
      FE000001000000000000000000000000FE000001000000000000000000000000
      FE000001000000000000000000000000FE000001000000000000000000000000
      FE000001000000000000000000000000FE000001000000000000000000000000
      FE000001000000000000000000000000FE000001000000000000000000000000
      FE000001000000000000000000000000FE000001000000000000000000000000
      FE000001000000000000000000000000FE000001000000000000000000000000
      FE000001000000000000000000000000FE000003000000000000000000000000
      FE000003000000000000000000000000FE000007000000000000000000000000
      FE00000F000000000000000000000000FE00001F000000000000000000000000
      FE00003F000000000000000000000000FE00007F000000000000000000000000
      FE0000FF00000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object BarSmallImages: TImageList
    Left = 44
    Top = 120
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001D82B5001B81B300187E
      B000167CAE001379AB001076A8000D73A5000B71A300086EA000066C9E00046A
      9C0002689A000167990000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002287BA0067CCFF002085B80099FF
      FF006FD4FF006FD4FF006FD4FF006FD4FF006FD4FF006FD4FF006FD4FF006FD4
      FF003BA0D30099FFFF0001679900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000258ABD0067CCFF00278CBF0099FF
      FF007BE0FF007BE0FF007BE0FF007BE0FF007BE0FF007BE0FF007BE0FF007BE0
      FF0044A9DC0099FFFF0002689A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000288DC00067CCFF002D92C50099FF
      FF0085EBFF0085EBFF0085EBFF0085EBFF0085EBFF0085EBFF0085EBFF0085EB
      FF004EB3E60099FFFF00046A9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002A8FC20067CCFF003398CB0099FF
      FF0091F7FF0091F7FF0091F7FF0091F7FF0091F7FF0091F7FF0091F7FF0091F7
      FF0057BCEF0099FFFF00066C9E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002D92C5006FD4FF003499CC0099FF
      FF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FF
      FF0060C5F80099FFFF00086EA000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002F94C7007BE0FF002D92C500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0081E6FF00FFFFFF000B71A300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003196C90085EBFF0081E6FF002D92
      C5002D92C5002D92C5002D92C5002D92C5002D92C500288DC0002489BC002085
      B8001C81B4001B81B3001B81B300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003398CB0091F7FF008EF4FF008EF4
      FF008EF4FF008EF4FF008EF4FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00167CAE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003499CC00FFFFFF0099FFFF0099FF
      FF0099FFFF0099FFFF00FFFFFF00258ABD002287BA001F84B7001D82B5001B81
      B300187EB0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003499CC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF002A8FC200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003499CC003398
      CB003196C9002F94C70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      8003000000000000000100000000000000010000000000000001000000000000
      0001000000000000000100000000000000010000000000000001000000000000
      0007000000000000000700000000000081FF000000000000C3FF000000000000
      FFFF000000000000FFFF00000000000000000000000000000000000000000000
      000000000000}
  end
  object ActionDataSet: TosClientDataset
    Aggregates = <>
    FetchOnDemand = False
    Params = <
      item
        DataType = ftString
        Precision = 255
        NumericScale = 255
        Name = 'UserName'
        ParamType = ptInput
        Size = 20
      end
      item
        DataType = ftString
        Precision = 255
        NumericScale = 255
        Name = 'NomeRecurso'
        ParamType = ptInput
        Size = 50
      end>
    DataProvider = RecursoData.AcoesUsuarioProvider
    Left = 840
    Top = 112
    object ActionDataSetNOMECOMPONENTE: TStringField
      FieldName = 'NOMECOMPONENTE'
      Size = 40
    end
  end
  object ppDBPipeline: TppDBPipeline
    DataSource = FilterDatasource
    UserName = 'DBPipeline'
    Left = 868
    Top = 112
  end
  object ppReport: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.Format = ftASCII
    Units = utMillimeters
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 896
    Top = 112
    Version = '15.0'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline'
    object ppHeaderBand: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 21167
      mmPrintPosition = 0
      object ppLineHeader: TppLine
        UserName = 'ppLineHeader'
        Border.Weight = 1.000000000000000000
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 1000
        mmLeft = 0
        mmTop = 20108
        mmWidth = 197300
        BandType = 0
      end
      object pplblTitulo: TppLabel
        UserName = 'lblTitulo'
        HyperlinkEnabled = False
        Border.Weight = 1.000000000000000000
        Caption = 'T'#237'tulo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 85461
        mmTop = 265
        mmWidth = 14023
        BandType = 0
      end
      object ppvarDtHora: TppSystemVariable
        UserName = 'varDtHora'
        HyperlinkEnabled = False
        Border.Weight = 1.000000000000000000
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 163777
        mmTop = 794
        mmWidth = 31221
        BandType = 0
      end
      object pplblSubtitulo: TppLabel
        UserName = 'lblSubtitulo'
        HyperlinkEnabled = False
        Border.Weight = 1.000000000000000000
        Caption = 'Consulta:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 85461
        mmTop = 6879
        mmWidth = 11906
        BandType = 0
      end
    end
    object ppDetailBand: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
    end
    object ppFooterBand: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppvarPagina: TppSystemVariable
        UserName = 'varPagina'
        HyperlinkEnabled = False
        Border.Weight = 1.000000000000000000
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 169863
        mmTop = 1588
        mmWidth = 21167
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Border.Weight = 1.000000000000000000
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 0
        mmTop = 529
        mmWidth = 197300
        BandType = 8
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object plItem: TppDBPipeline
    RefreshAfterPost = True
    UserName = 'plItem'
    Visible = False
    Left = 321
    Top = 362
  end
  object Report: TppReport
    AutoStop = False
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 124
    Template.DatabaseSettings.DataPipeline = plItem
    Template.DatabaseSettings.NameField = 'Name'
    Template.DatabaseSettings.TemplateField = 'Template'
    Template.SaveTo = stDatabase
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OnPreviewFormCreate = ReportPreviewFormCreate
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    ShowAutoSearchDialog = True
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 353
    Top = 362
    Version = '15.0'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 28840
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppParameterList2: TppParameterList
    end
  end
  object SQLConnection: TSQLConnection
    ConnectionName = 'IBLocal'
    DriverName = 'Interbase'
    LoginPrompt = False
    Params.Strings = (
      'BlobSize='
      'CommitRetain='
      'Database='
      'DriverName=Interbase'
      'ErrorResourceFile='
      'LocaleCode='
      'Password='
      'RoleName='
      'ServerCharSet='
      'SQLDialect='
      'Interbase TransIsolation='
      'User_Name='
      'WaitOnLocks=')
    Left = 288
    Top = 360
  end
  object SaveBackupDialog: TSaveDialog
    DefaultExt = 'bkp'
    Filter = 'Arquivos de Backup|*.bkp'
    Left = 488
    Top = 72
  end
  object FFilterDepot: TacFilterController
    Left = 600
    Top = 125
  end
  object FReportDepot: TacReportContainer
    Left = 905
    Top = 37
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 272
    Top = 104
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Pitch = fpVariable
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16311512
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Pitch = fpVariable
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Pitch = fpVariable
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15912117
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Pitch = fpVariable
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clActiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      TextColor = clDefault
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 7407872
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16311512
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnShadow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      TextColor = clDefault
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 9699219
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Pitch = fpVariable
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8585215
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyleBandHeader: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxBandVersao: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 7118079
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object cxBandAtributo: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 12320699
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object cxBandValorReferencia: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object cxBandRecomendacaoPaciente: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 12500606
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object cxBandRecomendacaoColeta: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 16752543
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 10354687
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object cxExameAlterado: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 10790052
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 9699219
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxBandApoio: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
end
