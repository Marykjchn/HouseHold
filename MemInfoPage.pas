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
    LabPostCode: TcxLabel;
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
    cxLabel14: TcxLabel;
    LabAdd: TcxLabel;
    cxLabel17: TcxLabel;
    LabDetailAdd: TcxLabel;
    cxLabel21: TcxLabel;

    // --------------- 폼생성시 회원정보 셋팅 ---------------
    procedure FormCreate(Sender: TObject);

    // --------------- 버튼 마우스 호버시 색 변경 ---------------
    procedure BtnStyle_2MouseEnter(Sender: TObject);
    procedure BtnStyle_2MouseLeave(Sender: TObject);

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
  HDataMethod, DataModule, UpdatePhonePage, UpdateEmailPage, UpdatePWPage, SearchJusoPage;

procedure TMemInfoForm.BtnMAddUpdateClick(Sender: TObject);
var
  ModalResult : TModalResult;
  TotalAdd    : String;
begin

  ModalResult := 0;

  SearchJusoForm := TSearchJusoForm.Create(Self);

  try
    ModalResult := SearchJusoForm.ShowModal;
  finally
    with Datamodule1 do begin

      if ModalResult = mrOk then begin
        with QH_DML do begin
          SQL.Clear;
          SQL.Add(' UPDATE HOUSEHOLD                            ');
          SQL.Add(' SET                                         ');
          SQL.Add('   mpostcode = :MPOSTCODE, madd = :MADD    ');
          SQL.Add(' WHERE                                       ');
          SQL.Add('   mid = :MID AND mpw = :MPW                 ');

          with AddressSearch do begin

            if ARoadBool then begin
              TotalAdd := ARoadAddr + ' | ' + ADetailAddr;
            end else begin
              TotalAdd := AJibunAddr + ' | ' + ADetailAddr;
            end;

            ParamByName('MID').AsString         := recMemDate.mid;
            ParamByName('MPW').AsString         := recMemDate.mpw;
            ParamByName('MPOSTCODE').AsString   := HITSEncrypt(AZipCode, KEY);
            ParamByName('MADD').AsString        := HITSEncrypt(TotalAdd, KEY);

          end;

          ExecSQL;
        end;

        recMemDate.mpostcode  := AddressSearch.AZipCode;
        if AddressSearch.ARoadBool then begin
          recMemDate.madd := AddressSearch.ARoadAddr;
        end else begin
          recMemDate.madd := AddressSearch.AJibunAddr;
        end;
        recMemDate.mdetailadd := AddressSearch.ADetailAddr;

        MemInfoShow;
      end else begin

        addressSearch.AZipCode    := '';
        addressSearch.ARoadAddr   := '';
        addressSearch.AJibunAddr  := '';
        addressSearch.ADetailAddr := '';
        addressSearch.ARoadBool   := False;

      end;
      SearchJusoForm.Free;

    end;

  end;
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

procedure TMemInfoForm.BtnStyle_2MouseEnter(Sender: TObject);
begin
  DataModule1.SetBtnStyle_2(TWinControl(Sender), True);
end;

procedure TMemInfoForm.BtnStyle_2MouseLeave(Sender: TObject);
begin
  DataModule1.SetBtnStyle_2(TWinControl(Sender), False);
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

procedure TMemInfoForm.FormCreate(Sender: TObject);
begin
  MemInfoShow;
end;

procedure TMemInfoForm.MemInfoShow;
var
  email, email1, email2, code1, phone, phone1, phone2 : String;
  idx, Pemail1                                        : Integer;
begin
  with DataModule1 do begin

    LabId.Caption     := HITSDecrypt(recMemDate.mid, KEY);

    phone  := recMemDate.mphone;
    Insert('**', phone, 7);
    phone1 := Copy(phone, 1, 8);

    phone  := recMemDate.mphone;
    Insert('**', phone, 12);
    phone2 := Copy(phone, 9, 5);

    LabPhone.Caption  := phone1 + phone2;

    email := recMemDate.memail;
    Pemail1 := Pos('@', email);
    email1  := Copy(email, 1, Pemail1-1);

    for idx := 2 to Pemail1 - 2 do begin
      code1 := code1 + '*';
    end;

    Insert(code1, email1, 3);
    email1  := Copy(email1, 1, Pemail1-1);
    email2  := Copy(email, Pemail1,  Length(email)-1);

    LabEmail.Caption      := email1 + email2;
    LabGrade.Caption      := recMemDate.mgrade;
    LabName.Caption       := recMemDate.mname;
    LabAge.Caption        := recMemDate.mage;
    LabPostCode.Caption   := recMemDate.mpostcode;
    LabAdd.Caption        := recMemDate.madd;
    LabDetailAdd.Caption  := recMemDate.mdetailadd;

  end;

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

end.
