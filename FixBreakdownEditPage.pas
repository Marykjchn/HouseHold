unit FixBreakdownEditPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, MemDS, DBAccess, Ora, cxContainer, cxLabel, ExtCtrls,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid;

type
  TFBreakDownData = record
    AField, AValue : String;
    ano            : Integer;
  end;

type
  TFixBreakdownEditForm = class(TForm)
    DH_FBreakDownSelectAll: TOraDataSource;
    GRD_FixBreakdown: TcxGrid;
    Total_FixBreakdown: TcxGridDBTableView;
    Total_FixBreakdownColumn1: TcxGridDBColumn;
    Total_FixBreakdownColumn2: TcxGridDBColumn;
    Total_FixBreakdownColumn3: TcxGridDBColumn;
    Total_FixBreakdownColumn4: TcxGridDBColumn;
    Total_FixBreakdownColumn5: TcxGridDBColumn;
    Total_FixBreakdownColumn6: TcxGridDBColumn;
    GRD_FixBreakdownLevel1: TcxGridLevel;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    BtnClose: TPanel;
    BtnUpdateFBreakdown: TPanel;
    BtnDelFBreakdown: TPanel;
    BtnAddFBreakdown: TPanel;
    QH_FBreakDownEditSelect: TOraQuery;
    Total_FixBreakdownColumn7: TcxGridDBColumn;
    Total_FixBreakdownColumn8: TcxGridDBColumn;
    Total_FixBreakdownColumn9: TcxGridDBColumn;
    Total_FixBreakdownColumn10: TcxGridDBColumn;

    // 폼 생성시 기념일 목록 출력
    procedure FormCreate(Sender: TObject);
    // Form Close
    procedure BtnCloseClick(Sender: TObject);
    // 기념일 추가 Form 생성
    procedure BtnAddFBreakdownClick(Sender: TObject);
    // 기념일 전체출력 procedure
    procedure SelectAnniversary;
    procedure BtnUpdateFBreakdownClick(Sender: TObject);

    // 고정내역 수정
    procedure Total_FbreakDownMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    // 고정내역 수정
    procedure FbreakDownDataUpdate;
    procedure BtnDelFBreakdownClick(Sender: TObject);

    // 고정내역 삭제
    procedure FbreakDownDataDelete;


    // -------------- 마우스 호버시 색 변경 ---------------
    procedure BtnStyle_1MouseLeave(Sender: TObject);
    procedure BtnStyle_1MouseEnter(Sender: TObject);
    procedure BtnStyle_2MouseEnter(Sender: TObject);
    procedure BtnStyle_2MouseLeave(Sender: TObject);
    procedure BtnUpdateFBreakdownMouseLeave(Sender: TObject);
    procedure BtnDelFBreakdownMouseLeave(Sender: TObject);

  private
    FbreakDownData : TFbreakDownData;
  public
    { Public declarations }
  end;

var
  FixBreakdownEditForm: TFixBreakdownEditForm;

implementation

{$R *.dfm}

{ TFixBreakdownEdit }

uses
  HouseholdPage, DataModule, FixBreakAddPage;

procedure TFixBreakdownEditForm.FbreakDownDataDelete;
var
  MessageVal : Integer;
begin
  MessageVal := MessageDlg( '이항목을 삭제하시겠습니까?', mtWarning, mbYesNo, 0 );

  if MessageVal = 6 then begin
    with DataModule1.QH_DML do begin
      SQL.Clear;
      SQL.Add('DELETE FROM hanniversary         ');
      SQL.Add('  WHERE ano = :ANO               ');

      ParamByName('ANO').AsInteger  := FBreakDownData.ano;

      ExecSQL;
    end;

    SelectAnniversary;

  end else begin
    Exit;
  end;



end;

procedure TFixBreakdownEditForm.FbreakDownDataUpdate;
var
  InputVal : String;
begin
  if FBreakDownData.AField = 'ACONTENTS' then begin
    InputVal := InputBox('고정내역 수정', '수정할 분류를 입력해주세요', FBreakDownData.AValue);
  end else begin
    InputVal := InputBox('고정내역 수정', '수정할 이름을 입력해주세요', FBreakDownData.AValue);
  end;
  with DataModule1.QH_DML do begin
    SQL.Clear;
    SQL.Add('UPDATE hanniversary              ');
    if FBreakDownData.AField = 'ACONTENTS' then begin
      SQL.Add('  SET acontents = :ACOUNTENTS  ');
    end else begin
      SQL.Add('  SET aname = :ANAME           ');
    end;
    SQL.Add('  WHERE ano = :ANO               ');

    if FBreakDownData.AField = 'ACONTENTS' then begin
      ParamByName('ACOUNTENTS').AsString  := InputVal;
    end else begin
      ParamByName('ANAME').AsString       := InputVal;
    end;
      ParamByName('ANO').AsInteger        := FBreakDownData.Ano;
    ExecSQL;
  end;

  QH_FBreakDownEditSelect.RefreshRecord;

end;

procedure TFixBreakdownEditForm.BtnAddFBreakdownClick(Sender: TObject);
begin
  try
    FixBreakAddForm := TFixBreakAddForm.Create(self);
    FixBreakAddForm.ShowModal;
  finally
    FixBreakAddForm.Free;
  end;
  SelectAnniversary;
end;

procedure TFixBreakdownEditForm.BtnStyle_2MouseEnter(Sender: TObject);
begin
  DataModule1.SetBtnStyle_2(TWinControl(Sender), True);
end;

procedure TFixBreakdownEditForm.BtnStyle_2MouseLeave(Sender: TObject);
begin
  DataModule1.SetBtnStyle_2(TWinControl(Sender), False);
end;

procedure TFixBreakdownEditForm.BtnUpdateFBreakdownClick(Sender: TObject);
begin
  if BtnUpdateFBreakdown.Caption = '수  정' then begin
    BtnUpdateFBreakdown.Caption                := '수정모드';
    BtnUpdateFBreakdown.Color                  := $00FFAB57;
    BtnDelFBreakdown.Enabled                   := False;
    BtnAddFBreakdown.Enabled                   := False;

  end else begin
    BtnUpdateFBreakdown.Caption                := '수  정';
    BtnUpdateFBreakdown.Color                  := $00FFBF80;
    BtnDelFBreakdown.Enabled                   := True;
    BtnAddFBreakdown.Enabled                   := True;
  end;


end;

procedure TFixBreakdownEditForm.BtnUpdateFBreakdownMouseLeave(Sender: TObject);
begin
  if BtnUpdateFBreakdown.Caption = '수  정' then begin
    BtnUpdateFBreakdown.Color := $00FFBF80;
  end;
end;

procedure TFixBreakdownEditForm.BtnCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFixBreakdownEditForm.BtnStyle_1MouseEnter(Sender: TObject);
begin
  DataModule1.SetBtnStyle_1(TWinControl(Sender), True);
end;

procedure TFixBreakdownEditForm.BtnStyle_1MouseLeave(Sender: TObject);
begin
  DataModule1.SetBtnStyle_1(TWinControl(Sender), False);
end;

procedure TFixBreakdownEditForm.BtnDelFBreakdownClick(Sender: TObject);
begin
  if BtnDelFBreakdown.Caption = '제  거' then begin
    BtnDelFBreakdown.Caption                := '제거모드';
    BtnDelFBreakdown.Color                  := $00FFAB57;
    BtnUpdateFBreakdown.Enabled             := False;
    BtnAddFBreakdown.Enabled                := False;

  end else begin
    BtnDelFBreakdown.Caption                := '제  거';
    BtnDelFBreakdown.Color                  := $00FFBF80;
    BtnUpdateFBreakdown.Enabled             := True;
    BtnAddFBreakdown.Enabled                := True;
  end;
end;

procedure TFixBreakdownEditForm.BtnDelFBreakdownMouseLeave(Sender: TObject);
begin
  if BtnDelFBreakdown.Caption = '제  거' then begin
    BtnDelFBreakdown.Color := $00FFBF80;
  end;
end;


procedure TFixBreakdownEditForm.FormCreate(Sender: TObject);
begin

  FBreakDownData.AField := '';
  FBreakDownData.AValue := '';
  FBreakDownData.ano    := 0;

  QH_FBreakDownEditSelect.Session  := DataModule1.OraSession1;

  DH_FBreakDownSelectAll.DataSet                      := QH_FBreakDownEditSelect;
  Total_FixBreakdown.DataController.DataSource        := DH_FBreakDownSelectAll;

  SelectAnniversary;

end;

procedure TFixBreakdownEditForm.SelectAnniversary;
begin
  try
    with QH_FBreakDownEditSelect do begin
      SQL.Clear;
      SQL.Add('SELECT * FROM hanniversary   ');
      SQL.Add('  WHERE aid = :AID           ');

      ParamByName('AID').AsString := DataModule1.recMemDate.mid;

      Open;
    end;

  finally

  end;
end;

procedure TFixBreakdownEditForm.Total_FBreakDownMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  CField, CValue : String;
  ano            : Integer;
begin

  if BtnUpdateFBreakdown.Caption = '수정모드' then begin
    CField := TcxGridDBColumn( Total_FixBreakdown.Controller.FocusedColumn ).DataBinding.FieldName;
    Cvalue := TcxGridDBColumn( Total_FixBreakdown.Controller.FocusedColumn ).DataBinding.Field.Text;
    ano    := Total_FixBreakdown.DataController.Values[Total_FixBreakdown.DataController.FocusedRecordIndex, 5];

    FBreakDownData.AField := CField;
    FBreakDownData.AValue := CValue;
    FBreakDownData.ano    := ano;

    if (CField = 'ACONTENTS') OR (CField = 'ANAME') then begin
      FBreakDownDataUpdate;
    end;
  end else if BtnDelFBreakdown.Caption = '제거모드' then begin
    ano    := Total_FixBreakdown.DataController.Values[Total_FixBreakdown.DataController.FocusedRecordIndex, 5];

    FBreakDownData.ano    := ano;

    FBreakDownDataDelete;

  end;

  FBreakDownData.AField := '';
  FBreakDownData.AValue := '';
  FBreakDownData.ano    := 0;

  // 클릭한놈의 filed이름
  // TcxGridDBColumn( Total_Holding.Controller.FocusedColumn ).DataBinding.FieldName;

  // 클릭한놈의 데이터값
  // TcxGridDBColumn( Total_Holding.Controller.FocusedColumn ).DataBinding.Field.Text;

  // 클릭한놈 row의 특정 filed값
  // Total_Holding.DataController.Values[Total_Holding.DataController.FocusedRecordIndex, 0]

  // 클릭한놈 row index번호
  // IntToStr(Total_Holding.Controller.FocusedColumnIndex);
end;

end.

