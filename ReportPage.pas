unit ReportPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, ExtCtrls, cxDBEdit, Mask, AdvEdit, AdvMEdBtn,
  PlannerMaskDatePicker, StdCtrls, AdvEdBtn, PlannerDatePicker, ComCtrls,
  clisted, MaskEdEx, MoneyEdit, EditBtn, advlued, AdvSpin, Lucombo, dblucomb,
  Planner, PlanSimpleEdit, frmctrllink, AdvGrid, AsgMemo, IWControl32,
  IWCompEdit32, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWCompEdit, Spin, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxMemo,
  cxRichEdit, cxSpinEdit, cxSpinButton, cxButtonEdit, AdvCardList, cxLabel,
  Menus, cxLookAndFeelPainters, cxButtons, AdvDateTimePicker, datelbl,
  cxRadioGroup, PlannerCal, DBAccess, Ora, MemDS, DateUtils, cxCurrencyEdit,
  PlannerMonthView, DBPlannerMonthView, ImgList;

type
  TDateData = record
    year, month, StartDate, FinishDate     : String;
    category, cdiv, citem, cmeans, ctype   : String;
  end;

type
  TReportForm = class(TForm)
    QH_SelectAll: TOraQuery;
    DH_SelectAll: TOraDataSource;
    QH_SelectIncome: TOraQuery;
    QH_SelectSpending: TOraQuery;
    DH_SelectIncome: TOraDataSource;
    DH_SelectSpending: TOraDataSource;
    Panel1: TPanel;
    StartFinishDatePanel: TPanel;
    StartDateData: TcxLabel;
    MiddileData: TcxLabel;
    FinishDateData: TcxLabel;
    YearPanel: TPanel;
    BtnBeforeYear: TLabel;
    BtnAfterYear: TLabel;
    Year: TcxLabel;
    YearText: TcxLabel;
    MonthPanel: TPanel;
    BtnMonthBefore2: TcxLabel;
    BtnMonthBefore1: TcxLabel;
    Month_Year: TcxLabel;
    Month_Year2: TcxLabel;
    Month_Month: TcxLabel;
    Month_Month2: TcxLabel;
    BtnMonthAfter1: TcxLabel;
    BtnMonthAfter2: TcxLabel;
    cxRadioButton1: TcxRadioButton;
    cxRadioButton2: TcxRadioButton;
    cxRadioButton3: TcxRadioButton;
    GRD_SelectAll: TcxGrid;
    Holding_SelectAll: TcxGridDBTableView;
    Holding_SelectAllColumn1: TcxGridDBColumn;
    Holding_SelectAllColumn2: TcxGridDBColumn;
    Holding_SelectAllColumn3: TcxGridDBColumn;
    Holding_SelectAllColumn4: TcxGridDBColumn;
    Holding_SelectAllColumn5: TcxGridDBColumn;
    Holding_SelectAllColumn6: TcxGridDBColumn;
    Holding_SelectAllColumn7: TcxGridDBColumn;
    Holding_SelectAllColumn8: TcxGridDBColumn;
    Holding_SelectAllColumn9: TcxGridDBColumn;
    Holding_SelectAllColumn10: TcxGridDBColumn;
    GRD_SelectAllDBTableView2: TcxGridDBTableView;
    GRD_SelectAllDBTableView3: TcxGridDBTableView;
    GRD_SelectAllLevel1: TcxGridLevel;
    StatusBar1: TStatusBar;
    EditSearch: TcxTextEdit;
    ComboCategory: TComboBox;
    LabCategory: TcxLabel;
    BtnIncomeSpending: TPanel;
    BtnClose: TPanel;
    BtnTerm: TPanel;
    BtnMonth: TPanel;
    BtnYear: TPanel;
    BtnSearch: TPanel;
    Panel2: TPanel;
    cxLabel1: TcxLabel;
    GRD_SelectIncome: TcxGrid;
    Holding_SelectIncome: TcxGridDBTableView;
    Holding_SelectIncomeColumn1: TcxGridDBColumn;
    Holding_SelectIncomeColumn2: TcxGridDBColumn;
    Holding_SelectIncomeColumn3: TcxGridDBColumn;
    Holding_SelectIncomeColumn4: TcxGridDBColumn;
    GRD_SelectIncomeLevel1: TcxGridLevel;
    GRD_SelectSpending: TcxGrid;
    Holding_SelectSpending: TcxGridDBTableView;
    Holding_SelectSpendingColumn1: TcxGridDBColumn;
    Holding_SelectSpendingColumn2: TcxGridDBColumn;
    Holding_SelectSpendingColumn3: TcxGridDBColumn;
    Holding_SelectSpendingColumn4: TcxGridDBColumn;
    Holding_SelectSpendingColumn5: TcxGridDBColumn;
    GRD_SelectSpendingLevel1: TcxGridLevel;
    PlannerCalendar1: TPlannerCalendar;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    BtnTotalExcel: TImage;
    BtnTotalPrint: TImage;
    BtnSpendingExcel: TImage;
    BtnSpendingPrint: TImage;
    BtnIncomePrint: TImage;
    BtnIncomeExcel: TImage;


    // ------------------ Grid 출력 ------------------
    // 조건별 출력 procedure
    procedure DateSelectAll;
    // 기간별 클릭후 달력 선택시 이벤트
    procedure PlannerCalendar1DaySelect(Sender: TObject; SelDate: TDateTime);
    // 연도별 출력
    procedure YearSelectAll;
    // 월별 출력
    procedure MonthSelectAll;
    // 기간별 출력
    procedure TermSelectAll;

    // ------------------ 버튼 클릭 ------------------
    // 연도별, 월별 버튼 클릭시 label값 변경
    procedure BtnBeforeYearClick(Sender: TObject);
    procedure BtnAfterYearClick(Sender: TObject);
    procedure YearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnYear2Click(Sender: TObject);
    procedure BtnMonthClick(Sender: TObject);
    procedure BtnMonthBefore1Click(Sender: TObject);
    procedure BtnMonthAfter1Click(Sender: TObject);
    procedure Month_MonthClick(Sender: TObject);
    procedure BtnMonthAfter2Click(Sender: TObject);
    procedure BtnMonthBefore2Click(Sender: TObject);
    procedure BtnTerm2Click(Sender: TObject);


    // ------------------ 검색 ------------------
    // Combobox 설명 Label 관련
    procedure ComboCategoryEnter(Sender: TObject);
    procedure ComboCategoryExit(Sender: TObject);
    // 검색 Edit에서 엔터 키 입력시 검색 버튼 클릭
    procedure EditSearchKeyPress(Sender: TObject; var Key: Char);
    // 검색 버튼 클릭시 검색
    procedure BtnSearchClick(Sender: TObject);

    // ------------------ 폼 종료시 메모리 해제 ------------------
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnTermClick(Sender: TObject);
    procedure BtnYearClick(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure BtnIncomeSpendingClick(Sender: TObject);


    // --------------- 버튼 호버시 색 변경 ---------------
    procedure BtnStyle_1MouseEnter(Sender: TObject);
    procedure BtnStyle_1MouseLeave(Sender: TObject);
    procedure BtnStyle_2MouseEnter(Sender: TObject);
    procedure BtnStyle_2MouseLeave(Sender: TObject);

    // ----- 엑셀 및 프린트 버튼 클릭 -----
    procedure BtnExcelClick(Sender: TObject);


    procedure ExcelDataFind(Sender : TObject; PHandle : HWND);

  private
    { Private declarations }
    StartYear, StartMonth, StartDay, FinishYear, FinishMonth, FinishDay : String;
    StartDate, FinishDate                                               : TDateTime;
    DateData                                                            : TDateData;
  public
    { Public declarations }
  end;

var
  ReportForm: TReportForm;

implementation

{$R *.dfm}

uses
  HouseholdPage, DataModule, HDataMethod;

procedure TReportForm.BtnAfterYearClick(Sender: TObject);
begin
  Year.Caption := IntToStr(StrToInt(Year.Caption) + 1);

  DateData.year := Year.Caption;
  DateSelectAll;

  with QH_SelectAll do Begin
    Session := DataModule1.OraSession1;
  End;


end;

procedure TReportForm.BtnBeforeYearClick(Sender: TObject);
begin
  Year.Caption := IntToStr(StrToInt(Year.Caption) - 1);

  DateData.year := Year.Caption;
  DateSelectAll;
end;

procedure TReportForm.BtnMonthAfter1Click(Sender: TObject);
begin
  if Month_Month.Caption <> '12' then begin
    if StrToInt(Month_Month.Caption) > 8 then begin
      Month_Month.Caption := IntToStr(StrToInt(Month_Month.Caption) + 1);
    end else begin
      Month_Month.Caption := '0' + IntToStr(StrToInt(Month_Month.Caption) + 1);
    end;
  end else begin
    Month_Year.Caption := IntToStr(StrToInt(Month_Year.Caption) + 1);
    Month_Month.Caption := '01';
  end;

  DateData.year   := Month_Year.Caption;
  DateData.month  := Month_Month.Caption;

  DateSelectAll;

end;

procedure TReportForm.BtnMonthAfter2Click(Sender: TObject);
begin
  Month_Year.Caption := IntToStr(StrToInt(Month_Year.Caption) + 1);

  DateData.year   := Month_Year.Caption;
  DateData.month  := Month_Month.Caption;

  DateSelectAll;

end;



procedure TReportForm.BtnMonthBefore1Click(Sender: TObject);
begin
  if Month_Month.Caption <> '01' then begin
    if StrToInt(Month_Month.Caption) > 10 then begin
      Month_Month.Caption := IntToStr(StrToInt(Month_Month.Caption) - 1);
    end else begin
      Month_Month.Caption := '0' + IntToStr(StrToInt(Month_Month.Caption) - 1);
    end;
  end else begin
    Month_Year.Caption := IntToStr(StrToInt(Month_Year.Caption) - 1);
    Month_Month.Caption := '12';
  end;

  DateData.year   := Month_Year.Caption;
  DateData.month  := Month_Month.Caption;

  DateSelectAll;


end;

procedure TReportForm.BtnMonthBefore2Click(Sender: TObject);
begin
  Month_Year.Caption := IntToStr(StrToInt(Month_Year.Caption) - 1);

  DateData.year   := Month_Year.Caption;
  DateData.month  := Month_Month.Caption;

  DateSelectAll;

end;

procedure TReportForm.BtnSearchClick(Sender: TObject);
begin
  if (ComboCategory.Text <> '') AND (EditSearch.Text <> '') then begin
    if ComboCategory.Text = '구분' then begin
      DateData.category := 'cdiv';
      DateData.cdiv     :=  '%' + EditSearch.Text + '%';

    end else if ComboCategory.Text = '항목' then begin
      DateData.category := 'citem';
      DateData.citem    := '%' + EditSearch.Text + '%';

    end else if ComboCategory.Text = '결제수단' then begin
      DateData.category := 'cmeans';
      DateData.cmeans   := '%' + EditSearch.Text + '%';

    end else if ComboCategory.Text = '카드사' then begin
      DateData.category := 'ctype';
      DateData.ctype    := '%' + EditSearch.Text + '%';

    end;

    DateSelectAll;
  end else begin
    if ComboCategory.Text <> '' then begin
      ShowMessage('카테고리를 선택해주세요.');
      ComboCategory.SetFocus;
    end else begin
      ShowMessage('검색어를 입력해주세요.');
      EditSearch.SetFocus;

    end;
  end;
end;



procedure TReportForm.ComboCategoryEnter(Sender: TObject);
begin
  LabCategory.Hide;
end;

procedure TReportForm.ComboCategoryExit(Sender: TObject);
begin
  if ComboCategory.Text = '' then begin
    LabCategory.Show;
  end;
end;

procedure TReportForm.BtnYear2Click(Sender: TObject);
begin
  cxRadioButton1.Checked := True;
  cxRadioButton2.Checked := False;
  cxRadioButton3.Checked := False;
  MonthPanel.Hide;
  PlannerCalendar1.Hide;
  StartDateData.Hide;
  MiddileData.Hide;
  FinishDateData.Hide;

  Year.Caption          := FormatDateTime('yyyy', Now);
  YearPanel.Show;

  with DateData do begin
    year       := FormatDateTime('yyyy', Now);
    category   := '';
    cdiv       := '';
    citem      := '';
    cmeans     := '';
    ctype      := '';
  end;

  EditSearch.Text    := '';
  ComboCategory.Text := '';
  LabCategory.hide;

  DateSelectAll;

end;

procedure TReportForm.BtnYearClick(Sender: TObject);
begin
  cxRadioButton1.Checked := True;
  cxRadioButton2.Checked := False;
  cxRadioButton3.Checked := False;
  MonthPanel.Hide;
  PlannerCalendar1.Hide;
  StartDateData.Hide;
  MiddileData.Hide;
  FinishDateData.Hide;

  Year.Caption          := FormatDateTime('yyyy', Now);
  YearPanel.Show;

  with DateData do begin
    year       := FormatDateTime('yyyy', Now);
    category   := '';
    cdiv       := '';
    citem      := '';
    cmeans     := '';
    ctype      := '';
  end;

  EditSearch.Text    := '';
  ComboCategory.Text := '';
  LabCategory.Show;

  DateSelectAll;
end;

procedure TReportForm.BtnStyle_2MouseEnter(Sender: TObject);
begin
  DataModule1.SetBtnStyle_2(TWinControl(Sender), True);
end;

procedure TReportForm.BtnStyle_2MouseLeave(Sender: TObject);
begin
  DataModule1.SetBtnStyle_2(TWinControl(Sender), False);
end;

procedure TReportForm.BtnMonthClick(Sender: TObject);
begin

  cxRadioButton1.Checked := False;
  cxRadioButton2.Checked := True;
  cxRadioButton3.Checked := False;

  YearPanel.Hide;
  PlannerCalendar1.Hide;
  StartDateData.Hide;
  MiddileData.Hide;
  FinishDateData.Hide;

  Month_Year.Caption    := FormatDateTime('yyyy', Now);
  Month_Month.Caption   := FormatDateTime('mm', Now);
  MonthPanel.Show;

  with DateData do begin
    year       := FormatDateTime('yyyy', Now);
    month      := FormatDateTime('mm', Now);
    category   := '';
    cdiv       := '';
    citem      := '';
    cmeans     := '';
    ctype      := '';
  end;

  EditSearch.Text    := '';
  ComboCategory.Text := '';
  LabCategory.Show;

  DateSelectAll;

end;

procedure TReportForm.BtnTerm2Click(Sender: TObject);
begin

  cxRadioButton1.Checked := False;
  cxRadioButton2.Checked := False;
  cxRadioButton3.Checked := True;

  YearPanel.Hide;
  MonthPanel.Hide;

  StartYear   := '';
  StartMonth  := '';
  StartDay    := '';
  FinishYear  := '';
  FinishMonth := '';
  FinishDay   := '';

  PlannerCalendar1.Date := Now;
  PlannerCalendar1.Show;
end;

procedure TReportForm.BtnTermClick(Sender: TObject);
begin
  cxRadioButton1.Checked := False;
  cxRadioButton2.Checked := False;
  cxRadioButton3.Checked := True;

  YearPanel.Hide;
  MonthPanel.Hide;

  StartYear   := '';
  StartMonth  := '';
  StartDay    := '';
  FinishYear  := '';
  FinishMonth := '';
  FinishDay   := '';

  PlannerCalendar1.Date := Now;
  PlannerCalendar1.Show;  
end;

procedure TReportForm.BtnExcelClick(Sender: TObject);
var
  PHandle : HWND;
begin
  PHandle   := Self.Handle;
  ExcelDataFind(Sender, PHandle);
end;

procedure TReportForm.BtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TReportForm.BtnIncomeSpendingClick(Sender: TObject);
begin
  cxLabel1.hide;
  cxLabel2.Show;
  cxLabel3.Show;
  GRD_SelectAll.Hide;
  GRD_SelectIncome.Show;
  GRD_SelectSpending.Show;
  BtnTotalPrint.Hide;
  BtnTotalExcel.Hide;
  BtnIncomePrint.Show;
  BtnIncomeExcel.Show;
  BtnSpendingPrint.Show;
  BtnSpendingExcel.Show;
end;

procedure TReportForm.EditSearchKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    BtnSearchClick(nil);
  end;
end;

procedure TReportForm.ExcelDataFind(Sender : TObject; PHandle : HWND);
var
  FileName, ComName     : String;
  GridName              : TcxGrid;
  SYear, SMonth, SDay   : String;
  FYear, FMonth, FDay   : String;
begin

  GridName  := nil;
  ComName   := TReportForm(Sender).Name;

  if cxRadioButton1.Checked then begin
    if ComName = 'BtnTotalExcel' then begin
      GridName := GRD_SelectAll;
      FileName   := DateData.year + ' 전체내역';
    end else if ComName = 'BtnIncomeExcel' then begin
      GridName := GRD_SelectIncome;
      FileName   := DateData.year + ' 수입내역';
    end else if ComName = 'BtnSpendingExcel' then begin
      GridName := GRD_SelectSpending;
      FileName   := DateData.year + ' 지출내역';
    end;

  end else if cxRadioButton2.Checked then begin
    if ComName = 'BtnTotalExcel' then begin
      GridName := GRD_SelectAll;
      FileName   := DateData.year + '.' + DateData.month + ' 전체내역';
    end else if ComName = 'BtnIncomeExcel' then begin
      GridName := GRD_SelectIncome;
      FileName   := DateData.year + '.' + DateData.month + ' 수입내역';
    end else if ComName = 'BtnSpendingExcel' then begin
      GridName := GRD_SelectSpending;
      FileName   := DateData.year + '.' + DateData.month + ' 지출내역';
    end;

  end else if cxRadioButton3.Checked then begin
    SYear      := Copy(DateData.StartDate, 1, 4);
    SMonth     := Copy(DateData.StartDate, 6, 2);
    SDay       := Copy(DateData.StartDate, 9, 2);
    FYear      := Copy(DateData.StartDate, 1, 4);
    FMonth     := Copy(DateData.StartDate, 6, 2);
    FDay       := Copy(DateData.StartDate, 9, 2);

    if ComName = 'BtnTotalExcel' then begin
      GridName := GRD_SelectAll;
      FileName   := SYear + '.' + SMonth + '.' + SDay + ' ~ ' + FYear + '.' + FMonth + '.' + FDay + ' 전체내역';
    end else if ComName = 'BtnIncomeExcel' then begin
      GridName := GRD_SelectIncome;
      FileName   := SYear + '.' + SMonth + '.' + SDay + ' ~ ' + FYear + '.' + FMonth + '.' + FDay + ' 수입내역';
    end else if ComName = 'BtnSpendingExcel' then begin
      GridName := GRD_SelectSpending;
      FileName   := SYear + '.' + SMonth + '.' + SDay + ' ~ ' + FYear + '.' + FMonth + '.' + FDay + ' 지출내역';
    end;
  end;

  DataModule1.ExcelRoute(FileName, GridName, PHandle);

end;

procedure TReportForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ReportForm.Free;

end;

procedure TReportForm.FormCreate(Sender: TObject);
begin
  cxRadioButton1.Checked := True;
  cxRadioButton2.Checked := False;
  cxRadioButton3.Checked := False;
  MonthPanel.Hide;
  StartDateData.Hide;
  MiddileData.Hide;
  FinishDateData.Hide;
  PlannerCalendar1.Hide;
  GRD_SelectIncome.Hide;
  GRD_SelectSpending.Hide;
  BtnIncomePrint.Hide;
  BtnIncomeExcel.Hide;
  BtnSpendingPrint.Hide;
  BtnSpendingExcel.Hide;
  cxLabel2.Hide;
  cxLabel3.Hide;
  Year.Caption          := FormatDateTime('yyyy', Now);
  Month_Year.Caption    := FormatDateTime('yyyy', Now);
  Month_Month.Caption   := FormatDateTime('mm', Now);

  with DateData do begin
    year       := FormatDateTime('yyyy', Now);
    month      := '';
    StartDate  := '';
    FinishDate := '';
    category   := '';
    cdiv       := '';
    citem      := '';
    cmeans     := '';
    ctype      := '';
  end;

  QH_SelectAll.Session                              := DataModule1.OraSession1;
  QH_SelectIncome.Session                           := DataModule1.OraSession1;
  QH_SelectSpending.Session                         := DataModule1.OraSession1;

  DH_SelectAll.DataSet                              := QH_SelectAll;
  DH_SelectIncome.DataSet                           := QH_SelectIncome;
  DH_SelectSpending.DataSet                         := QH_SelectSpending;

  Holding_SelectAll.DataController.DataSource       := DH_SelectAll;
  Holding_SelectIncome.DataController.DataSource    := DH_SelectIncome;
  Holding_SelectSpending.DataController.DataSource  := DH_SelectSpending;

  DateSelectAll;

end;

procedure TReportForm.Month_MonthClick(Sender: TObject);
var
  YearVal, MonthVal : String;
  a : Integer;
begin
  YearVal := InputBox('연도 입력', '연도를 입력해주세요.', FormatDateTime('yyyy', Now));

  if TryStrToInt(YearVal, a) then begin
    Month_Year.Caption := YearVal;

    MonthVal := InputBox('월 입력', '월을 입력해주세요.', FormatDateTime('mm', Now));

    if TryStrToInt(MonthVal, a) then begin
      if (StrToInt(MonthVal) > 0) AND (StrToInt(MonthVal) < 10) then begin
        if Pos('0', MonthVal) = 1 then begin
          Month_Month.Caption :=  MonthVal;
        end else begin
          Month_Month.Caption :=  '0' + MonthVal;
        end;
      end else if (StrToInt(MonthVal) > 9) AND (StrToInt(MonthVal) < 13) then begin
        Month_Month.Caption :=  MonthVal;
      end else if (StrToInt(MonthVal) > 12) then begin
        Month_Month.Caption := '12';
      end else if (StrToInt(MonthVal) < 1) then begin
        Month_Month.Caption := '1';
      end;

      DateData.year   := Month_Year.Caption;
      DateData.month  := Month_Month.Caption;

      DateSelectAll;

    end else begin
      ShowMessage('숫자만 입력해주세요.');
    end;
  end else begin
    ShowMessage('숫자만 입력해주세요.');
  end;
end;

procedure TReportForm.Panel2Click(Sender: TObject);
begin
  cxLabel2.hide;
  cxLabel3.hide;
  cxLabel1.Show;
  GRD_SelectIncome.Hide;
  GRD_SelectSpending.Hide;
  GRD_SelectAll.Show;
  BtnTotalPrint.Show;
  BtnTotalExcel.Show;
  BtnIncomePrint.Hide;
  BtnIncomeExcel.Hide;
  BtnSpendingPrint.Hide;
  BtnSpendingExcel.Hide;
end;


procedure TReportForm.PlannerCalendar1DaySelect(Sender: TObject;
  SelDate: TDateTime);
begin
  if StartYear = '' then begin
    StartDate := SelDate;

    StartYear   := FormatDateTime('yyyy', SelDate);
    StartMonth  := FormatDateTime('mm', SelDate);
    StartDay    := FormatDateTime('dd', SelDate);

    StartDateData.Caption := DateToStr(StartDate);
    StartDateData.Show;
    MiddileData.Show;

  end else if FinishYear = '' then begin
    FinishDate := SelDate;

    FinishYear  := FormatDateTime('yyyy', SelDate);
    FinishMonth := FormatDateTime('mm', SelDate);
    FinishDay   := FormatDateTime('dd', SelDate);

    FinishDateData.Caption := DateToStr(FinishDate);

    FinishDateData.Show;

    DateData.StartDate     := StartDateData.Caption;
    DateData.FinishDate    := FinishDateData.Caption;

    with DateData do begin
      category   := '';
      cdiv       := '';
      citem      := '';
      cmeans     := '';
      ctype      := '';
    end;

    EditSearch.Text    := '';
    ComboCategory.Text := '';
    LabCategory.Show;

    DateSelectAll;

  end;

  if (StartYear <> '') AND (FinishYear <> '') then begin
    StartYear   := '';
    StartMonth  := '';
    StartDay    := '';
    FinishYear  := '';
    FinishMonth := '';
    FinishDay   := '';

    PlannerCalendar1.Hide;

  end;

end;

procedure TReportForm.YearClick(Sender: TObject);
var
  YearVal : String;
  a : Integer;
begin
  YearVal := InputBox('연도 입력', '연도를 입력해주세요.', FormatDateTime('yyyy', Now));
  if TryStrToInt(YearVal, a) then begin
    Year.Caption := YearVal;

    DateData.year := Year.Caption;
    DateSelectAll;

  end else begin
    ShowMessage('숫자만 입력해주세요');
  end;

end;

procedure TReportForm.DateSelectAll;
begin

  if cxRadioButton1.Checked = True then begin
    YearSelectAll;
  end else if cxRadioButton2.Checked = True then begin
    MonthSelectAll;
  end else if cxRadioButton3.Checked = True then begin
    TermSelectAll;
  end; 

end;

procedure TReportForm.YearSelectAll;
begin

  with QH_SelectAll do begin
    SQL.Clear;

    SQL.Add('SELECT * FROM hcontents                                                      ');
    SQL.Add('  WHERE cid = :CID AND cnum != 0 AND TO_CHAR(CDATE, ''YYYY'') = :CURYEAR     ');

    if DateData.category = 'cdiv' then begin
      SQL.Add('  AND cdiv LIKE :CDIV                                                      ');
    end else if DateData.category = 'citem' then begin
      SQL.Add('  AND citem LIKE :CITEM                                                    ');
    end else if DateData.category = 'cmeans' then begin
      SQL.Add('  AND cmeans LIKE :CMEANS                                                  ');
    end else if DateData.category = 'ctype' then begin
      SQL.Add('  AND ctype LIKE :CTYPE                                                    ');
    end;

    SQL.Add('  ORDER BY cnum DESC                                                         ');

    ParamByName('CID').AsString         := DataModule1.recMemDate.mid;
    ParamByname('CURYEAR').AsString     := DateData.year;

    if DateData.category = 'cdiv' then begin
      ParamByName('CDIV').AsString      := DateData.cdiv;
    end else if DateData.category = 'citem' then begin
      ParamByName('CITEM').AsString     := DateData.citem;
    end else if DateData.category = 'cmeans' then begin
      ParamByName('CMEANS').AsString    := DateData.cmeans;
    end else if DateData.category = 'ctype' then begin
      ParamByName('CTYPE').AsString     := DateData.ctype;
    end;

    Open;

  end;

  with QH_SelectIncome do begin
    SQL.Clear;

    SQL.Add('SELECT cnum, citem, cmeans, cincome FROM hcontents                                           ');
    SQL.Add('  WHERE cid = :CID AND cnum != 0 AND TO_CHAR(CDATE, ''YYYY'') = :CURYEAR AND cdiv = :CDIV    ');

    if DateData.category = 'cdiv' then begin
      SQL.Add('  AND cdiv LIKE :CDIV                                                      ');
    end else if DateData.category = 'citem' then begin
      SQL.Add('  AND citem LIKE :CITEM                                                    ');
    end else if DateData.category = 'cmeans' then begin
      SQL.Add('  AND cmeans LIKE :CMEANS                                                  ');
    end else if DateData.category = 'ctype' then begin
      SQL.Add('  AND ctype LIKE :CTYPE                                                    ');
    end;

    SQL.Add('  ORDER BY cnum DESC                                                         ');

    ParamByName('CID').AsString         := DataModule1.recMemDate.mid;
    ParamByname('CURYEAR').AsString     := DateData.year;
    ParamByname('CDIV').AsString        := '수입';

    if DateData.category = 'cdiv' then begin
      ParamByName('CDIV').AsString      := DateData.cdiv;
    end else if DateData.category = 'citem' then begin
      ParamByName('CITEM').AsString     := DateData.citem;
    end else if DateData.category = 'cmeans' then begin
      ParamByName('CMEANS').AsString    := DateData.cmeans;
    end else if DateData.category = 'ctype' then begin
      ParamByName('CTYPE').AsString     := DateData.ctype;
    end;

    Open;

  end;

  with QH_SelectSpending do begin
    SQL.Clear;

    SQL.Add('SELECT cnum, citem, cmeans, cspending, ccreditbal FROM hcontents                             ');
    SQL.Add('  WHERE cid = :CID AND cnum != 0 AND TO_CHAR(CDATE, ''YYYY'') = :CURYEAR AND cdiv = :CDIV    ');

    if DateData.category = 'cdiv' then begin
      SQL.Add('  AND cdiv LIKE :CDIV                                                      ');
    end else if DateData.category = 'citem' then begin
      SQL.Add('  AND citem LIKE :CITEM                                                    ');
    end else if DateData.category = 'cmeans' then begin
      SQL.Add('  AND cmeans LIKE :CMEANS                                                  ');
    end else if DateData.category = 'ctype' then begin
      SQL.Add('  AND ctype LIKE :CTYPE                                                    ');
    end;

    SQL.Add('  ORDER BY cnum DESC                                                         ');

    ParamByName('CID').AsString         := DataModule1.recMemDate.mid;
    ParamByname('CURYEAR').AsString     := DateData.year;
    ParamByname('CDIV').AsString        := '지출';

    if DateData.category = 'cdiv' then begin
      ParamByName('CDIV').AsString      := DateData.cdiv;
    end else if DateData.category = 'citem' then begin
      ParamByName('CITEM').AsString     := DateData.citem;
    end else if DateData.category = 'cmeans' then begin
      ParamByName('CMEANS').AsString    := DateData.cmeans;
    end else if DateData.category = 'ctype' then begin
      ParamByName('CTYPE').AsString     := DateData.ctype;
    end;

    Open;

  end;

end;

procedure TReportForm.MonthSelectAll;
begin
  with QH_SelectAll do begin
    SQL.Clear;
    SQL.Add('SELECT * FROM hcontents                                                        ');
    SQL.Add('  WHERE cid = :CID AND cnum != 0 AND TO_CHAR(CDATE, ''YYYYMM'') = :CURMONTH    ');

    if DateData.category = 'cdiv' then begin
      SQL.Add('  AND cdiv LIKE :CDIV                                                        ');
    end else if DateData.category = 'citem' then begin
      SQL.Add('  AND citem LIKE :CITEM                                                      ');
    end else if DateData.category = 'cmeans' then begin
      SQL.Add('  AND cmeans LIKE :CMEANS                                                    ');
    end else if DateData.category = 'ctype' then begin
      SQL.Add('  AND ctype LIKE :CTYPE                                                      ');
    end;

    SQL.Add('  ORDER BY cnum DESC                                                           ');

    ParamByName('CID').AsString          := DataModule1.recMemDate.mid;
    ParamByName('CURMONTH').AsString     := DateData.year + DateData.Month;

    if DateData.category = 'cdiv' then begin
      ParamByName('CDIV').AsString      := DateData.cdiv;
    end else if DateData.category = 'citem' then begin
      ParamByName('CITEM').AsString     := DateData.citem;
    end else if DateData.category = 'cmeans' then begin
      ParamByName('CMEANS').AsString    := DateData.cmeans;
    end else if DateData.category = 'ctype' then begin
      ParamByName('CTYPE').AsString     := DateData.ctype;
    end;

    Open;

  end;

  with QH_SelectIncome do begin
    SQL.Clear;

    SQL.Add('SELECT cnum, citem, cmeans, cincome FROM hcontents                                              ');
    SQL.Add('  WHERE cid = :CID AND cnum != 0 AND TO_CHAR(CDATE, ''YYYYMM'') = :CURMONTH AND cdiv = :CDIV    ');

    if DateData.category = 'cdiv' then begin
      SQL.Add('  AND cdiv LIKE :CDIV                                                      ');
    end else if DateData.category = 'citem' then begin
      SQL.Add('  AND citem LIKE :CITEM                                                    ');
    end else if DateData.category = 'cmeans' then begin
      SQL.Add('  AND cmeans LIKE :CMEANS                                                  ');
    end else if DateData.category = 'ctype' then begin
      SQL.Add('  AND ctype LIKE :CTYPE                                                    ');
    end;

    SQL.Add('  ORDER BY cnum DESC                                                         ');

    ParamByName('CID').AsString          := DataModule1.recMemDate.mid;
    ParamByName('CURMONTH').AsString     := DateData.year + DateData.Month;
    ParamByname('CDIV').AsString         := '수입';

    if DateData.category = 'cdiv' then begin
      ParamByName('CDIV').AsString      := DateData.cdiv;
    end else if DateData.category = 'citem' then begin
      ParamByName('CITEM').AsString     := DateData.citem;
    end else if DateData.category = 'cmeans' then begin
      ParamByName('CMEANS').AsString    := DateData.cmeans;
    end else if DateData.category = 'ctype' then begin
      ParamByName('CTYPE').AsString     := DateData.ctype;
    end;

    Open;

  end;

  with QH_SelectSpending do begin
    SQL.Clear;

    SQL.Add('SELECT cnum, citem, cmeans, cspending, ccreditbal FROM hcontents                                ');
    SQL.Add('  WHERE cid = :CID AND cnum != 0 AND TO_CHAR(CDATE, ''YYYYMM'') = :CURMONTH AND cdiv = :CDIV    ');

    if DateData.category = 'cdiv' then begin
      SQL.Add('  AND cdiv LIKE :CDIV                                                      ');
    end else if DateData.category = 'citem' then begin
      SQL.Add('  AND citem LIKE :CITEM                                                    ');
    end else if DateData.category = 'cmeans' then begin
      SQL.Add('  AND cmeans LIKE :CMEANS                                                  ');
    end else if DateData.category = 'ctype' then begin
      SQL.Add('  AND ctype LIKE :CTYPE                                                    ');
    end;

    SQL.Add('  ORDER BY cnum DESC                                                         ');

    ParamByName('CID').AsString          := DataModule1.recMemDate.mid;
    ParamByName('CURMONTH').AsString     := DateData.year + DateData.Month;
    ParamByname('CDIV').AsString         := '지출';

    if DateData.category = 'cdiv' then begin
      ParamByName('CDIV').AsString      := DateData.cdiv;
    end else if DateData.category = 'citem' then begin
      ParamByName('CITEM').AsString     := DateData.citem;
    end else if DateData.category = 'cmeans' then begin
      ParamByName('CMEANS').AsString    := DateData.cmeans;
    end else if DateData.category = 'ctype' then begin
      ParamByName('CTYPE').AsString     := DateData.ctype;
    end;

    Open;

  end;

end;

procedure TReportForm.TermSelectAll;
begin
  with QH_SelectAll do begin
    SQL.Clear;
    SQL.Add('SELECT * FROM hcontents                                                                           ');
    SQL.Add('  WHERE cid = :CID AND cnum != 0 AND TO_CHAR(CDATE, ''YYYYMMDD'') BETWEEN :STARTDATE AND :ENDDATE ');

    if DateData.category = '구분' then begin
      SQL.Add('  AND cdiv LIKE :CDIV                                                      ');
    end else if DateData.category = 'citem' then begin
      SQL.Add('  AND citem LIKE :CITEM                                                    ');
    end else if DateData.category = 'cmeans' then begin
      SQL.Add('  AND cmeans LIKE :CMEANS                                                  ');
    end else if DateData.category = 'ctype' then begin
      SQL.Add('  AND ctype LIKE :CTYPE                                                    ');
    end;

    SQL.Add('  ORDER BY cnum DESC                                                                              ');

    ParamByName('CID').AsString          := DataModule1.recMemDate.mid;
    ParamByName('STARTDATE').AsString    := FormatDateTime('YYYYMMDD', StrToDate(DateData.StartDate));
    ParamByName('ENDDATE').AsString      := FormatDateTime('YYYYMMDD', StrToDate(DateData.FinishDate));

    if DateData.category = 'cdiv' then begin
      ParamByName('CDIV').AsString      := DateData.cdiv;
    end else if DateData.category = 'citem' then begin
      ParamByName('CITEM').AsString     := DateData.citem;
    end else if DateData.category = 'cmeans' then begin
      ParamByName('CMEANS').AsString    := DateData.cmeans;
    end else if DateData.category = 'ctype' then begin
      ParamByName('CTYPE').AsString     := DateData.ctype;
    end;

    Open;

  end;

  with QH_SelectIncome do begin
    SQL.Clear;

    SQL.Add('SELECT cnum, citem, cmeans, cincome FROM hcontents                                                                    ');
    SQL.Add('  WHERE cid = :CID AND cnum != 0 AND TO_CHAR(CDATE, ''YYYYMMDD'') BETWEEN :STARTDATE AND :ENDDATE AND cdiv = :CDIV    ');

    if DateData.category = '구분' then begin
      SQL.Add('  AND cdiv LIKE :CDIV                                                      ');
    end else if DateData.category = 'citem' then begin
      SQL.Add('  AND citem LIKE :CITEM                                                    ');
    end else if DateData.category = 'cmeans' then begin
      SQL.Add('  AND cmeans LIKE :CMEANS                                                  ');
    end else if DateData.category = 'ctype' then begin
      SQL.Add('  AND ctype LIKE :CTYPE                                                    ');
    end;

    SQL.Add('  ORDER BY cnum DESC                                                         ');

    ParamByName('CID').AsString          := DataModule1.recMemDate.mid;
    ParamByName('STARTDATE').AsString    := FormatDateTime('YYYYMMDD', StrToDate(DateData.StartDate));
    ParamByName('ENDDATE').AsString      := FormatDateTime('YYYYMMDD', StrToDate(DateData.FinishDate));
    ParamByname('CDIV').AsString         := '수입';

    if DateData.category = 'cdiv' then begin
      ParamByName('CDIV').AsString      := DateData.cdiv;
    end else if DateData.category = 'citem' then begin
      ParamByName('CITEM').AsString     := DateData.citem;
    end else if DateData.category = 'cmeans' then begin
      ParamByName('CMEANS').AsString    := DateData.cmeans;
    end else if DateData.category = 'ctype' then begin
      ParamByName('CTYPE').AsString     := DateData.ctype;
    end;

    Open;

  end;

  with QH_SelectSpending do begin
    SQL.Clear;

    SQL.Add('SELECT cnum, citem, cmeans, cspending, ccreditbal FROM hcontents                                                      ');
    SQL.Add('  WHERE cid = :CID AND cnum != 0 AND TO_CHAR(CDATE, ''YYYYMMDD'') BETWEEN :STARTDATE AND :ENDDATE AND cdiv = :CDIV    ');

    if DateData.category = '구분' then begin
      SQL.Add('  AND cdiv LIKE :CDIV                                                      ');
    end else if DateData.category = 'citem' then begin
      SQL.Add('  AND citem LIKE :CITEM                                                    ');
    end else if DateData.category = 'cmeans' then begin
      SQL.Add('  AND cmeans LIKE :CMEANS                                                  ');
    end else if DateData.category = 'ctype' then begin
      SQL.Add('  AND ctype LIKE :CTYPE                                                    ');
    end;

    SQL.Add('  ORDER BY cnum DESC                                                         ');

    ParamByName('CID').AsString          := DataModule1.recMemDate.mid;
    ParamByName('STARTDATE').AsString    := FormatDateTime('YYYYMMDD', StrToDate(DateData.StartDate));
    ParamByName('ENDDATE').AsString      := FormatDateTime('YYYYMMDD', StrToDate(DateData.FinishDate));
    ParamByname('CDIV').AsString         := '수입';

    if DateData.category = 'cdiv' then begin
      ParamByName('CDIV').AsString      := DateData.cdiv;
    end else if DateData.category = 'citem' then begin
      ParamByName('CITEM').AsString     := DateData.citem;
    end else if DateData.category = 'cmeans' then begin
      ParamByName('CMEANS').AsString    := DateData.cmeans;
    end else if DateData.category = 'ctype' then begin
      ParamByName('CTYPE').AsString     := DateData.ctype;
    end;

    Open;

  end;

end;

procedure TReportForm.BtnStyle_1MouseEnter(Sender: TObject);
begin
  DataModule1.SetBtnStyle_1(TWinControl(Sender), True);
end;

procedure TReportForm.BtnStyle_1MouseLeave(Sender: TObject);
begin
  DataModule1.SetBtnStyle_1(TWinControl(Sender), False);
end;

end.
