object UpdateEmailForm: TUpdateEmailForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #51060#47700#51068' '#48320#44221
  ClientHeight = 250
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
    Height = 250
    Align = alClient
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 40
      Top = 65
      Width = 340
      Height = 100
      BevelEdges = [beTop, beBottom]
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWindow
      ParentBackground = False
      TabOrder = 0
      object cxLabel9: TcxLabel
        Left = 19
        Top = 15
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
        Top = 35
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
        TabOrder = 1
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
          OnKeyPress = EditEmailKeyPress
          Width = 75
        end
      end
      object chkEmail: TcxLabel
        Left = 19
        Top = 66
        Caption = #51060#47700#51068#51012' '#51077#47141#54644#51452#49464#50836'.'
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.TextColor = clRed
        Style.IsFontAssigned = True
      end
      object cxLabel26: TcxLabel
        Left = 89
        Top = 39
        Caption = '@'
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object Panel16: TPanel
        Left = 105
        Top = 35
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
        TabOrder = 4
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
          OnKeyPress = EditEmailKeyPress
          Width = 81
        end
      end
      object Panel17: TPanel
        Left = 199
        Top = 35
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
        TabOrder = 5
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
      object BtnEmailChk: TPanel
        Left = 291
        Top = 34
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
    end
    object BtnClose: TPanel
      Left = 220
      Top = 185
      Width = 155
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
    object BtnEmailUpdate: TPanel
      Left = 45
      Top = 185
      Width = 155
      Height = 35
      Cursor = crHandPoint
      Caption = #48320'    '#44221
      Color = 16752190
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      OnClick = BtnEmailUpdateClick
      OnMouseEnter = BtnStyle_1MouseEnter
      OnMouseLeave = BtnStyle_1MouseLeave
    end
    object cxLabel10: TcxLabel
      Left = 157
      Top = 20
      Caption = #51060#47700#51068' '#48320#44221
      ParentFont = False
      Style.BorderColor = 4605510
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = 3947580
      Style.Font.Height = -19
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = [fsBold]
      Style.TextColor = 3947580
      Style.IsFontAssigned = True
    end
  end
end
