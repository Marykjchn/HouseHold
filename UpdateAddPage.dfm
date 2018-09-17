object UpdateAddForm: TUpdateAddForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #51452#49548' '#48320#44221
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
      object cxLabel8: TcxLabel
        Left = 19
        Top = 15
        Caption = #51452#49548
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = 4605510
        Style.Font.Height = -11
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object Panel14: TPanel
        Left = 0
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
        TabOrder = 1
        object EditAdd: TcxTextEdit
          Left = 14
          Top = 4
          ImeMode = imSHanguel
          ParentFont = False
          ParentShowHint = False
          Properties.ImeMode = imSHanguel
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
          OnEnter = EditAddEnter
          OnExit = EditAddExit
          OnKeyPress = EditAddKeyPress
          OnKeyUp = EditAddKeyUp
          Width = 300
        end
        object cxLabel22: TcxLabel
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
          OnClick = cxLabel22Click
        end
      end
      object chkAdd: TcxLabel
        Left = 19
        Top = 65
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
    object BtnAddUpdate: TPanel
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
      OnClick = BtnAddUpdateClick
      OnMouseEnter = BtnAddUpdateMouseEnter
      OnMouseLeave = BtnAddUpdateMouseLeave
    end
    object cxLabel10: TcxLabel
      Left = 166
      Top = 20
      Caption = #51452#49548' '#48320#44221
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
