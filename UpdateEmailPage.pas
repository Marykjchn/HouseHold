unit UpdateEmailPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxControls,
  cxContainer, cxEdit, cxLabel, ExtCtrls;

type
  TUpdateEmailForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtnClose: TPanel;
    BtnEmailUpdate: TPanel;
    cxLabel10: TcxLabel;
    cxLabel9: TcxLabel;
    Panel15: TPanel;
    EditEmail1: TcxTextEdit;
    chkEmail: TcxLabel;
    cxLabel26: TcxLabel;
    Panel16: TPanel;
    EditEmail2: TcxTextEdit;
    Panel17: TPanel;
    ComboEmailSel: TcxComboBox;
    BtnEmailChk: TPanel;

    // --------------- 폼 생성시 이벤트 ---------------
    procedure FormCreate(Sender: TObject);

    // --------------- 버튼 호버시 색 변경 ---------------
    procedure BtnStyle_2MouseEnter(Sender: TObject);
    procedure BtnStyle_2MouseLeave(Sender: TObject);
    procedure BtnStyle_1MouseEnter(Sender: TObject);
    procedure BtnStyle_1MouseLeave(Sender: TObject);

    // --------------- 입력란 클릭 이벤트 ---------------
    procedure EditEnter(Sender: TObject);
    procedure EditExit(Sender: TObject);
    procedure EditEmailKeyPress(Sender: TObject; var Key: Char);
    procedure ComboEmailSelPropertiesChange(Sender: TObject);

    // ---------------- 버튼 클릭시 이벤트 ---------------
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnEmailChkClick(Sender: TObject);
    procedure BtnEmailUpdateClick(Sender: TObject);


  private
    { Private declarations }
    var
      Emailchk : Boolean;
  public
    { Public declarations }
  end;

var
  UpdateEmailForm: TUpdateEmailForm;

implementation

{$R *.dfm}

uses
  HDataMethod, DataModule, EmailchkPage;

procedure TUpdateEmailForm.BtnCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TUpdateEmailForm.BtnEmailChkClick(Sender: TObject);
var
  Uemail, EnEmail, SEmail, eBody : String;
  chk                            : Integer;
begin
  if EditEmail1.Text = '' then begin
    EditEmail1.SetFocus;
    chkEmail.Show;
  end else if EditEmail2.Text = '' then begin
    EditEmail2.SetFocus;
    chkEmail.Show;
  end else begin
    Uemail  := EditEmail1.Text + '@' + EditEmail2.Text;
    EnEmail := HITSEncrypt(Uemail, KEY);

    with DataModule1.QH_DML do begin
      SQL.Clear;
      SQL.Add('SELECT memail FROM household');
      SQL.Add('  WHERE memail = :MEMAIL    ');

      ParamByName('MEMAIL').AsString := Uemail;

      Open;

      SEmail := FieldByName('memail').AsString;

      if SEmail = '' then begin
        ebody := HDataMethod.GetRandomString;

        DataModule1.emailCerti.eemail    := Uemail;
        DataModule1.emailCerti.ebody     := ebody;

        DataModule1.SendEmail('가계부 이메일 변경 인증번호 입니다.', ebody);

        EmailchkForm := TEmailchkForm.Create(Application);

        chk := EmailchkForm.ShowModal;

        if chk = 1 then begin
          Emailchk                          := True;
          chkEmail.Style.TextColor          := clGreen;
          chkEmail.Caption                  := '이메일 인증이 완료되었습니다.';
          EditEmail1.Properties.ReadOnly    := True;
          EditEmail2.Properties.ReadOnly    := True;
          ComboEmailSel.Properties.ReadOnly := True;
          chkEmail.Show;

        end else if chk = 7 then begin
          ShowMessage('인증시간이 초과되었습니다.');
        end;

        DataModule1.emailCerti.eemail    := '';
        DataModule1.emailCerti.ebody := '';
        EmailchkForm.Free;

      end else if SEmail = EnEmail then begin
        ShowMessage('현재 등록된 이메일입니다.');
        EditEmail1.SetFocus;
      end else begin
        ShowMessage('중복된 이메일입니다.');
        EditEmail1.SetFocus;
      end;

    end;
  end;
end;

procedure TUpdateEmailForm.BtnStyle_2MouseEnter(Sender: TObject);
begin
  DataModule1.SetBtnStyle_2(TWinControl(Sender), True);
end;

procedure TUpdateEmailForm.BtnStyle_2MouseLeave(Sender: TObject);
begin
  DataModule1.SetBtnStyle_2(TWinControl(Sender), False);
end;

procedure TUpdateEmailForm.BtnEmailUpdateClick(Sender: TObject);
var
  Uemail, EnEmail : String;

begin
  if EmailChk then begin
    Uemail  := EditEmail1.Text + '@' + EditEmail2.Text;
    EnEmail := HITSEncrypt(Uemail, KEY);

    with DataModule1.QH_DML do begin
      SQL.Clear;
      SQL.Add('UPDATE household       ');
      SQL.Add('  SET memail = :MEMAIL ');
      SQL.Add('  WHERE mid = :MID     ');

      ParamByName('MEMAIL').AsString := EnEmail;
      ParamByName('MID').AsString    := DataModule1.recMemDate.mid;

      ExecSQL;
    end;

    ShowMessage('이메일 변경이 완료되었습니다.');
    DataModule1.recMemDate.memail    := Uemail;
    ModalResult := mrCancel;

  end else begin
    ShowMessage('이메일을 인증해주세요');
    EditEmail2.SetFocus
  end;
end;

procedure TUpdateEmailForm.BtnStyle_1MouseEnter(Sender: TObject);
begin
  DataModule1.SetBtnStyle_1(TWinControl(Sender), True);
end;

procedure TUpdateEmailForm.BtnStyle_1MouseLeave(Sender: TObject);
begin
  DataModule1.SetBtnStyle_1(TWinControl(Sender), False);
end;

procedure TUpdateEmailForm.ComboEmailSelPropertiesChange(Sender: TObject);
begin
  if ComboEmailSel.Text <> '직접입력' then begin
    EditEmail2.Properties.ReadOnly := True;
    EditEmail2.Text := ComboEmailSel.Text;
    chkEmail.Hide;
  end else begin
    EditEmail2.Properties.ReadOnly := False;
    EditEmail2.Text := '';
    EditEmail2.SetFocus;
  end;
end;

procedure TUpdateEmailForm.EditEnter(Sender: TObject);
begin
  DataModule1.SetEditStyle(TWinControl(Sender).Parent, True);
end;

procedure TUpdateEmailForm.EditExit(Sender: TObject);
var
  ControlN : TWinControl;
begin
  ControlN := TWinControl(Sender);

  DataModule1.SetEditStyle(ControlN.Parent, False);

  if ControlN.Name = 'EditEmail1' then begin
    if EditEmail1.Text = '' then begin
      chkEmail.Show;
    end else begin
      chkEmail.Hide;
    end;
  end else if ControlN.Name = 'EditEmail2' then begin
    if EditEmail2.Text = '' then begin
      chkEmail.Show;
    end else begin
      chkEmail.Hide;
    end;
  end;

end;

procedure TUpdateEmailForm.EditEmailKeyPress(Sender: TObject; var Key: Char);
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

procedure TUpdateEmailForm.FormCreate(Sender: TObject);
begin
  chkEmail.Hide;
  Emailchk := False;
end;

end.
