object LoginForm: TLoginForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  BorderWidth = 1
  Caption = #44032#44228#48512' - '#47196#44536#51064
  ClientHeight = 365
  ClientWidth = 350
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
    Width = 350
    Height = 365
    Align = alClient
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    object cxLabel3: TcxLabel
      Left = 40
      Top = 158
      Caption = #50500#51060#46356#47484' '#51077#47141#54644#51452#49464#50836'.'
      ParentColor = False
      ParentFont = False
      Properties.ShadowedColor = clGray
      Style.BorderColor = clWindow
      Style.Color = clWindow
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -11
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = []
      Style.TextColor = 217
      Style.IsFontAssigned = True
    end
    object cxLabel4: TcxLabel
      Left = 44
      Top = 228
      Caption = #48708#48128#48264#54840' '#47484' '#51077#47141#54644#51452#49464#50836'.'
      ParentColor = False
      ParentFont = False
      Properties.ShadowedColor = clGray
      Style.BorderColor = clWindow
      Style.Color = clWindow
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -11
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = []
      Style.TextColor = 217
      Style.IsFontAssigned = True
    end
    object Panel3: TPanel
      Left = 24
      Top = 177
      Width = 300
      Height = 50
      BevelEdges = []
      BevelOuter = bvNone
      BorderWidth = 1
      BorderStyle = bsSingle
      Color = clWindow
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 2
      object EditPW: TcxTextEdit
        Left = 14
        Top = 14
        ParentFont = False
        ParentShowHint = False
        Properties.EchoMode = eemPassword
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
        OnKeyPress = EditKeyPress
        OnKeyUp = EditPWKeyUp
        Width = 271
      end
      object cxLabel2: TcxLabel
        Left = 16
        Top = 12
        Caption = #48708#48128#48264#54840' '#51077#47141
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
        OnClick = cxLabel2Click
      end
    end
    object Panel2: TPanel
      Left = 24
      Top = 106
      Width = 300
      Height = 50
      BevelEdges = []
      BevelOuter = bvNone
      BorderWidth = 1
      BorderStyle = bsSingle
      Color = clWindow
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 1
      object EditID: TcxTextEdit
        Left = 14
        Top = 14
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
        OnKeyPress = EditIDKeyPress
        OnKeyUp = EditIDKeyUp
        Width = 271
      end
      object cxLabel1: TcxLabel
        Left = 16
        Top = 12
        Caption = #50500#51060#46356' '#51077#47141
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
        OnClick = cxLabel1Click
      end
    end
    object Panel4: TPanel
      Left = 24
      Top = 330
      Width = 300
      Height = 35
      BevelEdges = [beTop]
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 4
      object LabFindID: TcxLabel
        Left = 42
        Top = 4
        Cursor = crHandPoint
        Caption = #50500#51060#46356' '#52286#44592
        ParentColor = False
        ParentFont = False
        Style.Color = clWindow
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 7895160
        Style.Font.Height = -11
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.IsFontAssigned = True
        OnClick = LabFindIDClick
        OnMouseEnter = LabMouseEnter
        OnMouseLeave = LabMouseLeave
      end
      object LabFindPW: TcxLabel
        Left = 118
        Top = 4
        Cursor = crHandPoint
        Caption = #48708#48128#48264#54840' '#52286#44592
        ParentColor = False
        ParentFont = False
        Style.Color = clWindow
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 7895160
        Style.Font.Height = -11
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.IsFontAssigned = True
        OnClick = LabFindPWClick
        OnMouseEnter = LabMouseEnter
        OnMouseLeave = LabMouseLeave
      end
      object LabMemInsert: TcxLabel
        Left = 205
        Top = 4
        Cursor = crHandPoint
        Caption = #54924#50896#44032#51077
        ParentColor = False
        ParentFont = False
        Style.Color = clWindow
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 7895160
        Style.Font.Height = -11
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.Shadow = False
        Style.TextStyle = []
        Style.IsFontAssigned = True
        StyleDisabled.TextStyle = []
        StyleFocused.TextStyle = []
        StyleHot.TextStyle = []
        OnClick = LabMemInsertClick
        OnMouseEnter = LabMouseEnter
        OnMouseLeave = LabMouseLeave
      end
      object cxLabel5: TcxLabel
        Left = 108
        Top = 4
        Caption = '|'
        ParentColor = False
        ParentFont = False
        Style.Color = clWindow
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 11842740
        Style.Font.Height = -11
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxLabel6: TcxLabel
        Left = 196
        Top = 4
        Caption = '|'
        ParentColor = False
        ParentFont = False
        Style.Color = clWindow
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 11842740
        Style.Font.Height = -11
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
    end
    object BtnLogin: TPanel
      Left = 24
      Top = 251
      Width = 300
      Height = 50
      Cursor = crHandPoint
      Caption = #47196#44536#51064
      Color = 16752190
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -17
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 5
      OnClick = BtnLoginClick
      OnMouseEnter = BtnStyle_1MouseEnter
      OnMouseLeave = BtnStyle_1MouseLeave
    end
  end
  object TPanel
    Left = 85
    Top = 30
    Width = 180
    Height = 40
    Caption = #47196'    '#44256
    Color = 16764831
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
  end
end
