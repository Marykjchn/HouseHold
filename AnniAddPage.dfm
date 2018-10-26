object AnniAddForm: TAnniAddForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #44592#45392#51068' '#52628#44032
  ClientHeight = 410
  ClientWidth = 310
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 310
    Height = 410
    Align = alClient
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 80
      Top = 120
      Width = 200
      Height = 40
      BevelOuter = bvNone
      TabOrder = 2
      object RadType1: TcxRadioButton
        Left = 21
        Top = 10
        Width = 70
        Height = 20
        Caption = #50577#47141
        Checked = True
        Color = clBtnFace
        Font.Charset = HANGEUL_CHARSET
        Font.Color = 4605510
        Font.Height = -12
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        TabStop = True
        ParentBackground = False
        Transparent = True
      end
      object RadType2: TcxRadioButton
        Left = 121
        Top = 10
        Width = 70
        Height = 20
        Caption = #51020#47141
        Color = clBtnFace
        Font.Charset = HANGEUL_CHARSET
        Font.Color = 4605510
        Font.Height = -12
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        ParentBackground = False
        Transparent = True
      end
    end
    object cxLabel1: TcxLabel
      Left = 20
      Top = 74
      Caption = #48516'   '#47448
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = 3947580
      Style.Font.Height = -12
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object cxLabel2: TcxLabel
      Left = 20
      Top = 129
      Caption = #44396'   '#48516
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = 3947580
      Style.Font.Height = -12
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object cxLabel3: TcxLabel
      Left = 20
      Top = 182
      Caption = #45236'   '#50857
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = 3947580
      Style.Font.Height = -12
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object cxLabel4: TcxLabel
      Left = 20
      Top = 237
      Caption = #51452'   '#44592
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = 3947580
      Style.Font.Height = -12
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object cxLabel5: TcxLabel
      Left = 20
      Top = 289
      Caption = #45216'   '#51676
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = 3947580
      Style.Font.Height = -12
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object cxLabel6: TcxLabel
      Left = 102
      Top = 15
      Caption = #44592#45392#51068' '#52628#44032
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = 3947580
      Style.Font.Height = -19
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object Panel3: TPanel
      Left = 80
      Top = 228
      Width = 200
      Height = 40
      BevelOuter = bvNone
      TabOrder = 4
      object RadCycle1: TcxRadioButton
        Left = 22
        Top = 10
        Width = 70
        Height = 20
        Caption = #51068#45380
        Checked = True
        Color = clBtnFace
        Font.Charset = HANGEUL_CHARSET
        Font.Color = 4605510
        Font.Height = -12
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        TabStop = True
        ParentBackground = False
        Transparent = True
      end
      object RadCycle2: TcxRadioButton
        Left = 121
        Top = 10
        Width = 70
        Height = 20
        Caption = #54620#45804
        Color = clBtnFace
        Font.Charset = HANGEUL_CHARSET
        Font.Color = 4605510
        Font.Height = -12
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        ParentBackground = False
        Transparent = True
      end
    end
    object BtnAnniStore: TPanel
      Left = 30
      Top = 350
      Width = 110
      Height = 30
      Cursor = crHandPoint
      Caption = #51200'     '#51109
      Color = 16752190
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 6
      OnClick = BtnAnniStoreClick
      OnMouseEnter = BtnStyle_1MouseEnter
      OnMouseLeave = BtnStyle_1MouseLeave
    end
    object BtnClose: TPanel
      Left = 160
      Top = 350
      Width = 110
      Height = 30
      Cursor = crHandPoint
      Caption = #45803'     '#44592
      Color = 16752190
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 7
      OnClick = BtnCloseClick
      OnMouseEnter = BtnStyle_1MouseEnter
      OnMouseLeave = BtnStyle_1MouseLeave
    end
    object Panel4: TPanel
      Left = 80
      Top = 65
      Width = 200
      Height = 40
      BevelEdges = []
      BevelOuter = bvNone
      BorderWidth = 1
      BorderStyle = bsSingle
      Color = clWindow
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 0
      object EditContents: TcxTextEdit
        Left = 14
        Top = 8
        ParentFont = False
        ParentShowHint = False
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
        OnKeyUp = EditKeyUp
        Width = 170
      end
      object cxLabel7: TcxLabel
        Left = 16
        Top = 7
        Caption = #48516#47448' ex)'#49373#51068
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
    object Panel5: TPanel
      Left = 80
      Top = 173
      Width = 200
      Height = 40
      BevelEdges = []
      BevelOuter = bvNone
      BorderWidth = 1
      BorderStyle = bsSingle
      Color = clWindow
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 3
      object EditName: TcxTextEdit
        Left = 14
        Top = 8
        ParentFont = False
        ParentShowHint = False
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
        OnKeyUp = EditKeyUp
        Width = 170
      end
      object cxLabel8: TcxLabel
        Left = 16
        Top = 7
        Caption = #45236#50857
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
    object Panel6: TPanel
      Left = 80
      Top = 282
      Width = 200
      Height = 40
      BevelEdges = []
      BevelOuter = bvNone
      BorderWidth = 1
      BorderStyle = bsSingle
      Color = clWindow
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 5
      object DatePickerAnni: TPlannerDatePicker
        Left = 14
        Top = 8
        Width = 170
        Height = 23
        Flat = False
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'Tahoma'
        LabelFont.Style = []
        Lookup.Separator = ';'
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = clWindow
        Enabled = True
        Font.Charset = HANGEUL_CHARSET
        Font.Color = 4605510
        Font.Height = -12
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        ReadOnly = False
        TabOrder = 1
        Visible = True
        OnChange = DatePickerChange
        OnEnter = EditEnter
        OnExit = EditExit
        OnKeyPress = DatePickerAnniKeyPress
        Version = '1.6.2.3'
        ButtonStyle = bsDropDown
        ButtonWidth = 16
        Etched = False
        Glyph.Data = {
          DA020000424DDA0200000000000036000000280000000D0000000D0000000100
          200000000000A402000000000000000000000000000000000000F0F0F000F0F0
          F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
          F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
          F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
          F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
          F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
          F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
          F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
          F00000000000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
          F000F0F0F000F0F0F000F0F0F000F0F0F000000000000000000000000000F0F0
          F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
          F0000000000000000000000000000000000000000000F0F0F000F0F0F000F0F0
          F000F0F0F000F0F0F000F0F0F000F0F0F0000000000000000000000000000000
          0000000000000000000000000000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
          F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
          F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
          F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
          F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
          F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
          F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
          F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
          F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000}
        Calendar = DatePickerAnni.cal_
        HideCalendarAfterSelection = True
        object cal_: TPlannerCalendar
          Left = 0
          Top = 0
          Width = 180
          Height = 180
          EventDayColor = clBlack
          EventMarkerColor = clYellow
          EventMarkerShape = evsCircle
          BackgroundPosition = bpTiled
          BevelOuter = bvNone
          BorderWidth = 1
          Look = lookFlat
          DateDownColor = clNone
          DateHoverColor = clNone
          DayFont.Charset = DEFAULT_CHARSET
          DayFont.Color = clWindowText
          DayFont.Height = -11
          DayFont.Name = 'Tahoma'
          DayFont.Style = []
          WeekFont.Charset = DEFAULT_CHARSET
          WeekFont.Color = clWindowText
          WeekFont.Height = -11
          WeekFont.Name = 'Tahoma'
          WeekFont.Style = []
          WeekName = 'Wk'
          TextColor = clBlack
          SelectColor = clTeal
          SelectFontColor = clWhite
          InActiveColor = clGray
          HeaderColor = clNone
          FocusColor = clHighlight
          InversColor = clTeal
          WeekendColor = clRed
          NameOfDays.Monday = #50900
          NameOfDays.Tuesday = #54868
          NameOfDays.Wednesday = #49688
          NameOfDays.Thursday = #47785
          NameOfDays.Friday = #44552
          NameOfDays.Saturday = #53664
          NameOfDays.Sunday = #51068
          NameOfMonths.January = '1'
          NameOfMonths.February = '2'
          NameOfMonths.March = '3'
          NameOfMonths.April = '4'
          NameOfMonths.May = '5'
          NameOfMonths.June = '6'
          NameOfMonths.July = '7'
          NameOfMonths.August = '8'
          NameOfMonths.September = '9'
          NameOfMonths.October = '10'
          NameOfMonths.November = '11'
          NameOfMonths.December = '12'
          NameOfMonths.UseIntlNames = True
          StartDay = 7
          TodayFormat = '"Today" DDD/mm, YYYY'
          Day = 26
          Month = 10
          Year = 2018
          TabOrder = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          CaptionColor = clNone
          CaptionTextColor = clBlack
          LineColor = clGray
          Line3D = True
          GradientStartColor = clWhite
          GradientEndColor = clBtnFace
          GradientDirection = gdVertical
          MonthGradientStartColor = clNone
          MonthGradientEndColor = clNone
          MonthGradientDirection = gdHorizontal
          HintPrevYear = 'Previous Year'
          HintPrevMonth = 'Previous Month'
          HintNextMonth = 'Next Month'
          HintNextYear = 'Next Year'
          Version = '1.7.5.2'
        end
      end
      object cxLabel9: TcxLabel
        Left = 16
        Top = 7
        Caption = #45216#51676' '#49440#53469
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
  end
end
