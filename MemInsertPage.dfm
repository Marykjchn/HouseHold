object MemInsertForm: TMemInsertForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #54924#50896#44032#51077
  ClientHeight = 850
  ClientWidth = 480
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
    Width = 480
    Height = 850
    Align = alClient
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 89
      Top = 75
      Caption = #50500#51060#46356
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = 4605510
      Style.Font.Height = -11
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object cxLabel2: TcxLabel
      Left = 89
      Top = 250
      Caption = #51060#47492
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = 4605510
      Style.Font.Height = -11
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object cxLabel3: TcxLabel
      Left = 89
      Top = 145
      Caption = #48708#48128#48264#54840
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = 4605510
      Style.Font.Height = -11
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object cxLabel5: TcxLabel
      Left = 89
      Top = 320
      Caption = #49373#51068
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = 4605510
      Style.Font.Height = -11
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object cxLabel7: TcxLabel
      Left = 199
      Top = 390
      Caption = #49457#48324
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = 4605510
      Style.Font.Height = -11
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object cxLabel8: TcxLabel
      Left = 87
      Top = 460
      Caption = #51452#49548
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = 4605510
      Style.Font.Height = -11
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object cxLabel9: TcxLabel
      Left = 87
      Top = 670
      Caption = #51060#47700#51068
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = 4605510
      Style.Font.Height = -11
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object cxLabel10: TcxLabel
      Left = 185
      Top = 20
      Caption = #54924' '#50896' '#44032' '#51077
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
    object chkName: TcxLabel
      Left = 89
      Top = 300
      Caption = #54620#44544#51012' '#51077#47141#54644#51452#49464#50836
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = []
      Style.TextColor = clRed
      Style.IsFontAssigned = True
    end
    object chkID: TcxLabel
      Left = 89
      Top = 125
      Caption = #50500#51060#46356#44032' '#50732#48148#47476#51648' '#50506#49845#45768#45796'.'
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = []
      Style.TextColor = clRed
      Style.IsFontAssigned = True
    end
    object chkPW: TcxLabel
      Left = 89
      Top = 230
      Caption = #48708#48128#48264#54840#47484' 6~16'#51088#47196' '#51077#47141#54644#51452#49464#50836'.'
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = []
      Style.TextColor = clRed
      Style.IsFontAssigned = True
    end
    object chkPWTrue: TcxLabel
      Left = 89
      Top = 230
      Caption = #48708#48128#48264#54840#44032' '#51068#52824#54616#51648' '#50506#49845#45768#45796'.'
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = []
      Style.TextColor = clRed
      Style.IsFontAssigned = True
    end
    object chkBirth: TcxLabel
      Left = 89
      Top = 370
      Caption = #49373#45380#50900#51068#51012' '#51221#54869#55176' '#51077#47141#54644#51452#49464#50836'.'
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = []
      Style.TextColor = clRed
      Style.IsFontAssigned = True
    end
    object chkAdd: TcxLabel
      Left = 89
      Top = 580
      Caption = #51452#49548#47484' '#51077#47141#54644#51452#49464#50836'.'
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = []
      Style.TextColor = clRed
      Style.IsFontAssigned = True
    end
    object chkEmail: TcxLabel
      Left = 87
      Top = 720
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
    object cxLabel12: TcxLabel
      Left = 87
      Top = 600
      Caption = #55092#45824#54256' '#48264#54840
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = 4605510
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object cxLabel13: TcxLabel
      Left = 173
      Top = 625
      Caption = '-'
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object cxLabel14: TcxLabel
      Left = 288
      Top = 625
      Caption = '-'
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object Panel2: TPanel
      Left = 70
      Top = 95
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
        OnKeyUp = EditIDKeyUp
        Width = 300
      end
      object LabID: TcxLabel
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
        OnClick = LabIDClick
      end
    end
    object Panel3: TPanel
      Left = 70
      Top = 165
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
        OnExit = EditPWExit
        OnKeyUp = EditPWKeyUp
        Width = 300
      end
      object LabPW: TcxLabel
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
        OnClick = LabPWClick
      end
    end
    object Panel4: TPanel
      Left = 70
      Top = 200
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
        OnEnter = EditEnter
        OnExit = EditPWchkExit
        OnKeyUp = EditPWchkKeyUp
        Width = 300
      end
      object LabPWChk: TcxLabel
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
        OnClick = LabPWChkClick
      end
    end
    object Panel5: TPanel
      Left = 70
      Top = 270
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
        OnExit = EditNameExit
        OnKeyPress = EditNameKeyPress
        OnKeyUp = EditNameKeyUp
        Width = 300
      end
      object LabName: TcxLabel
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
        OnClick = LabNameClick
      end
    end
    object Panel6: TPanel
      Left = 70
      Top = 340
      Width = 106
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
      object EditYear: TcxTextEdit
        Left = 14
        Top = 3
        ParentFont = False
        ParentShowHint = False
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
        OnExit = EditYear2Exit
        OnKeyPress = OnlyNumber
        OnKeyUp = EditYearKeyUp
        Width = 76
      end
      object LabBirthYear: TcxLabel
        Left = 17
        Top = 2
        Caption = #45380
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
        OnClick = LabBirthYearClick
      end
    end
    object Panel7: TPanel
      Left = 182
      Top = 340
      Width = 106
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
      TabOrder = 6
      object ComboMon: TcxComboBox
        Left = 14
        Top = 4
        ParentFont = False
        Properties.Items.Strings = (
          '01'
          '02'
          '03'
          '04'
          '05'
          '06'
          '07'
          '08'
          '09'
          '10'
          '11'
          '12')
        Properties.MaxLength = 2
        Properties.OnChange = ComboMonPropertiesChange
        Style.Edges = []
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = 5592405
        Style.Font.Height = -12
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        StyleFocused.Color = 16776441
        TabOrder = 1
        OnEnter = EditEnter
        OnExit = ComboMonExit
        OnKeyPress = OnlyNumber
        OnKeyUp = ComboMonKeyUp
        Width = 76
      end
      object LabBirthMonth: TcxLabel
        Left = 17
        Top = 2
        Caption = #50900
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
        OnClick = LabBirthMonthClick
      end
    end
    object Panel8: TPanel
      Left = 294
      Top = 340
      Width = 106
      Height = 30
      BevelEdges = []
      BevelOuter = bvNone
      BorderWidth = 1
      BorderStyle = bsSingle
      Color = clWindow
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 7
      object EditDay: TcxTextEdit
        Left = 14
        Top = 4
        ParentFont = False
        ParentShowHint = False
        Properties.MaxLength = 2
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
        OnExit = EditDayExit
        OnKeyPress = OnlyNumber
        OnKeyUp = EditDayKeyUp
        Width = 76
      end
      object LabBirthDay: TcxLabel
        Left = 17
        Top = 2
        Caption = #51068
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
        OnClick = LabBirthDayClick
      end
    end
    object cxLabel6: TcxLabel
      Left = 89
      Top = 390
      Caption = #45208#51060
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = 4605510
      Style.Font.Height = -11
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object Panel9: TPanel
      Left = 70
      Top = 410
      Width = 111
      Height = 30
      BevelEdges = []
      BevelOuter = bvNone
      BorderWidth = 1
      BorderStyle = bsSingle
      Color = clWindow
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 8
      object EditAge: TcxTextEdit
        Left = 14
        Top = 4
        ParentFont = False
        ParentShowHint = False
        Properties.ReadOnly = True
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
        Width = 81
      end
      object LabAge: TcxLabel
        Left = 17
        Top = 2
        Caption = #45208#51060
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
    end
    object Panel10: TPanel
      Left = 187
      Top = 410
      Width = 213
      Height = 30
      BevelEdges = []
      BevelOuter = bvNone
      BorderWidth = 1
      BorderStyle = bsSingle
      Color = clWindow
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 9
      object RBtnSexW: TcxRadioButton
        Left = 128
        Top = 5
        Width = 70
        Height = 20
        Caption = #50668#51088
        Font.Charset = HANGEUL_CHARSET
        Font.Color = 5592405
        Font.Height = -11
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object RBtnSexM: TcxRadioButton
        Left = 35
        Top = 5
        Width = 70
        Height = 20
        Caption = #45224#51088
        Checked = True
        Font.Charset = HANGEUL_CHARSET
        Font.Color = 5592405
        Font.Height = -11
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = True
      end
    end
    object Panel11: TPanel
      Left = 70
      Top = 620
      Width = 100
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
      TabOrder = 13
      object ComFPhone: TcxComboBox
        Left = 14
        Top = 3
        ParentFont = False
        Properties.Items.Strings = (
          '010'
          '011'
          '016'
          '017'
          '018'
          '019')
        Properties.MaxLength = 3
        Style.Edges = []
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = 5592405
        Style.Font.Height = -12
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        StyleFocused.Color = 16776441
        TabOrder = 0
        Text = '010'
        OnEnter = EditEnter
        OnExit = ComFPhoneExit
        OnKeyPress = OnlyNumber2
        Width = 70
      end
    end
    object Panel12: TPanel
      Left = 185
      Top = 620
      Width = 100
      Height = 30
      BevelEdges = []
      BevelOuter = bvNone
      BorderWidth = 1
      BorderStyle = bsSingle
      Color = clWindow
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 14
      object EditMPhone: TcxTextEdit
        Left = 14
        Top = 4
        ParentFont = False
        ParentShowHint = False
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
        TabOrder = 0
        OnEnter = EditEnter
        OnExit = EditMPhoneExit
        OnKeyPress = OnlyNumber2
        Width = 70
      end
    end
    object Panel13: TPanel
      Left = 300
      Top = 620
      Width = 100
      Height = 30
      BevelEdges = []
      BevelOuter = bvNone
      BorderWidth = 1
      BorderStyle = bsSingle
      Color = clWindow
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 15
      object EditLPhone: TcxTextEdit
        Left = 14
        Top = 4
        ParentFont = False
        ParentShowHint = False
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
        TabOrder = 0
        OnEnter = EditEnter
        OnExit = EditLPhoneExit
        OnKeyPress = OnlyNumber2
        Width = 70
      end
    end
    object Panel14: TPanel
      Left = 70
      Top = 515
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
      TabOrder = 11
      object EditAdd: TcxTextEdit
        Left = 14
        Top = 1
        ImeMode = imSHanguel
        ParentFont = False
        ParentShowHint = False
        Properties.ImeMode = imSHanguel
        Properties.ReadOnly = True
        Properties.OnChange = EditAddPropertiesChange
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
        OnClick = EditAddClick
        OnEnter = EditEnter
        OnExit = EditExit
        Width = 300
      end
      object LabAddress: TcxLabel
        Left = 17
        Top = 2
        Caption = #51452#49548
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
        OnClick = LabAddressClick
      end
    end
    object chkPhone: TcxLabel
      Left = 89
      Top = 650
      Caption = #55092#45824#54256' '#48264#54840#47484' '#51221#54869#55176' '#51077#47141#54644#51452#49464#50836'.'
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = []
      Style.TextColor = clRed
      Style.IsFontAssigned = True
    end
    object Panel15: TPanel
      Left = 70
      Top = 690
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
      TabOrder = 16
      object EditFEmail: TcxTextEdit
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
        OnExit = EditFEmailExit
        OnKeyPress = EditEmailKeyPress
        Width = 75
      end
    end
    object Panel16: TPanel
      Left = 170
      Top = 690
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
      TabOrder = 17
      object EditLEmail: TcxTextEdit
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
        OnExit = EditLEmailExit
        OnKeyPress = EditEmailKeyPress
        Width = 81
      end
    end
    object Panel17: TPanel
      Left = 264
      Top = 690
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
      TabOrder = 18
      object ComboSelEmail: TcxComboBox
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
        OnExit = ComboSelEmailExit
        Width = 81
      end
    end
    object cxLabel26: TcxLabel
      Left = 154
      Top = 695
      Caption = '@'
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object BtnMemInsert: TPanel
      Left = 75
      Top = 760
      Width = 320
      Height = 40
      Cursor = crHandPoint
      Caption = #54924#50896#44032#51077
      Color = 16752190
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 39
      OnClick = BtnMemInsertClick
      OnMouseEnter = BtnMemInsertMouseEnter
      OnMouseLeave = BtnMemInsertMouseLeave
    end
    object BtnEmailChk: TPanel
      Left = 356
      Top = 689
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
      TabOrder = 40
      OnClick = BtnEmailChkClick
      OnMouseEnter = BtnEmailChkMouseEnter
      OnMouseLeave = BtnEmailChkMouseLeave
    end
    object Panel18: TPanel
      Left = 70
      Top = 551
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
      TabOrder = 12
      object EditDetailAddress: TcxTextEdit
        Left = 14
        Top = 4
        ImeMode = imSHanguel
        ParentFont = False
        ParentShowHint = False
        Properties.ImeMode = imSHanguel
        Properties.ReadOnly = False
        Properties.OnChange = EditDetailAddressPropertiesChange
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
        OnClick = EditAddClick
        OnEnter = EditEnter
        OnExit = EditExit
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
        OnClick = LabAddressClick
      end
    end
    object Panel19: TPanel
      Left = 70
      Top = 480
      Width = 225
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
      object EditPostCode: TcxTextEdit
        Left = 14
        Top = 4
        ParentFont = False
        ParentShowHint = False
        Properties.MaxLength = 2
        Properties.ReadOnly = True
        Properties.OnChange = EditPostCodePropertiesChange
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
        OnClick = EditAddClick
        OnEnter = EditEnter
        OnExit = EditExit
        Width = 195
      end
      object LabPostCode: TcxLabel
        Left = 17
        Top = 2
        Caption = #50864#54200#48264#54840
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
        OnClick = LabAddressClick
      end
    end
    object BtnSearchAddress: TPanel
      Left = 300
      Top = 479
      Width = 100
      Height = 31
      Cursor = crHandPoint
      Caption = #51452#49548#44160#49353
      Color = 16760704
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 41
      OnClick = BtnSearchAddressClick
      OnMouseEnter = BtnEmailChkMouseEnter
      OnMouseLeave = BtnEmailChkMouseLeave
    end
  end
end
