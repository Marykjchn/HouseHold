object SearchJusoForm: TSearchJusoForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #51452#49548' '#44160#49353
  ClientHeight = 497
  ClientWidth = 567
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 567
    Height = 497
    Align = alClient
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    object PlEditAddress: TPanel
      Left = 80
      Top = 56
      Width = 410
      Height = 50
      BevelEdges = []
      BevelOuter = bvNone
      BorderWidth = 1
      BorderStyle = bsSingle
      Color = clWindow
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 0
      object BtnSearchAddress: TImage
        Left = 368
        Top = 9
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Picture.Data = {
          0A544A504547496D61676552030000FFD8FFE000104A46494600010100000100
          010000FFFE001F436F6D70726573736564206279206A7065672D7265636F6D70
          72657373FFDB0084000404040404040404040406060506060807070707080C09
          090909090C130C0E0C0C0E0C131114100F1014111E171515171E221D1B1D222A
          25252A34323444445C010404040404040404040406060506060807070707080C
          09090909090C130C0E0C0C0E0C131114100F1014111E171515171E221D1B1D22
          2A25252A34323444445CFFC20011080020002003012200021101031101FFC400
          17000101010100000000000000000000000008070605FFDA0008010100000000
          AAE2794F112B765D958ED88A8FAD54B34C47FFC4001401010000000000000000
          0000000000000000FFDA00080102100000000FFFC40014010100000000000000
          000000000000000000FFDA00080103100000000FFFC4002F1000010402000403
          0607010000000000000201030405060700081112213141131522437282101423
          618193A2B2FFDA0008010100013F00DD7B932C632CAED3FA85969FCB67074972
          BC0961218F7A08F77C22681F19117808F0CF2716B70CFBCF37DAF632AF5D0432
          30689F16DDFADE3EF7383B7DBDCACDBD5B7935C1E57AE674B063F32E2913B1FE
          84322264FD443AA81715B6302D2BA15B56CA0930A630DBF1DE6D7A838D383DC2
          43FB2A2F1CB183569B9F7B5E5A2A15CB53DD683BFC4C5B7A63BED7FE07F0DFD0
          6BAC34DEC26ACD07D9374EFC86C887AF47D8FD46BFDA71CAB499AFE8DC48E7F7
          2881CF6D822F564251A0F1B4E872BD17B55DDDD8555BF638E5B238B90C26FC80
          8FC5C53F51035F8C4FD0F8A6E6A74A5AD70CF91951573A8D21BB0E6447D1E0FE
          B0313FB38E61399285B16B9709C2124B18D9C967DE76AEB640B23D44043CC5BE
          35B576374F806275B884E09944C57349165017547D17C49CFA8CBAA970422624
          06284248A8A8A9D515178B2D03A62CA69584AD7D548FA977923226C37FC83240
          1C49D69801E293F080C5ABD8A2980A2F448EC8B42A5E8E750F983E687C61E19D
          F2D1B1EBF0596CCCBCD7992D88335AF80299C779E241FB5C1F981E47C7FFC400
          14110100000000000000000000000000000020FFDA0008010201013F001FFFC4
          0014110100000000000000000000000000000020FFDA0008010301013F001FFF
          D9}
        OnClick = BtnSearchAddressClick
      end
      object EditAddress: TcxTextEdit
        Left = 16
        Top = 12
        ParentFont = False
        ParentShowHint = False
        Properties.MaxLength = 18
        ShowHint = True
        Style.BorderColor = clWindow
        Style.Edges = []
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 5592405
        Style.Font.Height = -12
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        StyleFocused.Color = 16776441
        TabOrder = 1
        OnEnter = EditEnter
        OnExit = EditExit
        OnKeyPress = EditAddressKeyPress
        OnKeyUp = EditAddressKeyUp
        Width = 345
      end
      object LabEditAddress: TcxLabel
        Left = 16
        Top = 12
        Caption = #51452#49548' '#51077#47141
        ParentColor = False
        ParentFont = False
        Style.BorderColor = 13158600
        Style.Color = clWindow
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 9211020
        Style.Font.Height = -15
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.IsFontAssigned = True
        StyleDisabled.Color = clWindow
        StyleHot.Color = clWindow
        OnClick = LabelClick
      end
    end
    object plJusoList: TPanel
      Left = 50
      Top = 150
      Width = 465
      Height = 270
      BevelOuter = bvNone
      Color = clWindow
      ParentBackground = False
      TabOrder = 1
      object plJusoTitle: TPanel
        Left = -4
        Top = -2
        Width = 471
        Height = 47
        BevelEdges = [beTop, beBottom]
        BevelInner = bvLowered
        BevelWidth = 2
        TabOrder = 0
        object LabPostCode: TcxLabel
          Left = 23
          Top = 14
          Caption = #50864#54200#48264#54840
          ParentFont = False
          Style.Font.Charset = HANGEUL_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = #47569#51008' '#44256#46357
          Style.Font.Style = []
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
          Transparent = True
        end
        object LabAddress: TcxLabel
          Left = 246
          Top = 14
          Caption = #46020#47196#47749' '#51452#49548
          ParentFont = False
          Style.Font.Charset = HANGEUL_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = #47569#51008' '#44256#46357
          Style.Font.Style = []
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
          Transparent = True
        end
      end
      object plJusoLine1: TPanel
        Tag = 7
        Left = 0
        Top = 45
        Width = 465
        Height = 45
        BevelEdges = [beBottom]
        BevelKind = bkFlat
        BevelOuter = bvNone
        Color = 16775408
        ParentBackground = False
        TabOrder = 1
        object ZipNo1: TcxLabel
          Left = 28
          Top = 11
          Cursor = crHandPoint
          Caption = '03951'
          ParentFont = False
          Style.Font.Charset = HANGEUL_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = #47569#51008' '#44256#46357
          Style.Font.Style = []
          Style.IsFontAssigned = True
          OnClick = AddressClick
          OnMouseEnter = LabJusoMouseEnter
          OnMouseLeave = LabJusoMouseLeave
        end
        object roadAddr1: TcxLabel
          Left = 141
          Top = 0
          Cursor = crHandPoint
          Caption = 'roadAddr1'
          ParentFont = False
          Style.Font.Charset = HANGEUL_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = #47569#51008' '#44256#46357
          Style.Font.Style = []
          Style.IsFontAssigned = True
          OnClick = AddressClick
          OnMouseEnter = LabJusoMouseEnter
          OnMouseLeave = LabJusoMouseLeave
        end
        object jibunAddr1: TcxLabel
          Left = 140
          Top = 23
          Cursor = crHandPoint
          Caption = 'jibunAddr1'
          ParentFont = False
          Style.Font.Charset = HANGEUL_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = #47569#51008' '#44256#46357
          Style.Font.Style = []
          Style.IsFontAssigned = True
          OnClick = AddressClick
          OnMouseEnter = LabJusoMouseEnter
          OnMouseLeave = LabJusoMouseLeave
        end
        object Panel11: TPanel
          Left = 95
          Top = 4
          Width = 40
          Height = 15
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = #46020#47196#47749
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
        end
        object Panel12: TPanel
          Left = 95
          Top = 25
          Width = 40
          Height = 15
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = #51648'  '#48264
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 4
        end
      end
      object plJusoLine2: TPanel
        Tag = 7
        Left = 0
        Top = 90
        Width = 465
        Height = 45
        BevelEdges = [beBottom]
        BevelKind = bkFlat
        BevelOuter = bvNone
        TabOrder = 2
        object ZipNo2: TcxLabel
          Left = 28
          Top = 11
          Cursor = crHandPoint
          Caption = '03951'
          ParentFont = False
          Style.Font.Charset = HANGEUL_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = #47569#51008' '#44256#46357
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
          OnClick = AddressClick
          OnMouseEnter = LabJusoMouseEnter
          OnMouseLeave = LabJusoMouseLeave
        end
        object roadAddr2: TcxLabel
          Left = 140
          Top = 2
          Cursor = crHandPoint
          Caption = 'roadAddr2'
          ParentFont = False
          Style.Font.Charset = HANGEUL_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = #47569#51008' '#44256#46357
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
          OnClick = AddressClick
          OnMouseEnter = LabJusoMouseEnter
          OnMouseLeave = LabJusoMouseLeave
        end
        object jibunAddr2: TcxLabel
          Left = 140
          Top = 23
          Cursor = crHandPoint
          Caption = 'jibunAddr2'
          ParentFont = False
          Style.Font.Charset = HANGEUL_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = #47569#51008' '#44256#46357
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
          OnClick = AddressClick
          OnMouseEnter = LabJusoMouseEnter
          OnMouseLeave = LabJusoMouseLeave
        end
        object Panel13: TPanel
          Left = 95
          Top = 25
          Width = 40
          Height = 15
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = #51648'  '#48264
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
        end
        object Panel14: TPanel
          Left = 95
          Top = 4
          Width = 40
          Height = 15
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = #46020#47196#47749
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 4
        end
      end
      object plJusoLine3: TPanel
        Tag = 7
        Left = 0
        Top = 135
        Width = 465
        Height = 45
        BevelEdges = [beBottom]
        BevelKind = bkFlat
        BevelOuter = bvNone
        Color = 16775408
        ParentBackground = False
        TabOrder = 3
        object ZipNo3: TcxLabel
          Left = 28
          Top = 11
          Cursor = crHandPoint
          Caption = '03951'
          ParentFont = False
          Style.Font.Charset = HANGEUL_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = #47569#51008' '#44256#46357
          Style.Font.Style = []
          Style.IsFontAssigned = True
          OnClick = AddressClick
          OnMouseEnter = LabJusoMouseEnter
          OnMouseLeave = LabJusoMouseLeave
        end
        object roadAddr3: TcxLabel
          Left = 140
          Top = 2
          Cursor = crHandPoint
          Caption = 'roadAddr3'
          ParentFont = False
          Style.Font.Charset = HANGEUL_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = #47569#51008' '#44256#46357
          Style.Font.Style = []
          Style.IsFontAssigned = True
          OnClick = AddressClick
          OnMouseEnter = LabJusoMouseEnter
          OnMouseLeave = LabJusoMouseLeave
        end
        object jibunAddr3: TcxLabel
          Left = 140
          Top = 23
          Cursor = crHandPoint
          Caption = 'jibunAddr3'
          ParentFont = False
          Style.BorderColor = clAppWorkSpace
          Style.BorderStyle = ebsNone
          Style.Font.Charset = HANGEUL_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = #47569#51008' '#44256#46357
          Style.Font.Style = []
          Style.IsFontAssigned = True
          OnClick = AddressClick
          OnMouseEnter = LabJusoMouseEnter
          OnMouseLeave = LabJusoMouseLeave
        end
        object Panel15: TPanel
          Left = 95
          Top = 4
          Width = 40
          Height = 15
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = #46020#47196#47749
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
        end
        object Panel16: TPanel
          Left = 95
          Top = 25
          Width = 40
          Height = 15
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = #51648'  '#48264
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 4
        end
      end
      object plJusoLine4: TPanel
        Tag = 7
        Left = 0
        Top = 180
        Width = 465
        Height = 45
        BevelEdges = [beBottom]
        BevelKind = bkFlat
        BevelOuter = bvNone
        TabOrder = 4
        object ZipNo4: TcxLabel
          Left = 28
          Top = 11
          Cursor = crHandPoint
          Caption = '03951'
          ParentFont = False
          Style.Font.Charset = HANGEUL_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = #47569#51008' '#44256#46357
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
          OnClick = AddressClick
          OnMouseEnter = LabJusoMouseEnter
          OnMouseLeave = LabJusoMouseLeave
        end
        object roadAddr4: TcxLabel
          Left = 140
          Top = 2
          Cursor = crHandPoint
          Caption = 'roadAddr4'
          ParentFont = False
          Style.BorderStyle = ebsNone
          Style.Font.Charset = HANGEUL_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = #47569#51008' '#44256#46357
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TransparentBorder = True
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = False
          Transparent = True
          OnClick = AddressClick
          OnMouseEnter = LabJusoMouseEnter
          OnMouseLeave = LabJusoMouseLeave
        end
        object jibunAddr4: TcxLabel
          Left = 140
          Top = 23
          Cursor = crHandPoint
          Caption = 'jibunAddr4'
          ParentFont = False
          Style.Font.Charset = HANGEUL_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = #47569#51008' '#44256#46357
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
          OnClick = AddressClick
          OnMouseEnter = LabJusoMouseEnter
          OnMouseLeave = LabJusoMouseLeave
        end
        object Panel17: TPanel
          Left = 95
          Top = 4
          Width = 40
          Height = 15
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = #46020#47196#47749
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
        end
        object Panel18: TPanel
          Left = 95
          Top = 25
          Width = 40
          Height = 15
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = #51648'  '#48264
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 4
        end
      end
      object plJusoLine5: TPanel
        Tag = 7
        Left = 0
        Top = 225
        Width = 465
        Height = 45
        BevelEdges = [beBottom]
        BevelKind = bkFlat
        BevelOuter = bvNone
        Color = 16775408
        ParentBackground = False
        TabOrder = 5
        object ZipNo5: TcxLabel
          Left = 28
          Top = 11
          Cursor = crHandPoint
          Caption = '03951'
          ParentFont = False
          Style.Font.Charset = HANGEUL_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = #47569#51008' '#44256#46357
          Style.Font.Style = []
          Style.IsFontAssigned = True
          OnClick = AddressClick
          OnMouseEnter = LabJusoMouseEnter
          OnMouseLeave = LabJusoMouseLeave
        end
        object roadAddr5: TcxLabel
          Left = 141
          Top = 2
          Cursor = crHandPoint
          Caption = 'roadAddr5'
          ParentFont = False
          Style.Font.Charset = HANGEUL_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = #47569#51008' '#44256#46357
          Style.Font.Style = []
          Style.IsFontAssigned = True
          OnClick = AddressClick
          OnMouseEnter = LabJusoMouseEnter
          OnMouseLeave = LabJusoMouseLeave
        end
        object jibunAddr5: TcxLabel
          Left = 140
          Top = 23
          Cursor = crHandPoint
          Caption = 'jibunAddr5'
          ParentFont = False
          Style.Font.Charset = HANGEUL_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = #47569#51008' '#44256#46357
          Style.Font.Style = []
          Style.IsFontAssigned = True
          OnClick = AddressClick
          OnMouseEnter = LabJusoMouseEnter
          OnMouseLeave = LabJusoMouseLeave
        end
        object Panel19: TPanel
          Left = 95
          Top = 4
          Width = 40
          Height = 15
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = #46020#47196#47749
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
        end
        object Panel20: TPanel
          Left = 95
          Top = 25
          Width = 40
          Height = 15
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = #51648'  '#48264
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 4
        end
      end
    end
    object plPagenation: TPanel
      Left = 52
      Top = 426
      Width = 465
      Height = 45
      BevelOuter = bvNone
      TabOrder = 2
      object Panel21: TPanel
        Left = 145
        Top = 6
        Width = 175
        Height = 35
        BevelOuter = bvNone
        TabOrder = 0
        object BtnPageNum1: TcxLabel
          Left = 0
          Top = 0
          Cursor = crHandPoint
          AutoSize = False
          Caption = '1'
          ParentColor = False
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Style.Color = clWindow
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = 16747804
          Style.Font.Height = -15
          Style.Font.Name = #47569#51008' '#44256#46357
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          OnClick = BtnPageNumClick
          Height = 35
          Width = 35
        end
        object BtnPageNum2: TcxLabel
          AlignWithMargins = True
          Left = 35
          Top = 0
          Cursor = crHandPoint
          AutoSize = False
          Caption = '2'
          ParentColor = False
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Style.Color = clWindow
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = 16747804
          Style.Font.Height = -15
          Style.Font.Name = #47569#51008' '#44256#46357
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          OnClick = BtnPageNumClick
          Height = 35
          Width = 35
        end
        object BtnPageNum3: TcxLabel
          Left = 70
          Top = 0
          Cursor = crHandPoint
          AutoSize = False
          Caption = '3'
          ParentColor = False
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Style.Color = clWindow
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = 16747804
          Style.Font.Height = -15
          Style.Font.Name = #47569#51008' '#44256#46357
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          OnClick = BtnPageNumClick
          Height = 35
          Width = 35
        end
        object BtnPageNum4: TcxLabel
          Left = 105
          Top = 0
          Cursor = crHandPoint
          AutoSize = False
          Caption = '4'
          ParentColor = False
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Style.Color = clWindow
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = 16747804
          Style.Font.Height = -15
          Style.Font.Name = #47569#51008' '#44256#46357
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          OnClick = BtnPageNumClick
          Height = 35
          Width = 35
        end
        object BtnPageNum5: TcxLabel
          Left = 140
          Top = 0
          Cursor = crHandPoint
          AutoSize = False
          Caption = '5'
          ParentColor = False
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Style.Color = clWindow
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = 16747804
          Style.Font.Height = -15
          Style.Font.Name = #47569#51008' '#44256#46357
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          OnClick = BtnPageNumClick
          Height = 35
          Width = 35
        end
      end
      object BtnBeforePage: TPanel
        Left = 100
        Top = 6
        Width = 35
        Height = 35
        Cursor = crHandPoint
        BevelKind = bkFlat
        BevelOuter = bvNone
        Caption = '<'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        OnClick = BtnBeforeNextPageClick
        OnMouseEnter = BtnBeforeNextMouseEnter
        OnMouseLeave = BtnBeforeNextMouseLeave
      end
      object BtnNextPage: TPanel
        Left = 326
        Top = 5
        Width = 35
        Height = 35
        Cursor = crHandPoint
        BevelKind = bkFlat
        BevelOuter = bvNone
        Caption = '>'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
        OnClick = BtnBeforeNextPageClick
        OnMouseEnter = BtnBeforeNextMouseEnter
        OnMouseLeave = BtnBeforeNextMouseLeave
      end
    end
    object LabTotAddList: TcxLabel
      Left = 55
      Top = 130
      Caption = #52509' 12'#44148
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object LabNotFindAddress: TcxLabel
      Left = 209
      Top = 295
      Caption = #51452#49548#47484' '#44160#49353#54644#51452#49464#50836'.'
      ParentColor = False
      ParentFont = False
      Style.Color = 16775408
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = 6908265
      Style.Font.Height = -15
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = []
      Style.TextStyle = []
      Style.IsFontAssigned = True
      Visible = False
    end
  end
end
