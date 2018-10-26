object FixBreakAddForm: TFixBreakAddForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #44256#51221#45236#50669' '#52628#44032
  ClientHeight = 500
  ClientWidth = 400
  Color = clWindow
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
    Width = 400
    Height = 500
    Align = alClient
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    object cxLabel6: TcxLabel
      Left = 137
      Top = 20
      Caption = #44256#51221#45236#50669' '#52628#44032
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = 3947580
      Style.Font.Height = -19
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object cxLabel5: TcxLabel
      Left = 50
      Top = 92
      Caption = #45216'   '#51676
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = 3947580
      Style.Font.Height = -12
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object Panel6: TPanel
      Left = 128
      Top = 80
      Width = 220
      Height = 40
      BevelEdges = []
      BevelOuter = bvNone
      BorderWidth = 1
      BorderStyle = bsSingle
      Color = clWindow
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 2
      object DatePickerFixBreak: TPlannerDatePicker
        Left = 14
        Top = 8
        Width = 190
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
        ReadOnly = True
        TabOrder = 1
        Visible = True
        OnChange = DatePickerChange
        OnEnter = EditEnter
        OnExit = EditExit
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
        Calendar = DatePickerFixBreak.cal_
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
      object LabDatePicker: TcxLabel
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
    object cxLabel2: TcxLabel
      Left = 50
      Top = 201
      Caption = #44396'   '#48516
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = 3947580
      Style.Font.Height = -12
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object Panel2: TPanel
      Left = 128
      Top = 190
      Width = 220
      Height = 40
      BevelOuter = bvNone
      TabOrder = 4
      object RadDiv1: TcxRadioButton
        Left = 16
        Top = 10
        Width = 70
        Height = 20
        Caption = #49688'      '#51077
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
      object RadDiv2: TcxRadioButton
        Left = 131
        Top = 10
        Width = 70
        Height = 20
        Caption = #51648'      '#52636
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
    object cxLabel3: TcxLabel
      Left = 50
      Top = 147
      Caption = #45236'   '#50857
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = 3947580
      Style.Font.Height = -12
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object Panel5: TPanel
      Left = 128
      Top = 135
      Width = 220
      Height = 40
      BevelEdges = []
      BevelOuter = bvNone
      BorderWidth = 1
      BorderStyle = bsSingle
      Color = clWindow
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 6
      object EditItem: TcxTextEdit
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
        Width = 190
      end
      object LabItem: TcxLabel
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
    object cxLabel1: TcxLabel
      Left = 50
      Top = 252
      Caption = #44208#51228#49688#45800
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = 3947580
      Style.Font.Height = -12
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object Panel3: TPanel
      Left = 128
      Top = 245
      Width = 220
      Height = 40
      BevelOuter = bvNone
      TabOrder = 8
      object RadMeans2: TcxRadioButton
        Left = 74
        Top = 6
        Width = 50
        Height = 20
        Caption = #52852#46300
        Color = clBtnFace
        Font.Charset = HANGEUL_CHARSET
        Font.Color = 4605510
        Font.Height = -12
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        ParentBackground = False
        Transparent = True
      end
      object RadMeans3: TcxRadioButton
        Left = 131
        Top = 6
        Width = 70
        Height = 20
        Caption = #49888#50857#52852#46300
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
      object RadMeans1: TcxRadioButton
        Left = 16
        Top = 6
        Width = 50
        Height = 20
        Caption = #54788#44552
        Checked = True
        Color = clBtnFace
        Font.Charset = HANGEUL_CHARSET
        Font.Color = 4605510
        Font.Height = -12
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 2
        TabStop = True
        ParentBackground = False
        Transparent = True
      end
    end
    object cxLabel4: TcxLabel
      Left = 50
      Top = 312
      Caption = #52852#46300#51333#47448
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = 3947580
      Style.Font.Height = -12
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object Panel4: TPanel
      Left = 128
      Top = 300
      Width = 220
      Height = 40
      BevelEdges = []
      BevelOuter = bvNone
      BorderWidth = 1
      BorderStyle = bsSingle
      Caption = #52852#46300#51333#47448
      Color = clWindow
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 10
      object EditType: TcxTextEdit
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
        Width = 190
      end
      object LabType: TcxLabel
        Left = 16
        Top = 7
        Caption = #52852#46300#51333#47448
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
    object cxLabel10: TcxLabel
      Left = 50
      Top = 367
      Caption = #44552'  '#50529
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = 3947580
      Style.Font.Height = -12
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object Panel7: TPanel
      Left = 128
      Top = 355
      Width = 220
      Height = 40
      BevelEdges = []
      BevelOuter = bvNone
      BorderWidth = 1
      BorderStyle = bsSingle
      Color = clWindow
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 12
      object EidtAmount: TcxTextEdit
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
        Width = 190
      end
      object LabAmount: TcxLabel
        Left = 16
        Top = 7
        Caption = #44552#50529
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
    object BtnFixBreakStore: TPanel
      Left = 60
      Top = 430
      Width = 130
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
      TabOrder = 13
      OnMouseEnter = BtnStyle_1MouseEnter
      OnMouseLeave = BtnStyle_1MouseLeave
    end
    object BtnClose: TPanel
      Left = 208
      Top = 430
      Width = 130
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
      TabOrder = 14
      OnClick = BtnCloseClick
      OnMouseEnter = BtnStyle_1MouseEnter
      OnMouseLeave = BtnStyle_1MouseLeave
    end
  end
end
