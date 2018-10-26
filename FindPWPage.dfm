object FindPWForm: TFindPWForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #54056#49828#50892#46300' '#52286#44592
  ClientHeight = 390
  ClientWidth = 420
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 420
    Height = 390
    Align = alClient
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    object Panel3: TPanel
      Left = 40
      Top = 65
      Width = 340
      Height = 240
      BevelEdges = [beTop, beBottom]
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWindow
      ParentBackground = False
      TabOrder = 3
      object chkID: TcxLabel
        Left = 25
        Top = 65
        Caption = #50500#51060#46356#44032' '#50732#48148#47476#51648' '#50506#49845#45768#45796'.'
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.TextColor = 8421631
        Style.IsFontAssigned = True
      end
      object cxLabel4: TcxLabel
        Left = 25
        Top = 15
        Caption = #50500#51060#46356
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 4605510
        Style.Font.Height = -11
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object Panel2: TPanel
        Left = 5
        Top = 35
        Width = 330
        Height = 30
        BevelEdges = []
        BevelOuter = bvNone
        BorderWidth = 1
        BorderStyle = bsSingle
        Color = clWindow
        Ctl3D = False
        ParentBackground = False
        ParentCtl3D = False
        TabOrder = 2
        object EditID: TcxTextEdit
          Left = 14
          Top = 3
          ImeMode = imSAlpha
          ParentFont = False
          ParentShowHint = False
          Properties.ImeMode = imSAlpha
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
          OnKeyPress = EditIDKeyPress
          OnKeyUp = EditKeyUp
          Width = 300
        end
        object cxLabel15: TcxLabel
          Left = 17
          Top = 2
          Caption = #50500#51060#46356
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
      object chkName: TcxLabel
        Left = 25
        Top = 135
        Caption = #54620#44544#51012' '#51077#47141#54644#51452#49464#50836
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.TextColor = 8421631
        Style.IsFontAssigned = True
      end
      object cxLabel2: TcxLabel
        Left = 25
        Top = 85
        Caption = #51060#47492
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 4605510
        Style.Font.Height = -11
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object Panel5: TPanel
        Left = 5
        Top = 105
        Width = 330
        Height = 30
        BevelEdges = []
        BevelOuter = bvNone
        BorderWidth = 1
        BorderStyle = bsSingle
        Color = clWindow
        Ctl3D = False
        ParentBackground = False
        ParentCtl3D = False
        TabOrder = 5
        object EditName: TcxTextEdit
          Left = 14
          Top = 4
          ImeMode = imSHanguel
          ParentFont = False
          ParentShowHint = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 4
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
          OnKeyPress = EditNameKeyPress
          OnKeyUp = EditKeyUp
          Width = 300
        end
        object cxLabel1: TcxLabel
          Left = 17
          Top = 2
          Caption = #51060#47492
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
      object BtnEmailChk: TPanel
        Left = 291
        Top = 174
        Width = 44
        Height = 31
        Cursor = crHandPoint
        Caption = #51064#51613
        Color = 16760704
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 6
        OnClick = BtnEmailChkClick
        OnMouseEnter = BtnStyle_2MouseEnter
        OnMouseLeave = BtnStyle_2MouseLeave
      end
      object chkEmail: TcxLabel
        Left = 25
        Top = 205
        Caption = #51060#47700#51068#51012' '#51077#47141#54644#51452#49464#50836'.'
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.TextColor = 8421631
        Style.IsFontAssigned = True
      end
      object cxLabel26: TcxLabel
        Left = 89
        Top = 179
        Caption = '@'
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxLabel9: TcxLabel
        Left = 25
        Top = 155
        Caption = #51060#47700#51068
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 4605510
        Style.Font.Height = -11
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object Panel15: TPanel
        Left = 5
        Top = 175
        Width = 85
        Height = 30
        BevelEdges = []
        BevelOuter = bvNone
        BorderWidth = 1
        BorderStyle = bsSingle
        Color = clWindow
        Ctl3D = False
        ParentBackground = False
        ParentCtl3D = False
        TabOrder = 10
        object EditEmail1: TcxTextEdit
          Left = 5
          Top = 4
          ImeMode = imSAlpha
          ParentFont = False
          ParentShowHint = False
          Properties.ImeMode = imSAlpha
          ShowHint = True
          Style.BorderColor = clWindow
          Style.Edges = []
          Style.Font.Charset = HANGEUL_CHARSET
          Style.Font.Color = 5592405
          Style.Font.Height = -11
          Style.Font.Name = #47569#51008' '#44256#46357
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          StyleFocused.Color = 16776441
          TabOrder = 0
          OnEnter = EditEnter
          OnExit = EditExit
          OnKeyPress = EditEmail1KeyPress
          Width = 75
        end
      end
      object Panel16: TPanel
        Left = 105
        Top = 175
        Width = 91
        Height = 30
        BevelEdges = []
        BevelOuter = bvNone
        BorderWidth = 1
        BorderStyle = bsSingle
        Color = clWindow
        Ctl3D = False
        ParentBackground = False
        ParentCtl3D = False
        TabOrder = 11
        object EditEmail2: TcxTextEdit
          Left = 5
          Top = 4
          ImeMode = imSAlpha
          ParentFont = False
          ParentShowHint = False
          Properties.ImeMode = imSAlpha
          ShowHint = True
          Style.BorderColor = clWindow
          Style.Edges = []
          Style.Font.Charset = HANGEUL_CHARSET
          Style.Font.Color = 5592405
          Style.Font.Height = -11
          Style.Font.Name = #47569#51008' '#44256#46357
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          StyleFocused.Color = 16776441
          TabOrder = 0
          OnEnter = EditEnter
          OnExit = EditExit
          OnKeyPress = EditEmail2KeyPress
          Width = 81
        end
      end
      object Panel17: TPanel
        Left = 199
        Top = 175
        Width = 91
        Height = 30
        BevelEdges = []
        BevelOuter = bvNone
        BorderWidth = 1
        BorderStyle = bsSingle
        Color = clWindow
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'ComboMon'
        Font.Style = []
        ParentBackground = False
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 12
        object ComboEmailSel: TcxComboBox
          Left = 5
          Top = 4
          ParentFont = False
          Properties.Items.Strings = (
            #51649#51217#51077#47141
            'gmail.com'
            'naver.com'
            'nate.com'
            'daum.net')
          Properties.MaxLength = 0
          Properties.OnChange = ComboEmailSelPropertiesChange
          Style.Edges = []
          Style.Font.Charset = HANGEUL_CHARSET
          Style.Font.Color = 5592405
          Style.Font.Height = -11
          Style.Font.Name = #47569#51008' '#44256#46357
          Style.Font.Style = [fsBold]
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
          StyleFocused.Color = 16776441
          TabOrder = 0
          Text = #51649#51217#51077#47141
          OnEnter = EditEnter
          OnExit = EditExit
          Width = 81
        end
      end
    end
    object cxLabel10: TcxLabel
      Left = 147
      Top = 20
      Caption = #54056#49828#50892#46300' '#52286#44592
      ParentFont = False
      Style.BorderColor = 4605510
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = [fsBold]
      Style.TextColor = 3947580
      Style.IsFontAssigned = True
    end
    object BtnIdSelect: TPanel
      Left = 50
      Top = 325
      Width = 150
      Height = 35
      Cursor = crHandPoint
      Caption = #54869'    '#51064
      Color = 16752190
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      OnClick = BtnIdSelectClick
      OnMouseEnter = BtnStyle_1MouseEnter
      OnMouseLeave = BtnStyle_1MouseLeave
    end
    object BtnClose: TPanel
      Left = 220
      Top = 325
      Width = 150
      Height = 35
      Cursor = crHandPoint
      Caption = #52712'    '#49548
      Color = 16752190
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      OnClick = BtnCloseClick
      OnMouseEnter = BtnStyle_1MouseEnter
      OnMouseLeave = BtnStyle_1MouseLeave
    end
  end
end
