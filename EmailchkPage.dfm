object EmailchkForm: TEmailchkForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #51060#47700#51068' '#51064#51613
  ClientHeight = 180
  ClientWidth = 410
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
    Width = 410
    Height = 180
    Align = alClient
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 400
    ExplicitHeight = 200
    object cxLabel1: TcxLabel
      Left = 54
      Top = 25
      Caption = #51064#51613#48264#54840#47484' '#51077#47141#54644#51452#49464#50836'.'
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = 3947580
      Style.Font.Height = -12
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object Panel5: TPanel
      Left = 35
      Top = 45
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
      TabOrder = 1
      object EditCodeVal: TcxTextEdit
        Left = 14
        Top = 4
        ParentFont = False
        ParentShowHint = False
        Properties.MaxLength = 8
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
        OnEnter = EditCodeValEnter
        OnExit = EditCodeValExit
        OnKeyUp = EditCodeValKeyUp
        Width = 300
      end
      object cxLabel4: TcxLabel
        Left = 17
        Top = 2
        Caption = #51064#51613#48264#54840' '#51077#47141
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
      end
      object cxLabel2: TcxLabel
        Left = 279
        Top = 5
        Caption = '03:00'
        ParentColor = False
        ParentFont = False
        Style.Color = clWindow
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 16744964
        Style.Font.Height = -12
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
    end
    object chkCodeVal: TcxLabel
      Left = 55
      Top = 75
      Caption = #51064#51613#48264#54840#44032' '#51068#52824#54616#51648' '#50506#49845#45768#45796'.'
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = []
      Style.TextColor = 8421631
      Style.IsFontAssigned = True
    end
    object BtnCodeVal: TPanel
      Left = 40
      Top = 105
      Width = 320
      Height = 40
      Cursor = crHandPoint
      Caption = #51064'    '#51613
      Color = 16752190
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
      OnClick = BtnCodeValClick
      OnMouseEnter = BtnCodeValMouseEnter
      OnMouseLeave = BtnCodeValMouseLeave
    end
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 368
    Top = 8
  end
end
