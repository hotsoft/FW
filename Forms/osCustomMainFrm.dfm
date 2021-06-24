inherited osCustomMainForm: TosCustomMainForm
  Left = 233
  Top = 311
  Caption = 'osCustomMainForm'
  ClientHeight = 645
  ClientWidth = 1008
  Menu = MainMenu
  Visible = True
  WindowState = wsMaximized
  ExplicitWidth = 1024
  ExplicitHeight = 704
  PixelsPerInch = 96
  TextHeight = 13
  object ControlBar: TControlBar [0]
    Left = 0
    Top = 0
    Width = 1008
    Height = 39
    Align = alTop
    AutoDrag = False
    DragKind = dkDock
    TabOrder = 0
    object MainToolbar: TToolBar
      Left = 11
      Top = 2
      Width = 268
      AutoSize = True
      ButtonHeight = 32
      ButtonWidth = 32
      EdgeInner = esNone
      EdgeOuter = esNone
      Images = MainImageList
      TabOrder = 0
      object NewToolButton: TToolButton
        Left = 0
        Top = 0
        Action = NewAction
        ParentShowHint = False
        ShowHint = True
      end
      object EditToolButton: TToolButton
        Left = 32
        Top = 0
        Action = EditAction
        ParentShowHint = False
        ShowHint = True
      end
      object DeleteToolButton: TToolButton
        Left = 64
        Top = 0
        Action = DeleteAction
        ParentShowHint = False
        ShowHint = True
      end
      object ViewToolButton: TToolButton
        Left = 96
        Top = 0
        Action = ViewAction
        ParentShowHint = False
        ShowHint = True
      end
      object PrintToolButton: TToolButton
        Left = 128
        Top = 0
        Action = PrintAction
        ParentShowHint = False
        ShowHint = True
      end
      object PrintAllToolButton: TW7ToolButton
        Left = 160
        Top = 0
        Width = 72
        Height = 32
        Hint = 'Imprimir Todos'
        Version = '1.0.2.0'
        Caption = 'Todos'
        Images = MainImageList
        ImageIndex = 4
        IconSize = is24px
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5978398
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Action = PrintAction
        ParentFont = False
        TabOrder = 0
      end
      object PaginaInicialToolButton: TToolButton
        Left = 232
        Top = 0
        Caption = 'P'#225'gina Inicial'
        ImageIndex = 9
        OnClick = PaginaInicial
      end
    end
    object ConsultaPanel: TPanel
      Left = 292
      Top = 2
      Width = 656
      Height = 48
      Align = alTop
      BevelOuter = bvNone
      DragKind = dkDock
      TabOrder = 1
      object ConsultaLabel: TLabel
        Left = 0
        Top = 8
        Width = 46
        Height = 13
        Caption = 'Pesquisa:'
      end
      object EditarTodosButton: TSpeedButton
        Left = 568
        Top = 4
        Width = 81
        Height = 22
        Caption = 'Editar Todos'
        Flat = True
        OnClick = EditarTodosButtonClick
      end
      object tbrFilter: TToolBar
        Left = 284
        Top = 0
        Width = 29
        Height = 29
        Align = alNone
        AutoSize = True
        ButtonHeight = 29
        ButtonWidth = 29
        Caption = 'tbrFilter'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object FilterButton: TToolButton
          Left = 0
          Top = 0
          Action = FilterAction
        end
      end
      object ConsultaCombo: TosComboFilter
        Left = 53
        Top = 4
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
        TabOrder = 1
        UnboundDataType = wwDefault
        OnCloseUp = ConsultaComboCloseUp
        ClientDS = FilterDataset
        Params = <>
        ViewDefault = 0
      end
      object SearchEdit: TEdit
        Left = 488
        Top = 4
        Width = 73
        Height = 21
        TabOrder = 2
        OnDblClick = SearchEditDblClick
      end
    end
  end
  object StatusBar: TStatusBar [1]
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
  object Panel2: TPanel [2]
    Left = 0
    Top = 39
    Width = 1008
    Height = 587
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Splitter1: TSplitter
      Left = 141
      Top = 0
      Width = 4
      Height = 587
      ExplicitLeft = 165
      ExplicitTop = 33
      ExplicitHeight = 556
    end
    object WebBrowser: TWebBrowser
      Left = 145
      Top = 0
      Width = 863
      Height = 587
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 185
      ExplicitTop = 33
      ExplicitWidth = 823
      ExplicitHeight = 556
      ControlData = {
        4C00000032590000AB3C00000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E12620A000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 141
      Height = 587
      Align = alLeft
      TabOrder = 1
      ExplicitTop = 33
      ExplicitHeight = 554
      object TreeView1: TTreeView
        Left = 1
        Top = 1
        Width = 44
        Height = 564
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
        ExplicitHeight = 531
      end
      object EdtPesquisa: TEdit
        Left = 1
        Top = 565
        Width = 139
        Height = 21
        Align = alBottom
        AutoSelect = False
        TabOrder = 1
        OnChange = EdtPesquisaChange
        OnEnter = EdtPesquisaEnter
        OnKeyDown = EdtPesquisaKeyDown
        ExplicitTop = 532
      end
      object AdvSmoothMegaMenu: TAdvSmoothMegaMenu
        Left = 45
        Top = 1
        Width = 95
        Height = 564
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
            MenuAutoSize = True
            MenuHeight = 10
            Caption = 'MenuItem 0'
            CaptionFont.Charset = DEFAULT_CHARSET
            CaptionFont.Color = clWindowText
            CaptionFont.Height = -11
            CaptionFont.Name = 'Tahoma'
            CaptionFont.Style = [fsBold]
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
                Caption = 'Section on MenuItem 1'
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
            MenuAutoSize = True
            Caption = 'MenuItem 1'
            CaptionFont.Charset = DEFAULT_CHARSET
            CaptionFont.Color = clWindowText
            CaptionFont.Height = -11
            CaptionFont.Name = 'Tahoma'
            CaptionFont.Style = []
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
            MenuAutoSize = True
            Caption = 'MenuItem 2'
            CaptionFont.Charset = DEFAULT_CHARSET
            CaptionFont.Color = clWindowText
            CaptionFont.Height = -11
            CaptionFont.Name = 'Tahoma'
            CaptionFont.Style = []
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
                Caption = 'Section on MenuItem 3'
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
            MenuAutoSize = True
            Caption = 'MenuItem 3'
            CaptionFont.Charset = DEFAULT_CHARSET
            CaptionFont.Color = clWindowText
            CaptionFont.Height = -11
            CaptionFont.Name = 'Tahoma'
            CaptionFont.Style = []
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
                Caption = 'Section on MenuItem 4'
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
            MenuAutoSize = True
            Caption = 'MenuItem 4'
            CaptionFont.Charset = DEFAULT_CHARSET
            CaptionFont.Color = clWindowText
            CaptionFont.Height = -11
            CaptionFont.Name = 'Tahoma'
            CaptionFont.Style = []
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
                Caption = 'Section on MenuItem 5'
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
            MenuAutoSize = True
            Caption = 'MenuItem 5'
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
        Direction = mdVertical
        Transparent = True
        Version = '1.3.5.2'
        Align = alClient
        ExplicitHeight = 531
      end
    end
    object AbasPrincipalTS: TPageControl
      Left = 145
      Top = 0
      Width = 863
      Height = 587
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 2
      OnChange = AbasPrincipalTSChange
      ExplicitTop = 33
      ExplicitHeight = 554
      object TabSheet1: TTabSheet
        Caption = 'Pesquisa'
        ExplicitHeight = 526
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
          TabOrder = 0
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
          end
          object LvGrid: TcxGridLevel
            GridView = TvGrid
          end
        end
      end
    end
  end
  object RelatPanel: TPanel [3]
    Left = 485
    Top = 140
    Width = 473
    Height = 389
    BevelInner = bvRaised
    BevelOuter = bvNone
    TabOrder = 3
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
    Images = MainImageList
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
      Caption = 'Alterar...'
      Hint = 'Alterar'
      ImageIndex = 1
      OnExecute = EditActionExecute
    end
    object NewAction: TAction
      Category = 'File'
      Caption = 'Novo...'
      Hint = 'Novo'
      ImageIndex = 0
      OnExecute = NewActionExecute
    end
    object ViewAction: TAction
      Category = 'File'
      Caption = 'Visualizar...'
      Hint = 'Visualizar'
      ImageIndex = 3
      OnExecute = ViewActionExecute
    end
    object DeleteAction: TAction
      Category = 'File'
      Caption = 'Excluir'
      Hint = 'Excluir'
      ImageIndex = 2
      OnExecute = DeleteActionExecute
    end
    object PrintFilterAction: TAction
      Category = 'File'
      Caption = 'Imprimir Filtro...'
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
      Caption = 'Imprimir...'
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
  end
  object MainMenu: TMainMenu [5]
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
  object FilterDatasource: TDataSource [6]
    DataSet = FilterDataset
    Left = 724
    Top = 112
  end
  object FilterDataset: TosClientDataset [7]
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
  object PopupMenu: TPopupMenu [8]
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
    Left = 4
    Top = 96
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
    Left = 36
    Top = 96
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
  object ArrowsImageList: TImageList
    Left = 144
    Top = 240
    Bitmap = {
      494C010102000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000000000000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840084848400FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000848484000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400848484000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400848484000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000848484000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840084848400FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000000000000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFFFFFF00000000
      FFFFFFFF00000000FFFFFFFF00000000F00FFE7F00000000F3CFFC3F00000000
      FBDFFDBF00000000F99FF99F00000000FDBFFBDF00000000FC3FF3CF00000000
      FE7FF00F00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000
      FFFFFFFF00000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
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
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
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
  object MainImageList: TImageList
    Height = 22
    Width = 22
    Left = 674
    Top = 52
    Bitmap = {
      494C01010B000D00040016001600FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000058000000420000000100200000000000C05A
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6BD00BDBD
      B500C6C6BD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CEBDB500AD7B73008C3931007B1810006B00000063000000731010008431
      3100A5737300C6BDB50000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDB5AD009C9C
      9400ADA59C00C6C6BD0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B584
      73008418100084100800B5421800D66B2900DE733100DE733100CE6B2900A539
      18006B0000006B080800A5737300000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99BA
      D700709FE1005C97E700328CFF00328CFF005D98E800709FE1008DAFD100FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000084A00007B7B
      73007B7B7300ADA59C00C6C6BD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A55A4A008C21
      0800BD521800FF943900FF943900FF943900FF943900FF943900FF943900FF94
      3900FF943900B54218006B0000008C4239000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBCAD3004492
      E500318EFF003893FF004CA5FF004DA6FF003994FF00318DFF004595E200AFBD
      D900FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042B53100084A
      000063635A007B7B7300ADA59C00C6C6BD000000000000000000000000000000
      00000000000000000000000000000000000000000000A5634A0094290800E77B
      2100FF8C2900FF8C2900FF8C2900FF8C2900FF8C2900FF8C2900FF8C2900FF8C
      2900FF8C2900FF8C2900E76B21006B0000008C42390000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFC0D7005C9DDA004999
      FF004D90FF004588FD00387AFD00397BFF004487FC00498CFB004F9FFF005094
      E1009DB9D400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042B5310042B5
      3100084A000063635A007B7B7300ADA59C000000000000000000000000000000
      000000000000000000000000000000000000BD8C7B0094290800EF731000FF84
      1800FF841800FF841800FF841800FF841800FF841800FF841800FF841800FF84
      1800FF841800FF841800FF841800E76B10006B000000A5737300000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0CCE400669EE3003493FF004386
      FB003781FF00377EFF003D7BFF003F7DFF00387FFF00357FFF004582FA003192
      FF00569BE500A7C0DE00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDB5AD007B7373007B7373007B7373007B7373007B73730042B531006BDE
      5A00319C210018840800084A000063635A00ADA59C00C6C6BD00000000000000
      0000000000000000000000000000CEC6B5009C391800CE520800FF7B0800FF7B
      0800FF943100FFDEBD00FFDEBD00FFDEBD00FFDEBD00FFDEBD00FFDEBD00FFDE
      BD00FFDEBD00FFA55200FF7B0800FF7B0800B53100006B080800C6BDB5000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF71A7E4003A91F0003D91FF003780
      FF003D7FFF003C86FF004398FD00469BFF00418BFF003F81FF003A80FF003788
      FF003790FF005AA2E400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000107B0000086B0000086B000008630000085A0000085A00000852000039AD
      290031A52100319C210018840800004A00007B7B7300ADA59C00C6C6BD000000
      0000000000000000000000000000BD947B00A5391000FF730000FF730000FF73
      0000FFBD7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFBD7300FF730000FF730000FF7300006B000000A57373000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3591FF003C84F4003788FF00348E
      FF00458EFC002E85FF00F0FDFF00F9FFFF00F7FFFF0050A8F3002D94FF003984
      FF004C8FFC003187F500E4DDE400FFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000052C6420084FF730084FF730084F76B007BF76B007BEF630073EF630042B5
      310039AD290031A52100319C21001884080063635A007B7B7300ADA59C00C6C6
      BD00000000000000000000000000AD634200CE520800FF730000FF7B0000FF73
      0000FFBD7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFBD7300FF730000FF730000FF730000A5290000843131000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFC8D5E5003588FF00398EFA003E99FF003795
      F700388BFB00579CF7004B94FB00F2F5FF00F2FAFF00FBFFF90056B2FB004492
      FF003B8EF8003E91FF0093BCEB00FFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000052CE42006BDE520063D652005ACE4A0052CE420052C642004ABD390042B5
      310042B5310039AD290031A52100299C21000042000063635A0084847B00BDB5
      AD00000000000000000000000000AD522900E7630000FF7B0000FF7B0000FF7B
      0000FFBD7B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFBD7300FF7B0000FF7B0000FF7B0000CE4A0000731010000000
      0000FFFFFFFFFFFFFFFFFFFFFFFF92BFE100328AFF003897FF00429DFC0072B2
      F30059B8F40037ADFE00499BFA005095ED00F7FBFF00FFFCFF00E8F7FF0040A4
      FE003E92F4003199FF0063AAFC00FFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005ACE4A006BDE5A0063DE520063D652005ACE4A0052CE420052C639004ABD
      390042B5310039AD290039AD290031A52100188408000042000084847B00BDB5
      AD00000000000000000000000000AD421000EF731000FF8C1800FF8C1800FF9C
      3100FFE7C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFDEBD00FF9C3100FF7B0000FF7B0000DE5A0000630000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFF6EB5E9003D9BFF00419AFF0049AAFC00E7F4
      FF00F3FFFF00FAF7FF00F3F7FF00FFFAFC00FFFFF600EFFDFC00FFFFF60052AF
      F50048A2F700479FFF005BA7EE00FFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005ACE4A006BE75A006BDE5A0063DE520063D652005ACE4A0052CE42004AC6
      39004ABD390042B5310039AD290039AD2900299C210000420000ADA59C00C6C6
      BD00000000000000000000000000AD4A1800EF7B1000FF9C3100FF9C3100F7D6
      C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF7EF00FF7B0000FF7B0000DE5A0000630000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFF6BB1F1004BA4FD0044A4FE0048AFFC00FFFD
      FA00FFFCFD00F8FCFD00F1FBFF00FAFBFF00FCFFFF00FFFFF000F5FFFF00F0FC
      FF0032A5FE003A9BFF00459FF400FFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005AD64A006BE75A006BE75A006BDE5A0063D6520063D64A005ACE4A0052C6
      42004AC639004ABD390042B5310039AD2900004A0000ADA59C00C6C6BD000000
      0000000000000000000000000000B55A2900E7731800FFA55200FFA55200EFAD
      7B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7AD6300FF7B0000FF7B0000D6520000731010000000
      0000FFFFFFFFFFFFFFFFFFFFFFFF77BDF9004BA3FF003AB0FE004CA2F300F6FB
      FA00FFFCFF00FAFFFF00FFFFF300FFF8F900FFF9FF00FFFFFB00FFF7FF004CB2
      F1002FA5FD0048ADFE005CA3F300FFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005AD64A0073E75A006BE75A006BDE5A0063DE520063D652005AD64A005ACE
      420052C642004ABD39004ABD390042B53100ADA59C00C6C6BD00000000000000
      0000000000000000000000000000BD734A00D6630800FFB56300FFB56B00FFB5
      6B00EFA56B00F7EFE700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7C69400FFA54200FF8C1800FF7B0000AD3100008C3931000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFB4D9FF003CAEFE0042ACF80043ACFE0055AE
      FD0042AAFB0040A9FE0046AEFE0056B8EC00FFFFFD00FFFFFA00F0F7FF003EAE
      FE004CADF50036AFFE0091C6FD00FFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000063D652005ACE420052C6420052C642004AC639004ABD39004ABD390084FF
      730052CE420052C642004ABD3900084A0000C6C6BD0000000000000000000000
      0000000000000000000000000000C69C7B00B5521800FFA54200FFC68400FFC6
      8400FFC68400F7B57B00EFCEBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFD6A500FFC68400FFC68400FFAD52007B100000AD7B73000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFD0EFFF003EB1FE0041AFFE003BB2F8003AAF
      F7003EB2F3004DB8FE0049B6F400EDF9FD00F5FFFF00EAFAFF0054B8F6003AB2
      FD0049B5FE004CAFFE00B7E3FF00FFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004ABD390084FF
      73005ACE4A0052C6420008520000ADA59C000000000000000000000000000000
      0000000000000000000000000000CEC6B500B55A2100DE6B1000FFCE9400FFD6
      A500FFD6A500FFD6A500FFCE9C00E7BD9C00FFF7EF00FFFFFF00FFDECE00FFEF
      D600FFEFD600FFD6AD00FFD6A500FFD6A500BD5218007B100800CEBDB5000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5BBBF50037B0FE004FBDFE0047B7
      FE0037ADFE0053C1FE00CDEBFF00FFFDFF004EC1F90048B6FE0042B7FE0059C3
      F9003ABAFE0040B4FE00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004ABD390084FF
      73005AD64A0008520000ADA59C00C6C6BD000000000000000000000000000000
      000000000000000000000000000000000000C69C8400BD521800F7842100FFDE
      AD00FFDEBD00FFDEBD00FFDEBD00FFDEBD00EFBD9C00F7CEAD00FFDEBD00FFDE
      BD00FFDEBD00FFDEBD00FFDEBD00E78C390084180000AD847300000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBDFFF0053BBF8002EB2FB0042C2
      FE005BC5FE002CB6FA004CBDF40056BCEF004BBEF60039BDFE0040BEFD003DC2
      FD003BBCFC009CD5F900FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004ABD3900085A
      0000ADA59C00C6C6BD0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD845200BD521800F784
      2100FFDEB500FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEF
      D600FFEFD600FFE7C600E79442008C2108009C52420000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4DCFB004AC4FB003EC6
      FE004BC2FC003BC6F90030C7FE003AC3FE004BC5FE0053C6F70047C8FE0035C0
      F80087DBF900FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004ABD3900BDBD
      B500C6C6BD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD845200BD52
      1800DE6B1000FFB56B00FFE7CE00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFEF
      DE00FFC68C00C65A180094290800A55A4A000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6ECFE0051C1
      F3003CCBFE0060D2FE0056D1FE004AC7FE004BC6FE004FD3FE003EC3F2008EDB
      F600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C69C
      7B00B55A2100B5521000D65A0800E77B1800EF8C3900E78C3900DE7B2900C652
      08009C31080094311000B58C7B00000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF84DE
      FE0041CBFE0039C1FE003DC6FE003EC8F8003BC8F6002ECBFE0086DAFE00FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CEC6B500C69C7B00BD734A00AD522900A5421000A5391000A54A2100AD63
      4200BD8C7B00CEBDB50000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6948C00BD6B5A00C6A59C00000000000000000000000000CEBD
      AD00C6947300CE9C8400BD947B00CEBDB5000000000000000000000000000000
      0000000000000000000000000000523131004A29290039212100CECEC600CECE
      C600CECEC600CECEC600CECEC600CECEC600CECEC600CECEC600CECEC600CECE
      C600CECEC600CECEC600CECEC600C6C6BD00ADA59C0084847B007B7373008484
      7B00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      BD0042638C00184A8C0010529C002152840073849C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C68C7B00C66B5200E7AD9C00C6635200BD635200C6948400CEB5A500CEA5
      8400FFEFEF00FFFFFF00E7D6C600BD846300B5846300CEBDAD00000000000000
      000000000000000000007B5A5A00634242005A39390052313100CECEC6006342
      420042292900FFFFFF00CECEC600CECEC600CECEC600CECEC600CECEC600CECE
      C600CECEC600CECEC600C6C6BD00ADA59C0000214A0000214A0000529C006363
      5A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6BD003963
      8C001073C600008CFF00008CFF00088CF700185AA500738CA500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6BD00BDBDB500C6C6BD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CEC6BD00C67B
      6300D6846B00FFEFE700FFE7E700FFDECE00DEADAD00C6846B00E7BDA500FFFF
      FF00FFFFFF00FFFFFF00FFF7F700FFEFEF00E7CEC600C68C7300AD735200C6AD
      9C0000000000000000008C6B6B0073525200634242004A313100CECEC6009C84
      840063424200FFFFFF00CECEC600CECEC600CECEC600CECEC600CECEC600CECE
      C600CECEC600C6C6BD00ADA59C0000214A0000529C004284BD0000214A000052
      9C00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6BD00396B9400107B
      D600089CFF0021C6FF00089CFF000894FF000894F700215A9400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6BD00ADA59C009C9C9400BDB5AD000000000000000000000000000000
      00000000000000000000000000000000000000000000CEB5AD00C6735A00DE94
      8400FFEFEF00FFF7EF00FFE7E700FFDED600E7AD9C00E7C6AD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF7F700FFEFEF00F7EFEF00F7E7E700E7CEC600BD8C
      6B00AD735200BDA59400A58C8C00947373007B5A5A00CECEC600CECEC600CECE
      C600CECEC600CECEC600CECEC600CECEC600CECEC600CECEC600CECEC600CECE
      C600C6C6BD00ADA59C0000214A0000529C004284BD001884BD001884BD000052
      9C00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6BD00396B9C001894D60010AD
      FF0010ADFF00007BFF00008CFF00008CFF0008A5FF00186BAD00000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      BD00ADA59C00004A00007B7B7300B5ADA5000000000000000000000000000000
      000000000000000000000000000000000000CEB5A500CE735200EFB5A500FFEF
      E700FFEFE700FFE7DE00F7CEC600FFDED600F7CEC600DEAD9C00D6A58C00EFD6
      C600FFF7F700FFFFFF00FFF7F700FFEFEF00F7EFEF00F7E7E700EFDEDE00EFDE
      DE00E7C6BD00AD6B4200CECEC600CECEC600CECEC600B5B5AD00000000003921
      2100CECEC600CECEC600CECEC600CECEC600CECEC600CECEC600CECEC600C6C6
      BD00ADA59C0000214A0000529C004284BD001884BD00FFFFFF001884BD000052
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6BD003973A500189CDE0029DEFF0010AD
      FF0010A5FF000084FF000894FF00008CFF0010ADFF00186BA500000000000000
      0000000000000000000000000000000000000000000000000000C6C6BD00ADA5
      9C00084A0000084A00007B737300B5ADA5000000000000000000000000000000
      000000000000000000000000000000000000CE6B4A00FFCEBD00FFE7DE00FFE7
      DE00FFDED600E7BDB500F7D6CE00E7BDB500E7BDB500FFD6CE00F7CEC600D6A5
      9C00C68C7B00D6AD9400F7E7DE00FFEFEF00F7EFEF00F7E7E700EFDEDE00D6B5
      A500B5846300CEC6BD00CECEC6006342420042212100CECEC6008C6B6B004A29
      2900BDB5AD00B5ADA500B5ADA500B5ADA500B5ADA500BDB5AD00BDBDB500ADA5
      9C0000214A0000529C004284BD001884BD00FFFFFF001884BD0000529C00ADA5
      9C00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C6003973AD00189CDE0021CEFF0021CEFF0018BD
      FF0010ADFF00089CFF00089CFF0010ADFF001894D6005284AD00000000000000
      00000000000000000000000000000000000000000000C6C6BD00ADA59C000852
      0000218C1000085200007B737300B5ADA5000000000000000000000000000000
      000000000000000000000000000000000000CE6B4A00FFDED600FFDED600F7CE
      C600EFC6BD00FFDEDE00FFEFE700FFEFE700FFE7DE00EFBDBD00E7B5AD00F7CE
      C600F7CECE00DEADA500B5736300BD846B00DEBDAD00E7D6CE00BD846300A539
      29000000000000000000CECEC6009C7B7B005A393900C6C6BD00BDB5AD00A59C
      9C0084847B007B7373007B7373007B7373007B73730084847B0094948C000021
      4A0000529C004284BD001884BD00FFFFFF001884BD0000529C00ADA59C00C6C6
      BD00000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600397BAD00189CDE0018BDFF0018BDFF0018BDFF0018BD
      FF0018B5FF0018B5FF0018B5FF00189CE700397BAD00C6C6C600000000000000
      0000000000000000000000000000C6C6BD00ADA59C00085A0000319C210042B5
      31006BE75A000852000063635A00736B6B007B7373007B7373007B7373007B73
      73008C8C8400BDB5AD000000000000000000D6734A00FFD6CE00F7C6BD00F7C6
      BD00FFDED600FFE7DE00FFF7EF00FFF7EF00FFEFEF00FFEFEF00FFEFE700F7CE
      CE00DEADAD00EFC6BD00F7D6CE00DEADA500B56B6300A55A3900FFD6CE00A529
      21000000000000000000CECEC600CECEC600C6C6BD00ADA59C0084847B007339
      0000733900007339000073390000733900007339000063635A00004A9400108C
      F7004284BD001884BD00FFFFFF001884BD0000529C00ADA59C00C6C6BD00CECE
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000007B9CB5002184C60010A5F70010ADFF0010ADFF0010ADFF0010AD
      FF0010ADFF0010A5F70018A5DE003984B500C6C6C60000000000000000000000
      0000000000000000000000000000ADA59C000863000039AD29004ABD39004ABD
      390073E763000852000008520000084A0000084A0000084A0000004200000042
      00007B737300B5ADA5000000000000000000D6735200EFBDBD00FFCEC600FFD6
      CE00FFDECE00FFEFDE00FFF7E700FFF7F700FFF7F700FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00F7DED600E7B5B500E7B5B500F7D6CE00E7BDBD009CDE8C00A529
      21000000000000000000CECEC600C6C6BD00ADA59C007339000073390000F7B5
      8C00F7AD8400F79C7B00F7947300F78C6B00EF8463007339000073390000108C
      F70000FFFF00FFFFFF001884BD0000529C00ADA59C00C6C6BD00CECEC600CECE
      C60000000000000000000000000000000000C6BDB500B5ADA5009C8C8400B5AD
      A500B5A59C00846363006394BD00188CCE000894EF00089CFF00089CFF00089C
      FF000894EF0021A5E7003984BD00C6C6C6000000000000000000000000000000
      00000000000000000000C6C6BD00086B000042B531005ACE4A0052C642004ABD
      390031A52100319C2100299C18002194180021941000218C100042B53100084A
      00007B737300B5ADA5000000000000000000D67B5200FFCEBD00FFCEC600FFD6
      C600FFEFD600FFDE9C00FFCE7B00FFD69C00FFE7CE00FFFFF700FFFFF700FFFF
      F700FFF7F700FFF7F700FFF7F700FFEFE700EFC6C600DEADAD009CCE8400A531
      21000000000000000000CECEC600BDB5AD007B420000FFC69C00FFBD9C00FFBD
      9400F7B59400F7AD8C00F7A58400F7947B00F78C7300EF846B00EF8463007339
      0000FFFFFF0000FFFF0000529C00ADA59C00C6C6BD00CECEC600CECEC600CECE
      C6000000000000000000BDB5AD008C6B6B0084636300947B7B009C8484009473
      73008C737300CEC6C600DED6D600639CC6001894D6000884E700008CFF00088C
      EF0021ADE700398CC600C6C6C600000000000000000000000000000000000000
      00000000000000000000BDB5AD004ABD390063D652005AD64A005ACE420052C6
      42004ABD390042B5310039AD290039A5290031A52100299C180063D65200084A
      00007B737300B5ADA5000000000000000000D6947B00E78C6B00FFD6BD00FFFF
      DE00FFFFC600FFE7A500FFCE7B00FFBD6B00FFAD5A00FFAD6300FFCEAD00FFFF
      EF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700FFF7EF00F7D6D600AD39
      29000000000000000000C6C6BD0084521000FFCEA500FFCEA500FFC6A500FFC6
      9C00F7BD9C00F7BD9400F7AD8C00F7A58400F79C7B00F7947B00F7947300F794
      73007339000000A5A50094948C00BDBDB500CECEC600CECEC600CECEC600CECE
      C60000000000BDB5AD00846B6B00B5A5A500D6CECE00DED6D600DED6D600DED6
      D600DED6D600D6C6C600CEC6C600D6C6C600639CC6001894D6000884DE0021B5
      E700398CC600C6C6C60000000000000000000000000000000000000000000000
      00000000000000000000107B00006BDE5A006BDE5A0063D652005AD64A0052CE
      420052C639004ABD390042B5310039AD290031A52100319C210063D65200084A
      00007B737300B5ADA500000000000000000000000000D6B5A500D69C8400E7BD
      9400FFFFD600FFF7BD00FFE7A500FFC67B00FFAD6300F79C5200F78C4200EF8C
      3900FFAD7300FFEFD600FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFBDB500B563
      52000000000000000000BDB5AD00945A1800FFD6AD00FFD6AD00FFCEA500FFCE
      A500FFC6A500FFC69C00F7BD9400F7B58C00F7AD8C00F7A58400F7A58400F7A5
      84007339000063635A0084847B00BDB5AD00CECEC600CECEC600CECEC600CECE
      C600C6BDB5008C6B6B00D6CECE00E7D6D600E7D6D600E7D6D600E7D6D600E7D6
      D600E7D6D600DED6D600C6B5B500C6B5B500CEBDBD005A9CCE0021A5DE003994
      CE00C6C6C600000000000000000000000000D6CEC60000000000000000000000
      000000000000000000005ACE42006BE75A006BDE5A006BDE520063D652005ACE
      4A0052C642004ABD390042B5310039AD290039AD290031A5210063D65200084A
      00007B737300B5ADA50000000000000000000000000000000000CEBDAD00DEB5
      9C00FFFFFF00FFF7E700FFEFC600FFE79C00FFCE8400FFB56B00F79C4A00EF84
      3900E7732900E7631800EF844200FFC69C00FFFFFF00FFFFFF00BD635200C69C
      94000000000000000000A56B3100FFDEB500FFDEAD00FFD6AD00FFD6AD00FFD6
      AD00FFCEA500FFCEA500FFC69C00F7BD9C00F7BD9400F7B59400F7B58C00F7B5
      8C00F7B58C007B3900007B737300B5ADA500CEC6BD00CECEC600CECEC600CECE
      C6009C8C8C00BDADAD00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DE
      DE00E7DEDE00E7DEDE00E7DEDE00CEC6C600CEBDBD0094847B007BADCE00C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006BE75A006BE75A006BDE5A0063DE520063D6
      4A005ACE4A0052C642004ABD390042B5310039AD290031A5210063DE5200084A
      00007B737300B5ADA50000000000000000000000000000000000C6A58400FFF7
      EF00FFFFFF00FFF7F700FFEFEF00FFEFE700FFDEBD00FFD68400FFC66B00FFAD
      5200EF843100E76B2100DE5A1000DE4A0000E7732900D68C7B00BD7363000000
      00000000000000000000AD733900FFDEB500FFDEBD00FFEFD600FFE7C600FFE7
      D600FFDEC600FFD6AD00FFCEA500FFCEA500FFC69C00FFC69C00F7BD9C00F7BD
      9C00F7BD9C00733900007B737300A59C9400CECEC600CECEC600CECEC600CECE
      C6009C848400EFE7E700EFE7E700D6CECE00A5949400E7DEDE00EFE7E700EFE7
      E700EFE7E700EFE7E700EFE7E700EFE7E700A58C8C00BDB5AD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005ACE4A006BE75A006BE75A006BDE5A0063DE
      52005AD64A007BF76B007BEF6B0073EF630073E763006BE75A0063DE52000852
      00008C8C8400BDB5AD00000000000000000000000000CEC6B500DEAD9C00FFFF
      FF00FFFFFF00FFF7F700FFEFEF00F7EFEF00F7E7E700EFDEDE00FFD6B500FFC6
      8400FFB55200E76B2100E7631800DE6B2900C65A3900C6846B00000000000000
      00000000000000000000BD844A00FFEFD600FFF7EF00FFF7EF00FFF7E700FFF7
      E700FFEFE700FFEFD600FFDEC600FFD6AD00FFCEA500FFCEA500FFCEA500FFCE
      A500FFC6A500733900007B737300B5ADA5004A29290039212100CECEC600CECE
      C600AD949400F7EFEF00DED6D6009C848400B5ADA500A5949400E7E7E700F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00BDADAD00B5ADA500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005ACE4A006BE75A006BE75A006BDE
      520063D652004ABD39004ABD39004ABD390042BD310042B5310042B531000852
      0000BDB5AD00C6C6BD00000000000000000000000000CEA58C00F7E7DE00FFFF
      FF00FFFFFF00FFF7F700FFEFEF00F7EFEF00F7E7E700EFDEDE00EFDEDE00D6AD
      9C00BD7B5200D66B3900C6735200C6847300CEBDAD0000000000000000000000
      00000000000000000000C68C5A00FFEFD600FFF7EF00FFF7EF00FFF7EF00FFF7
      E700FFF7E700FFEFDE00FFEFDE00FFEFD600FFDEBD00FFD6AD00FFD6AD00FFCE
      AD00FFCEAD007339000084847B0052393900523131004A29290039212100CECE
      C600B59C9C00E7DEDE00A58C8C00C6BDB50000000000C6BDB500AD9C9400EFEF
      EF00F7F7F700F7F7F700F7F7F700F7F7F700D6CECE00B5A59C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005ACE4A006BE75A006BDE
      5A008CFF73004ABD39007B737300B5ADA5000000000000000000000000000000
      000000000000000000000000000000000000CEC6BD00DEAD9400FFFFFF00FFFF
      FF00FFFFFF00FFF7F700FFEFEF00F7EFEF00F7E7E700EFDEDE00EFDEDE00AD6B
      4A00CEC6BD000000000000000000000000000000000000000000000000000000
      00000000000000000000CE946300FFE7BD00FFFFF700FFFFF700FFFFF700FFF7
      EF00FFF7EF00FFF7E700FFF7DE00FFEFDE00FFEFD600FFDEB500FFD6AD00FFD6
      AD00FFD6AD0073390000A59C9C007B5A5A00634242005A39390052313100CECE
      C600AD949400AD949400C6BDB500000000000000000000000000C6BDB500B59C
      9C00F7F7F700FFFFFF00FFFFFF00FFFFFF00D6C6C600BDADAD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005ACE42006BE7
      5A008CFF7B004AC639007B737300B5ADA5000000000000000000000000000000
      000000000000000000000000000000000000CEAD9400FFEFE700FFFFFF00FFFF
      FF00FFFFFF00FFF7F700FFEFEF00F7EFEF00F7E7E700EFDEDE00D6AD9C00B58C
      7300000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CECEC600CE946300FFE7C600FFFFEF00FFFFF700FFFF
      F700FFFFEF00FFF7EF00FFF7E700FFF7DE00FFEFDE00FFEFD600FFDEB500FFDE
      B5007339000084847B00BDB5AD008C6B6B00735252006342420052313100CECE
      C600B5A5A500C6BDB5000000000000000000000000000000000000000000B5A5
      A500D6CECE00FFFFFF00FFFFFF00FFFFFF00C6B5B500C6BDBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000052C6420052C642009C9C9400BDB5AD000000000000000000000000000000
      000000000000000000000000000000000000DEAD8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7F700FFEFEF00F7EFEF00F7E7E700EFDEDE00B57B5A00CEC6
      BD00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CECEC600CE9C6B00FFDEB500FFEFD600FFFFFF00FFFF
      FF00FFFFF700FFF7EF00FFF7EF00FFF7E700FFEFDE00FFEFD600FFE7C600FFDE
      B50073390000ADA59C00C6C6BD00CECEC600947373007B5A5A00CECEC600CECE
      C600000000000000000000000000000000000000000000000000BDADAD00CEBD
      BD00FFFFFF00FFFFFF00FFFFFF00F7EFEF00B59C9C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000052C64200BDBDB500C6C6BD000000000000000000000000000000
      000000000000000000000000000000000000CEBDAD00CEA58C00DEB59C00EFCE
      C600FFF7F700FFF7F700FFEFEF00F7EFEF00F7E7E700DEC6B500B58C73000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CECEC600CECEC600CE9C6B00FFE7BD00FFE7BD00FFF7
      DE00FFFFF700FFFFFF00FFFFEF00FFF7EF00FFF7E700FFF7DE00FFE7CE007339
      0000ADA59C00C6C6BD00CECEC600CECEC600CECEC600CECEC600CECEC6006342
      42000000000000000000000000000000000000000000BDB5AD00CEC6C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6B5B500C6BDBD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CEB5
      A500BD947B00CE9C7B00DEBDAD00F7E7DE00F7E7E700BD7B5A00CEBDAD000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CECEC600CECEC600CECEC600CE9C6B00CE946300FFE7
      BD00FFE7BD00FFEFD600FFF7EF00FFEFD600FFEFDE009C73390084521000BDB5
      AD00C6C6BD00CECEC600CECEC600CECEC6006342420042292900CECEC6009C84
      840000000000000000000000000000000000C6B5B500D6CECE00FFFFFF00FFFF
      FF00FFFFFF00EFEFEF00C6B5B500C6BDB5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CEC6BD00C6A58C00B57B5A00BD7B5A00B5846300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CECEC600CECEC600CECEC600CECEC600CECEC600CE94
      6300C68C5A00B5844A00AD733900A56B31009C632100BDB5AD00C6C6BD00CECE
      C600CECEC600CECEC600CECEC600CECEC6009C84840063424200CECEC600CECE
      C60000000000000000000000000000000000C6B5B500CEC6C600DED6D600D6CE
      CE00CEBDBD00C6BDB500CEC6BD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DED6CE007B6B6B007B6B
      6B007B6B6B007B6B6B007B6B6B007B6B6B007B6B6B007B6B6B007B6B6B007B6B
      6B007B6B6B007B6B6B007B6B6B007B6B6B007B6B6B007B6B6B00000000000000
      00000000000000000000000000007B6B6B007B6B6B007B6B6B007B6B6B007B6B
      6B007B6B6B007B6B6B007B6B6B007B6B6B007B6B6B007B6B6B007B6B6B007B6B
      6B007B6B6B007B6B6B007B6B6B00CECEC600CECEC600CECEC600CECEC600CECE
      C60000000000DED6CE007B6B6B007B6B6B007B6B6B007B6B6B007B6B6B007B6B
      6B007B6B6B007B6B6B007B6B6B007B6B6B007B6B6B007B6B6B007B6B6B007B6B
      6B007B6B6B007B6B6B000000000000000000000000000000000000000000DED6
      CE00A5949400A5948C00A5948C00A5948C00A5948C00A5948C00A5948C00A594
      8C00A5948C00A5948C00A5948C00A5948C00A5948C009C8C8400000000000000
      0000526B940010427B006B636B008C73730000000000DECECE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7F700FFF7F700F7F7
      EF00F7F7EF00F7EFEF00F7EFEF00F7EFE700EFE7E7007B6B6B00000000000000
      00000000000000000000DECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7F700FFF7F700FFF7F700F7F7EF00F7F7EF00F7EFEF00F7EF
      EF00F7EFE700EFE7E7007B6B6B00CECEC600CECEC600CECEC600CECEC600CECE
      C60000000000DECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF7F700FFF7F700FFF7F700F7F7EF00F7F7EF00F7EFEF00F7EFEF00F7EF
      E700EFE7E7007B6B6B000000000000000000000000000000000000000000DECE
      CE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7F700FFF7F700F7F7
      EF00F7F7EF00F7EFEF00F7EFEF00F7EFE700EFE7E7009C848400000000008494
      AD002173AD008CDEF700295A94007B73840000000000DECECE00FFFFFF00FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700F7F7EF00F7F7EF00F7F7EF00F7EF
      EF00F7EFEF00F7EFE700EFE7E700EFE7E700EFE7DE007B6B6B00000000000000
      00000000000000000000DECECE00FFFFFF00FFF7F700FFF7F700FFF7F700A5A5
      D600EFE7E700EFE7E700EFE7E700EFE7E700E7DEDE00EFE7E700F7EFE700EFE7
      E700EFE7E700EFE7DE007B6B6B00CECEC600CECEC600CECEC600CECEC600CECE
      C60000000000DECECE00FFFFFF00FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700F7F7EF00F7F7EF00F7F7EF00F7EFEF00F7EFEF00F7EFE700EFE7E700EFE7
      E700EFE7DE007B6B6B000000000000000000000000000000000000000000DECE
      CE00FFFFFF00FFF7F700FFF7F700FFF7F700F7F7EF00F7F7EF00F7F7EF00F7EF
      EF00F7EFEF00F7EFE700EFE7E700EFE7E700EFE7DE009C848400849CAD002173
      B50094EFFF007BCEF7002194E70010528C0000000000DECECE00FFFFFF00FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700F7F7EF00F7F7EF00F7EF
      EF00F7EFEF00F7EFEF00EFE7E700EFE7E700EFE7E7007B6B6B00000000000000
      00000000000000000000DECECE00FFFFFF00FFF7F700FFF7F700FFF7F7005263
      94005263A500DEDED600DED6D600DED6D600DED6D600DED6D600DED6D600E7DE
      DE00EFE7E700EFE7E7007B6B6B00CECEC600CECEC600CECEC600CECEC600CECE
      C60000000000DECECE00FFFFFF00FFF7F700EFEFF700394AFF009CA5FF00FFF7
      F700FFF7F700F7F7EF00F7F7EF00C6BDEF000808FF008C8CF700EFE7E700EFE7
      E700EFE7E7007B6B6B000000000000000000000000000000000000000000DECE
      CE00FFFFFF00FFF7F700FFF7F700FFF7F700FFF7F700F7F7EF00F7F7EF00F7EF
      EF00F7EFEF00F7EFEF00EFE7E700EFE7E700EFE7E70063738C00217BBD0094E7
      FF007BD6F700299CEF00086BC600527BA50000000000DECECE00FFFFFF00FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700F7F7EF00F7F7EF00F7EF
      EF00F7EFEF00F7EFEF00F7E7E700EFE7E700EFE7E7007B6B6B00000000000000
      00000000000000000000DECECE00FFFFFF00FFF7F700FFF7F700FFF7F7005A73
      940073849C005A73BD00DED6D600DED6D600DED6D600DED6D600DED6CE00DECE
      CE00DED6CE00E7DED6007B6B6300CECEC600CECEC600CECEC600CECEC600CECE
      C60000000000DECECE00FFFFFF00FFF7F7004A6BFF001839FF001029FF009CA5
      FF00FFF7F700F7F7EF00C6BDF7000808FF000000FF000000FF009C94EF00EFE7
      E700EFE7E7007B6B6B000000000000000000000000000000000000000000DECE
      CE00FFFFFF00FFF7F700FFF7F700FFF7F700FFF7F700F7F7EF00F7F7EF00F7EF
      EF00F7EFEF00F7EFEF00F7E7E700EFE7E70094ADCE00217BBD0094E7FF007BD6
      F700299CEF00086BCE005284AD000000000000000000DECECE00FFFFFF00FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700F7F7EF00F7F7EF00F7EF
      EF00F7EFEF00F7EFEF00F7E7E700EFE7E700EFE7E7007B6B6B00000000000000
      00000000000000000000DECECE00FFFFFF00FFF7F700FFF7F700FFF7F7007BAD
      DE00C6E7FF00ADD6F7002952AD00CECECE00DED6D600DED6D600DED6CE00DECE
      CE00D6CECE00D6CECE006B635A00C6BDB500CEC6BD00CECEC600CECEC600CECE
      C60000000000DECECE00FFFFFF00FFF7F700ADBDFF00294AFF001839FF001029
      FF009CA5F700C6C6F7000810FF000000FF000000FF002121FF00DED6E700EFE7
      E700EFE7E7007B6B6B000000000000000000000000000000000000000000DECE
      CE00FFFFFF00FFF7F700FFF7F700FFF7F700FFF7F700F7F7EF00F7F7EF00F7EF
      EF00F7EFEF00F7EFE700EFE7E70094B5CE002184CE0094E7FF007BD6F700299C
      EF000873CE005284B500000000000000000000000000DECECE00FFFFFF00FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700F7F7EF00F7F7EF00F7EF
      EF00F7EFEF00F7EFEF00F7E7E700EFE7E700EFE7E7007B6B6B00000000000000
      00000000000000000000DECECE00FFFFFF00FFF7F700FFF7F700FFF7F70084BD
      EF00C6E7FF009CDEFF007BC6F700315AB500DED6D600DED6D600DED6CE00DECE
      CE00D6CECE00D6CECE006B635A00BDB5AD00BDB5AD00BDBDB500C6C6BD00CECE
      C60000000000DECECE00FFFFFF00FFF7F700FFF7F700ADBDFF00294AFF001839
      FF001029FF001029FF000010FF000000FF002121FF00E7DEEF00F7E7E700EFE7
      E700EFE7E7007B6B6B000000000000000000000000000000000000000000DECE
      CE00FFFFFF00FFF7F700FFF7F700FFF7F700FFF7F700F7F7EF00F7F7EF00F7EF
      EF00F7EFEF00F7EFE700EFE7E700186BBD0073CEEF0084D6F700299CEF000873
      D600528CBD0000000000000000000000000000000000DECECE00FFFFFF00FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700F7F7EF00F7F7EF00F7EF
      EF00F7EFEF00F7EFE700EFE7E700EFE7E700EFE7DE007B6B6B00000000000000
      00000000000000000000DECECE00FFFFFF00FFF7F700FFF7F700FFF7F7007BC6
      F7006BDEFF004ACEFF0052C6FF003184E700A5ADC600DED6D600DED6CE00D6CE
      CE00D6CECE00D6CEC6006B635A00BDB5AD00BDB5AD00BDB5AD00BDB5AD00BDB5
      AD0000000000DECECE00FFFFFF00FFF7F700FFF7F700FFF7F700ADBDFF00294A
      FF001839FF001029FF000818FF002931FF00E7DEEF00F7EFE700EFE7E700EFE7
      E700EFE7DE007B6B6B000000000000000000000000000000000000000000DECE
      CE00FFFFFF00F7F7F700A5949400846B630084635A0084635A0084635A007B63
      6300B5A5A500DECECE00D6C6C6009494A5001873BD002994E700087BD600528C
      BD000000000000000000000000000000000000000000DECECE00FFFFFF00FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700F7F7EF00F7F7EF00F7EF
      EF00F7EFEF00F7EFE700EFE7E700EFE7E700EFE7E7007B6B6B00000000000000
      00000000000000000000DECECE00FFFFFF00FFF7F700FFF7F700FFF7F70063C6
      F70052EFFF0042CEFF0042C6FF0052B5FF005A84CE00F7EFEF00EFE7E700DED6
      D600D6CECE00D6CECE006B635A00BDB5AD00BDB5AD00BDB5AD00BDB5AD00BDB5
      AD0000000000DECECE00FFFFFF00FFF7F700FFF7F700FFF7F700D6DEF7004263
      FF00294AFF001839FF001029FF008C94F700F7EFEF00F7EFE700EFE7E700EFE7
      E700EFE7E7007B6B6B000000000000000000000000000000000000000000DECE
      CE00D6CECE0094736300DECEA500FFF7CE00FFF7D600FFF7D600FFF7DE00F7F7
      DE00C6B5A5006B525200947B7B00AD9C9C00848C9C001073CE005294C6000000
      00000000000000000000000000000000000000000000DECECE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF7F700FFF7F700F7F7EF00F7F7EF00F7EFEF00F7EF
      EF00F7E7E700EFE7E700EFE7E700EFE7DE00EFE7DE007B6B6B00000000000000
      00000000000000000000DECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A5CE
      F70039DEFF0039D6FF0031C6FF0039B5FF00216BDE00CECEDE00EFE7E700EFE7
      E700EFDEDE00DED6CE006B635A00BDB5AD00BDB5AD00BDB5AD00BDB5AD00BDBD
      B50000000000DECECE00FFFFFF00FFFFFF00FFFFFF00E7E7FF006384FF004A6B
      FF00395AFF00294AFF001839FF001029FF00949CEF00EFE7E700EFE7E700EFE7
      DE00EFE7DE007B6B6B000000000000000000000000000000000000000000BDAD
      AD00AD8C7300FFEFBD00FFF7D600FFF7D600FFF7D600FFF7D600FFF7DE00F7F7
      DE00F7F7E700E7DED600846363008C737300C6B5B5009C848400000000000000
      00000000000000000000000000000000000000000000DECECE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700F7EFEF00F7EFEF00F7EFEF00EFE7
      E700EFE7E700EFE7E700EFE7DE00EFE7DE00EFDEDE007B6B6B00000000000000
      00000000000000000000DECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0029BDFF0031E7FF0029BDFF0029BDFF00399CFF00526BBD00EFE7E700EFE7
      DE00EFE7DE00EFDEDE007B6B6300C6C6BD00BDB5AD00BDB5AD00BDB5AD00CEC6
      BD0000000000DECECE00FFFFFF00FFFFFF00EFEFFF00849CFF006B8CFF005A7B
      FF006384FF009CADF700294AFF001839FF001029FF00949CEF00EFE7DE00EFE7
      DE00EFDEDE007B6B6B0000000000000000000000000000000000CEC6BD009C7B
      7300FFE7B500FFF7CE00FFF7CE00FFF7D600FFFFDE00FFFFDE00FFFFE700F7F7
      E700F7EFE700F7EFE700DEDED60073525200D6C6C6009C848400000000000000
      00000000000000000000000000000000000000000000DECECE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7EF00F7EFEF00F7EFE700EFE7
      E700EFE7E700EFE7DE00EFDEDE00EFDEDE00E7DEDE007B6B6B00000000000000
      00000000000000000000DECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0094CEFF0021DEFF0021CEFF0021BDFF00299CFF002163DE00DED6DE00EFDE
      DE00EFDEDE00E7DEDE007B6B6B00CECEC600CECEC600C6C6BD00CEC6BD00CECE
      C60000000000DECECE00FFFFFF00FFFFFF00A5BDFF008CA5FF007B9CFF00849C
      FF00EFEFF700F7EFEF00A5B5F700294AFF001839FF001029FF00A5A5E700EFDE
      DE00E7DEDE007B6B6B0000000000000000000000000000000000AD9C9400DEB5
      8C00FFEFCE00FFEFC600FFEFCE00FFF7D600FFFFDE00FFFFE700FFFFE700F7F7
      E700F7EFE700F7EFE700EFEFDE00B59C9400CEBDB5009C848400000000000000
      00000000000000000000000000000000000000000000DECECE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7F700F7F7EF00EFE7
      E700EFDEDE00E7DED600E7DED600E7DED600E7D6D6007B6B6B00000000000000
      00000000000000000000DECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0010ADF70018DEFF0018B5FF0018A5FF00218CFF006B7BBD00E7DE
      D600E7DED600E7D6D6007B6B6B00CECEC600CECEC600CECEC600CECEC600CECE
      C60000000000DECECE00FFFFFF00FFFFFF00DEE7FF009CB5FF009CB5FF00F7F7
      FF00FFFFF700FFF7F700F7F7EF00A5ADEF00294AFF004252F700D6CED600E7DE
      D600E7D6D6007B6B6B0000000000000000000000000000000000AD8C8400EFCE
      9C00FFEFC600FFE7BD00FFF7CE00FFFFD600FFFFDE00FFFFDE00FFFFE700FFFF
      E700FFF7E700F7EFE700EFE7D600DED6C6009C8484009C848400000000000000
      00000000000000000000000000000000000000000000DECECE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700EFE7
      E700EFDEDE00E7DED600DED6D600DED6CE00DED6CE007B6B6B00000000000000
      00000000000000000000DECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0073BDF70010E7FF0010BDFF0010ADFF00188CFF00104ACE00DED6
      D600DED6CE00DED6CE007B6B6B00CECEC600CECEC600CECEC600CECEC600CECE
      C60000000000DECECE00FFFFFF00FFFFFF00FFFFFF00E7EFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF7F700EFE7E700ADB5E700DED6DE00DED6D600DED6
      CE00DED6CE007B6B6B0000000000000000000000000000000000BD947300EFCE
      A500FFEFC600FFF7CE00FFF7D600FFF7D600FFFFDE00FFFFE700FFFFDE00FFF7
      DE00FFF7E700FFF7E700EFE7D600EFE7CE00947B73009C847B00000000000000
      00000000000000000000000000000000000000000000DECECE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700F7F7
      EF00F7EFEF00EFDEDE00DECEC600DECEC600D6CEC6007B6B6B00000000000000
      00000000000000000000DECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFF7FF0000ADF70008D6FF0008ADFF000894FF00106BF7007B8C
      BD00DECEC600D6CEC6007B6B6B00CECEC600CECEC600CECEC600CECEC600CECE
      C60000000000DECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF7F700F7F7EF00F7EFEF00EFDEDE00DECEC600DECE
      C600D6CEC6007B6B6B0000000000000000000000000000000000CE947300E7CE
      A500FFEFC600FFEFC600FFEFCE00FFF7D600FFF7D600FFFFDE00FFFFE700DECE
      B500DECEB500DECEB500DECEB500DECEB5008C737300B5A59C00000000000000
      00000000000000000000000000000000000000000000DECECE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700F7EF
      EF00F7EFEF00F7EFEF00DECECE00D6C6C600D6C6C6007B6B6B00000000000000
      00000000000000000000DECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0052ADF70000DEFF0000ADFF0000A5FF000873FF001042
      BD00D6C6C600D6C6C6007B6B6B00CECEC600CECEC600CECEC600CECEC600CECE
      C60000000000DECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF7F700F7EFEF00F7EFEF00F7EFEF00DECECE00D6C6
      C600D6C6C6007B6B6B0000000000000000000000000000000000C69C8400EFCE
      A500FFEFC600FFF7D600FFFFE700FFFFF700FFFFE700FFF7D600FFFFE700EFE7
      C600FFFFDE00FFFFE700FFFFDE00F7F7D6009C847B0000000000000000000000
      00000000000000000000000000000000000000000000DECECE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F7009C84
      84009C8484009C8484009C8484009C8484009C8484009C848400000000000000
      00000000000000000000DECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DEE7F70000BDF70000C6FF00009CFF000084FF00005A
      F700636384009C8484009C848400CECEC600CECEC600CECEC600CECEC600CECE
      C60000000000DECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF7F7009C8484009C8484009C8484009C8484009C84
      84009C8484009C84840000000000000000000000000000000000C6ADA500EFC6
      9400FFE7C600FFF7D600FFFFE700FFFFEF00FFFFF700FFEFCE00FFF7DE00EFE7
      BD00FFF7D600FFFFDE00F7EFCE00DECEAD00AD9C9C0000000000000000000000
      00000000000000000000000000000000000000000000DECECE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7F700DECE
      CE00FFFFF700FFFFFF00FFF7F700EFE7E700C6ADAD0000000000000000000000
      00000000000000000000DECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF70042ADEF0000DEFF00009CFF000094FF00086B
      FF003163CE00C6ADAD00CECEC600CECEC600CECEC600CECEC600CECEC600CECE
      C60000000000DECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7F700DECECE00FFFFF700FFFFFF00FFF7F700EFE7
      E700C6ADAD000000000000000000000000000000000000000000CEBDBD00E7BD
      8C00FFE7BD00FFEFCE00FFFFDE00FFFFE700FFFFE700FFEFCE00FFF7D600EFDE
      B500F7E7C600F7EFC600DED6AD00C6B59C00C6BDB50000000000000000000000
      00000000000000000000000000000000000000000000DECECE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7F700DECE
      CE00F7F7EF00FFFFFF00E7DEDE00C6ADAD000000000000000000000000000000
      00000000000000000000DECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF7F700B5CEEF0000BDF70000BDFF000094FF00007B
      FF00004AE700949CB500CECEC600CECEC600CECEC600CECEC600CECEC600CECE
      C60000000000DECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7F700FFF7F700DECECE00F7F7EF00FFFFFF00E7DEDE00C6AD
      AD00000000000000000000000000000000000000000000000000CECEC600D6B5
      A500FFD6A500FFE7C600FFF7CE00FFF7D600FFF7D600FFEFCE00F7E7BD00EFD6
      AD00F7DEBD00DECEA500DECEAD00B5A59C000000000000000000000000000000
      00000000000000000000000000000000000000000000DECECE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7F700F7EFEF00DECE
      CE00EFE7E700EFE7E700C6ADAD00000000000000000000000000000000000000
      00000000000000000000DECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7F700F7EFEF0029A5E70000D6FF00009CFF000094
      FF002184FF004A63B500CECEC600CECEC600CECEC600CECEC600CECEC600CECE
      C60000000000DECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7F700F7EFEF00DECECE00EFE7E700EFE7E700C6ADAD000000
      000000000000000000000000000000000000000000000000000000000000D6CE
      CE00DEB59C00EFBD9400E7CEA500EFD6AD00E7D6AD00E7CEA500E7CEA500DEC6
      9C00DEC6A500E7CEA500C6ADA500CEC6BD000000000000000000000000000000
      00000000000000000000000000000000000000000000DECECE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700F7F7EF00F7EFEF00DECE
      CE00EFDEDE00C6ADAD0000000000000000000000000000000000000000000000
      00000000000000000000DECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7F700F7F7EF00F7EFEF007BA5D60000CEFF0042D6FF00C6E7
      FF0084B5E700526BAD00CECEC600CECEC600CECEC600CECEC600CECEC600CECE
      C60000000000DECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF7F700F7F7EF00F7EFEF00DECECE00EFDEDE00C6ADAD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D6CEC600DEBDA500E7BD8C00E7C69400E7CEA500E7CEA500E7CEA500E7CE
      9C00DEBD9C00C6B5AD00CEC6BD00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DECEC600DECECE00DECE
      CE00DECECE00DECECE00DECECE00DECECE00D6CEC600D6C6BD00CEBDBD00C6AD
      AD00C6ADAD000000000000000000000000000000000000000000000000000000
      00000000000000000000DECEC600DECECE00DECECE00DECECE00DECECE00DECE
      CE00DECECE00D6CEC600D6C6BD00CEBDBD00C6ADAD00187BDE00528CDE003963
      BD007B84AD00CECEC600CECEC600CECEC600CECEC600CECEC600CECEC600CECE
      C60000000000DECEC600DECECE00DECECE00DECECE00DECECE00DECECE00DECE
      CE00D6CEC600D6C6BD00CEBDBD00C6ADAD00C6ADAD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D6CEC600DED6CE00DEC6B500E7BD9C00E7B58C00DEBDAD00D6C6
      BD00CEC6BD000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000058000000420000000100010000000000180300000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFF0000000000000FFC7FFF0
      03F0000000000000FFC3FFE001F0000000000000FFC1FFC000F0000000000000
      FFC0FF800070000000000000FFC0FF000030000000000000F0003E0000100000
      00000000F0001E000010000000000000F0000E000010000000000000F0000E00
      0010000000000000F0000E000010000000000000F0000E000010000000000000
      F0001E000010000000000000F0003E000010000000000000F0007E0000100000
      00000000FFC0FE000010000000000000FFC0FF000030000000000000FFC3FF80
      0070000000000000FFC7FFC000F0000000000000FFFFFFE001F0000000000000
      FFFFFFF003F0000000000000FFFFFFFFFFF0000000000000F8E0FE00000FFFE0
      7FFFFF00F0003C00000FFFC03FF8FF00C0000C00000FFF803FF0FF0080000000
      000FFF003FE0FF0000000020000FFE003FC0FF0000000000000FFC003F80FF00
      00000C00000FF8003E00030000000C00000FF8007E00030000000C00000F0000
      FC00030000000C00000C0001FC00030000000C0000080003FC00030080000C00
      000000077C000300C0000C000000000FFE000300C0001C000000003FFE000300
      80003C000000003FFF00030080007C000000803FFF80FF000007FC000001C03F
      FFC0FF00000FFC000003E03FFFF0FF00000FFC00000FC07FFFF8FF00001FFC00
      000F807FFFFFFF00E01FFC00000F00FFFFFFFF00F83FFC00000F01FFFFFFFF00
      80003E0000080003E000300080003C0000080003E000200080003C0000080003
      E000000080003C0000080003E000000080003C0000080003E000010080003C00
      00080003E000030080003C0000080003E000070080003C0000080003E0000F00
      80003C0000080003E0001F0080003C0000080003E0003F0080003C0000080003
      C0003F0080003C0000080003C0003F0080003C0000080003C0003F0080003C00
      00080003C0003F0080003C0000080003C0003F0080003C0000080003C0007F00
      80003C0000080003C0007F0080007C0000080007C0007F008000FC000008000F
      C000FF008001FC000008001FE000FF008003FC000008003FF001FF008007FC00
      0008007FF807FF0000000000000000000000000000000000000000000000}
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
