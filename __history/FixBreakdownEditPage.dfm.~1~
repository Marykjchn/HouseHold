object FixBreakdownEditForm: TFixBreakdownEditForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #44256#51221#45236#50669' '#49444#51221
  ClientHeight = 346
  ClientWidth = 540
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
    Width = 540
    Height = 346
    Align = alClient
    Color = clWindow
    ParentBackground = False
    TabOrder = 1
    object cxLabel1: TcxLabel
      Left = 212
      Top = 16
      Caption = #44256#51221#45236#50669' '#47785#47197
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = 3947580
      Style.Font.Height = -16
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object BtnClose: TPanel
      Left = 444
      Top = 301
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = #45803'  '#44592
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
    object BtnUpdateFBreakdown: TPanel
      Left = 444
      Top = 111
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = #49688'  '#51221
      Color = 16760704
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      OnClick = BtnUpdateFBreakdownClick
      OnMouseEnter = BtnUpdateFBreakdownMouseEnter
      OnMouseLeave = BtnUpdateFBreakdownMouseLeave
    end
    object BtnDelFBreakdown: TPanel
      Left = 444
      Top = 151
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = #51228'  '#44144
      Color = 16760704
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
      OnClick = BtnDelFBreakdownClick
      OnMouseEnter = BtnDelFBreakdownMouseEnter
      OnMouseLeave = BtnDelFBreakdownMouseLeave
    end
    object BtnAddFBreakdown: TPanel
      Left = 444
      Top = 71
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = #52628'  '#44032
      Color = 16760704
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 4
      OnMouseEnter = BtnAddFBreakdownMouseEnter
      OnMouseLeave = BtnAddFBreakdownMouseLeave
    end
  end
  object GRD_FixBreakdown: TcxGrid
    Left = 5
    Top = 66
    Width = 430
    Height = 265
    TabOrder = 0
    object Total_FixBreakdown: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object Total_FixBreakdownColumn1: TcxGridDBColumn
        Caption = #45216'  '#51676
        DataBinding.FieldName = 'AANNIVERSARY'
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Editing = False
        Width = 80
      end
      object Total_FixBreakdownColumn2: TcxGridDBColumn
        Caption = #44396'  '#48516
        DataBinding.FieldName = 'ATYPE'
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Editing = False
        Width = 60
      end
      object Total_FixBreakdownColumn3: TcxGridDBColumn
        Caption = #51452'  '#44592
        DataBinding.FieldName = 'ACYCLE'
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Editing = False
        Width = 60
      end
      object Total_FixBreakdownColumn4: TcxGridDBColumn
        Caption = #48516'  '#47448
        DataBinding.FieldName = 'ACONTENTS'
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 70
      end
      object Total_FixBreakdownColumn5: TcxGridDBColumn
        Caption = #51060'  '#47492
        DataBinding.FieldName = 'ANAME'
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 60
      end
      object Total_FixBreakdownColumn6: TcxGridDBColumn
        Caption = 'xx'
        DataBinding.FieldName = 'ano'
        Visible = False
        Options.Editing = False
      end
    end
    object GRD_FixBreakdownLevel1: TcxGridLevel
      GridView = Total_FixBreakdown
    end
  end
  object DH_AnniSelectAll: TOraDataSource
    Left = 48
    Top = 8
  end
  object QH_AnniversaryEditSelect: TOraQuery
    SQLRefresh.Strings = (
      'SELECT acontents, aname'
      'FROM hanniversary '
      'WHERE ano = :ANO')
    Left = 16
    Top = 8
  end
end
