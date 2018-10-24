object UpdatePhoneForm: TUpdatePhoneForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #55092#45824#54256#48264#54840' '#48320#44221
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
  OnShow = FormShow
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
      object cxLabel12: TcxLabel
        Left = 19
        Top = 15
        Caption = #55092#45824#54256' '#48264#54840
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = 4605510
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object Panel11: TPanel
        Left = 5
        Top = 35
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
        TabOrder = 1
        object ComboFPhone: TcxComboBox
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
          OnExit = EditExit
          OnKeyPress = OnlyNumber2
          Width = 70
        end
      end
      object Panel12: TPanel
        Left = 120
        Top = 35
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
        TabOrder = 2
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
          OnExit = EditExit
          OnKeyPress = OnlyNumber2
          Width = 70
        end
      end
      object Panel13: TPanel
        Left = 235
        Top = 35
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
        TabOrder = 3
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
          OnExit = EditExit
          OnKeyPress = OnlyNumber2
          Width = 70
        end
      end
      object cxLabel14: TcxLabel
        Left = 223
        Top = 40
        Caption = '-'
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxLabel13: TcxLabel
        Left = 108
        Top = 40
        Caption = '-'
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object chkPhone: TcxLabel
        Left = 19
        Top = 65
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
      OnMouseEnter = BtnCloseMouseEnter
      OnMouseLeave = BtnCloseMouseLeave
    end
    object BtnPhoneUpdate: TPanel
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
      OnClick = BtnPhoneUpdateClick
      OnMouseEnter = BtnPhoneUpdateMouseEnter
      OnMouseLeave = BtnPhoneUpdateMouseLeave
    end
    object cxLabel10: TcxLabel
      Left = 138
      Top = 20
      Caption = #55092#45824#54256#48264#54840' '#48320#44221
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
