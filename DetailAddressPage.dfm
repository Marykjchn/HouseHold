object DetailAddressForm: TDetailAddressForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #49345#49464#51452#49548' '#51077#47141
  ClientHeight = 302
  ClientWidth = 402
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 402
    Height = 302
    Align = alClient
    TabOrder = 0
    object Panel19: TPanel
      Left = 38
      Top = 100
      Width = 225
      Height = 30
      BevelEdges = []
      BevelOuter = bvNone
      BorderWidth = 1
      BorderStyle = bsSingle
      Color = clMenuBar
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 0
      object EditPostCode: TcxTextEdit
        Left = 14
        Top = 4
        Enabled = False
        ParentFont = False
        ParentShowHint = False
        Properties.MaxLength = 2
        Properties.ReadOnly = True
        ShowHint = True
        Style.BorderColor = clWindow
        Style.Color = clMenuBar
        Style.Edges = []
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 2302755
        Style.Font.Height = -12
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        StyleFocused.Color = 16776441
        TabOrder = 0
        Width = 195
      end
    end
    object Panel14: TPanel
      Left = 38
      Top = 135
      Width = 330
      Height = 30
      BevelEdges = []
      BevelOuter = bvNone
      BorderWidth = 1
      BorderStyle = bsSingle
      Color = clMenuBar
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 1
      object EditAdd: TcxTextEdit
        Left = 14
        Top = 4
        Enabled = False
        ImeMode = imSHanguel
        ParentFont = False
        ParentShowHint = False
        Properties.ImeMode = imSHanguel
        Properties.ReadOnly = True
        ShowHint = True
        Style.BorderColor = clWindow
        Style.Color = clMenuBar
        Style.Edges = []
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 2302755
        Style.Font.Height = -12
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        StyleFocused.Color = 16776441
        TabOrder = 0
        Width = 300
      end
    end
    object Panel18: TPanel
      Left = 38
      Top = 170
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
      object EditDetailAddress: TcxTextEdit
        Left = 14
        Top = 4
        ImeMode = imSHanguel
        ParentFont = False
        ParentShowHint = False
        Properties.ImeMode = imSHanguel
        Properties.ReadOnly = False
        Properties.OnChange = cxTextEdit1PropertiesChange
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
        OnKeyPress = EditDetailAddressKeyPress
        Width = 300
      end
      object LabDetailAddress: TcxLabel
        Left = 17
        Top = 2
        Caption = #49345#49464' '#51452#49548
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
        OnClick = LabDetailAddressClick
      end
    end
    object BtnDetailAddress: TPanel
      Left = 43
      Top = 220
      Width = 320
      Height = 40
      Cursor = crHandPoint
      Caption = #51077#47141' '#50756#47308
      Color = 16752190
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
      OnClick = BtnDetailAddressClick
      OnMouseEnter = BtnStyle_1MouseEnter
      OnMouseLeave = BtnStyle_1MouseLeave
    end
    object cxLabel10: TcxLabel
      Left = 144
      Top = 30
      Caption = #49345#49464#51452#49548' '#51077#47141
      ParentFont = False
      Style.BorderColor = 4605510
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = 3947580
      Style.Font.Height = -17
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = [fsBold]
      Style.TextColor = 3947580
      Style.IsFontAssigned = True
      Transparent = True
    end
  end
end
