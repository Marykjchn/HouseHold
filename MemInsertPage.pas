unit MemInsertPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxDropDownEdit, StdCtrls, cxRadioGroup, cxTextEdit,
  cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxControls,
  cxContainer, cxEdit, cxLabel, ExtCtrls, cxCalendar, cxCalc, PlannerCal, Imm,
  Menus, cxLookAndFeelPainters, cxButtons, DB, MemDS, DBAccess, Ora,
  IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL, IdComponent, IdTCPConnection,
  IdTCPClient, IdMessageClient, IdSMTP, IdBaseComponent, IdMessage, DCPcrypt2,
  DCPblockciphers, DCPrijndael;

type
  TMemInsertChk = record
    name, id, pw, pwchk, year, phone1, phone2, phone3,
    month, day, address, email                          : Boolean;
  end;

type
  TMemInsertForm = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    RBtnSexM: TcxRadioButton;
    RBtnSexW: TcxRadioButton;
    chkName: TcxLabel;
    chkID: TcxLabel;
    chkPW: TcxLabel;
    chkPWTrue: TcxLabel;
    chkBirth: TcxLabel;
    chkAdd: TcxLabel;
    chkEmail: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    Panel2: TPanel;
    EditID: TcxTextEdit;
    LabID: TcxLabel;
    Panel3: TPanel;
    EditPW: TcxTextEdit;
    LabPW: TcxLabel;
    Panel4: TPanel;
    EditPWchk: TcxTextEdit;
    LabPWChk: TcxLabel;
    Panel5: TPanel;
    EditName: TcxTextEdit;
    LabName: TcxLabel;
    Panel6: TPanel;
    EditYear: TcxTextEdit;
    LabBirthYear: TcxLabel;
    Panel7: TPanel;
    LabBirthMonth: TcxLabel;
    Panel8: TPanel;
    EditDay: TcxTextEdit;
    LabBirthDay: TcxLabel;
    ComboMon: TcxComboBox;
    cxLabel6: TcxLabel;
    Panel9: TPanel;
    LabAge: TcxLabel;
    EditAge: TcxTextEdit;
    Panel10: TPanel;
    Panel11: TPanel;
    ComFPhone: TcxComboBox;
    Panel12: TPanel;
    EditMPhone: TcxTextEdit;
    Panel13: TPanel;
    EditLPhone: TcxTextEdit;
    Panel14: TPanel;
    EditAdd: TcxTextEdit;
    LabAddress: TcxLabel;
    chkPhone: TcxLabel;
    Panel15: TPanel;
    EditFEmail: TcxTextEdit;
    Panel16: TPanel;
    EditLEmail: TcxTextEdit;
    Panel17: TPanel;
    ComboSelEmail: TcxComboBox;
    cxLabel26: TcxLabel;
    BtnMemInsert: TPanel;
    BtnEmailChk: TPanel;
    Panel18: TPanel;
    EditDetailAddress: TcxTextEdit;
    LabDetailAddress: TcxLabel;
    Panel19: TPanel;
    EditPostCode: TcxTextEdit;
    LabPostCode: TcxLabel;
    BtnSearchAddress: TPanel;

    // 폼 생성시 에러 라벨 hide
    procedure FormCreate(Sender: TObject);   


    // ------------- 숫자 값 확인 -------------
    // 숫자인지 확인
    procedure OnlyNumber(Sender: TObject; var Key: Char);
    procedure OnlyNumber2(Sender: TObject; var Key: Char);



    // 가입 버튼 클릭시 DB로 회원정보 INSERT
    procedure BtnMemInsertClick(Sender: TObject);     

    // ------------- 회원가입 입력란 이벤트 -------------

    // -----아이디-----
    procedure LabIDClick(Sender: TObject);
    procedure EditIDEnter(Sender: TObject);
    procedure EditIDKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditIDKeyPress(Sender: TObject; var Key: Char);
    procedure EditIDExit(Sender: TObject);

    // -----비밀번호-----
    procedure LabPWClick(Sender: TObject);
    procedure EditPWEnter(Sender: TObject);
    procedure EditPWKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditPWExit(Sender: TObject);

    // -----비밀번호 확인-----
    procedure LabPWChkClick(Sender: TObject);
    procedure EditPWchkEnter(Sender: TObject);
    procedure EditPWchkKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditPWchkExit(Sender: TObject);

    // -----이름-----
    procedure LabNameClick(Sender: TObject);
    procedure EditNameEnter(Sender: TObject);
    procedure EditNameKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditNameKeyPress(Sender: TObject; var Key: Char);
    procedure EditNameExit(Sender: TObject);

    // -----생년월일-----
    // 년도
    procedure LabBirthYearClick(Sender: TObject);
    procedure EditYearEnter(Sender: TObject);
    procedure EditYearKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditYear2Exit(Sender: TObject);
    // 월
    procedure LabBirthMonthClick(Sender: TObject);
    procedure ComboMonEnter(Sender: TObject);
    procedure ComboMonKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ComboMonPropertiesChange(Sender: TObject);
    procedure ComboMonExit(Sender: TObject);
    // 일
    procedure LabBirthDayClick(Sender: TObject);
    procedure EditDayEnter(Sender: TObject);
    procedure EditDayKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditDayExit(Sender: TObject);

    // -----주소-----
    procedure LabAddressClick(Sender: TObject);

    // -----핸드폰 번호-----
    // 앞번호
    procedure ComFPhoneEnter(Sender: TObject);
    procedure ComFPhoneExit(Sender: TObject);
    // 중간번호
    procedure EditMPhoneEnter(Sender: TObject);
    procedure EditMPhoneExit(Sender: TObject);
    // 뒷번호
    procedure EditLPhoneEnter(Sender: TObject);
    procedure EditLPhoneExit(Sender: TObject);

    // -----이메일-----
    // 아이디
    procedure EditFEmailEnter(Sender: TObject);
    procedure EditEmailKeyPress(Sender: TObject; var Key: Char);
    procedure EditFEmailExit(Sender: TObject);
    // 메일주소
    procedure EditLEmailEnter(Sender: TObject);
    procedure EditLEmailExit(Sender: TObject);
    // 선택
    procedure ComboSelEmailEnter(Sender: TObject);
    procedure ComboSelEmailExit(Sender: TObject);
    procedure ComboEmailSelPropertiesChange(Sender: TObject);


    // --------------- 버튼 호버시 색변경 ---------------
    procedure BtnMemInsertMouseEnter(Sender: TObject);
    procedure BtnMemInsertMouseLeave(Sender: TObject);
    procedure BtnEmailChkMouseEnter(Sender: TObject);
    procedure BtnEmailChkMouseLeave(Sender: TObject);




    // --------------- 인증 메일 번호 ---------------
    procedure BtnEmailChkClick(Sender: TObject);
    procedure EditAddPropertiesChange(Sender: TObject);
    procedure EditPostCodePropertiesChange(Sender: TObject);
    procedure BtnSearchAddressClick(Sender: TObject);
    procedure EditAddClick(Sender: TObject);
    procedure EditDetailAddressPropertiesChange(Sender: TObject);
    //function SendEmail : string;

  private
    MemInsertChk: TMemInsertChk;
  public
    { Public declarations }
  end;

var
  MemInsertForm: TMemInsertForm;

  TType: array[0..9] of string;
  IItem: array[0..4] of string;

implementation

{$R *.dfm}

uses
  DataModule, EmailchkPage, HDataMethod, SearchJusoPage;

procedure TMemInsertForm.BtnMemInsertMouseEnter(Sender: TObject);
begin
  BtnMemInsert.Color := $00C66300;
end;

procedure TMemInsertForm.BtnMemInsertMouseLeave(Sender: TObject);
begin
  BtnMemInsert.Color := $00FF9122;
end;

procedure TMemInsertForm.BtnSearchAddressClick(Sender: TObject);
var
  GetModal : TModalResult;
begin
  GetModal := 0;
  SearchJusoForm := TSearchJusoForm.Create(Self);
  try
    GetModal := SearchJusoForm.ShowModal;
  finally
    if GetModal = mrOk then begin
      SearchJusoForm.Free;
      with DataModule1 do begin
        EditPostCode.Text       := addressSearch.AZipCode;
        if addressSearch.ARoadBool then begin
          EditAdd.Text := addressSearch.ARoadAddr;
        end else begin
          EditAdd.Text := addressSearch.AJibunAddr;
        end;
        EditDetailAddress.Text  := addressSearch.ADetailAddr;

        addressSearch.AZipCode    := '';
        addressSearch.ARoadAddr   := '';
        addressSearch.AJibunAddr  := '';
        addressSearch.ADetailAddr := '';
        addressSearch.ARoadBool   := False;

        MemInsertChk.address := True;
      end;
      EditMPhone.SetFocus;
    end;
  end;
end;

procedure TMemInsertForm.ComboSelEmailEnter(Sender: TObject);
begin
  chkEmail.Caption       := '이메일을 입력해주세요.';
  Panel17.Color          := $00FFFCF9;
end;

procedure TMemInsertForm.ComboSelEmailExit(Sender: TObject);
begin
  Panel17.Color          := clWindow;
end;

procedure TMemInsertForm.ComboEmailSelPropertiesChange(Sender: TObject);
begin
  if ComboSelEmail.Text <> '직접입력' then begin
    EditLEmail.Properties.ReadOnly := True;
    EditLEmail.Text := ComboSelEmail.Text;
    chkEmail.Hide;
  end else begin
    EditLEmail.Properties.ReadOnly := False;
    EditLEmail.Text := '';
    EditLEmail.SetFocus;
  end;
end;

procedure TMemInsertForm.ComboMonEnter(Sender: TObject);
begin
  cxLabel9.Style.Color  := $00FFFCF9;
  Panel7.Color          := $00FFFCF9;
end;

procedure TMemInsertForm.ComboMonExit(Sender: TObject);
begin
  LabBirthMonth.Style.Color := clWindow;
  Panel7.Color          := clWindow;

  if ComboMon.Text = '' then begin
    chkBirth.Show;
    MemInsertChk.month := False;
  end else if (StrToInt(ComboMon.Text) > 12) OR (StrToInt(ComboMon.Text) < 1) then begin
    chkBirth.Show;
    MemInsertChk.month := False;
  end else begin
    if (StrToInt(ComboMon.Text) > 0) OR (StrToInt(ComboMon.Text) < 10) then begin
      ComboMon.Text := '0' + IntToStr(StrToInt(ComboMon.Text));
    end;
    chkBirth.Hide;
    MemInsertChk.month := True;
  end;

end;

procedure TMemInsertForm.ComboMonKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ComboMon.Text <> '' then begin
    LabBirthMonth.hide;
  end else begin
    LabBirthMonth.show;
  end;

end;

procedure TMemInsertForm.ComboMonPropertiesChange(Sender: TObject);
begin
  if ComboMon.Text <> '' then begin
    LabBirthMonth.hide;
  end else begin
    LabBirthMonth.show;
  end;

end;

procedure TMemInsertForm.BtnEmailChkClick(Sender: TObject);
var
  eemail, ebody, emailchk   : String;
  chk                       : Integer;

begin
  if EditFEmail.Text = '' then begin
    chkEmail.Show;
    EditFEmail.SetFocus;
    Exit;

  end else if EditLEmail.Text = '' then begin
    chkEmail.Show;
    EditLEmail.SetFocus;
    Exit;

  end else begin
    eemail := EditFEmail.Text + '@' + EditLEmail.Text;

    with DataModule1.QH_DML do begin
      SQL.Clear;
      SQL.ADD('SELECT memail FROM household');
      SQL.ADD('   WHERE memail = :EMAIL       ');

      ParamByName('EMAIL').AsString := eemail;
      Open;

      emailchk := FieldByName('memail').AsString;
    end;

    if eemail = emailchk then begin
      ShowMessage('중복된 이메일 입니다.');
      EditFEmail.SetFocus;
      Exit;

    end else begin
      Screen.Cursor := crHourGlass;

      ebody := HDataMethod.GetRandomString;

      DataModule1.emailCerti.eemail    := eemail;
      DataModule1.emailCerti.ebody     := ebody;

      DataModule1.SendEmail('가계부 회원가입 이메일 인증번호 입니다.', ebody);

      Screen.Cursor := crDefault;

      EmailchkForm := TEmailchkForm.Create(Application);

      chk := EmailchkForm.ShowModal;

      if chk = 1 then begin
        MemInsertChk.email                := True;
        chkEmail.Style.TextColor          := clGreen;
        chkEmail.Caption                  := '이메일 인증이 완료되었습니다.';
        EditFEmail.Properties.ReadOnly    := True;
        EditLEmail.Properties.ReadOnly    := True;
        ComboSelEmail.Properties.ReadOnly := True;
        chkEmail.Show;

      end else if chk = 7 then begin
        MemInsertChk.email        := False;
        ShowMessage('인증시간이 초과되었습니다.');

      end;

      DataModule1.emailCerti.eemail    := '';
      DataModule1.emailCerti.ebody := '';
      EmailchkForm.Free;
    end;

  end;

end;

procedure TMemInsertForm.BtnEmailChkMouseEnter(Sender: TObject);
begin
  BtnEmailChk.Color := $00FFAB57;
end;

procedure TMemInsertForm.BtnEmailChkMouseLeave(Sender: TObject);
begin
  BtnEmailChk.Color := $00FFBF80;
end;

procedure TMemInsertForm.BtnMemInsertClick(Sender: TObject);
var
  nam, id, pw, birth, year, month, day, sex, add,
  phone, phonechk, email, idiv, postcode          : string;

  idx                                             : Integer;
//  TranID                                          : TBytes;
begin
  if MemInsertChk.name = False then begin
    ShowMessage('이름이 잘못 입력되었습니다.');
    EditName.SetFocus;
  end else if MemInsertChk.id = False then begin
    ShowMessage('아이디가 잘못 입력되었습니다.');
    EditID.SetFocus;
  end else if MemInsertChk.pw = False then begin
    ShowMessage('비밀번호가 잘못 입력되었습니다.');
    EditPW.SetFocus;
  end else if MemInsertChk.pwchk = False then begin
    ShowMessage('비밀번호 확인이 잘못 입력되었습니다.');
    EditPWchk.SetFocus;
  end else if MemInsertChk.year = False then begin
    ShowMessage('연도가 잘못 입력되었습니다.');
    EditYear.SetFocus;
  end else if MemInsertChk.month = False then begin
    ShowMessage('월이 잘못 입력되었습니다.');
    ComboMon.SetFocus;
  end else if MemInsertChk.day = False then begin
    ShowMessage('일이 잘못 입력되었습니다.');
    EditDay.SetFocus;
  end else if MemInsertChk.address = False then begin
    ShowMessage('주소가 잘못 입력되었습니다.');
    EditPostCode.SetFocus;
  end else if MemInsertChk.phone1 = False then begin
    ShowMessage('휴대폰번호가 잘못 입력되었습니다.');
    ComFPhone.SetFocus;
  end else if MemInsertChk.phone2 = False then begin
    ShowMessage('휴대폰번호가 잘못 입력되었습니다.');
    EditMPhone.SetFocus;
  end else if MemInsertChk.phone3 = False then begin
    ShowMessage('휴대폰번호가 잘못 입력되었습니다.');
    EditLPhone.SetFocus;
  end else if MemInsertChk.email = False then begin
    ShowMessage('이메일을 인증해주세요.');
    EditLEmail.SetFocus;
  end else begin

    phone := ComFPhone.Text + '-' + EditMPhone.Text + '-' + EditLPhone.Text;

    try
      with DataModule1.QH_DML do begin
        SQL.Clear;
        SQL.ADD('SELECT mphone FROM household');
        SQL.ADD('   WHERE mphone = :MPHONE       ');

        ParamByName('MPHONE').AsString := phone;
        Open;

        phonechk := FieldByName('mphone').AsString;
      end;
    finally
    end;

    if phone = phonechk then begin
      ShowMessage('중복된 전화번호 입니다.');
      MemInsertChk.phone2 := False;
      EditMPhone.SetFocus;

    end else begin
      nam       := HDataMethod.HITSEncrypt(EditName.Text, KEY);
      id        := HDataMethod.HITSEncrypt(EditID.Text, KEY);
      pw        := HDataMethod.HITSHashEncrypt(EditPW.Text);
      year      := EditYear.Text;
      month     := ComboMon.Text;
      day       := EditDay.Text;
      birth     := HDataMethod.HITSEncrypt(year + '-' + month + '-' + day, KEY);
      postcode  := HDataMethod.HITSHashEncrypt(EditPostCode.Text);

      if RBtnSexM.Checked then begin
        sex := 'M';
      end else begin
        sex := 'F';
      end;

      add   := HDataMethod.HITSEncrypt(EditAdd.Text + ' | ' + EditDetailAddress.Text, KEY);
      email := HDataMethod.HITSEncrypt(EditFEmail.Text + '@' + EditLEmail.Text, KEY);
      phone := HDataMethod.HITSEncrypt(phone, KEY);

      with DataModule1 do begin

        with QH_DML do begin
          try

            if DataModule1.OraSession1.InTransaction then begin
              DataModule1.OraSession1.Commit;
            end;

            DataModule1.OraSession1.StartTransaction;

            SQL.Clear;
            SQL.Add(' INSERT INTO household(                        ');
            SQL.Add('   mnum, mname, mid, mpw, mbirth,              ');
            SQL.Add('   msex, mpostcode, madd, memail, mphone)      ');
            SQL.Add(' VALUES(household_seq.nextval,                 ');
            SQL.Add('   :MNAME, :MID,  :MPW,  :MBIRTH,              ');
            SQL.Add('   :MSEX,  :MPOSTCODE, :MADD, :MEMAIL, :MPHONE) ');

            ParamByName('MNAME').AsString       := nam;
            ParamByName('MID').AsString         := id;
            ParamByName('MPW').AsString         := pw;
            ParamByName('MBIRTH').AsString      := birth;
            ParamByName('MSEX').AsString        := sex;
            ParamByName('MAPOSTCODE').AsString  := postcode;
            ParamByName('MADD').AsString        := add;
            ParamByName('MEMAIL').AsString      := email;
            ParamByName('MPHONE').AsString      := phone;

            Execute;

            SQL.Clear;
            SQL.Add(' INSERT INTO hcontents                                 ');
            SQL.Add('  (cno, cnum, cid, cdate, cdiv, citem, cmeans,         ');
            SQL.Add('   ctype, cincome, cspending, ccreditbal, cbalance)    ');
            SQL.Add(' VALUES                                                ');
            SQL.Add('  (hcontents_seq.nextval, 0, :MID, :MDATE, 0, 0, 0,    ');
            SQL.Add('   0, 0, 0, 0, 0)                                      ');
            ParamByName('MID').AsString := id;
            ParamByName('MDATE').AsDate := now;

            Execute;

            iDiv := '지출';

            IItem[0] := '카드요금 납부';
            IItem[1] := '식비';
            IItem[2] := '의류비';
            IItem[3] := '교통비';
            IItem[4] := '경조사비';

            for idx := 0 to 5 - 1 do begin
              SQL.Clear;
              SQL.Add('INSERT INTO hitem VALUES(                   ');
              SQL.Add('  hitem_seq.nextval, :IID, :IDIV, :IITEM )  ');
              ParamByName('IID').AsString   := id;
              ParamByName('IDIV').AsString  := idiv;
              ParamByName('IITEM').AsString := IItem[idx];

              Execute;

            end;

            SQL.Clear;
            SQL.Add('INSERT INTO hitem VALUES(                   ');
            SQL.Add('  hitem_seq.nextval, :IID, :IDIV, :IITEM)   ');
            ParamByName('IID').AsString   := id;
            ParamByName('IDIV').AsString  := '수입';
            ParamByName('IITEM').AsString := '월급';

            Execute;

            TType[0] := 'NH농협';
            TType[1] := 'IBK기업';
            TType[2] := 'KB국민';
            TType[3] := '우리';
            TType[4] := '하나';
            TType[5] := '롯데';
            TType[6] := '비씨';
            TType[7] := '삼성';
            TType[8] := '신한';
            TType[9] := '현대';

            for idx := 0 to 9 do begin
              SQL.Clear;
              SQL.Add('INSERT INTO htype                            ');
              SQL.Add('  VALUES (htype_seq.nextval, :TID, :TTYPE)   ');

              ParamByName('TID').AsString := id;
              ParamByName('TTYPE').AsString := TType[idx];

              Execute;
            end;

            SQL.Clear;
            SQL.Add('INSERT INTO hanniversary                                                                      ');
            SQL.Add('  VALUES( hanniversary_seq.nextval, :AID, :ATPYE, :ACONTENTS, :ANAME, :ACYCLE, :AANIVERSARY ) ');

            ParamByName('AID').AsString       := id;
            ParamByName('ATPYE').AsString     := '양력';
            ParamByName('ACONTENTS').AsString := '생일';
            ParamByName('ANAME').AsString     := EditName.Text;
            ParamByName('ACYCLE').AsString    := '일년';
            ParamByName('AANIVERSARY').AsDate := StrToDate(year + '-' + month + '-' + day);

            Execute;

            SQL.Clear;
            SQL.Add('INSERT INTO hexcelStore (eno, eid)         ');
            SQL.Add('  VALUES( hexcelStore_seq.nextval, :EID )  ');

            ParamByName('EID').AsString     := id;

            Execute;

            ShowMessage('회원가입이 완료되었습니다.');

            if DataModule1.OraSession1.InTransaction then begin
              DataModule1.OraSession1.Commit;
            end;

          except
            on e : Exception do begin
              Application.MessageBox(PChar(e.Message), PChar('회원가입 실패'), MB_ICONERROR + MB_OK);
              if DataModule1.OraSession1.InTransaction then begin
                 DataModule1.OraSession1.rollback;
              end;
            end;

          end;

        end;

//        end;

      end;

      ModalResult := mrCancel;

    end;

  end;

end;

procedure TMemInsertForm.ComFPhoneEnter(Sender: TObject);
begin
  Panel11.Color          := $00FFFCF9;
end;

procedure TMemInsertForm.ComFPhoneExit(Sender: TObject);
begin
  Panel11.Color          := clWindow;

  if ComFPhone.Text = '' then begin
    chkPhone.Show;
    MemInsertChk.phone1 := False;
  end else begin
    chkPhone.Hide;
    MemInsertChk.phone1 := True;
  end;

end;

procedure TMemInsertForm.LabIDClick(Sender: TObject);
begin
  EditID.SetFocus;
end;

procedure TMemInsertForm.LabPWClick(Sender: TObject);
begin
  EditPw.SetFocus;
end;

procedure TMemInsertForm.LabPWChkClick(Sender: TObject);
begin
  EditPWchk.SetFocus;
end;

procedure TMemInsertForm.LabBirthYearClick(Sender: TObject);
begin
  EditYear.SetFocus;
end;

procedure TMemInsertForm.LabBirthMonthClick(Sender: TObject);
begin
  ComboMon.SetFocus;
end;

procedure TMemInsertForm.LabBirthDayClick(Sender: TObject);
begin
  EditDay.SetFocus;
end;

procedure TMemInsertForm.LabAddressClick(Sender: TObject);
begin
  BtnSearchAddressClick(nil);
end;

procedure TMemInsertForm.LabNameClick(Sender: TObject);
begin
  EditName.SetFocus;
end;

procedure TMemInsertForm.EditMPhoneEnter(Sender: TObject);
begin
  Panel12.Color          := $00FFFCF9;
end;

procedure TMemInsertForm.EditMPhoneExit(Sender: TObject);
begin
  Panel12.Color          := clWindow;

  if EditMPhone.Text = '' then begin
    chkPhone.Show;
    MemInsertChk.phone2 := False;
  end else begin
    chkPhone.Hide;
    MemInsertChk.phone2 := True;
  end;
end;

procedure TMemInsertForm.EditLPhoneEnter(Sender: TObject);
begin
  Panel13.Color          := $00FFFCF9;
end;

procedure TMemInsertForm.EditLPhoneExit(Sender: TObject);
begin
  Panel13.Color          := clWindow;

  if EditLPhone.Text = '' then begin
    chkPhone.Show;
    MemInsertChk.phone3 := False;
  end else begin
    chkPhone.Hide;
    MemInsertChk.phone3 := True;
  end;
end;

procedure TMemInsertForm.EditLEmailEnter(Sender: TObject);
begin
  Panel16.Color          := $00FFFCF9;
end;

procedure TMemInsertForm.EditLEmailExit(Sender: TObject);
var
  emailchk: string;
begin
  Panel16.Color     := clWindow;
  emailchk          := EditLEmail.Text;

  if emailchk = '' then begin
    chkEmail.Style.TextColor := clRed;
    chkEmail.Caption         := '이메일을 입력해주세요.';
    chkEmail.Show;
  end else begin
    chkEmail.Hide;
  end;

end;

procedure TMemInsertForm.EditAddClick(Sender: TObject);
begin  
  if TcxTextEdit(Sender).Text = '' then begin
    BtnSearchAddressClick(nil);
  end else begin
    EditMPhone.SetFocus;
    Exit;
  end;
end;

procedure TMemInsertForm.EditAddPropertiesChange(Sender: TObject);
begin
  if EditAdd.Text <> '' then begin
    LabAddress.hide;
    MemInsertChk.address := True;
  end else begin
    LabAddress.show;
    MemInsertChk.address := False;
  end;
end;

procedure TMemInsertForm.EditDayEnter(Sender: TObject);
begin
  LabBirthDay.Style.Color  := $00FFFCF9;
  Panel8.Color          := $00FFFCF9;
end;

procedure TMemInsertForm.EditDayExit(Sender: TObject);
begin
  LabBirthDay.Style.Color := clWindow;
  Panel8.Color          := clWindow;

  if EditDay.Text = '' then begin
    chkBirth.Show;
    MemInsertChk.day := False;
  end else if (StrToInt(EditDay.Text) > 31) or (StrToInt(EditDay.Text) < 1) then begin
    chkBirth.Show;
    MemInsertChk.day := False;
  end else begin
    if (StrToInt(EditDay.Text) > 0) AND (StrToInt(EditDay.Text) < 10) then begin
      EditDay.Text := '0' + IntToStr(StrToInt(EditDay.Text));
    end;
    chkBirth.Hide;
    MemInsertChk.day := True;
  end;
end;

procedure TMemInsertForm.EditDayKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EditDay.Text <> '' then begin
    LabBirthDay.hide;
  end else begin
    LabBirthDay.show;
  end;
end;

procedure TMemInsertForm.EditDetailAddressPropertiesChange(Sender: TObject);
begin
  if EditDetailAddress.Text = '' then begin
    LabDetailAddress.Show;
  end else begin
    LabDetailAddress.Hide;
  end;
end;

procedure TMemInsertForm.EditFEmailEnter(Sender: TObject);
begin
  Panel15.Color          := $00FFFCF9;
end;

procedure TMemInsertForm.EditFEmailExit(Sender: TObject);
var
  emailchk: string;
begin
  Panel15.Color          := clWindow;
  emailchk := EditFEmail.Text;

  if emailchk = '' then begin
    chkEmail.Caption    := '이메일을 입력해주세요.';
    chkEmail.Show;
  end else begin
    chkEmail.Hide;
  end;

end;

procedure TMemInsertForm.EditEmailKeyPress(Sender: TObject; var Key: Char);
var
  chk: Boolean;
begin
  chk := HDataMethod.hanglechk(Key, Self.Handle);
  if chk AND (key <> '') then begin
    chkEmail.Caption := '영문으로 이메일을 입력해주세요.';
    chkEmail.Show;
    key := #0;
  end;

end;

procedure TMemInsertForm.EditIDEnter(Sender: TObject);
begin
  LabID.Style.Color := $00FFFCF9;
  Panel2.Color         := $00FFFCF9;
end;

procedure TMemInsertForm.EditIDExit(Sender: TObject);
var
  id, idchk: string;
  IDlength: Integer;
begin

  LabID.Style.Color := clWindow;
  Panel2.Color          := clWindow;

  id := HDataMethod.HITSEncrypt(EditID.Text, KEY);
  IDlength := Length(EditID.Text);

  if (IDlength < 4) or (IDlength > 18) then
  begin
    chkID.Caption := '4~18자의 아이디를 입력해주세요.';
    MemInsertChk.id := False;
    chkID.Show;

  end
  else
  begin
    chkID.Caption := '아이디가 올바르지 않습니다.';
    chkID.Hide;

    try
      with DataModule1.QH_DML do
      begin

        SQL.Clear;
        SQL.ADD('SELECT mid FROM household');
        SQL.ADD('   WHERE mid = :ID       ');

        ParamByName('ID').AsString := id;
        ExecSQL;

        idchk := FieldByName('mid').AsString;
      end;

      if id <> idchk then
      begin
        chkID.Show;
        chkID.Caption := '좋은 아이디네요.';
        chkID.Style.TextColor := clGreen;
        MemInsertChk.id := True;
      end
      else
      begin
        ShowMessage('중복된 아이디 입니다.');
        MemInsertChk.id := False;
        EditID.SetFocus;
      end;

    finally

    end;

  end;
end;

procedure TMemInsertForm.EditIDKeyPress(Sender: TObject; var Key: Char);
var
  chk: Boolean;
begin

  chk := HDataMethod.hanglechk(Key, Self.Handle);
  if chk AND (Key <> '') then begin
    chkID.Style.TextColor := $008080FF;
    chkID.Caption         := '영문으로 아이디를 입력해주세요.';
    chkID.Show;
    key := #0;
  end else begin
    if key <> '' then begin
      chkID.Hide;
    end;
  end;
end;

procedure TMemInsertForm.EditIDKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EditID.Text <> '' then begin
    LabID.hide;
  end else begin
    LabID.show;
  end;
end;

procedure TMemInsertForm.EditNameEnter(Sender: TObject);
begin
  LabName.Style.Color  := $00FFFCF9;
  Panel5.Color          := $00FFFCF9;
end;

procedure TMemInsertForm.EditNameExit(Sender: TObject);
var
  namechk: string;
begin
  LabName.Style.Color := clWindow;
  Panel5.Color          := clWindow;

  namechk := EditName.Text;
  if namechk = '' then
  begin
    chkName.Caption := '이름을 입력해주세요.';
    MemInsertChk.name := False;
    chkName.Show;
  end
  else if namechk <> '' then
  begin
    chkName.Hide;
    MemInsertChk.name := True;
  end;

end;

procedure TMemInsertForm.EditNameKeyPress(Sender: TObject; var Key: Char);
var
  chk: Boolean;
begin
  chk := HDataMethod.hanglechk(Key, Self.Handle);
  if not (chk) then
  begin
    if key <> '' then
    begin
      chkName.Caption := '한글을 입력해주세요.';
      MemInsertChk.name := False;
      chkName.Show;
      key := #0;
    end;
  end
  else if not (EditName.Text = '') then
  begin
    chkName.Hide;
    MemInsertChk.name := True;
  end;
end;

procedure TMemInsertForm.EditNameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EditName.Text <> '' then begin
    LabName.hide;
  end else begin
    LabName.show;
  end;
end;


procedure TMemInsertForm.EditPostCodePropertiesChange(Sender: TObject);
begin
  if EditPostCode.Text <> '' then begin
    LabPostCode.Hide;
  end else begin
    LabPostCode.Show;
  end;
end;

procedure TMemInsertForm.EditPWchkEnter(Sender: TObject);
begin
  LabPWChk.Style.Color := $00FFFCF9;
  Panel4.Color          := $00FFFCF9;
end;

procedure TMemInsertForm.EditPWchkExit(Sender: TObject);
var
  pw, pwchk: string;
begin
  LabPWChk.Style.Color := clWindow;
  Panel4.Color          := clWindow;

  pw := EditPW.Text;
  pwchk := EditPWchk.Text;

  if pwchk = '' then begin
    chkPWTrue.Caption := '비밀번호확인을 입력해주세요.';
    MemInsertChk.pwchk := False;
    chkPWTrue.Show;
    chkPW.Hide;
  end else begin
    if not (pwchk = pw) then begin
      chkPWTrue.Caption := '비밀번호가 일치하지 않습니다.';
      MemInsertChk.pwchk := False;
      chkPWTrue.Show;
      chkPW.Hide;
    end else begin
      chkPWTrue.Hide;
      MemInsertChk.pwchk := True;
    end;
  end;

end;

procedure TMemInsertForm.EditPWchkKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EditPWChk.Text <> '' then begin
    LabPWChk.hide;
  end else begin
    LabPWChk.show;
  end;
end;

procedure TMemInsertForm.EditPWEnter(Sender: TObject);
begin
  LabPW.Style.Color := $00FFFCF9;
  Panel3.Color          := $00FFFCF9;
end;

procedure TMemInsertForm.EditPWExit(Sender: TObject);
var
  pw: string;
  PWlength: Integer;
begin
  LabPW.Style.Color := clWindow;
  Panel3.Color          := clWindow;

  pw := EditPW.Text;
  PWlength := Length(pw);
  if pw = '' then
  begin
    chkpw.Caption := '비밀번호를 입력해주세요.';
    MemInsertChk.pw := False;
    chkpw.Show;
    chkPWTrue.Hide;
  end else begin
    if (PWlength < 6) or (PWlength > 18) then  begin
      chkpw.Caption := '비밀번호를 8~16자로 입력해주세요.';
      MemInsertChk.pw := False;
      chkPW.Show;
      chkPWTrue.Hide;
    end else begin
      chkPW.Hide;
      MemInsertChk.pw := True;
    end;
  end;

end;

procedure TMemInsertForm.EditPWKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EditPW.Text <> '' then begin
    LabPW.hide;
  end else begin
    LabPW.show;
  end;
end;

procedure TMemInsertForm.EditYear2Exit(Sender: TObject);
var
  year: string;
  Nyear: string;
  age: Integer;
begin
  LabBirthYear.Style.Color := clWindow;
  Panel6.Color          := clWindow;

  year := EditYear.Text;
  Nyear := FormatDateTime('yyyy', Now);

  if year = '' then
  begin
    chkBirth.show;
    MemInsertChk.year := False;
  end
  else if StrToInt(year) > StrToInt(Nyear) then
  begin
    chkBirth.show;
    MemInsertChk.year := False;
  end
  else
  begin
    chkBirth.hide;
    age := StrToInt(Nyear) - StrToInt(year) + 1;
    EditAge.Text := IntToStr(age);
    EditAge.Properties.ReadOnly := True;
    MemInsertChk.year := True;
    LabAge.Hide;
  end;

end;

procedure TMemInsertForm.EditYearEnter(Sender: TObject);
begin
  cxLabel8.Style.Color  := $00FFFCF9;
  Panel6.Color          := $00FFFCF9;
end;

procedure TMemInsertForm.EditYearKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EditYear.Text <> '' then begin
    LabBirthYear.hide;
  end else begin
    LabBirthYear.show;
  end;

end;

procedure TMemInsertForm.FormCreate(Sender: TObject);
begin
  chkName.Hide;
  chkID.Hide;
  chkPW.Hide;
  chkPWTrue.Hide;
  chkBirth.Hide;
  chkAdd.Hide;
  chkEmail.Hide;
  chkPhone.Hide;
  with MemInsertChk do
  begin
    name    := False;
    id      := False;
    pw      := False;
    pwchk   := False;
    year    := False;
    month   := False;
    day     := False;
    address := False;
    phone1  := True;
    phone2  := False;
    phone3  := False;
    email   := False;
  end;
end;

procedure TMemInsertForm.OnlyNumber(Sender: TObject; var Key: Char);
begin
  if not ((key in ['0'..'9']) or (Key = #8) or (key = '') or (key = #9)) then begin
    chkBirth.Show;
    Key := #0;
  end;
end;

procedure TMemInsertForm.OnlyNumber2(Sender: TObject; var Key: Char);
begin
  if not ((key in ['0'..'9']) or (Key = #8) or (key = '') or (key = #9)) then
  begin
    chkPhone.Show;
    Key := #0;
  end;
end;

end.
