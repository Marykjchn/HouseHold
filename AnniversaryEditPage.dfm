object AnniversaryEditForm: TAnniversaryEditForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #44592#45392#51068' '#49444#51221
  ClientHeight = 346
  ClientWidth = 460
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
    Width = 460
    Height = 346
    Align = alClient
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 185
      Top = 16
      Caption = #44592#45392#51068' '#47785#47197
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = 3947580
      Style.Font.Height = -16
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object BtnClose: TPanel
      Left = 370
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
    object BtnUpdateAnniver: TPanel
      Left = 370
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
      OnClick = BtnUpdateAnniverClick
      OnMouseEnter = BtnStyle_2MouseEnter
      OnMouseLeave = BtnUpdateAnniverMouseLeave
    end
    object BtnDelAnniver: TPanel
      Left = 370
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
      OnClick = BtnDelAnniverClick
      OnMouseEnter = BtnStyle_2MouseEnter
      OnMouseLeave = BtnDelAnniverMouseLeave
    end
    object BtnAddAnniver: TPanel
      Left = 370
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
      OnClick = BtnAddAnniverClick
      OnMouseEnter = BtnStyle_2MouseEnter
      OnMouseLeave = BtnStyle_2MouseLeave
    end
  end
  object GRD_Anniversary: TcxGrid
    Left = 5
    Top = 66
    Width = 350
    Height = 265
    TabOrder = 1
    object Total_Anniversary: TcxGridDBTableView
      OnMouseDown = Total_AnniversaryMouseDown
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
      object Total_AnniversaryColumn1: TcxGridDBColumn
        Caption = #45216'  '#51676
        DataBinding.FieldName = 'AANNIVERSARY'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Editing = False
        Width = 60
      end
      object Total_AnniversaryColumn2: TcxGridDBColumn
        Caption = #44396'  '#48516
        DataBinding.FieldName = 'ATYPE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Editing = False
        Width = 50
      end
      object Total_AnniversaryColumn3: TcxGridDBColumn
        Caption = #51452'  '#44592
        DataBinding.FieldName = 'ACYCLE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Editing = False
        Width = 50
      end
      object Total_AnniversaryColumn4: TcxGridDBColumn
        Caption = #48516'  '#47448
        DataBinding.FieldName = 'ACONTENTS'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 70
      end
      object Total_AnniversaryColumn5: TcxGridDBColumn
        Caption = #51060'  '#47492
        DataBinding.FieldName = 'ANAME'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 60
      end
      object Total_AnniversaryColumn6: TcxGridDBColumn
        Caption = 'xx'
        DataBinding.FieldName = 'ano'
        Visible = False
        Options.Editing = False
      end
    end
    object GRD_AnniversaryLevel1: TcxGridLevel
      GridView = Total_Anniversary
    end
  end
  object QH_AnniversaryEditSelect: TOraQuery
    SQLRefresh.Strings = (
      'SELECT acontents, aname'
      'FROM hanniversary '
      'WHERE ano = :ANO')
    Left = 16
    Top = 8
  end
  object DH_AnniSelectAll: TOraDataSource
    Left = 48
    Top = 8
  end
end
