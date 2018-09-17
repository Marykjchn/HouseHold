unit MemInfoPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls;

type
  TMemInfoForm = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    cxLabel2: TcxLabel;
    LabId: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    LabPhone: TcxLabel;
    LabEmail: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    LabGrade: TcxLabel;
    LabName: TcxLabel;
    cxLabel20: TcxLabel;
    LabAge: TcxLabel;
    cxLabel16: TcxLabel;
    LabAdd: TcxLabel;
    BtnMPhoneUpdate: TPanel;
    BtnMEmailUpdate: TPanel;
    BtnMAddUpdate: TPanel;
    cxLabel18: TcxLabel;
    Panel5: TPanel;
    cxLabel3: TcxLabel;
    cxLabel7: TcxLabel;
    BtnMPWUpdate: TPanel;
    BtnMIDDelete: TPanel;
    cxLabel8: TcxLabel;

    // --------------- 폼생성시 회원정보 셋팅 ---------------
    procedure FormCreate(Sender: TObject);

    // --------------- 버튼 마우스 호버시 색 변경 ---------------
    procedure BtnMPhoneUpdateMouseEnter(Sender: TObject);
    procedure BtnMPhoneUpdateMouseLeave(Sender: TObject);
    procedure BtnMEmailUpdateMouseEnter(Sender: TObject);
    procedure BtnMEmailUpdateMouseLeave(Sender: TObject);
    procedure BtnMAddUpdateMouseEnter(Sender: TObject);
    procedure BtnMAddUpdateMouseLeave(Sender: TObject);
    procedure BtnMPWUpdateMouseEnter(Sender: TObject);
    procedure BtnMPWUpdateMouseLeave(Sender: TObject);
    procedure BtnMIDDeleteMouseEnter(Sender: TObject);
    procedure BtnMIDDeleteMouseLeave(Sender: TObject);

    // --------------- 변경 버튼 클릭시 이벤트 ---------------
    procedure BtnMPhoneUpdateClick(Sender: TObject);
    procedure BtnMEmailUpdateClick(Sender: TObject);
    procedure BtnMAddUpdateClick(Sender: TObject);
    procedure BtnMPWUpdateClick(Sender: TObject);

  private
    { Private declarations }
    // --------------- 개인정보 출력 ---------------
    procedure MemInfoShow;

  public
    { Public declarations }
  end;

var
  MemInfoForm: TMemInfoForm;

implementation

{$R *.dfm}

uses
  HDataMethod, DataModule, UpdatePhonePage, UpdateEmailPage, UpdateAddPage,
  UpdatePWPage;

procedure TMemInfoForm.BtnMAddUpdateClick(Sender: TObject);
begin
  UpdateAddForm := TUpdateAddForm.Create(Self);
  try
    UpdateAddForm.ShowModal;
  finally
    UpdateAddForm.Free;
    MemInfoShow;
  end;
end;

procedure TMemInfoForm.BtnMAddUpdateMouseEnter(Sender: TObject);
begin
  BtnMAddUpdate.Color := $00FFAB57;
end;

procedure TMemInfoForm.BtnMAddUpdateMouseLeave(Sender: TObject);
begin
  BtnMAddUpdate.Color := $00FFBF80;
end;

procedure TMemInfoForm.BtnMEmailUpdateClick(Sender: TObject);
begin
  UpdateEmailForm := TUpdateEmailForm.Create(Self);
  try
    UpdateEmailForm.ShowModal;
  finally
    UpdateEmailForm.Free;
    MemInfoShow;
  end;
end;

procedure TMemInfoForm.BtnMEmailUpdateMouseEnter(Sender: TObject);
begin
  BtnMEmailUpdate.Color := $00FFAB57;
end;

procedure TMemInfoForm.BtnMEmailUpdateMouseLeave(Sender: TObject);
begin
  BtnMEmailUpdate.Color := $00FFBF80;
end;

procedure TMemInfoForm.BtnMIDDeleteMouseEnter(Sender: TObject);
begin
  BtnMIDDelete.Color := $00FFAB57;
end;

procedure TMemInfoForm.BtnMIDDeleteMouseLeave(Sender: TObject);
begin
  BtnMIDDelete.Color := $00FFBF80;
end;

procedure TMemInfoForm.BtnMPhoneUpdateClick(Sender: TObject);
begin
  UpdatePhoneForm := TUpdatePhoneForm.Create(self);
  try
    UpdatePhoneForm.Showmodal;
  finally
    UpdatePhoneForm.Free;
    MemInfoShow;
  end;
end;

procedure TMemInfoForm.BtnMPhoneUpdateMouseEnter(Sender: TObject);
begin
  BtnMPhoneUpdate.Color := $00FFAB57;
end;

procedure TMemInfoForm.BtnMPhoneUpdateMouseLeave(Sender: TObject);
begin
  BtnMPhoneUpdate.Color := $00FFBF80;
end;

procedure TMemInfoForm.FormCreate(Sender: TObject);
begin
  MemInfoShow;
end;

procedure TMemInfoForm.MemInfoShow;
var
  email, email1, email2, code1, phone, phone1, phone2 : String;
  idx, Pemail1                                        : Integer;
begin
  LabId.Caption     := HITSDecrypt(DataModule1.recMemDate.mid, KEY);

  phone  := DataModule1.recMemDate.mphone;
  Insert('**', phone, 7);
  phone1 := Copy(phone, 1, 8);

  phone  := DataModule1.recMemDate.mphone;
  Insert('**', phone, 12);
  phone2 := Copy(phone, 9, 5);

  LabPhone.Caption  := phone1 + phone2;

  email := DataModule1.recMemDate.memail;
  Pemail1 := Pos('@', email);
  email1  := Copy(email, 1, Pemail1-1);

  for idx := 2 to Pemail1 - 2 do begin
    code1 := code1 + '*';
  end;

  Insert(code1, email1, 3);
  email1  := Copy(email1, 1, Pemail1-1);
  email2  := Copy(email, Pemail1,  Length(email)-1);

  LabEmail.Caption  := email1 + email2;
  LabGrade.Caption  := DataModule1.recMemDate.mgrade;
  LabName.Caption   := DataModule1.recMemDate.mname;
  LabAge.Caption    := DataModule1.recMemDate.mage;
  LabAdd.Caption    := DataModule1.recMemDate.madd;
end;

procedure TMemInfoForm.BtnMPWUpdateClick(Sender: TObject);
begin
  UpdatePWForm := TUpdatePWForm.Create(Self);
  UpdatePWForm.SetEmail(DataModule1.recMemDate.memail);
  try
    UpdatePWForm.ShowModal;
  finally
    UpdatePWForm.Free;
  end;
end;

procedure TMemInfoForm.BtnMPWUpdateMouseEnter(Sender: TObject);
begin
  BtnMPWUpdate.Color := $00FFAB57;
end;

procedure TMemInfoForm.BtnMPWUpdateMouseLeave(Sender: TObject);
begin
  BtnMPWUpdate.Color := $00FFBF80;
end;

end.
