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
    procedure BtnEmailChkMouseEnter(Sender: TObject);
    procedure BtnEmailChkMouseLeave(Sender: TObject);
    procedure BtnEmailUpdateMouseEnter(Sender: TObject);
    procedure BtnEmailUpdateMouseLeave(Sender: TObject);
    procedure BtnCloseMouseEnter(Sender: TObject);
    procedure BtnCloseMouseLeave(Sender: TObject);

    // --------------- 입력란 클릭 이벤트 ---------------
    procedure EditEmail1Enter(Sender: TObject);
    procedure EditEmail1Exit(Sender: TObject);
    procedure EditEmailKeyPress(Sender: TObject; var Key: Char);
    procedure EditEmail2Enter(Sender: TObject);
    procedure EditEmail2Exit(Sender: TObject);
    procedure ComboEmailSelEnter(Sender: TObject);
    procedure ComboEmailSelExit(Sender: TObject);
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

procedure TUpdateEmailForm.BtnCloseMouseEnter(Sender: TObject);
begin
  BtnClose.Color := $00C66300;
end;

procedure TUpdateEmailForm.BtnCloseMouseLeave(Sender: TObject);
begin
  BtnClose.Color := $00FF9E3E;
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

procedure TUpdateEmailForm.BtnEmailChkMouseEnter(Sender: TObject);
begin
  BtnEmailChk.Color := $00FFAB57;
end;

procedure TUpdateEmailForm.BtnEmailChkMouseLeave(Sender: TObject);
begin
  BtnEmailChk.Color := $00FFBF80;
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

procedure TUpdateEmailForm.BtnEmailUpdateMouseEnter(Sender: TObject);
begin
  BtnEmailUpdate.Color := $00C66300;
end;

procedure TUpdateEmailForm.BtnEmailUpdateMouseLeave(Sender: TObject);
begin
  BtnEmailUpdate.Color := $00FF9E3E;
end;

procedure TUpdateEmailForm.ComboEmailSelEnter(Sender: TObject);
begin
  chkEmail.Caption       := '이메일을 입력해주세요.';
  Panel17.Color          := $00FFFCF9;
end;

procedure TUpdateEmailForm.ComboEmailSelExit(Sender: TObject);
begin
  Panel17.Color          := clWindow;
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

procedure TUpdateEmailForm.EditEmail1Enter(Sender: TObject);
begin
  Panel15.Color          := $00FFFCF9;
end;

procedure TUpdateEmailForm.EditEmail1Exit(Sender: TObject);
var
  emailchk: string;
begin
  Panel15.Color          := clWindow;

  emailchk := EditEmail1.Text;

  if emailchk = '' then begin
    chkEmail.Caption    := '이메일을 입력해주세요.';
    chkEmail.Show;
  end else begin
    chkEmail.Hide;
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

procedure TUpdateEmailForm.EditEmail2Enter(Sender: TObject);
begin
  Panel16.Color          := $00FFFCF9;
end;

procedure TUpdateEmailForm.EditEmail2Exit(Sender: TObject);
var
  emailchk: string;
begin
  Panel16.Color     := clWindow;
  emailchk          := EditEmail2.Text;

  if emailchk = '' then begin
    chkEmail.Style.TextColor := clRed;
    chkEmail.Caption         := '이메일을 입력해주세요.';
    chkEmail.Show;
  end else begin
    chkEmail.Hide;
  end;
end;

procedure TUpdateEmailForm.FormCreate(Sender: TObject);
begin
  chkEmail.Hide;
  Emailchk := False;
end;

end.
