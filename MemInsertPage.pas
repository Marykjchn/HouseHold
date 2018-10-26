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

    // �� ������ ���� �� hide
    procedure FormCreate(Sender: TObject);   


    // ------------- ���� �� Ȯ�� -------------
    // �������� Ȯ��
    procedure OnlyNumber(Sender: TObject; var Key: Char);
    procedure OnlyNumber2(Sender: TObject; var Key: Char);



    // ���� ��ư Ŭ���� DB�� ȸ������ INSERT
    procedure BtnMemInsertClick(Sender: TObject);     

    // ------------- ȸ������ �Է¶� �̺�Ʈ -------------

    // -----���̵�-----
    procedure LabelClick(Sender: TObject);
    procedure EditEnter(Sender: TObject);
    procedure EditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditIDKeyPress(Sender: TObject; var Key: Char);
    procedure EditExit(Sender: TObject);

    // -----�̸�-----
    procedure EditNameKeyPress(Sender: TObject; var Key: Char);

    // -----�������-----
    // �⵵
    // ��
    procedure ComboMonPropertiesChange(Sender: TObject);
    // ��

    // -----�ּ�-----
    procedure LabAddressClick(Sender: TObject);

    // -----�̸���-----
    // ���̵�
    procedure EditEmailKeyPress(Sender: TObject; var Key: Char);
    // ����
    procedure ComboEmailSelPropertiesChange(Sender: TObject);

    // --------------- ��ư ȣ���� ������ ---------------
    procedure BtnStyle_1MouseEnter(Sender: TObject);
    procedure BtnStyle_1MouseLeave(Sender: TObject);
    procedure BtnStyle_2MouseEnter(Sender: TObject);
    procedure BtnStyle_2MouseLeave(Sender: TObject);

    // --------------- ���� ���� ��ȣ ---------------
    procedure BtnEmailChkClick(Sender: TObject);
    procedure EditAddPropertiesChange(Sender: TObject);
    procedure EditPostCodePropertiesChange(Sender: TObject);
    procedure BtnSearchAddressClick(Sender: TObject);
    procedure EditAddClick(Sender: TObject);
    procedure EditDetailAddressPropertiesChange(Sender: TObject);
    //function SendEmail : string;

    // --------------- Edit�յ�ó�� ---------------
    procedure EditEvent(EditN : TWinControl);
    procedure ComboKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);

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

procedure TMemInsertForm.BtnStyle_1MouseEnter(Sender: TObject);
begin
  DataModule1.SetBtnStyle_1(TWinControl(Sender), True);
end;

procedure TMemInsertForm.BtnStyle_1MouseLeave(Sender: TObject);
begin
  DataModule1.SetBtnStyle_1(TWinControl(Sender), False);
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
    SearchJusoForm.Free;
  end;
end;

procedure TMemInsertForm.ComboEmailSelPropertiesChange(Sender: TObject);
begin
  if ComboSelEmail.Text <> '�����Է�' then begin
    EditLEmail.Properties.ReadOnly := True;
    EditLEmail.Text := ComboSelEmail.Text;
    chkEmail.Hide;
  end else begin
    EditLEmail.Properties.ReadOnly := False;
    EditLEmail.Text := '';
    EditLEmail.SetFocus;
  end;
end;

procedure TMemInsertForm.ComboKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if TcxComboBox(Sender).Text <> '' then begin
    Datamodule1.EditValueChange(TWinControl(Sender).Parent, False);
  end else begin
    Datamodule1.EditValueChange(TWinControl(Sender).Parent, True);
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
      ShowMessage('�ߺ��� �̸��� �Դϴ�.');
      EditFEmail.SetFocus;
      Exit;

    end else begin
      Screen.Cursor := crHourGlass;

      ebody := HDataMethod.GetRandomString;

      DataModule1.emailCerti.eemail    := eemail;
      DataModule1.emailCerti.ebody     := ebody;

      DataModule1.SendEmail('����� ȸ������ �̸��� ������ȣ �Դϴ�.', ebody);

      Screen.Cursor := crDefault;

      EmailchkForm := TEmailchkForm.Create(Application);

      chk := EmailchkForm.ShowModal;

      if chk = 1 then begin
        MemInsertChk.email                := True;
        chkEmail.Style.TextColor          := clGreen;
        chkEmail.Caption                  := '�̸��� ������ �Ϸ�Ǿ����ϴ�.';
        EditFEmail.Properties.ReadOnly    := True;
        EditLEmail.Properties.ReadOnly    := True;
        ComboSelEmail.Properties.ReadOnly := True;
        chkEmail.Show;

      end else if chk = 7 then begin
        MemInsertChk.email        := False;
        ShowMessage('�����ð��� �ʰ��Ǿ����ϴ�.');

      end;

      DataModule1.emailCerti.eemail    := '';
      DataModule1.emailCerti.ebody := '';
      EmailchkForm.Free;
    end;

  end;

end;

procedure TMemInsertForm.BtnStyle_2MouseEnter(Sender: TObject);
begin
  DataModule1.SetBtnStyle_2(TWinControl(Sender), True);
end;

procedure TMemInsertForm.BtnStyle_2MouseLeave(Sender: TObject);
begin
  DataModule1.SetBtnStyle_2(TWinControl(Sender), False);
end;

procedure TMemInsertForm.BtnMemInsertClick(Sender: TObject);
var
  nam, id, pw, birth, year, month, day, sex, add,
  phone, phonechk, email, idiv, postcode          : string;

  idx                                             : Integer;
//  TranID                                          : TBytes;
begin
  if MemInsertChk.name = False then begin
    ShowMessage('�̸��� �߸� �ԷµǾ����ϴ�.');
    EditName.SetFocus;
  end else if MemInsertChk.id = False then begin
    ShowMessage('���̵� �߸� �ԷµǾ����ϴ�.');
    EditID.SetFocus;
  end else if MemInsertChk.pw = False then begin
    ShowMessage('��й�ȣ�� �߸� �ԷµǾ����ϴ�.');
    EditPW.SetFocus;
  end else if MemInsertChk.pwchk = False then begin
    ShowMessage('��й�ȣ Ȯ���� �߸� �ԷµǾ����ϴ�.');
    EditPWchk.SetFocus;
  end else if MemInsertChk.year = False then begin
    ShowMessage('������ �߸� �ԷµǾ����ϴ�.');
    EditYear.SetFocus;
  end else if MemInsertChk.month = False then begin
    ShowMessage('���� �߸� �ԷµǾ����ϴ�.');
    ComboMon.SetFocus;
  end else if MemInsertChk.day = False then begin
    ShowMessage('���� �߸� �ԷµǾ����ϴ�.');
    EditDay.SetFocus;
  end else if MemInsertChk.address = False then begin
    ShowMessage('�ּҰ� �߸� �ԷµǾ����ϴ�.');
    EditPostCode.SetFocus;
  end else if MemInsertChk.phone1 = False then begin
    ShowMessage('�޴�����ȣ�� �߸� �ԷµǾ����ϴ�.');
    ComFPhone.SetFocus;
  end else if MemInsertChk.phone2 = False then begin
    ShowMessage('�޴�����ȣ�� �߸� �ԷµǾ����ϴ�.');
    EditMPhone.SetFocus;
  end else if MemInsertChk.phone3 = False then begin
    ShowMessage('�޴�����ȣ�� �߸� �ԷµǾ����ϴ�.');
    EditLPhone.SetFocus;
  end else if MemInsertChk.email = False then begin
    ShowMessage('�̸����� �������ּ���.');
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
      ShowMessage('�ߺ��� ��ȭ��ȣ �Դϴ�.');
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

            iDiv := '����';

            IItem[0] := 'ī���� ����';
            IItem[1] := '�ĺ�';
            IItem[2] := '�Ƿ���';
            IItem[3] := '�����';
            IItem[4] := '�������';

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
            ParamByName('IDIV').AsString  := '����';
            ParamByName('IITEM').AsString := '����';

            Execute;

            TType[0] := 'NH����';
            TType[1] := 'IBK���';
            TType[2] := 'KB����';
            TType[3] := '�츮';
            TType[4] := '�ϳ�';
            TType[5] := '�Ե�';
            TType[6] := '��';
            TType[7] := '�Ｚ';
            TType[8] := '����';
            TType[9] := '����';

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
            ParamByName('ATPYE').AsString     := '���';
            ParamByName('ACONTENTS').AsString := '����';
            ParamByName('ANAME').AsString     := EditName.Text;
            ParamByName('ACYCLE').AsString    := '�ϳ�';
            ParamByName('AANIVERSARY').AsDate := StrToDate(year + '-' + month + '-' + day);

            Execute;

            SQL.Clear;
            SQL.Add('INSERT INTO hexcelStore (eno, eid)         ');
            SQL.Add('  VALUES( hexcelStore_seq.nextval, :EID )  ');

            ParamByName('EID').AsString     := id;

            Execute;

            ShowMessage('ȸ�������� �Ϸ�Ǿ����ϴ�.');

            if DataModule1.OraSession1.InTransaction then begin
              DataModule1.OraSession1.Commit;
            end;

          except
            on e : Exception do begin
              Application.MessageBox(PChar(e.Message), PChar('ȸ������ ����'), MB_ICONERROR + MB_OK);
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

procedure TMemInsertForm.LabAddressClick(Sender: TObject);
begin
  if TcxTextEdit(Sender).Text = '' then begin
    BtnSearchAddressClick(nil);
  end else begin
    EditMPhone.SetFocus;
    Exit;
  end;
end;

procedure TMemInsertForm.LabelClick(Sender: TObject);
begin
  DataModule1.EditSetFocus(TwinControl(Sender).Parent);
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

procedure TMemInsertForm.EditDetailAddressPropertiesChange(Sender: TObject);
begin
  if EditDetailAddress.Text = '' then begin
    LabDetailAddress.Show;
  end else begin
    LabDetailAddress.Hide;
  end;
end;

procedure TMemInsertForm.EditEmailKeyPress(Sender: TObject; var Key: Char);
var
  chk: Boolean;
begin
  chk := HDataMethod.hanglechk(Key, Self.Handle);
  if chk AND (key <> '') then begin
    chkEmail.Caption := '�������� �̸����� �Է����ּ���.';
    chkEmail.Show;
    key := #0;
  end;

end;

procedure TMemInsertForm.EditEnter(Sender: TObject);
begin
  DataModule1.SetEditStyle(TWinControl(Sender).Parent, True);
end;

procedure TMemInsertForm.EditEvent(EditN : TWinControl);
var
  id, idchk : String;
  IDlength  : Integer;
  EditNam   : String;
  pw, pwchk : String;
  PWlength  : Integer;
  namechk   : String;
  year      : String;
  Nyear     : String;
  age       : Integer;
  emailchk  : String;
  emailchk2 : string;
begin   //
  EditNam  := EditN.Name;

  id        := HDataMethod.HITSEncrypt(EditID.Text, KEY);
  IDlength  := Length(EditID.Text);
  pw        := EditPW.Text;
  PWlength  := Length(pw);
  pwchk     := EditPWchk.Text;
  namechk   := EditName.Text;
  year      := EditYear.Text;
  Nyear     := FormatDateTime('yyyy', Now);

  if EditNam = 'EditID' then begin
    if (IDlength < 4) or (IDlength > 18) then begin
      chkID.Caption := '4~18���� ���̵� �Է����ּ���.';
      MemInsertChk.id := False;
      chkID.Show;

    end else begin
      chkID.Caption := '���̵� �ùٸ��� �ʽ��ϴ�.';
      chkID.Hide;

      with DataModule1.QH_DML do begin
        SQL.Clear;
        SQL.ADD('SELECT mid FROM household');
        SQL.ADD('   WHERE mid = :ID       ');

        ParamByName('ID').AsString := id;
        ExecSQL;

        idchk := FieldByName('mid').AsString;
      end;

      if id <> idchk then begin
        chkID.Show;
        chkID.Caption := '���� ���̵�׿�.';
        chkID.Style.TextColor := clGreen;
        MemInsertChk.id := True;
      end else begin
        ShowMessage('�ߺ��� ���̵� �Դϴ�.');
        MemInsertChk.id := False;
        EditID.SetFocus;
      end;
    end;

  end else if EditNam = 'EditPW' then begin
    if pw = '' then begin
      chkpw.Caption := '��й�ȣ�� �Է����ּ���.';
      MemInsertChk.pw := False;
      chkpw.Show;
      chkPWTrue.Hide;
    end else begin
      if (PWlength < 6) or (PWlength > 18) then  begin
        chkpw.Caption := '��й�ȣ�� 8~16�ڷ� �Է����ּ���.';
        MemInsertChk.pw := False;
        chkPW.Show;
        chkPWTrue.Hide;
      end else begin
        chkPW.Hide;
        MemInsertChk.pw := True;
      end;
    end;

  end else if EditNam = 'EditPW' then begin
    if pwchk = '' then begin
      chkPWTrue.Caption := '��й�ȣȮ���� �Է����ּ���.';
      MemInsertChk.pwchk := False;
      chkPWTrue.Show;
      chkPW.Hide;
    end else begin
      if not (pwchk = pw) then begin
        chkPWTrue.Caption := '��й�ȣ�� ��ġ���� �ʽ��ϴ�.';
        MemInsertChk.pwchk := False;
        chkPWTrue.Show;
        chkPW.Hide;
      end else begin
        chkPWTrue.Hide;
        MemInsertChk.pwchk := True;
      end;
    end;
  end else if EditNam = 'EditName' then begin
    if namechk = '' then begin
      chkName.Caption := '�̸��� �Է����ּ���.';
      MemInsertChk.name := False;
      chkName.Show;
    end else if namechk <> '' then begin
      chkName.Hide;
      MemInsertChk.name := True;
    end;

  end else if EditNam = 'EditYear' then begin
    if year = '' then begin
      chkBirth.show;
      MemInsertChk.year := False;
    end else if StrToInt(year) > StrToInt(Nyear) then begin
      chkBirth.show;
      MemInsertChk.year := False;
    end else begin
      chkBirth.hide;
      age := StrToInt(Nyear) - StrToInt(year) + 1;
      EditAge.Text := IntToStr(age);
      EditAge.Properties.ReadOnly := True;
      MemInsertChk.year := True;
      LabAge.Hide;
    end;

  end else if EditNam = 'ComboMon' then begin
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

  end else if EditNam = 'EditDay' then begin
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

  end else if EditNam = 'ComFPhone' then begin
    if ComFPhone.Text = '' then begin
      chkPhone.Show;
      MemInsertChk.phone1 := False;
    end else begin
      chkPhone.Hide;
      MemInsertChk.phone1 := True;
    end;

  end else if EditNam = 'EditMPhone' then begin
    if EditMPhone.Text = '' then begin
      chkPhone.Show;
      MemInsertChk.phone2 := False;
    end else begin
      chkPhone.Hide;
      MemInsertChk.phone2 := True;
    end;

  end else if EditNam = 'EditLPhone' then begin
     if EditLPhone.Text = '' then begin
      chkPhone.Show;
      MemInsertChk.phone3 := False;
    end else begin
      chkPhone.Hide;
      MemInsertChk.phone3 := True;
    end;

  end else if EditNam = 'EditFEmail' then begin
    if emailchk = '' then begin
      chkEmail.Caption    := '�̸����� �Է����ּ���.';
      chkEmail.Show;
    end else begin
      chkEmail.Hide;
    end;

  end else if EditNam = 'EditLEmail' then begin
    if emailchk2 = '' then begin
      chkEmail.Style.TextColor := clRed;
      chkEmail.Caption         := '�̸����� �Է����ּ���.';
      chkEmail.Show;
    end else begin
      chkEmail.Hide;
    end;
  end;








end;

procedure TMemInsertForm.EditExit(Sender: TObject);
var
  ControlN : TWinControl;
begin
  ControlN := TWinControl(Sender);

  DataModule1.SetEditStyle(ControlN.Parent, False);

  EditEvent(ControlN);

end;

procedure TMemInsertForm.EditIDKeyPress(Sender: TObject; var Key: Char);
var
  chk: Boolean;
begin

  chk := HDataMethod.hanglechk(Key, Self.Handle);
  if chk AND (Key <> '') then begin
    chkID.Style.TextColor := $008080FF;
    chkID.Caption         := '�������� ���̵� �Է����ּ���.';
    chkID.Show;
    key := #0;
  end else begin
    if key <> '' then begin
      chkID.Hide;
    end;
  end;
end;

procedure TMemInsertForm.EditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if TcxTextEdit(Sender).Text <> '' then begin
    Datamodule1.EditValueChange(TWinControl(Sender).Parent, False);
  end else begin
    Datamodule1.EditValueChange(TWinControl(Sender).Parent, True);
  end;
end;

procedure TMemInsertForm.EditNameKeyPress(Sender: TObject; var Key: Char);
var
  chk: Boolean;
begin 
  if Key = #13 then begin
    BtnMemInsert.OnClick(nil);
    Exit;
  end;

  chk := HDataMethod.hanglechk(Key, Self.Handle);
  if not(chk) then begin
    if key <> '' then begin
      chkName.Caption := '�ѱ��� �Է����ּ���.';
      MemInsertChk.name := False;
      chkName.Show;
      key := #0;

      Exit;
    end;
  end else if EditName.Text <> '' then begin
    chkName.Hide;
    MemInsertChk.name := True;
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

  with MemInsertChk do begin
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
