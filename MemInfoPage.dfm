object MemInfoForm: TMemInfoForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #54924#50896#51221#48372
  ClientHeight = 610
  ClientWidth = 700
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
    Width = 700
    Height = 610
    Align = alClient
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    ExplicitHeight = 556
    object Panel2: TPanel
      Left = 50
      Top = 100
      Width = 600
      Height = 70
      BevelEdges = [beTop, beBottom]
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWindow
      ParentBackground = False
      TabOrder = 0
      object cxLabel1: TcxLabel
        Left = -2
        Top = 20
        Caption = #50500#51060#46356
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 4605510
        Style.Font.Height = -15
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.HotTrack = True
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxLabel2: TcxLabel
        Left = 150
        Top = 23
        Caption = #50500#51060#46356
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 5921370
        Style.Font.Height = -12
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object LabId: TcxLabel
        Left = 300
        Top = 23
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 8536320
        Style.Font.Height = -12
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = [fsBold]
        Style.TextColor = 8536320
        Style.IsFontAssigned = True
      end
      object BtnMIDDelete: TPanel
        Left = 530
        Top = 20
        Width = 40
        Height = 23
        Cursor = crHandPoint
        Caption = #53448#53748
        Color = 16760704
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
        OnMouseEnter = BtnMIDDeleteMouseEnter
        OnMouseLeave = BtnMIDDeleteMouseLeave
      end
    end
    object Panel3: TPanel
      Left = 50
      Top = 237
      Width = 600
      Height = 121
      BevelEdges = [beTop, beBottom]
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWindow
      ParentBackground = False
      TabOrder = 1
      object cxLabel4: TcxLabel
        Left = -2
        Top = 20
        Caption = #50672#46973#52376
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 4605510
        Style.Font.Height = -15
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.HotTrack = True
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxLabel5: TcxLabel
        Left = 150
        Top = 23
        Caption = #55092#45824#54256
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 5921370
        Style.Font.Height = -12
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object cxLabel6: TcxLabel
        Left = 150
        Top = 50
        Caption = #51060#47700#51068
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 5921370
        Style.Font.Height = -12
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object LabPhone: TcxLabel
        Left = 300
        Top = 23
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 8536320
        Style.Font.Height = -12
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.TextColor = 8536320
        Style.IsFontAssigned = True
      end
      object LabEmail: TcxLabel
        Left = 300
        Top = 50
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 8536320
        Style.Font.Height = -12
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.TextColor = 8536320
        Style.IsFontAssigned = True
      end
      object cxLabel9: TcxLabel
        Left = 300
        Top = 77
        Caption = #50672#46973#52376#45716' '#47784#46160' '#54596#49688' '#54637#47785#51077#45768#45796'.'
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 1973790
        Style.Font.Height = -12
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object BtnMPhoneUpdate: TPanel
        Left = 530
        Top = 20
        Width = 40
        Height = 23
        Cursor = crHandPoint
        Caption = #48320#44221
        Color = 16760704
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 6
        OnClick = BtnMPhoneUpdateClick
        OnMouseEnter = BtnMPhoneUpdateMouseEnter
        OnMouseLeave = BtnMPhoneUpdateMouseLeave
      end
      object BtnMEmailUpdate: TPanel
        Left = 530
        Top = 47
        Width = 40
        Height = 23
        Cursor = crHandPoint
        Caption = #48320#44221
        Color = 16760704
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 7
        OnClick = BtnMEmailUpdateClick
        OnMouseEnter = BtnMEmailUpdateMouseEnter
        OnMouseLeave = BtnMEmailUpdateMouseLeave
      end
    end
    object Panel4: TPanel
      Left = 50
      Top = 356
      Width = 600
      Height = 202
      BevelEdges = [beTop, beBottom]
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWindow
      ParentBackground = False
      TabOrder = 2
      object cxLabel10: TcxLabel
        Left = -2
        Top = 20
        Caption = #44228#51221#51221#48372
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 4605510
        Style.Font.Height = -15
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.HotTrack = True
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxLabel11: TcxLabel
        Left = 150
        Top = 23
        Caption = #46321#44553
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 5921370
        Style.Font.Height = -12
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object cxLabel12: TcxLabel
        Left = 150
        Top = 50
        Caption = #51060#47492
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 5921370
        Style.Font.Height = -12
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object LabGrade: TcxLabel
        Left = 300
        Top = 23
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 8536320
        Style.Font.Height = -12
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.TextColor = 8536320
        Style.IsFontAssigned = True
      end
      object LabName: TcxLabel
        Left = 300
        Top = 50
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 8536320
        Style.Font.Height = -12
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.TextColor = 8536320
        Style.IsFontAssigned = True
      end
      object cxLabel20: TcxLabel
        Left = 150
        Top = 77
        Caption = #45208#51060
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 5921370
        Style.Font.Height = -12
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object LabAge: TcxLabel
        Left = 300
        Top = 77
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 8536320
        Style.Font.Height = -12
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.TextColor = 8536320
        Style.IsFontAssigned = True
      end
      object cxLabel16: TcxLabel
        Left = 150
        Top = 104
        Caption = #51452#49548
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 5921370
        Style.Font.Height = -12
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object LabPostCode: TcxLabel
        Left = 300
        Top = 104
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 8536320
        Style.Font.Height = -12
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.TextColor = 8536320
        Style.IsFontAssigned = True
      end
      object BtnMAddUpdate: TPanel
        Left = 530
        Top = 105
        Width = 40
        Height = 23
        Cursor = crHandPoint
        Caption = #48320#44221
        Color = 16760704
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 9
        OnClick = BtnMAddUpdateClick
        OnMouseEnter = BtnMAddUpdateMouseEnter
        OnMouseLeave = BtnMAddUpdateMouseLeave
      end
      object cxLabel14: TcxLabel
        Left = 210
        Top = 104
        Caption = #50864#54200#48264#54840'        :'
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 7237230
        Style.Font.Height = -12
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object LabAdd: TcxLabel
        Left = 300
        Top = 131
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 8536320
        Style.Font.Height = -12
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.TextColor = 8536320
        Style.IsFontAssigned = True
      end
      object cxLabel17: TcxLabel
        Left = 210
        Top = 131
        Caption = #44592#48376#51452#49548'        :'
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 7237230
        Style.Font.Height = -12
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object LabDetailAdd: TcxLabel
        Left = 300
        Top = 158
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 8536320
        Style.Font.Height = -12
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.TextColor = 8536320
        Style.IsFontAssigned = True
      end
      object cxLabel21: TcxLabel
        Left = 210
        Top = 158
        Caption = #49345#49464#51452#49548'        :'
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 7237230
        Style.Font.Height = -12
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
    end
    object cxLabel18: TcxLabel
      Left = 302
      Top = 35
      Caption = #54924' '#50896' '#51221' '#48372
      ParentFont = False
      Style.BorderColor = 4605510
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = 3947580
      Style.Font.Height = -21
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = [fsBold]
      Style.TextColor = 3947580
      Style.IsFontAssigned = True
    end
    object Panel5: TPanel
      Left = 48
      Top = 168
      Width = 600
      Height = 70
      BevelEdges = [beTop, beBottom]
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWindow
      ParentBackground = False
      TabOrder = 4
      object cxLabel3: TcxLabel
        Left = -2
        Top = 20
        Caption = #48708#48128#48264#54840
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 4605510
        Style.Font.Height = -15
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.HotTrack = True
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxLabel7: TcxLabel
        Left = 150
        Top = 23
        Caption = #48708#48128#48264#54840
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 5921370
        Style.Font.Height = -12
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object BtnMPWUpdate: TPanel
        Left = 532
        Top = 20
        Width = 40
        Height = 23
        Cursor = crHandPoint
        Caption = #48320#44221
        Color = 16760704
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
        OnClick = BtnMPWUpdateClick
        OnMouseEnter = BtnMPWUpdateMouseEnter
        OnMouseLeave = BtnMPWUpdateMouseLeave
      end
      object cxLabel8: TcxLabel
        Left = 300
        Top = 23
        Caption = #50516#54840#54868
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 8536320
        Style.Font.Height = -12
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.TextColor = 1973790
        Style.IsFontAssigned = True
      end
    end
  end
end
