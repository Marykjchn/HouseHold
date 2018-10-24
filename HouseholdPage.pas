unit HouseholdPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, ExtCtrls, ComCtrls,
  PlannerCal, DBPlannerCal, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxTextEdit, cxMemo, cxDBEdit, StdCtrls, cxButtons, cxContainer,
  cxLabel, DBAccess, Ora, MemDS, cxMaskEdit, cxDropDownEdit, cxRadioGroup,
  Grids, Calendar, DateUtils, PlannerMonthView, DBPlannerMonthView, AdvEdit,
  AdvEdBtn, PlannerDatePicker, cxCurrencyEdit, ImgList, cxCalendar;

const
  WM_LOCALMESSAGE = WM_USER + 1000;
  WM_LOCALMESSAGE2 = WM_USER + 1001;
  WM_LOCALMESSAGE3 = WM_USER + 1002;
type
  Tholddata = record
    cno, cnum, cincome, cspending, camount, ccreditspending : Integer;
    cid, cdiv, citem, cmeans, ctype                         : String;
    cdate                                                   : TDateTime;
  end;

type
  TGridUpdateData = record
    cincome, cspending : Integer;
  end;

type
  TInputboxUpdateData = record
    InputWtitle, InputTitle, InputValue   : String;
    ColumnName, citem                     : String;
    cnum, BefValue, AftValue              : Integer;
  end;

type
  TGridDeleteData = record
    cnum, camount : Integer;
  end;

type
  THouseHoldForm = class(TForm)
    DHContents_SelectAll: TOraDataSource;
    QHContents_SelectAll: TOraQuery;
    PopupMenu1: TPopupMenu;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    QHContents_SelectIncome: TOraQuery;
    QHContents_SelectSpending: TOraQuery;
    DHContents_SelectIncome: TOraDataSource;
    DHContents_SelectSpending: TOraDataSource;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    GRD_Income: TcxGrid;
    Simple_Income: TcxGridDBTableView;
    Simple_IncomeColumn1: TcxGridDBColumn;
    Simple_IncomeColumn2: TcxGridDBColumn;
    Simple_IncomeColumn3: TcxGridDBColumn;
    Simple_IncomeColumn4: TcxGridDBColumn;
    GRD_IncomeLevel1: TcxGridLevel;
    GRD_Spending: TcxGrid;
    Simple_Spending: TcxGridDBTableView;
    Simple_SpendingColumn1: TcxGridDBColumn;
    Simple_SpendingColumn2: TcxGridDBColumn;
    Simple_SpendingColumn3: TcxGridDBColumn;
    Simple_SpendingColumn4: TcxGridDBColumn;
    Simple_SpendingColumn5: TcxGridDBColumn;
    GRD_SpendingLevel1: TcxGridLevel;
    GRD_Holding: TcxGrid;
    Total_Holding: TcxGridDBTableView;
    Total_HoldingColumn1: TcxGridDBColumn;
    Total_HoldingColumn2: TcxGridDBColumn;
    Total_HoldingColumn3: TcxGridDBColumn;
    Total_HoldingColumn4: TcxGridDBColumn;
    Total_HoldingColumn5: TcxGridDBColumn;
    Total_HoldingColumn6: TcxGridDBColumn;
    Total_HoldingColumn7: TcxGridDBColumn;
    Total_HoldingColumn8: TcxGridDBColumn;
    Total_HoldingColumn9: TcxGridDBColumn;
    Total_HoldingColumn10: TcxGridDBColumn;
    GRD_HoldingLevel1: TcxGridLevel;
    cxMemo1: TcxMemo;
    BtnAnniversaryEdit: TPanel;
    BtnFixBreakdownEdit: TPanel;
    BtnClose: TPanel;
    BtnReportShow: TPanel;
    BtnHoldingUpdate: TPanel;
    BtnHoldingDelete: TPanel;
    BtnHoldingAction: TPanel;
    BtnIncomeDelete: TPanel;
    BtnIncomeUpdate: TPanel;
    BtnSpendingDelete: TPanel;
    BtnSpendingUpdate: TPanel;
    BtnIncomeAction: TPanel;
    BtnSpendingAction: TPanel;
    BtnMemoClear: TPanel;
    BtnMemoStore: TPanel;
    BtnMemoUpdate: TPanel;
    Panel2: TPanel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    ComboType: TcxComboBox;
    LabDate: TcxLabel;
    Panel3: TPanel;
    RadioDiv1: TcxRadioButton;
    RadioDiv2: TcxRadioButton;
    Panel4: TPanel;
    RadioMeans1: TcxRadioButton;
    RadioMeans2: TcxRadioButton;
    RadioMeans3: TcxRadioButton;
    ComboItem: TcxComboBox;
    cxLabel11: TcxLabel;
    BtnClear: TPanel;
    BtnStore: TPanel;
    BtnHouseHoldEdit: TPanel;
    BtnItemDel: TPanel;
    BtnTypeDel: TPanel;
    BtnItemAdd: TPanel;
    BtnTypeAdd: TPanel;
    DBPlannerMonthView1: TDBPlannerMonthView;
    BtnUpdateMem: TPanel;
    BtnTotalExcel: TImage;
    BtnTotalPrint: TImage;
    BtnSpendingPrint: TImage;
    BtnSpendingExcel: TImage;
    BtnIncomeExcel: TImage;
    BtnIncomePrint: TImage;
    ComboAmount: TcxCurrencyEdit;

    // ---------------- �� ----------------
    // �� ������ grid�� �⺻�� ����
    procedure FormCreate(Sender: TObject);

    // ---------------- �׸� ��� ----------------
    // ���� �׸� ��� procedure
    procedure IncomeItemSelect;
    // ���� �׸� ��� procedure
    procedure SpendingItemSelect;


    // ---------------- �׸� ���� ----------------
    // �׸� �߰� ��ư Ŭ���� �׸� INSERT
    procedure BtnItemAddClick(Sender: TObject);
    // �׸� ���� ��ư Ŭ���� �׸� DELETE
    procedure BtnItemDel2Click(Sender: TObject);


    // ---------------- ī����׸� ��� ----------------
    // ī��� �׸� ��� procedure
    procedure TypeSelect;


    // ---------------- ī����׸� ���� ----------------
    // ī��� �߰� ��ư Ŭ���� Insert
    procedure BtnTypeAddClick(Sender: TObject);
    // ī��� ���� ��ư Ŭ���� Delete
    procedure BtnTypeDelClick(Sender: TObject);


    // ---------------- ��ư ----------------
    // ����� �Է� �ʱ�ȭ�� Edit�׸� �ʱ�ȭ
    procedure BtnClearClick(Sender: TObject);
    // ����� �Է¶� ���� ��ư Ŭ���� DB����
    procedure BtnStoreClick(Sender: TObject);
    // ���� ���� ��ư Ŭ���� �޺��ڽ� Enable ����
    procedure RadioMeansClick(Sender: TObject);
    // ���� ���� ��ư Ŭ���� �޺��ڽ� ����
    procedure RadioDivClick(Sender: TObject);
    // �ݱ� ��ư Ŭ���� �� ����
    procedure BtnCloseClick(Sender: TObject);
    // �Է¶� ���� ��ư Ŭ���� Edit���
    procedure BtnHouseHoldEditClick(Sender: TObject);
    // ���� ���� ���� ��ư Ŭ���� Edit ���â
    procedure BtnFixBreakdownEditClick(Sender: TObject);
    // ����� ���� ��ư Ŭ�� Edit ���â
    procedure BtnAnniversaryEditClick(Sender: TObject);
    // ������ ��ư Ŭ���� Form Show
    procedure BtnReportShowClick(Sender: TObject);
    // �������� ���� ��ư Ŭ���� Form ShowModal
    procedure BtnUpdateMemClick(Sender: TObject);


    // ----------------- �޷� -----------------
    // �޷¿��� �����ѳ�¥�� Label�� �Ѹ�
    procedure DBPlannerCalendar1DaySelect(Sender: TObject; SelDate: TDateTime);


    // ----------------- �޸� -----------------
    // �޸�� change�Ҷ� �̺�Ʈ
    procedure cxMemo1PropertiesChange(Sender: TObject);
    // �޸� ���� ���
    procedure MemoSelect;
    // �޸� ���� ��ư Ŭ����
    procedure BtnMemoUpdateClick(Sender: TObject);
    // �޸� �ʱ�ȭ ��ư Ŭ��
    procedure BtnMemoClearClick(Sender: TObject);
    // �޸� ���� �� ���� ��ư Ŭ���� ���� �� ����
    procedure BtnMemoStore2Click(Sender: TObject);


    // ----------------- �Է� ��ó�� -----------------
    // ���ڸ� �Է°���
    procedure ComboAmount3KeyPress(Sender: TObject; var Key: Char);
    // �ſ�ī���� �����ϰ�� �ſ�ī�� ���� �Ұ�
    procedure ComboItemExit(Sender: TObject);


    // ----------------- ���������� �׸��� ��� -----------------
    procedure HoldAllDataView;
    procedure HoldIncomeDataView;
    procedure HoldSpendingDataView;


    // ----------------- ���������� �׸��� ���� -----------------
    // �׸��� Ŭ���� �ش� ���ڵ��� row ������ ������ ���ǹ�
    procedure HouseHoldingCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    // ��ü �׸��� ����(Income��)
    procedure UpdateGrid_Income(UValue : String);
    // ��ü �׸��� ����(Spending��)
    procedure UpdateGrid_Spending(UValue : String);
    // ���� �׸��� ���� ��ư Ŭ���� �̺�Ʈ
    procedure BtnIncomeUpdateClick(Sender: TObject);
    // ���� �׸��� ���� ��ư Ŭ���� �̺�Ʈ
    procedure BtnSpendingUpdateClick(Sender: TObject);
    // ��ü �׸��� ���� ��ư Ŭ���� �̺�Ʈ
    procedure BtnMemoStoreClick(Sender: TObject);


    // ----------------- ��ü �׸��� ���� -----------------
    // ��ü �׸��� ������ ���ǹ�
    procedure UpdateGrid_SelectAll;


    // ----------------- ���� �׸��� ���� -----------------
    // ���� �׸��� ����
    procedure UpdateGrid_SelectIncome;


    // ----------------- ���� �׸��� ���� -----------------
    // ���� �׸��� ����
    procedure UpdateGrid_SelectSpending;


    // ----------------- ���������� �׸��� ���� -----------------
    // ���� �׸��� ���� ���� Ŭ���� �̺�Ʈ
    procedure BtnIncomeDeleteClick(Sender: TObject);
    // ���� �׸��� ���� ��ư Ŭ���� �̺�Ʈ
    procedure BtnSpendingDeleteClick(Sender: TObject);
    // ��ü �׸��� ���� ��ư Ŭ���� �̺�Ʈ
    procedure BtnHoldingDeleteClick(Sender: TObject);

    // ----------------- �׸��� ���� -----------------
    procedure DeleteGrid;

    // ----------------- �׸��� ������ ���� -----------------
    procedure localmessage(var msg  : TMessage); message WM_LOCALMESSAGE;
    procedure localmessage2(var msg  : TMessage); message WM_LOCALMESSAGE2;
    procedure localmessage3(var msg  : TMessage); message WM_LOCALMESSAGE3;
    procedure Total_HoldingMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnHoldingUpdateClick(Sender: TObject);

    // ----------------- �޷¿� ����� ǥ�� -----------------
    procedure CalenderViewAnniversary;
    procedure DBPlannerMonthView1MonthChanged(Sender: TObject; origDate,
      newDate: TDateTime);
    procedure DBPlannerMonthView1YearChanged(Sender: TObject; origDate,
      newDate: TDateTime);

    // --------------- ���콺 ȣ���� �� ���� ---------------
    procedure BtnAnniversaryEditMouseEnter(Sender: TObject);
    procedure BtnAnniversaryEditMouseLeave(Sender: TObject);
    procedure BtnFixBreakdownEditMouseEnter(Sender: TObject);
    procedure BtnFixBreakdownEditMouseLeave(Sender: TObject);
    procedure BtnReportShowMouseEnter(Sender: TObject);
    procedure BtnReportShowMouseLeave(Sender: TObject);
    procedure BtnCloseMouseEnter(Sender: TObject);
    procedure BtnCloseMouseLeave(Sender: TObject);
    procedure BtnStoreMouseEnter(Sender: TObject);
    procedure BtnStoreMouseLeave(Sender: TObject);
    procedure BtnClearMouseEnter(Sender: TObject);
    procedure BtnClearMouseLeave(Sender: TObject);
    procedure BtnHouseHoldEditMouseEnter(Sender: TObject);
    procedure BtnHouseHoldEditMouseLeave(Sender: TObject);
    procedure BtnUpdateMemMouseEnter(Sender: TObject);
    procedure BtnUpdateMemMouseLeave(Sender: TObject);
    procedure BtnItemAddMouseEnter(Sender: TObject);
    procedure BtnItemAddMouseLeave(Sender: TObject);
    procedure BtnItemDelMouseEnter(Sender: TObject);
    procedure BtnItemDelMouseLeave(Sender: TObject);
    procedure BtnTypeAddMouseEnter(Sender: TObject);
    procedure BtnTypeAddMouseLeave(Sender: TObject);
    procedure BtnTypeDelMouseLeave(Sender: TObject);
    procedure BtnTypeDelMouseEnter(Sender: TObject);
    procedure BtnIncomeUpdateMouseEnter(Sender: TObject);
    procedure BtnIncomeUpdateMouseLeave(Sender: TObject);
    procedure BtnIncomeDeleteMouseLeave(Sender: TObject);
    procedure BtnIncomeDeleteMouseEnter(Sender: TObject);
    procedure BtnSpendingUpdateMouseEnter(Sender: TObject);
    procedure BtnSpendingUpdateMouseLeave(Sender: TObject);
    procedure BtnSpendingDeleteMouseEnter(Sender: TObject);
    procedure BtnHoldingUpdateMouseEnter(Sender: TObject);
    procedure BtnHoldingUpdateMouseLeave(Sender: TObject);
    procedure BtnHoldingDeleteMouseEnter(Sender: TObject);
    procedure BtnHoldingDeleteMouseLeave(Sender: TObject);
    procedure BtnMemoStoreMouseEnter(Sender: TObject);
    procedure BtnMemoStoreMouseLeave(Sender: TObject);
    procedure BtnMemoUpdateMouseEnter(Sender: TObject);
    procedure BtnMemoUpdateMouseLeave(Sender: TObject);
    procedure BtnMemoClearMouseEnter(Sender: TObject);
    procedure BtnMemoClearMouseLeave(Sender: TObject);
    procedure BtnSpendingDeleteMouseLeave(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure ComboAmountKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);






    { �׸��� Update Procedure
    procedure QHContents_SelectAllAfterPost(DataSet: TDataSet);
    procedure QHContents_SelectIncomeAfterPost(DataSet: TDataSet);
    procedure QHContents_SelectSpendingAfterPost(DataSet: TDataSet);}


  private

  public
    GridUpdateData     : TGridUpdateData;
    GridDeleteData     : TGridDeleteData;
    InputboxUpdateData : TInputboxUpdateData;
  end;

var
  HouseHoldForm: THouseHoldForm;
  MaxNum : Integer;

implementation



{$R *.dfm}

//{$IFDEF USE_CODESITE}uses CodeSiteLogging{$ENDIF}
//  ,DataModule, ReportPage, SolnLun, AnniversaryEditPage, FixBreakdownEditPage, MemInfoPage;

uses
  DataModule, ReportPage, SolnLun, AnniversaryEditPage, FixBreakdownEditPage, MemInfoPage,
  HDataMethod;


//procedure THouseHoldForm.DBPlannerCalendar1DateChange(Sender: TObject; origDate,
//  newDate: TDateTime);
//begin
//  {$IFDEF USE_CODESITE}CODESITE.EnterMethod( Self, 'DBPlannerCalendar1DateChange' );{$ENDIF}
//        {$IFDEF USE_CODESITE}CodeSite.Send('origDate', formatdateTime( 'yyyymmdd', origDate) ); {$ENDIF}
//        {$IFDEF USE_CODESITE}CodeSite.Send('origDate', formatdateTime( 'yyyymmdd', newDate) ); {$ENDIF}
//  {$IFDEF USE_CODESITE}CODESITE.ExitMethod( Self, 'DBPlannerCalendar1DateChange' );{$ENDIF}
//
//end;


procedure THouseHoldForm.BtnCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure THouseHoldForm.BtnCloseMouseEnter(Sender: TObject);
begin
 BtnClose.Color := $00C66300;
end;

procedure THouseHoldForm.BtnCloseMouseLeave(Sender: TObject);
begin
  BtnClose.Color := $00FF9E3E;
end;

procedure THouseHoldForm.BtnHoldingDeleteClick(Sender: TObject);
begin
  if BtnHoldingDelete.Caption = '��  ��' then begin
    BtnHoldingUpdate.Caption             := '��  ȸ';
    BtnHoldingDelete.Caption             := '��  ��';
    BtnHoldingAction.Caption             := '���Ÿ��';
  end else begin
    BtnHoldingDelete.Caption             := '��  ��';
    BtnHoldingAction.Caption             := '�������';
  end;
end;

procedure THouseHoldForm.BtnHoldingDeleteMouseEnter(Sender: TObject);
begin
  BtnHoldingDelete.Color := $00FFAB57;
end;

procedure THouseHoldForm.BtnHoldingDeleteMouseLeave(Sender: TObject);
begin
  BtnHoldingDelete.Color := $00FFBF80;
end;

procedure THouseHoldForm.BtnHoldingUpdateClick(Sender: TObject);
begin
  if BtnHoldingUpdate.Caption = '��  ��' then begin
    BtnHoldingUpdate.Caption             := '��  ȸ';
    BtnHoldingAction.Caption             := '�������';
  end else begin
    BtnHoldingUpdate.Caption             := '��  ��';
    BtnHoldingDelete.Caption             := '��  ��';
    BtnHoldingAction.Caption             := '��ȸ���';
  end;
end;

procedure THouseHoldForm.BtnHoldingUpdateMouseEnter(Sender: TObject);
begin
  BtnHoldingUpdate.Color := $00FFAB57;
end;

procedure THouseHoldForm.BtnHoldingUpdateMouseLeave(Sender: TObject);
begin
  BtnHoldingUpdate.Color := $00FFBF80;
end;

procedure THouseHoldForm.BtnMemoStoreClick(Sender: TObject);
var
  memo , btnClick : String;
begin

  memo := cxMemo1.Lines.Text;

  try
    with DataModule1.QH_DML do begin

      if BtnMemoStore.Caption = '��   ��' then begin
        SQL.Clear;
        SQL.Add('INSERT INTO hmemo (mnum, mdate, mid ,mmemo)          ');
        SQL.Add('  VALUES (hmemo_seq.nextval, :MDATE, :MID, :MMEMO)   ');

      end else if BtnMemoStore.Caption = '��   ��' then begin

        SQL.Clear;
        SQL.Add('UPDATE hmemo                            ');
        SQL.Add('  SET mmemo = :MMEMO, regdate = SYSDATE ');
        SQL.Add('  WHERE mid = :MID AND mdate = :MDATE   ');

      end;

      ParamByName('MDATE').AsString   := LabDate.Caption;
      ParamByName('MID').AsString     := DataModule1.recMemDate.mid;
      ParamByName('MMEMO').AsString   := memo;

      ExecSQL;

      btnClick := StringReplace(BtnMemoStore.Caption, ' ', '', [rfReplaceAll, rfIgnoreCase]);

      ShowMessage(btnClick + ' �Ϸ�');

      BtnMemoStore.Caption  := '��   ��';
      BtnMemoStore.Enabled  := False;
      BtnMemoUpdate.Caption := '��   ��';
      BtnMemoUpdate.Enabled := True;

    end;

  finally
  end;


end;

procedure THouseHoldForm.BtnMemoStoreMouseEnter(Sender: TObject);
begin
  BtnMemoStore.Color := $00FFAB57;
end; 

procedure THouseHoldForm.BtnMemoStoreMouseLeave(Sender: TObject);
begin
  BtnMemoStore.Color := $00FFBF80;
end;

procedure THouseHoldForm.BtnHouseHoldEditClick(Sender: TObject);
begin
  if BtnHouseHoldEdit.Caption = '��  ��' then begin

    BtnHouseHoldEdit.Caption  := 'Ȯ  ��';
    ComboItem.Width           := 170;
    ComboType.Width           := 170;
    BtnStore.Enabled          := False;
    BtnClear.Enabled          := False;
    ComboType.Enabled         := True;
    BtnItemAdd.Show;
    BtnItemDel.Show;
    BtnTypeAdd.Show;
    BtnTypeDel.Show;

  end else if BtnHouseHoldEdit.Caption = 'Ȯ  ��' then begin

    BtnHouseHoldEdit.Caption  := '��  ��';
    ComboItem.Width           := 240;
    ComboType.Width           := 240;
    ComboAmount.Width         := 240;
    BtnStore.Enabled          := True;
    BtnClear.Enabled          := True;

    if RadioMeans1.Checked = True then begin
      ComboType.Enabled       := False;
    end;

    BtnItemAdd.Hide;
    BtnItemDel.Hide;
    BtnTypeAdd.Hide;
    BtnTypeDel.Hide;
  end;
           

end;

procedure THouseHoldForm.BtnHouseHoldEditMouseEnter(Sender: TObject);
begin
  BtnHouseHoldEdit.Color := $00C66300;
end;

procedure THouseHoldForm.BtnHouseHoldEditMouseLeave(Sender: TObject);
begin
  BtnHouseHoldEdit.Color := $00FF9E3E;
end;

procedure THouseHoldForm.BtnIncomeDeleteClick(Sender: TObject);
begin
  if BtnIncomeDelete.Caption = '��  ��' then begin
    BtnIncomeDelete.Caption             := '��  ��';
    BtnIncomeUpdate.Caption             := '��  ȸ';
    BtnIncomeAction.Caption             := '���Ÿ��';
  end else begin
    BtnIncomeDelete.Caption             := '��  ��';
    BtnIncomeAction.Caption             := '�������';
  end;
end;

procedure THouseHoldForm.BtnIncomeDeleteMouseEnter(Sender: TObject);
begin
  BtnIncomeDelete.Color := $00FFAB57;
end;

procedure THouseHoldForm.BtnIncomeDeleteMouseLeave(Sender: TObject);
begin
  BtnIncomeDelete.Color := $00FFBF80;
end;

procedure THouseHoldForm.BtnIncomeUpdateClick(Sender: TObject);
begin
  if BtnIncomeUpdate.Caption = '��  ��' then begin
    BtnIncomeUpdate.Caption             := '��  ȸ';
    BtnIncomeAction.Caption             := '�������';
  end else begin
    BtnIncomeUpdate.Caption             := '��  ��';
    BtnIncomeDelete.Caption             := '��  ��';
    BtnIncomeAction.Caption             := '��ȸ���';
  end;
end;

procedure THouseHoldForm.BtnIncomeUpdateMouseEnter(Sender: TObject);
begin
  BtnIncomeUpdate.Color := $00FFAB57;
end;


procedure THouseHoldForm.BtnIncomeUpdateMouseLeave(Sender: TObject);
begin
  BtnIncomeUpdate.Color := $00FFBF80;
end;

procedure THouseHoldForm.BtnSpendingDeleteClick(Sender: TObject);
begin
  if BtnSpendingDelete.Caption = '��  ��' then begin
    BtnSpendingDelete.Caption             := '��  ��';
    BtnSpendingUpdate.Caption             := '��  ȸ';
    BtnSpendingAction.Caption             := '���Ÿ��';
  end else begin
    BtnSpendingDelete.Caption             := '��  ��';
    BtnSpendingAction.Caption             := '�������';
  end;
end;

procedure THouseHoldForm.BtnSpendingDeleteMouseEnter(Sender: TObject);
begin
  BtnSpendingDelete.Color := $00FFAB57;
end;

procedure THouseHoldForm.BtnSpendingDeleteMouseLeave(Sender: TObject);
begin
  BtnSpendingDelete.Color := $00FFBF80;
end;

procedure THouseHoldForm.BtnSpendingUpdateClick(Sender: TObject);
begin
  if BtnSpendingUpdate.Caption = '��  ��' then begin
    BtnSpendingUpdate.Caption             := '��  ȸ';
    BtnSpendingAction.Caption             := '�������';
  end else begin
    BtnSpendingUpdate.Caption             := '��  ��';
    BtnSpendingDelete.Caption             := '��  ��';
    BtnSpendingAction.Caption             := '��ȸ���';
  end;
end;

procedure THouseHoldForm.BtnSpendingUpdateMouseEnter(Sender: TObject);
begin
  BtnSpendingUpdate.Color := $00FFAB57;
end;

procedure THouseHoldForm.BtnSpendingUpdateMouseLeave(Sender: TObject);
begin
  BtnSpendingUpdate.Color := $00FFBF80;
end;

procedure THouseHoldForm.BtnItemAddClick(Sender: TObject);
var
  SelDiv, InputValue, id : String;
begin
  id := DataModule1.recMemDate.mid;

  if RadioDiv1.Checked then begin
    SelDiv := StringReplace(RadioDiv1.Caption, ' ', '', [rfReplaceAll, rfIgnoreCase]);
  end else begin
    SelDiv := StringReplace(RadioDiv2.Caption, ' ', '', [rfReplaceAll, rfIgnoreCase]);
  end;

  InputValue := InputBox(SelDiv + ' �׸�' ,'�߰��� ' + SelDiv + '�׸��� �Է����ּ���', ComboItem.Text);

  if InputValue <> '' then begin
    try
      with DataModule1.QH_DML do begin
        SQL.Clear;
        SQL.Add('INSERT INTO hitem                                   ');
        SQL.Add('  VALUES (hitem_seq.nextval, :IID, :IDIV, :IITEM)   ');
        ParamByName('IID').AsString   := id;
        ParamByName('IDIV').AsString  := SelDiv;
        ParamByName('IITEM').AsString := InputValue;

        ExecSQL;
        ShowMessage(InputValue + '�׸� �߰��Ϸ�');
        ComboItem.Text := InputValue;
      end;
    finally

    end;

    if SelDiv = '����' then begin
      IncomeItemSelect;
    end else begin
      SpendingItemSelect;
    end;

  end;

end;

procedure THouseHoldForm.BtnItemAddMouseEnter(Sender: TObject);
begin
  BtnItemAdd.Color := $00FFAB57;
end;

procedure THouseHoldForm.BtnItemAddMouseLeave(Sender: TObject);
begin
  BtnItemAdd.Color := $00FFBF80;
end;

procedure THouseHoldForm.BtnItemDel2Click(Sender: TObject);
var
  SelDiv, InputValue, id : String;
begin
  id := DataModule1.recMemDate.mid;

  if RadioDiv1.Checked then begin
    SelDiv := StringReplace(RadioDiv1.Caption, ' ', '', [rfReplaceAll, rfIgnoreCase]);
  end else begin
    SelDiv := StringReplace(RadioDiv2.Caption, ' ', '', [rfReplaceAll, rfIgnoreCase]);
  end;

  InputValue := InputBox(SelDiv + ' �׸�' ,'������ ' + SelDiv + '�׸��� �Է����ּ���', '');

  if ((RadioDiv2.Checked = True) AND (InputValue = 'ī���� ����')) OR ((RadioDiv1.Checked = True) AND (InputValue = '����')) then begin
    ShowMessage('���׸��� �����Ҽ� �����ϴ�.');
  end else if InputValue <> '' then begin
    try
      with DataModule1.QH_DML do begin
        SQL.Clear;
        SQL.Add('DELETE FROM hitem                                      ');
        SQL.Add('  WHERE iid = :IID AND idiv = :IDIV AND item = :ITEM ');
        ParamByName('IID').AsString   := id;
        ParamByName('IDIV').AsString  := SelDiv;
        ParamByName('ITEM').AsString  := InputValue;

        ExecSQL;

        ShowMessage(InputValue + '�׸� ���ſϷ�');
        ComboItem.Text := '';
      end;
    finally

    end;

    if SelDiv = '����' then begin
      IncomeItemSelect;
    end else begin
      SpendingItemSelect;
    end;

  end;
end;

procedure THouseHoldForm.BtnItemDelMouseEnter(Sender: TObject);
begin
  BtnItemDel.Color := $00FFAB57;
end;

procedure THouseHoldForm.BtnItemDelMouseLeave(Sender: TObject);
begin
  BtnItemDel.Color := $00FFBF80;
end;

procedure THouseHoldForm.BtnMemoClearClick(Sender: TObject);
begin
  MemoSelect;
end;

procedure THouseHoldForm.BtnMemoClearMouseEnter(Sender: TObject);
begin
  BtnMemoClear.Color := $00FFAB57;
end;

procedure THouseHoldForm.BtnMemoClearMouseLeave(Sender: TObject);
begin
  BtnMemoClear.Color := $00FFBF80;
end;

procedure THouseHoldForm.BtnMemoStore2Click(Sender: TObject);
var
  memo , btnClick : String;
begin

  memo := cxMemo1.Lines.Text;

  try
    with DataModule1.QH_DML do begin

      if BtnMemoStore.Caption = '��   ��' then begin
        SQL.Clear;
        SQL.Add('INSERT INTO hmemo (mnum, mdate, mid ,mmemo)          ');
        SQL.Add('  VALUES (hmemo_seq.nextval, :MDATE, :MID, :MMEMO)   ');

      end else if BtnMemoStore.Caption = '��   ��' then begin

        SQL.Clear;
        SQL.Add('UPDATE hmemo                            ');
        SQL.Add('  SET mmemo = :MMEMO, regdate = SYSDATE ');
        SQL.Add('  WHERE mid = :MID AND mdate = :MDATE   ');

      end;

      ParamByName('MDATE').AsString   := LabDate.Caption;
      ParamByName('MID').AsString     := DataModule1.recMemDate.mid;
      ParamByName('MMEMO').AsString   := memo;

      ExecSQL;

      btnClick := StringReplace(BtnMemoStore.Caption, ' ', '', [rfReplaceAll, rfIgnoreCase]);

      ShowMessage(btnClick + ' �Ϸ�');

      BtnMemoStore.Caption  := '��   ��';
      BtnMemoStore.Enabled  := False;
      BtnMemoUpdate.Caption := '��   ��';
      BtnMemoUpdate.Enabled := True;

    end;

  finally
  end;


end;

procedure THouseHoldForm.BtnMemoUpdateClick(Sender: TObject);
begin

  BtnMemoUpdate.Caption       := '������';
  BtnMemoUpdate.Enabled       := False;
  BtnMemoStore.Caption        := '��   ��';
  BtnMemoStore.Enabled        := True;
  cxMemo1.Properties.ReadOnly := False;

end;

procedure THouseHoldForm.BtnMemoUpdateMouseEnter(Sender: TObject);
begin
  BtnMemoUpdate.Color := $00FFAB57;
end;

procedure THouseHoldForm.BtnMemoUpdateMouseLeave(Sender: TObject);
begin
  BtnMemoUpdate.Color := $00FFBF80;
end;

procedure THouseHoldForm.CalenderViewAnniversary;
var
  FirstDate, MiddleDate , LastDate, SFullDate  : String;
  FullDate                                     : TDateTime;
  solar                                        : TSolLun;
  Monthchk                                     : Integer;
begin

  solar := TSolLun.Create(self);

  try
    with DataModule1.QH_DML do begin
      SQL.Clear;
      SQL.Add('SELECT atype, acontents, aname, acycle, aanniversary  ');
      SQL.Add('  FROM hanniversary                                   ');
      SQL.Add('  WHERE aid = :AID                                    ');

      ParamByName('AID').AsString := DataModule1.recMemDate.mid;

      Open;

      if RecordCount > 0 then begin
        while not Eof do begin
          if FieldByName( 'atype' ).AsString = '���' then begin
            if FieldByName( 'acycle' ).AsString = '�ϳ�' then begin

              FirstDate := Copy(LabDate.Caption, 1, 4);
              LastDate  := FormatDateTime('mm-dd', FieldByName('aanniversary').AsDateTime);

              with DBPlannerMonthView1.CreateItem do begin
                ItemStartTime := StrToDate(FirstDate + '-' + LastDate);
                ItemEndTime   := StrToDate(FirstDate + '-' + LastDate);
                Text.Text     := FieldByName('aname').AsString + #13 + FieldByName('acontents').AsString;
              end;

            end else begin

              FirstDate := Copy(LabDate.Caption, 1, 7);
              LastDate  := FormatDateTime('dd', FieldByName('aanniversary').AsDateTime);

              with DBPlannerMonthView1.CreateItem do begin
                ItemStartTime := StrToDate(FirstDate + '-' + LastDate);
                ItemEndTime   := StrToDate(FirstDate + '-' + LastDate);
                Text.Text     := FieldByName('aname').AsString + #13 + FieldByName('acontents').AsString;
              end;

            end;

          end else begin


            if FieldByName( 'acycle' ).AsString = '�ϳ�' then begin

              FirstDate  := FormatDateTime( 'YYYY', StrToDate( LabDate.Caption ) );
              LastDate   := FormatDateTime( 'mm-dd', FieldByName('aanniversary').AsDateTime );

              SFullDate  := FirstDate + '-' + LastDate;

              FullDate   := solar.fnLunar2Solar( StrToDate( SFullDate ) );

              with DBPlannerMonthView1.CreateItem do begin
                ItemStartTime := FullDate;
                ItemEndTime   := FullDate;
                Text.Text     := FieldByName('aname').AsString + #13 + FieldByName('acontents').AsString;
              end;

            end else begin

              FirstDate  := FormatDateTime( 'YYYY', StrToDate( LabDate.Caption ) );
              MiddleDate := FormatDateTime( 'MM', StrToDate( LabDate.Caption ) );
              LastDate   := FormatDateTime( 'dd', FieldByName('aanniversary').AsDateTime );

              Monthchk := StrToInt(MiddleDate) - 1;

              if Monthchk = 13 then begin
                MiddleDate := '01';
                FirstDate  := IntToStr(StrToInt(FirstDate) + 1);
              end else if Monthchk = 0 then begin
                MiddleDate := '12';
                FirstDate  := IntToStr(StrToInt(FirstDate) - 1);
              end else begin
                MiddleDate := IntToStr(StrToInt(MiddleDate) - 1);
              end;

              SFullDate  := FirstDate + '-' + MiddleDate + '-' + LastDate;

              FullDate   := solar.fnLunar2Solar( StrToDate( SFullDate ) );

              with DBPlannerMonthView1.CreateItem do begin
                ItemStartTime := FullDate;
                ItemEndTime   := FullDate;
                Text.Text     := FieldByName('aname').AsString + #13 + FieldByName('acontents').AsString;
              end;

              FirstDate  := FormatDateTime( 'YYYY', StrToDate( LabDate.Caption ) );
              MiddleDate := FormatDateTime( 'MM', StrToDate( LabDate.Caption ) );
              LastDate   := FormatDateTime( 'dd', FieldByName('aanniversary').AsDateTime );

              SFullDate  := FirstDate + '-' + MiddleDate + '-' + LastDate;

              FullDate   := solar.fnLunar2Solar( StrToDate( SFullDate ) );

              with DBPlannerMonthView1.CreateItem do begin
                ItemStartTime := FullDate;
                ItemEndTime   := FullDate;
                Text.Text     := FieldByName('aname').AsString + #13 + FieldByName('acontents').AsString;
              end;

            end;


          end;

          Next;
        end;
      end;

//    FieldByName('atype').AsString
//    FieldByName('acontents').AsString
//    FieldByName('aname').AsString
//    FieldByName('acycle').AsString
//    FieldByName('aaniversary').AsDateTime

    end;
  finally

    solar.Free;

  end;
end;

procedure THouseHoldForm.ComboAmount3KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    BtnStoreClick(nil);
  end;

  if (key in ['0'..'9']) or (Key = #8) then begin
  end else begin
    Key := #0;
  end;

end;

procedure THouseHoldForm.ComboAmountKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin
    BtnStoreClick(nil);
  end;
end;

procedure THouseHoldForm.ComboItemExit(Sender: TObject);
begin
  if (RadioDiv2.Checked = True) AND (ComboItem.Text = 'ī���� ����') then begin
    RadioMeans3.Enabled := False;
  end else if (RadioDiv2.Checked = True) AND (ComboItem.Text <> 'ī���� ����') then begin
    RadioMeans3.Enabled := True;
  end;
end;

procedure THouseHoldForm.BtnReportShowClick(Sender: TObject);
begin
  ReportForm := TReportForm.Create(Application);
  try
    ReportForm.Show;
  finally
  end;        
end;

procedure THouseHoldForm.BtnReportShowMouseEnter(Sender: TObject);
begin
  BtnReportShow.Color := $00C66300;
end;

procedure THouseHoldForm.BtnReportShowMouseLeave(Sender: TObject);
begin
  BtnReportShow.Color := $00FF9E3E;
end;

procedure THouseHoldForm.BtnFixBreakdownEditClick(Sender: TObject);
begin
  FixBreakdownEditForm := TFixBreakdownEditForm.Create(self);
  try
    FixBreakdownEditForm.ShowModal;
  finally
    FixBreakdownEditForm.Free;
  end;
end;

procedure THouseHoldForm.BtnFixBreakdownEditMouseEnter(Sender: TObject);
begin
  BtnFixBreakdownEdit.Color := $00C66300;
end;

procedure THouseHoldForm.BtnFixBreakdownEditMouseLeave(Sender: TObject);
begin
  BtnFixBreakdownEdit.Color := $00FF9E3E;
end;

procedure THouseHoldForm.cxMemo1PropertiesChange(Sender: TObject);
begin
  if cxMemo1.Lines.Text = '' then begin
    BtnMemoStore.Enabled := False;
  end else begin
    BtnMemoStore.Enabled := True;
  end;


end;

procedure THouseHoldForm.BtnStoreClick(Sender: TObject);
var
  HoldData : THoldData;
  cnum     : Integer;
  idchk    : String;
begin

  if ComboItem.Text = '' then begin
    ComboItem.SetFocus;
    ShowMessage('�׸��� �������ּ���');
  end else if ComboAmount.Text = '' then begin
    ComboAmount.SetFocus;
    ShowMessage('�ݾ��� �Է����ּ���.');
  end else begin

    with HoldData do begin
      cid := DataModule1.recMemDate.mid;
      cdate := StrToDate(LabDate.Caption);
      citem := ComboItem.Text;
      ctype := ComboType.Text;

      // ���� �ϴ� �ݾ� ����
      if RadioDiv1.Checked then begin
        cdiv      := StringReplace(RadioDiv1.Caption, ' ', '', [rfReplaceAll, rfIgnoreCase]);
        cincome   := StrToInt(StringReplace(StringReplace(ComboAmount.Text, ',', '', [rfReplaceAll, rfIgnoreCase]), '��', '', [rfReplaceAll, rfIgnoreCase]));
        cspending := 0;
        camount   := cincome;
      // �����϶� �ݾ� ����
      end else if RadioDiv2.Checked then begin
        cdiv := StringReplace(RadioDiv2.Caption, ' ', '', [rfReplaceAll, rfIgnoreCase]);
        cincome   := 0;
        cspending := StrToInt(StringReplace(StringReplace(ComboAmount.Text, ',', '', [rfReplaceAll, rfIgnoreCase]), '��', '', [rfReplaceAll, rfIgnoreCase]));
        // ������ �ſ�ī�尡 �ƴҶ� �ݾ� ����
        if NOT(RadioMeans3.Checked) then begin
          camount          := -cspending;
          // ������ �ſ�ī���̰� �׸��� ī���� �����϶�
          if ComboItem.Text = 'ī���� ����' then begin
            ccreditspending  := -cspending;
          // ������ �ſ�ī���̰� �׸��� ī���� ���ΰ� �ƴҶ�
          end else begin
            ccreditspending  := 0;
          end;
        // ������ �ſ�ī���϶� �ݾ� ����
        end else begin
          cspending        := 0;
          camount          := 0;
          ccreditspending  := StrToInt(StringReplace(StringReplace(ComboAmount.Text, ',', '', [rfReplaceAll, rfIgnoreCase]), '��', '', [rfReplaceAll, rfIgnoreCase]));
        end;

      end;

      if RadioMeans1.Checked then begin
        cmeans := RadioMeans1.Caption;

      end else if RadioMeans2.Checked then begin
        cmeans := RadioMeans2.Caption;

      end else if RadioMeans3.Checked then begin
        cmeans := RadioMeans3.Caption;
      end;


    end;

    with DataModule1.QH_DML do begin
      SQL.Clear;
      SQL.Add('SELECT Min(cnum) cnum FROM hcontents                   ');
      SQL.Add('  WHERE cdate > :CDATE AND cid = :CID AND cnum != 0    ');
      ParamByName('CDATE').AsDate := StrToDate(LabDate.Caption);
      ParamByName('CID').AsString := DataModule1.recMemDate.mid;

      Open;

      cnum := FieldByName('cnum').AsInteger;

    end;

    if cnum = 0 then begin

      try
        with DataModule1.QH_DML do begin
          SQL.Clear;
          SQL.Add('INSERT INTO HCONTENTS(cno, cnum, cid, cdate, cdiv, citem, cmeans, ctype, cincome, cspending, ccreditbal, cbalance)          ');
          SQL.Add('   VALUES (hcontents_seq.nextval,                                                                                           ');
          SQL.Add('          (SELECT MAX(cnum) KEEP(DENSE_RANK FIRST ORDER BY cnum DESC) FROM HCONTENTS WHERE cid= :ID)+1,                     ');
          SQL.Add('          :ID, :CDATE, :DIV, :ITEM, :MEANS, :TYPE, :INCOME, :SPENDING, :CREDITSPENDIG,                                      ');
          SQL.Add('          (SELECT MAX(cbalance) KEEP(DENSE_RANK FIRST ORDER BY cnum DESC) FROM HCONTENTS WHERE cid= :ID) + :AMOUNT)         ');

          with HoldData do begin
            ParamByName('ID').AsString                := cid;
            ParamByName('CDATE').AsDate               := cdate;
            ParamByName('DIV').AsString               := cdiv;
            ParamByName('ITEM').AsString              := citem;
            ParamByName('MEANS').AsString             := cmeans;
            ParamByName('TYPE').AsString              := ctype;
            ParamByName('INCOME').AsInteger           := cincome;
            ParamByName('SPENDING').AsInteger         := cspending;
            ParamByName('CREDITSPENDIG').AsInteger    := ccreditspending;
            ParamByName('AMOUNT').AsInteger           := camount;
          end;

          ExecSQL;
          
        end;

      finally

      end;

    end else begin

      with DataModule1.QH_DML do begin
        SQL.Clear;
        SQL.Add('SELECT cid FROM hcontents               ');
        SQL.Add('   WHERE cid = :CID AND cdate <= :CDATE  ');

        ParamByName('CID').AsString := HoldData.cid;
        ParamByName('CDATE').AsDate := HoldData.cdate;

        Open;

        idchk := FieldByName('cid').AsString;
      end;

      if idchk <> '' then begin
        try
          with DataModule1.QH_DML do begin
            SQL.Clear;
            SQL.Add('UPDATE hcontents                      ');
            SQL.Add('  SET cnum = cnum+1                   ');
            SQL.Add('  WHERE cnum >= :CNUM AND cid = :CID  ');

            ParamByName('CNUM').AsInteger       := cnum;
            ParamByName('CID').AsString         := DataModule1.recMemDate.mid;

            ExecSQL;

            SQL.Clear;
            SQL.Add('INSERT INTO HCONTENTS(cno, cnum, cid, cdate, cdiv, citem, cmeans, ctype, cincome, cspending, ccreditbal, cbalance)                         ');
            SQL.Add('   VALUES (hcontents_seq.nextval,                                                                                                          ');
            SQL.Add('          :CNUM, :ID, :CDATE, :DIV, :ITEM, :MEANS, :TYPE, :INCOME, :SPENDING, :CREDITSPENDIG,                                              ');
            SQL.Add('          (SELECT MAX(cbalance) KEEP(DENSE_RANK FIRST ORDER BY cnum DESC) FROM HCONTENTS WHERE cid= :ID AND cdate <= :CDATE) + :AMOUNT)    ');

            ParamByName('CNUM').AsInteger               := cnum;

            with HoldData do begin
              ParamByName('ID').AsString                := cid;
              ParamByName('CDATE').AsDate               := cdate;
              ParamByName('DIV').AsString               := cdiv;
              ParamByName('ITEM').AsString              := citem;
              ParamByName('MEANS').AsString             := cmeans;
              ParamByName('TYPE').AsString              := ctype;
              ParamByName('INCOME').AsInteger           := cincome;
              ParamByName('SPENDING').AsInteger         := cspending;
              ParamByName('CREDITSPENDIG').AsInteger    := ccreditspending;
              ParamByName('AMOUNT').AsInteger           := camount;
            end;

            ExecSQL;

          end;

        finally

        end;
      end else begin
        try
          with DataModule1.QH_DML do begin
            SQL.Clear;
            SQL.Add('UPDATE hcontents                      ');
            SQL.Add('  SET cnum = cnum+1                   ');
            SQL.Add('  WHERE cnum >= :CNUM AND cid = :CID  ');

            ParamByName('CNUM').AsInteger       := cnum;
            ParamByName('CID').AsString         := DataModule1.recMemDate.mid;

            ExecSQL;

            SQL.Clear;
            SQL.Add('INSERT INTO HCONTENTS(cno, cnum, cid, cdate, cdiv, citem, cmeans, ctype, cincome, cspending, ccreditbal, cbalance)     ');
            SQL.Add('   VALUES (hcontents_seq.nextval,                                                                                      ');
            SQL.Add('          :CNUM, :ID, :CDATE, :DIV, :ITEM, :MEANS, :TYPE, :INCOME, :SPENDING, :CREDITSPENDIG, :AMOUNT)                 ');

            ParamByName('CNUM').AsInteger               := cnum;

            with HoldData do begin
              ParamByName('ID').AsString                := cid;
              ParamByName('CDATE').AsDate               := cdate;
              ParamByName('DIV').AsString               := cdiv;
              ParamByName('ITEM').AsString              := citem;
              ParamByName('MEANS').AsString             := cmeans;
              ParamByName('TYPE').AsString              := ctype;
              ParamByName('INCOME').AsInteger           := cincome;
              ParamByName('SPENDING').AsInteger         := cspending;
              ParamByName('CREDITSPENDIG').AsInteger    := ccreditspending;
              ParamByName('AMOUNT').AsInteger           := camount;
            end;

            ExecSQL;

          end;

        finally

        end;

      end;

      with DataModule1.QH_DML do begin
        SQL.Clear;
        SQL.Add('UPDATE hcontents                    ');
        SQL.Add('  SET cbalance = cbalance + :AMOUNT ');
        SQL.Add('  WHERE cnum > :CNUM AND cid = :CID ');

        ParamByName('AMOUNT').AsInteger := HoldData.camount;
        ParamByName('CNUM').AsInteger   := cnum;
        ParamByName('CID').AsString     := DataModule1.recMemDate.mid;

        ExecSQL;
      end;

    end;

    BtnClearClick(Sender);

    HoldAllDataView;
  end;

end;

procedure THouseHoldForm.BtnStoreMouseEnter(Sender: TObject);
begin
 BtnStore.Color := $00C66300;
end;

procedure THouseHoldForm.BtnStoreMouseLeave(Sender: TObject);
begin
  BtnStore.Color := $00FF9E3E;
end;

procedure THouseHoldForm.BtnExcelClick(Sender: TObject);
var
  PHandle : HWND;
  FileName, ComName : String;
  GridName          : TcxGrid;
  Year, Month, Day  : String;
begin
  GridName  := nil;
  PHandle   := Self.Handle;
  ComName   := TReportForm(Sender).Name;
  Year      := Copy(LabDate.Caption, 1, 4);
  Month     := Copy(LabDate.Caption, 6, 2);
  Day       := Copy(LabDate.Caption, 9, 2);

  if ComName = 'BtnTotalExcel' then begin
    GridName := GRD_Holding;
    FileName   := Year + '.' + Month + ' ��ü����';
  end else if ComName = 'BtnIncomeExcel' then begin
    GridName := GRD_Income;
    FileName   := Year + '.' + Month + '.' + Day + ' ���Գ���';
  end else if ComName = 'BtnSpendingExcel' then begin
    GridName := GRD_Spending;
    FileName   := Year + '.' + Month + '.' + Day + ' ���⳻��';
  end;

  DataModule1.ExcelRoute(FileName, GridName, PHandle);

end;

procedure THouseHoldForm.BtnTypeAddClick(Sender: TObject);
var
  InputValue, id : String;
begin
  id := DataModule1.recMemDate.mid;

  InputValue := InputBox('ī��� �߰�' ,'�߰��� ī��縦 �Է����ּ���', ComboType.Text);

  if InputValue <> '' then begin
    try
      with DataModule1.QH_DML do begin
        SQL.Clear;
        SQL.Add('INSERT INTO htype                            ');
        SQL.Add('  VALUES(htype_seq.nextval,:TID, :TType)     ');
        ParamByName('TID').AsString    := id;
        ParamByName('TType').AsString  := InputValue;

        ExecSQL;

        ShowMessage(InputValue + '�׸� �߰��Ϸ�');
        ComboType.Text := InputValue;
      end;
    finally

    end;

    TypeSelect;

  end;
end;
procedure THouseHoldForm.BtnTypeAddMouseEnter(Sender: TObject);
begin
  BtnTypeAdd.Color := $00FFAB57;
end;

procedure THouseHoldForm.BtnTypeAddMouseLeave(Sender: TObject);
begin
  BtnTypeAdd.Color := $00FFBF80;
end;

procedure THouseHoldForm.BtnTypeDelClick(Sender: TObject);
var
  InputValue, id : String;
begin
  id := DataModule1.recMemDate.mid;

  InputValue := InputBox('ī��� ����' ,'������ ī��縦 �Է����ּ���', '');

 if InputValue <> '' then begin
    try
      with DataModule1.QH_DML do begin
        SQL.Clear;
        SQL.Add('DELETE FROM htype                            ');
        SQL.Add('  WHERE tid = :TID AND ttype = :TTPYE        ');
        ParamByName('TID').AsString   := id;
        ParamByName('TTPYE').AsString  := InputValue;

        ExecSQL;

        ShowMessage(InputValue + '�׸� ���ſϷ�');
        ComboType.Text := '';
      end;
    finally

    end;
    TypeSelect;
  end;
end;

procedure THouseHoldForm.BtnTypeDelMouseEnter(Sender: TObject);
begin
  BtnTypeDel.Color := $00FFAB57;
end;

procedure THouseHoldForm.BtnTypeDelMouseLeave(Sender: TObject);
begin
  BtnTypeDel.Color := $00FFBF80;
end;

procedure THouseHoldForm.BtnUpdateMemClick(Sender: TObject);
begin
  MemInfoForm := TMemInfoForm.Create(Self);
  try
    MemInfoForm.ShowModal;
  finally
    MemInfoForm.Free;
  end;


end;

procedure THouseHoldForm.BtnUpdateMemMouseEnter(Sender: TObject);
begin
  BtnUpdateMem.Color := $00C66300;

end;

procedure THouseHoldForm.BtnUpdateMemMouseLeave(Sender: TObject);
begin
  BtnUpdateMem.Color := $00FF9E3E;
end;

procedure THouseHoldForm.BtnAnniversaryEditClick(Sender: TObject);
begin
  try
    AnniversaryEditForm := TAnniversaryEditForm.Create(self);
    AnniversaryEditForm.ShowModal;
  finally
    AnniversaryEditForm.Free;
    DBPlannerMonthView1.Refresh;
    CalenderViewAnniversary;
  end;
end;

procedure THouseHoldForm.BtnAnniversaryEditMouseEnter(Sender: TObject);
begin
  BtnAnniversaryEdit.Color := $00C66300;
end;

procedure THouseHoldForm.BtnAnniversaryEditMouseLeave(Sender: TObject);
begin
  BtnAnniversaryEdit.Color := $00FF9E3E;
end;

procedure THouseHoldForm.BtnClearClick(Sender: TObject);
begin
  RadioDiv1.Checked     := True;
  ComboItem.Text        := '';
  RadioMeans1.Checked   := True;
  ComboType.Text        := '';
  ComboAmount.EditValue := 0;
end;

procedure THouseHoldForm.BtnClearMouseEnter(Sender: TObject);
begin
  BtnClear.Color := $00C66300;
end;

procedure THouseHoldForm.BtnClearMouseLeave(Sender: TObject);
begin
  BtnClear.Color := $00FF9E3E;
end;

//procedure THouseHoldForm.DBPlannerCalendar1DayChange(Sender: TObject; origDate,
//  newDate: TDateTime);
//begin
//  {$IFDEF USE_CODESITE}CODESITE.EnterMethod( Self, 'DBPlannerCalendar1DayChange' );{$ENDIF}
//        {$IFDEF USE_CODESITE}CodeSite.Send('origDate', formatdateTime( 'yyyy--mm--dd', origDate) ); {$ENDIF}
//        {$IFDEF USE_CODESITE}CodeSite.Send('origDate', formatdateTime( 'yyyy--mm--dd', newDate) ); {$ENDIF}
//  {$IFDEF USE_CODESITE}CODESITE.ExitMethod( Self, 'DBPlannerCalendar1DayChange' );{$ENDIF}
//end;

procedure THouseHoldForm.DBPlannerCalendar1DaySelect(Sender: TObject;
  SelDate: TDateTime);
begin
//  {$IFDEF USE_CODESITE}CODESITE.EnterMethod( Self, 'DBPlannerCalendar1DaySelect' );{$ENDIF}
//        {$IFDEF USE_CODESITE}CodeSite.Send('origDate', formatdateTime( 'yyyy--mm--dd', SelDate) ); {$ENDIF}
//  {$IFDEF USE_CODESITE}CODESITE.ExitMethod( Self, 'DBPlannerCalendar1DaySelect' );{$ENDIF}
  LabDate.Caption            := DateToStr(SelDate);
  HoldAllDataView;
  HoldIncomeDataView;
  HoldSpendingDataView;

  try
    with QHContents_SelectSpending do begin
      SQL.Clear;
      SQL.ADD('SELECT cnum, citem, cmeans, cspending, ccreditbal FROM hcontents   ');
      SQL.ADD('   WHERE cid = :ID AND cdate = :CDATE AND cdiv = :DIV              ');
      SQL.ADD('   ORDER BY cnum DESC                                              ');

      ParamByName('ID').AsString    := DataModule1.recMemDate.mid;
      ParamByName('CDATE').AsDate   := StrToDate(LabDate.Caption);
      ParamByName('DIV').AsString   := '����';

      Open;
    end;

    DHContents_SelectSpending.DataSet               := QHContents_SelectSpending;
    Simple_Spending.DataController.DataSource       := DHContents_SelectSpending;
    QHContents_SelectSpending.Active                := True;

    MemoSelect;

  finally

  end;
end;

procedure THouseHoldForm.DBPlannerMonthView1MonthChanged(Sender: TObject;
  origDate, newDate: TDateTime);
begin
  LabDate.Caption := DateToStr(newDate);
  CalenderViewAnniversary;
end;


procedure THouseHoldForm.DBPlannerMonthView1YearChanged(Sender: TObject;
  origDate, newDate: TDateTime);
begin
  LabDate.Caption := DateToStr(newDate);
  CalenderViewAnniversary;
end;

procedure THouseHoldForm.DeleteGrid;
begin
  with DataModule1.QH_DML do begin
    SQL.Clear;
    SQL.Add('DELETE FROM hcontents');
    SQL.Add('  WHERE cid = :CID AND cnum = :CNUM');

    ParamByName('CID').AsString   := DataModule1.recMemDate.mid;
    ParamByName('CNUM').AsInteger := GridDeleteData.cnum;

    ExecSQL;

    SQL.Clear;
    SQL.Add('UPDATE hcontents                                    ');
    SQL.Add('  SET cnum = cnum-1, cbalance = cbalance - :CAMOUNT ');
    SQL.Add('  WHERE cid = :CID AND cnum > :CNUM                 ');

    ParamByName('CAMOUNT').AsInteger := GridDeleteData.camount;
    ParamByName('CID').AsString      := DataModule1.recMemDate.mid;
    ParamByName('CNUM').AsInteger    := GridDeleteData.cnum;

    ExecSQL;

  end;
end;

procedure THouseHoldForm.FormCreate(Sender: TObject);
begin
  DBPlannerMonthView1.Date      := Now;
  LabDate.Caption               := FormatDateTime('yyyy-mm-dd', Now);
  StatusBar1.Panels[2].Text     := FormatDateTime('yyyy-mm-dd hh:mm', Now);

  DateSeparator := '-';

  BtnItemAdd.Hide;
  BtnItemDel.Hide;
  BtnTypeAdd.Hide;
  BtnTypeDel.Hide;

  ComboItem.Properties.Items.Clear;

  ComboItem.Properties.ItemHeight :=  20;

  ComboType.Enabled := False;

  cxMemo1.Properties.ReadOnly := True;

  RadioMeans3.Enabled := False;

  QHContents_SelectSpending.Session := DataModule1.OraSession1;
  QHContents_SelectIncome.Session   := DataModule1.OraSession1;
  QHContents_SelectAll.Session      := DataModule1.OraSession1;

  IncomeItemSelect;
  TypeSelect;

  DHContents_SelectAll.DataSet                  := QHContents_SelectAll;
  Total_Holding.DataController.DataSource       := DHContents_SelectAll;

  DHContents_SelectIncome.DataSet               := QHContents_SelectIncome;
  Simple_Income.DataController.DataSource       := DHContents_SelectIncome;

  DHContents_SelectSpending.DataSet             := QHContents_SelectSpending;
  Simple_Spending.DataController.DataSource     := DHContents_SelectSpending;

  HoldAllDataView;
  HoldIncomeDataView;
  HoldSpendingDataView;

  MemoSelect;

  CalenderViewAnniversary;

end;

procedure THouseHoldForm.HoldAllDataView;
begin
  try
    with QHContents_SelectAll do begin
      SQL.Clear;
      SQL.ADD('SELECT * FROM hcontents                                                      ');
      SQL.ADD('   WHERE cid = :ID AND cnum != 0 AND TO_CHAR(CDATE, ''YYYYMM'') = :CURDATE   ');
      SQL.ADD('   ORDER BY cnum DESC                                                        ');

      ParamByName('ID').AsString      := DataModule1.recMemDate.mid;
      ParamByName('CURDATE').AsString := FormatDateTime('YYYYMM', StrToDate(LabDate.Caption));

      Open;
    end;

  finally

  end;

end;

procedure THouseHoldForm.HoldIncomeDataView;
begin
  try
    with QHContents_SelectIncome do begin
      SQL.Clear;
      SQL.ADD('SELECT cnum, citem, cmeans, cincome FROM hcontents     ');
      SQL.ADD('   WHERE cid = :ID AND cdate = :CDATE AND cdiv = :DIV  ');
      SQL.ADD('   ORDER BY cnum DESC                                  ');

      ParamByName('ID').AsString     := DataModule1.recMemDate.mid;
      ParamByName('CDATE').AsDate    := StrToDate(LabDate.Caption);
      ParamByName('DIV').AsString    := '����';

      Open;
    end;

  finally

  end;

end;

procedure THouseHoldForm.HoldSpendingDataView;
begin

  try
    with QHContents_SelectSpending do begin
      SQL.Clear;
      SQL.ADD('SELECT cnum, citem, cmeans, cspending, ccreditbal FROM hcontents   ');
      SQL.ADD('   WHERE cid = :ID AND cdate = :CDATE AND cdiv = :DIV              ');
      SQL.ADD('   ORDER BY cnum DESC                                              ');

      ParamByName('ID').AsString    := DataModule1.recMemDate.mid;
      ParamByName('CDATE').AsDate   := StrToDate(LabDate.Caption);
      ParamByName('DIV').AsString   := '����';

      Open;

    end;

  finally

  end;
end;

procedure THouseHoldForm.IncomeItemSelect;
begin
  with DataModule1.QH_DML do begin
    SQL.Clear;
    SQL.Add('SELECT item FROM hitem                   ');
    SQL.Add('  WHERE iid = :IID AND idiv = :IDIV      ');
    SQL.Add('  ORDER BY item                          ');

    ParamByName('IID').AsString  := DataModule1.recMemDate.mid;
    ParamByName('IDIV').AsString := '����';

    Open;

    if RecordCount > 0 then begin
      ComboItem.Properties.Items.Clear;
      while not Eof do begin
        ComboItem.Properties.Items.Add(FieldByName( 'ITEM' ).AsString);
        Next;
      end;
    end;
  end;
end;

procedure THouseHoldForm.localmessage(var msg: TMessage);
begin
   QHContents_SelectSpending.RefreshRecord;
end;

procedure THouseHoldForm.localmessage2(var msg: TMessage);
begin
   QHContents_SelectIncome.RefreshRecord;
end;

procedure THouseHoldForm.localmessage3(var msg: TMessage);
begin
  HoldAllDataView;  
end;

procedure THouseHoldForm.SpendingItemSelect;
begin
  with DataModule1.QH_DML do begin
    SQL.Clear;
    SQL.Add('SELECT item FROM hitem                   ');
    SQL.Add('  WHERE iid = :IID AND idiv = :IITEM     ');
    SQL.Add('  ORDER BY item                          ');

    ParamByName('IID').AsString   := DataModule1.recMemDate.mid;
    ParamByName('IITEM').AsString := '����';

    Open;

    if RecordCount > 0 then begin
      ComboItem.Properties.Items.Clear;
      while not Eof do begin
        ComboItem.Properties.Items.Add(FieldByName( 'ITEM' ).AsString);
        Next;
      end;
    end;
  end;
end;

procedure THouseHoldForm.Total_HoldingMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  chk                       : Integer;
begin



  if Button = mbLeft then begin
    if BtnHoldingAction.Caption = '���Ÿ��' then begin
      chk := MessageDlg( '���׸��� �����Ͻðڽ��ϱ�?', mtWarning, mbYesNo, 0 );

      if chk = 6 then begin
        GridDeleteData.cnum       := Total_Holding.DataController.Values[Total_Holding.DataController.FocusedRecordIndex, 0];
        GridDeleteData.camount    := Total_Holding.DataController.Values[Total_Holding.DataController.FocusedRecordIndex, 6] - Total_Holding.DataController.Values[Total_Holding.DataController.FocusedRecordIndex, 7];

        DeleteGrid;

        HoldIncomeDataView;
        HoldSpendingDataView;
        HoldAllDataView;
      end;

    end else if BtnIncomeAction.Caption = '���Ÿ��' then begin
      chk := MessageDlg( '���׸��� �����Ͻðڽ��ϱ�?', mtWarning, mbYesNo, 0 );

      if chk = 6 then begin
        GridDeleteData.cnum       := Simple_Income.DataController.Values[Simple_Income.DataController.FocusedRecordIndex, 0];
        GridDeleteData.camount    := Simple_Income.DataController.Values[Simple_Income.DataController.FocusedRecordIndex, 3];

        DeleteGrid;

        HoldIncomeDataView;
        HoldAllDataView;
      end;

    end else if BtnSpendingAction.Caption = '���Ÿ��' then begin
      chk := MessageDlg( '���׸��� �����Ͻðڽ��ϱ�?', mtWarning, mbYesNo, 0 );

      if chk = 6 then begin
        GridDeleteData.cnum       := Simple_Spending.DataController.Values[Simple_Spending.DataController.FocusedRecordIndex, 0];
        GridDeleteData.camount    := -Simple_Spending.DataController.Values[Simple_Spending.DataController.FocusedRecordIndex, 4];

        DeleteGrid;

        HoldSpendingDataView;
        HoldAllDataView;
      end;

    end;

  end;

end;

procedure THouseHoldForm.TypeSelect;
begin
  with DataModule1.QH_DML do begin
    SQL.Clear;
    SQL.Add('SELECT ttype FROM htype                  ');
    SQL.Add('  WHERE tid = :TID                       ');
    SQL.Add('  ORDER BY ttype                         ');

    ParamByName('TID').AsString := DataModule1.recMemDate.mid;

    Open;

    if RecordCount > 0 then begin
      Combotype.Properties.Items.Clear;
      while not Eof do begin
        Combotype.Properties.Items.Add(FieldByName( 'TTYPE' ).AsString);
        Next;
      end;
    end;
  end;
end;

procedure THouseHoldForm.UpdateGrid_Income(UValue : String);
var
  amount : Integer;
begin

  with InputboxUpdateData do begin
    AftValue := StrToInt(UValue);

    amount := AftValue - BefValue;

    with DataModule1.QH_DML do begin
      SQL.Clear;

      SQL.Add('UPDATE hcontents                                         ');
      SQL.Add('  SET cincome = :CINCOME, cbalance = cbalance + :CAMOUNT ');
      SQL.Add('  WHERE cid = :CID AND cnum = :CNUM                      ');

      ParamByName('CINCOME').AsInteger := AftValue;
      ParamByName('CAMOUNT').AsInteger := amount;
      ParamByName('CID').AsString      := DataModule1.recMemDate.mid;
      ParamByName('CNUM').AsInteger    := cnum;

      ExecSQL;

      SQL.Clear;

      SQL.Add('UPDATE hcontents                               ');
      SQL.Add('  SET cbalance = cbalance + :CAMOUNT           ');
      SQL.Add('  WHERE cid = :CID AND cnum > :CNUM            ');

      ParamByName('CAMOUNT').AsInteger := amount;
      ParamByName('CID').AsString      := DataModule1.recMemDate.mid;
      ParamByName('CNUM').AsInteger    := cnum;

      ExecSQL;

    end;
  end;
end;

procedure THouseHoldForm.UpdateGrid_Spending(UValue: String);
var
  amount, amount2 : Integer;
begin
  amount    := 0;
  amount2   := 0;

  with InputboxUpdateData do begin

    AftValue := StrToInt(UValue);

    if ColumnName = 'CSPENDING' then begin
      if citem <> 'ī���� ����' then begin
        amount  := BefValue - AftValue;
        amount2 := 0;
      end else begin
        amount  := BefValue - AftValue;
        amount2 := -AftValue;
      end;

    end else if (ColumnName = 'CCREDITBAL') then begin
      if citem <> 'ī���� ����' then begin
        amount    := 0;
        amount2   := AftValue;
        AftValue  := 0;
      end else begin
        if StrToInt(Uvalue) < 0 then begin
          amount    := AftValue - BefValue;
          amount2   := AftValue;
          AftValue  := -AftValue;
        end else begin
          ShowMessage('ī���� ������ �����θ� �Է°����մϴ�.');
          exit;
        end;
      end;
    end;

    with DataModule1.QH_DML do begin
      SQL.Clear;

      SQL.Add('UPDATE hcontents                                                                        ');
      SQL.Add('  SET cspending = :CSPENDING, ccreditbal = :AMOUNT2, cbalance = cbalance + :CAMOUNT     ');
      SQL.Add('  WHERE cid = :CID AND cnum = :CNUM                                                     ');

      ParamByName('CSPENDING').AsInteger  := AftValue;
      ParamByName('CAMOUNT').AsInteger    := amount;
      ParamByName('AMOUNT2').AsInteger    := amount2;
      ParamByName('CID').AsString         := DataModule1.recMemDate.mid;
      ParamByName('CNUM').AsInteger       := cnum;

      ExecSQL;

      SQL.Clear;

      SQL.Add('UPDATE hcontents                               ');
      SQL.Add('  SET cbalance = cbalance + :CAMOUNT           ');
      SQL.Add('  WHERE cid = :CID AND cnum > :CNUM            ');

      ParamByName('CAMOUNT').AsInteger := amount;
      ParamByName('CID').AsString      := DataModule1.recMemDate.mid;
      ParamByName('CNUM').AsInteger    := cnum;

      ExecSQL;
    end;
  end;
end;

procedure THouseHoldForm.UpdateGrid_SelectIncome;
var
  UValue        : String;
  a             : Integer;
begin
  with InputboxUpdateData do begin
    InputValue  := IntToStr(BefValue);
    InputWTitle := '���� ����';
    Inputtitle  := '������ ���԰��� �Է����ּ���.';

    UValue := InputBox(InputWTitle, InputTitle, InputValue);

    if (UValue <> InputValue) AND (TryStrToInt(UValue, a)) then begin
      UpdateGrid_Income(UValue);
    end else if NOT(TryStrToInt(UValue, a)) then begin
      ShowMessage('���ڸ� �Է����ּ���.');
    end;

    InputWtitle:= '';
    InputTitle := '';
    InputValue := '';
    ColumnName := '';
    citem      := '';
    cnum       := 0;
    BefValue   := 0;
    AftValue   := 0;

  end;
end;

procedure THouseHoldForm.UpdateGrid_SelectSpending;
var
  UValue        : String;
  a             : Integer;
begin
  with InputboxUpdateData do begin

    InputValue  := IntToStr(BefValue);

    if ColumnName = 'CSPENDING' then begin
      InputWTitle := '�Ϲ����� ����';
      Inputtitle  := '������ �Ϲ����Ⱚ�� �Է����ּ���.';
    end else if ColumnName = 'CCREDITBAL' then begin
      InputWTitle := '�ſ����� ����';
      Inputtitle  := '������ �ſ����Ⱚ�� �Է����ּ���.';
    end;

    UValue := InputBox(InputWTitle, InputTitle, InputValue);

    if (UValue <> InputValue) AND (TryStrToInt(UValue, a)) then begin
      UpdateGrid_Spending(UValue);
    end else if NOT(TryStrToInt(UValue, a)) then begin
      ShowMessage('���ڸ� �Է����ּ���.');
    end;

    InputWtitle:= '';
    InputTitle := '';
    InputValue := '';
    ColumnName := '';
    citem      := '';
    cnum       := 0;
    BefValue   := 0;
    AftValue   := 0;
  end;
end;

procedure THouseHoldForm.UpdateGrid_SelectAll;
var
  UValue        : String;
  a             : Integer;
begin
  with InputboxUpdateData do begin

    InputValue  := IntToStr(BefValue);

    if ColumnName = 'CINCOME' then begin
      InputWTitle := '���� ����';
      Inputtitle  := '������ ���԰��� �Է����ּ���.';
    end else if ColumnName = 'CSPENDING' then begin
      InputWTitle := '�Ϲ����� ����';
      Inputtitle  := '������ �Ϲ����Ⱚ�� �Է����ּ���.';
    end else if ColumnName = 'CCREDITBAL' then begin
      InputWTitle := '�ſ����� ����';
      Inputtitle  := '������ �ſ����Ⱚ�� �Է����ּ���.';
    end;

    UValue := InputBox(InputWTitle, InputTitle, InputValue);

    if (UValue <> InputValue) AND (TryStrToInt(UValue, a)) then begin

      if ColumnName = 'CINCOME' then begin
        UpdateGrid_Income(UValue);
      end else begin
        UpdateGrid_Spending(UValue);
      end;

    end else if NOT(TryStrToInt(UValue, a)) then begin
      ShowMessage('���ڸ� �Է����ּ���.');
    end;

    InputWtitle:= '';
    InputTitle := '';
    InputValue := '';
    ColumnName := '';
    citem      := '';
    cnum       := 0;
    BefValue   := 0;
    AftValue   := 0;

  end;
end;

procedure THouseHoldForm.HouseHoldingCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  cName, cNum, cItem        : String;
begin

  if (BtnHoldingAction.Caption = '�������') AND (ACellViewInfo.Value <> '0') then begin

    cName    := TcxGridDBColumn( Total_Holding.Controller.FocusedColumn ).DataBinding.FieldName;

    if (cName = 'CINCOME') OR (cName = 'CSPENDING') OR (cName = 'CCREDITBAL') then begin


      cNum     := Total_Holding.DataController.Values[Total_Holding.DataController.FocusedRecordIndex, 0];
      cItem    := Total_Holding.DataController.Values[Total_Holding.DataController.FocusedRecordIndex, 3];

      InputboxUpdateData.BefValue   := ACellViewInfo.Value;
      InputboxUpdateData.ColumnName := cName;
      InputboxUpdateData.cnum       := StrToInt(cNum);
      InputboxUpdateData.citem      := cItem;

      UpdateGrid_SelectAll;

      HoldIncomeDataView;
      HoldSpendingDataView;

      Postmessage( Self.Handle, WM_LOCALMESSAGE3, 0, 0 );

    end;

  end else if (BtnIncomeAction.Caption = '�������') AND (ACellViewInfo.Value <> '0') then begin

    cName    := TcxGridDBColumn( Simple_Income.Controller.FocusedColumn ).DataBinding.FieldName;

    if cName = 'CINCOME' then begin

      cNum     := Simple_Income.DataController.Values[Simple_Income.DataController.FocusedRecordIndex, 0];

      InputboxUpdateData.BefValue   := ACellViewInfo.Value;
      InputboxUpdateData.ColumnName := cName;
      InputboxUpdateData.cnum       := StrToInt(cNum);

      UpdateGrid_SelectIncome;

      HoldAllDataView;
      Postmessage( Self.Handle, WM_LOCALMESSAGE2, 0, 0 );
    end;

  end else if (BtnSpendingAction.Caption = '�������') AND (ACellViewInfo.Value <> '0') then begin

    cName    := TcxGridDBColumn( Simple_Spending.Controller.FocusedColumn ).DataBinding.FieldName;

    if (cName = 'CSPENDING') OR (cName = 'CCREDITBAL') then begin

      cNum     := Simple_Spending.DataController.Values[Simple_Spending.DataController.FocusedRecordIndex, 0];
      cItem    := Simple_Spending.DataController.Values[Simple_Spending.DataController.FocusedRecordIndex, 1];

      InputboxUpdateData.BefValue   := ACellViewInfo.Value;
      InputboxUpdateData.ColumnName := cName;
      InputboxUpdateData.cnum       := StrToInt(cNum);
      InputboxUpdateData.citem      := cItem;

      UpdateGrid_SelectSpending;
      HoldAllDataView;
      Postmessage( Self.Handle, WM_LOCALMESSAGE, 0, 0 );
    end;
  end;


  // Ŭ���ѳ��� filed��
  // TcxGridDBColumn( Total_Holding.Controller.FocusedColumn ).DataBinding.Field.Text;

  // Ŭ���ѳ� row�� Ư�� filed��
  // Total_Holding.DataController.Values[Total_Holding.DataController.FocusedRecordIndex, 0]

  // Ŭ���ѳ� row index��ȣ
  // IntToStr(Total_Holding.Controller.FocusedColumnIndex);

end;

procedure THouseHoldForm.MemoSelect;
var
  mmemo : String;
begin
  cxMemo1.Lines.Clear;

  try
    with DataModule1.QH_DML do begin
      SQL.Clear;
      SQL.Add('SELECT mmemo FROM hmemo                ');
      SQL.Add('  WHERE mid = :MID AND mdate = :MDATE  ');

      ParamByName('MID').AsString   := DataModule1.recMemDate.mid;
      ParamByName('MDATE').AsString := LabDate.Caption;

      Open;

      mmemo := FieldByName('mmemo').AsString;
    end;

    if mmemo <> '' then begin
      cxMemo1.Lines.Text          := mmemo;
      cxMemo1.Properties.ReadOnly := True;
      BtnMemoUpdate.Enabled       := True;
      BtnMemoUpdate.Caption       := '��   ��';
    end else begin
      cxMemo1.Properties.ReadOnly := False;
      BtnMemoUpdate.Caption       := '�޸��Է�';
      BtnMemoUpdate.Enabled       := False;
    end;

    BtnMemoStore.Enabled  := False;
    BtnMemoStore.Caption  := '��   ��';

  finally
  end;
end;

procedure THouseHoldForm.RadioDivClick(Sender: TObject);
begin
  if RadioDiv1.Checked then begin
     IncomeItemSelect;
     RadioMeans3.Enabled := False;
     ComboItem.Text      := '';
  end else begin
     SpendingItemSelect;
     RadioMeans3.Enabled := True;
     ComboItem.Text      := '';
  end;

end;

procedure THouseHoldForm.RadioMeansClick(Sender: TObject);
begin
  if RadioMeans1.Checked then begin
    ComboType.Text := '';
    ComboType.Enabled := False;
  end else begin
    ComboType.Enabled := True;
  end;

end;

end.


//procedure THouseHoldForm.QHContents_SelectAllAfterPost(DataSet: TDataSet);
//var
//  cnum, cincome, cspending, camount : Integer;
//begin
//
//  cnum      := DataSet.FieldByName( 'cnum' ).AsInteger;
//  cincome   := DataSet.FieldByName( 'cincome' ).AsInteger;
//  cspending := DataSet.FieldByName( 'cspending' ).AsInteger;
//  camount   := 0;
//
////  ShowMessage('������ income�� : ' + IntToSTr(GridUpdateData.cincome));
////  ShowMessage('������ income�� : ' + IntToSTr(cincome));
////  ShowMessage('������ spending�� : ' + IntToSTr(GridUpdateData.cspending));
////  ShowMessage('������ spending�� : ' + IntToSTr(cspending));
//
//  if GridUpdateData.cincome > 0 then begin
//    camount := cincome - GridUpdateData.cincome;
//  end else if GridUpdateData.cspending > 0 then begin
//    camount := GridUpdateData.cspending - cspending;
//  end;
//
////  ShowMessage('������ �� : ' + IntToSTr(camount));
//
//  if camount <> 0 then begin
//    with QH_DML do begin
//      Session := OraSession1;
//      SQL.Clear;
//      SQL.Add('UPDATE hcontents                     ');
//      SQL.Add('  SET cbalance = cbalance + :CAMOUNT ');
//      SQL.Add('  WHERE cid = :CID AND cnum >= :CNUM  ');
//
//      ParamByName('CAMOUNT').AsInteger   := camount;
//      ParamByName('CID').AsString        := DataModule1.recMemDate.mid;
//      ParamByName('CNUM').AsInteger      := cnum;
//
//      ExecSQL;
//    end;
//
//    HoldDataView;
//
//  end;
//
//end;


//procedure THouseHoldForm.QHContents_SelectIncomeAfterPost(DataSet: TDataSet);
//var
//  cnum, cincome, camount : Integer;
//
//begin
//  cnum      := DataSet.FieldByName( 'cnum' ).AsInteger;
//  cincome   := DataSet.FieldByName( 'cincome' ).AsInteger;
//  camount   := 0;
//
//  if GridUpdateData.cincome > 0 then begin
//    camount := cincome - GridUpdateData.cincome;
//  end;
//
//  if camount <> 0 then begin
//    with QH_DML do begin
//      Session := OraSession1;
//      SQL.Clear;
//      SQL.Add('UPDATE hcontents                     ');
//      SQL.Add('  SET cbalance = cbalance + :CAMOUNT ');
//      SQL.Add('  WHERE cid = :CID AND cnum >= :CNUM  ');
//
//      ParamByName('CAMOUNT').AsInteger   := camount;
//      ParamByName('CID').AsString        := DataModule1.recMemDate.mid;
//      ParamByName('CNUM').AsInteger      := cnum;
//
//      ExecSQL;
//    end;
//
//    HoldDataView;
//
//  end;
//end;

//procedure THouseHoldForm.QHContents_SelectSpendingAfterPost(DataSet: TDataSet);
//var
//  cnum, cspending, camount : Integer;
//begin
//  cnum      := DataSet.FieldByName( 'cnum' ).AsInteger;
//  cspending := DataSet.FieldByName( 'cspending' ).AsInteger;
//  camount   := 0;
//
//  if GridUpdateData.cspending > 0 then begin
//    camount := GridUpdateData.cspending - cspending;
//  end;
//
//  if camount <> 0 then begin
//    with QH_DML do begin
//      Session := OraSession1;
//      SQL.Clear;
//      SQL.Add('UPDATE hcontents                     ');
//      SQL.Add('  SET cbalance = cbalance + :CAMOUNT ');
//      SQL.Add('  WHERE cid = :CID AND cnum >= :CNUM  ');
//
//      ParamByName('CAMOUNT').AsInteger   := camount;
//      ParamByName('CID').AsString        := DataModule1.recMemDate.mid;
//      ParamByName('CNUM').AsInteger      := cnum;
//
//      ExecSQL;
//    end;
//
//    HoldDataView;
//
//  end;
//end;
