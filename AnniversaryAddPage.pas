unit AnniversaryAddPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxRadioGroup, AdvEdit, AdvEdBtn, PlannerDatePicker, cxControls, cxContainer,
  cxEdit, cxLabel, ExtCtrls, DB, MemDS, DBAccess, Ora;

type
  TAnniversaryAddForm = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    DatePickerAnni: TPlannerDatePicker;
    RadCycle1: TcxRadioButton;
    RadCycle2: TcxRadioButton;
    RadType1: TcxRadioButton;
    RadType2: TcxRadioButton;
    cxLabel6: TcxLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    BtnAnniStore: TPanel;
    BtnClose: TPanel;
    Panel4: TPanel;
    EditContents: TcxTextEdit;
    cxLabel7: TcxLabel;
    Panel5: TPanel;
    EditName: TcxTextEdit;
    cxLabel8: TcxLabel;
    Panel6: TPanel;
    cxLabel9: TcxLabel;
    // 닫기 버튼 클릭시 폼 Close
    procedure BtnCloseClick(Sender: TObject);
    // 폼 close 메모리 해제
    procedure BtnAnniStoreClick(Sender: TObject);
    // 날짜 선택란에 입력 금지
    procedure DatePickerAnniKeyPress(Sender: TObject; var Key: Char);

    // -------------- 입력란 이벤트 --------------
    // 클릭시 색 변경
    procedure EditContentsEnter(Sender: TObject);
    procedure EditContentsExit(Sender: TObject);
    procedure EditNameEnter(Sender: TObject);
    procedure EditNameExit(Sender: TObject);
    procedure EditContentsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditNameKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DatePickerAnniChange(Sender: TObject);
    procedure cxLabel7Click(Sender: TObject);
    procedure cxLabel8Click(Sender: TObject);


    // -------------- 마우스 호버시 색 변경 ---------------
    procedure BtnAnniStoreMouseEnter(Sender: TObject);
    procedure BtnAnniStoreMouseLeave(Sender: TObject);
    procedure BtnCloseMouseEnter(Sender: TObject);
    procedure BtnCloseMouseLeave(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AnniversaryAddForm: TAnniversaryAddForm;

implementation

{$R *.dfm}

uses
  HouseholdPage, DataModule;

procedure TAnniversaryAddForm.BtnAnniStoreClick(Sender: TObject);
begin
  if EditContents.Text = '' then begin
    EditContents.SetFocus;
    ShowMessage('분류를 입력해주세요. ex)생일');
  end else if EditName.Text = '' then begin
    EditName.SetFocus;
    ShowMessage('기념일 당사자를 입력해주세요.');
  end else if DatePickerAnni.Text = '' then begin
    DatePickerAnni.SetFocus;
    ShowMessage('날짜를 선택해주세요.');
  end else begin

    try
      with DataModule1.QH_DML do begin
        SQL.Clear;
        SQL.Add('INSERT INTO hanniversary                                                                           ');
        SQL.Add('  VALUES (hanniversary_seq.nextval, :AID, :ATYPE, :ACONTENTS, :ANAME, :ACYCLE, :AANNIVERSARY)      ');

        ParamByName('AID').AsString           := DataModule1.recMemDate.mid;
        ParamByName('ACONTENTS').AsString     := EditContents.Text;
        ParamByName('ANAME').AsString         := EditName.Text;
        ParamByName('AANNIVERSARY').AsDate    := StrToDate(DatePickerAnni.Text);

        if RadType1.Checked = True then begin
          ParamByName('ATYPE').AsString         := RadType1.Caption;
        end else begin
          ParamByName('ATYPE').AsString         := RadType2.Caption;
        end;

        if RadCycle1.Checked = True then begin
          ParamByName('ACYCLE').AsString        := RadCycle1.Caption;
        end else begin
          ParamByName('ACYCLE').AsString        := RadCycle2.Caption;
        end;

        ExecSQL;

      end;

      ShowMessage('기념일 등록 완료');

    finally
    end;        

  end;

end;

procedure TAnniversaryAddForm.BtnAnniStoreMouseEnter(Sender: TObject);
begin
  BtnAnniStore.Color := $00C66300;
end;

procedure TAnniversaryAddForm.BtnAnniStoreMouseLeave(Sender: TObject);
begin
  BtnAnniStore.Color := $00FF9E3E;
end;

procedure TAnniversaryAddForm.BtnCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TAnniversaryAddForm.BtnCloseMouseEnter(Sender: TObject);
begin
  BtnClose.Color :=  $00C66300;
end;

procedure TAnniversaryAddForm.BtnCloseMouseLeave(Sender: TObject);
begin
  BtnClose.Color := $00FF9E3E;
end;

procedure TAnniversaryAddForm.cxLabel7Click(Sender: TObject);
begin
  EditContents.SetFocus;
end;

procedure TAnniversaryAddForm.cxLabel8Click(Sender: TObject);
begin
  EditName.SetFocus;
end;

procedure TAnniversaryAddForm.DatePickerAnniChange(Sender: TObject);
begin
  if DatePickerAnni.Text <> '' then begin
    cxLabel9.hide;
  end else begin
    cxLabel9.Show;
  end;

end;

procedure TAnniversaryAddForm.DatePickerAnniKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TAnniversaryAddForm.EditContentsEnter(Sender: TObject);
begin
  cxLabel7.Style.Color := $00FFFCF9;
  Panel4.Color         := $00FFFCF9;
end;

procedure TAnniversaryAddForm.EditContentsExit(Sender: TObject);
begin
  cxLabel7.Style.Color := clWindow;
  Panel4.Color         := clWindow;
end;

procedure TAnniversaryAddForm.EditContentsKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EditContents.Text <> '' then begin
    cxLabel7.hide;
  end else begin
    cxLabel7.show;
  end;
end;

procedure TAnniversaryAddForm.EditNameEnter(Sender: TObject);
begin
  cxLabel8.Style.Color := $00FFFCF9;
  Panel5.Color         := $00FFFCF9;
end;

procedure TAnniversaryAddForm.EditNameExit(Sender: TObject);
begin
  cxLabel8.Style.Color := clWindow;
  Panel5.Color         := clWindow;
end;

procedure TAnniversaryAddForm.EditNameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EditName.Text <> '' then begin
    cxLabel8.hide;
  end else begin
    cxLabel8.show;
  end;
end;

end.
