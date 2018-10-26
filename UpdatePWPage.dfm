object UpdatePWForm: TUpdatePWForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #48708#48128#48264#54840' '#48320#44221
  ClientHeight = 280
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
    Height = 280
    Align = alClient
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 40
      Top = 65
      Width = 340
      Height = 135
      BevelEdges = [beTop, beBottom]
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWindow
      ParentBackground = False
      TabOrder = 2
      object chkPW: TcxLabel
        Left = 25
        Top = 100
        Caption = #48708#48128#48264#54840#47484' 8~16'#51088#47196' '#51077#47141#54644#51452#49464#50836'.'
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.TextColor = 8421631
        Style.IsFontAssigned = True
      end
      object chkPWTrue: TcxLabel
        Left = 25
        Top = 100
        Caption = #48708#48128#48264#54840#44032' '#51068#52824#54616#51648' '#50506#49845#45768#45796'.'
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.TextColor = 8421631
        Style.IsFontAssigned = True
      end
      object cxLabel3: TcxLabel
        Left = 25
        Top = 15
        Caption = #48708#48128#48264#54840
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 4605510
        Style.Font.Height = -11
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object Panel3: TPanel
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
        TabOrder = 3
        object EditPW: TcxTextEdit
          Left = 14
          Top = 4
          ImeMode = imSAlpha
          ParentFont = False
          ParentShowHint = False
          Properties.EchoMode = eemPassword
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 16
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
          OnKeyUp = EditPWKeyUp
          Width = 300
        end
        object cxLabel16: TcxLabel
          Left = 17
          Top = 2
          Caption = #48708#48128#48264#54840' (6'#51088#51060#49345')'
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
          OnClick = Label1Click
        end
      end
      object Panel4: TPanel
        Left = 5
        Top = 70
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
        TabOrder = 4
        object EditPWchk: TcxTextEdit
          Left = 14
          Top = 4
          ImeMode = imSAlpha
          ParentFont = False
          ParentShowHint = False
          Properties.EchoMode = eemPassword
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 16
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
          OnKeyUp = EditPWchkKeyUp
          Width = 300
        end
        object cxLabel17: TcxLabel
          Left = 17
          Top = 2
          Caption = #48708#48128#48264#54840' '#51116#54869#51064
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
          OnClick = Label1Click
        end
      end
    end
    object BtnMemInsert: TPanel
      Left = 50
      Top = 220
      Width = 320
      Height = 40
      Cursor = crHandPoint
      Caption = #48708#48128#48264#54840' '#48320#44221
      Color = 16752190
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      OnClick = BtnMemInsertClick
      OnMouseEnter = BtnStyle_1MouseEnter
      OnMouseLeave = BtnStyle_1MouseLeave
    end
    object cxLabel10: TcxLabel
      Left = 147
      Top = 20
      Caption = #48708#48128#48264#54840' '#48320#44221
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
  end
end
