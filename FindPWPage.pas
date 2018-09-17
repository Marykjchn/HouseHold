unit FindPWPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxMaskEdit, cxDropDownEdit, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit, ExtCtrls, imm;

type
  TFindPWForm = class(TForm)
    Panel1: TPanel;
    Panel5: TPanel;
    EditName: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel26: TcxLabel;
    Panel15: TPanel;
    EditEmail1: TcxTextEdit;
    Panel16: TPanel;
    EditEmail2: TcxTextEdit;
    Panel17: TPanel;
    ComboEmailSel: TcxComboBox;
    cxLabel9: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel10: TcxLabel;
    BtnIdSelect: TPanel;
    BtnClose: TPanel;
    chkName: TcxLabel;
    chkEmail: TcxLabel;
    cxLabel4: TcxLabel;
    Panel2: TPanel;
    EditID: TcxTextEdit;
    cxLabel15: TcxLabel;
    chkID: TcxLabel;
    BtnEmailChk: TPanel;
    Panel3: TPanel;

    // --------------- 폼 생성 및 닫기 ---------------
    procedure BtnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);


    // --------------- 비밀번호 찾기란 이벤트 ---------------
    // --- 아이디 ---
    procedure EditIDEnter(Sender: TObject);
    procedure EditIDExit(Sender: TObject);
    procedure EditIDKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    // --- 이름 ---
    procedure EditNameKeyPress(Sender: TObject; var Key: Char);
    procedure EditNameEnter(Sender: TObject);
    procedure EditNameExit(Sender: TObject);
    procedure EditNameKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);

    // --------------- 버튼 호버시 이벤트 ---------------
    procedure BtnIdSelectMouseEnter(Sender: TObject);
    procedure BtnIdSelectMouseLeave(Sender: TObject);
    procedure BtnCloseMouseEnter(Sender: TObject);
    procedure BtnCloseMouseLeave(Sender: TObject);
    procedure EditEmail1Enter(Sender: TObject);
    procedure EditEmail1Exit(Sender: TObject);
    procedure EditEmail1KeyPress(Sender: TObject; var Key: Char);
    procedure EditEmail2Enter(Sender: TObject);
    procedure EditEmail2Exit(Sender: TObject);
    procedure EditEmail2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboEmailSelEnter(Sender: TObject);
    procedure ComboEmailSelExit(Sender: TObject);
    procedure ComboEmailSelPropertiesChange(Sender: TObject);
    procedure BtnEmailChkMouseEnter(Sender: TObject);
    procedure BtnEmailChkMouseLeave(Sender: TObject);

    // ---------------  버튼 클릭시 이메일인증 ---------------
   procedure BtnEmailChkClick(Sender: TObject);
    
    // --------------- 버튼 클릭시 비밀번호 수정 ---------------  
    procedure BtnIdSelectClick(Sender: TObject);
    procedure EditIDKeyPress(Sender: TObject; var Key: Char);



  private
    { Private declarations }
  public
    { Public declarations }
    var
      FindPWChk : Boolean;
      MemPW     : String;
  end;

var
  FindPWForm: TFindPWForm;

implementation

{$R *.dfm}

uses
  DataModule, HDataMethod, EmailchkPage, UpdatePWPage;

procedure TFindPWForm.BtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFindPWForm.BtnCloseMouseEnter(Sender: TObject);
begin
  BtnClose.Color := $00C66300;
end;

procedure TFindPWForm.BtnCloseMouseLeave(Sender: TObject);
begin
  BtnClose.Color := $00FF9E3E;
end;

procedure TFindPWForm.BtnEmailChkClick(Sender: TObject);
var
  MID, MName, MEmail : String;
  eemail, ebody      : String;
  chk                : Integer;

begin
  if EditID.Text = '' then begin
    chkID.Show;
    chkID.SetFocus;

  end else if EditName.Text = '' then begin
    chkName.Show;
    chkName.SetFocus;

  end else if EditEmail1.Text = '' then begin
    chkEmail.Show;
    EditEmail1.SetFocus;

  end else if EditEmail2.Text = '' then begin
    chkEmail.Show;
    EditEmail2.SetFocus;

  end else begin
    MID    := HDataMethod.HITSEncrypt(EditID.Text, KEY);
    MName  := HDataMethod.HITSEncrypt(EditName.Text, KEY);
    MEmail := HDataMethod.HITSEncrypt(EditEmail1.Text + '@' + EditEmail2.Text, KEY);

    with DataModule1.QH_DML do begin
      SQL.Clear;
      SQL.Add('SELECT mpw FROM household                                  ');
      SQL.Add('  WHERE mid = :MID AND mname = :MNAME AND memail = :MEMAIL ');

      ParamByName('MID').AsString    := MID;
      ParamByName('MNAME').AsString  := MName;
      ParamByName('MEMAIL').AsString := MEmail;

      Open;

      if RecordCount > 0 then begin
        eemail := EditEmail1.Text + '@' + EditEmail2.Text;
        ebody  := HDataMethod.GetRandomString;

        DataModule1.emailCerti.eemail    := eemail;
        DataModule1.emailCerti.ebody     := ebody;

        DataModule1.SendEmail('가계부 비밀번호찾기 이메일 인증번호 입니다.', ebody);

        EmailchkForm := TEmailchkForm.Create(Application);

        chk := EmailchkForm.ShowModal;

        if chk = 1 then begin
          chkEmail.Style.TextColor          := clGreen;
          chkEmail.Caption                  := '이메일 인증이 완료되었습니다.';
          EditEmail1.Properties.ReadOnly    := True;
          EditEmail2.Properties.ReadOnly    := True;
          ComboEmailSel.Properties.ReadOnly := True;
          FindPWChk                         := True;
          MemPW                             := FieldByName('mpw').AsString;
          chkEmail.Show;

        end else if chk = 7 then begin
          ShowMessage('인증시간이 초과되었습니다.');

        end;

        DataModule1.emailCerti.eemail    := '';
        DataModule1.emailCerti.ebody := '';
        EmailchkForm.Free;

      end else begin
        ShowMessage('일치하는 패스워드가 없습니다.');
      end;
    end;

  end;

end;

procedure TFindPWForm.BtnEmailChkMouseEnter(Sender: TObject);
begin
  BtnEmailChk.Color := $00FFAB57;
end;

procedure TFindPWForm.BtnEmailChkMouseLeave(Sender: TObject);
begin
  BtnEmailChk.Color := $00FFBF80;
end;

procedure TFindPWForm.BtnIdSelectClick(Sender: TObject);
begin
  if FindPWChk then begin
    UpdatePWForm := TUpdatePWForm.Create(Self);
    UpdatePWForm.SetEmail(EditEmail1.Text + '@' + EditEmail2.Text);
    try
      UpdatePWForm.ShowModal;
    finally
      UpdatePWForm.Free;
      DataModule1.recMemDate.mpw := '';
    end;

    ModalResult := mrCancel;

  end else begin
    ShowMessage('이메일 인증을 해주세요.');
  end;
end;

procedure TFindPWForm.BtnIdSelectMouseEnter(Sender: TObject);
begin
  BtnIdSelect.Color := $00C66300;
end;

procedure TFindPWForm.BtnIdSelectMouseLeave(Sender: TObject);
begin
  BtnIdSelect.Color := $00FF9E3E;
end;

procedure TFindPWForm.ComboEmailSelEnter(Sender: TObject);
begin
  Panel17.Color          := $00FFFCF9;
end;

procedure TFindPWForm.ComboEmailSelExit(Sender: TObject);
begin
  Panel17.Color          := clWindow;
end;

procedure TFindPWForm.ComboEmailSelPropertiesChange(Sender: TObject);
begin
if ComboEmailSel.Text <> '직접입력' then
  begin
    EditEmail2.Properties.ReadOnly := True;
    EditEmail2.Text := ComboEmailSel.Text;
    chkEmail.Hide;
  end
  else
  begin
    EditEmail2.Properties.ReadOnly := False;
    EditEmail2.Text := '';
    EditEmail2.SetFocus;
  end;
end;

procedure TFindPWForm.EditEmail1Enter(Sender: TObject);
begin
  Panel15.Color          := $00FFFCF9;
end;

procedure TFindPWForm.EditEmail1Exit(Sender: TObject);
begin
  Panel15.Color          := clWindow;

  if EditEmail1.Text = '' then
  begin
    chkEmail.Show;
  end
  else
  begin
    chkEmail.Hide;
  end;
end;

procedure TFindPWForm.EditEmail1KeyPress(Sender: TObject; var Key: Char);
var
  chk: Boolean;
begin
  chk := HDataMethod.hanglechk(Key, Self.Handle);
  if chk then
  begin
    if key <> #9 then
    begin
      chkEmail.Caption := '영문으로 이메일을 입력해주세요.';
      chkEmail.Show;
      key := #0;
    end;
  end
  else
  begin
    if key <> '' then
    begin
      chkEmail.Hide;
    end;
  end;
end;

procedure TFindPWForm.EditEmail2Enter(Sender: TObject);
begin
  Panel16.Color          := $00FFFCF9;
end;

procedure TFindPWForm.EditEmail2Exit(Sender: TObject);
begin
  Panel16.Color          := clWindow;

  if EditEmail2.Text = '' then begin
    chkEmail.Show;
  end else begin
    chkEmail.Hide;
  end;
end;

procedure TFindPWForm.EditEmail2KeyPress(Sender: TObject; var Key: Char);
var
  chk: Boolean;
begin

  chk := HDataMethod.hanglechk(Key, Self.Handle);
  if chk then begin
    if key <> #9 then begin
      chkEmail.Caption := '영문으로 이메일을 입력해주세요.';
      chkEmail.Show;
      key := #0;
    end;
  end else begin
    if key <> '' then begin
      chkEmail.Hide;
    end;
  end;
end;

procedure TFindPWForm.EditIDEnter(Sender: TObject);
begin
  cxLabel15.Style.Color := $00FFFCF9;
  Panel2.Color          := $00FFFCF9;
end;

procedure TFindPWForm.EditIDExit(Sender: TObject);
begin
  cxLabel15.Style.Color := clWindow;
  Panel2.Color          := clWindow;

  if EditID.Text = '' then begin
    chkID.Caption := '이름을 입력해주세요.';
    chkID.Show;
  end else if EditID.Text <> '' then begin
    chkID.Hide;
  end;
end;         

procedure TFindPWForm.EditIDKeyPress(Sender: TObject; var Key: Char);
var
  chk: Boolean;
begin
  chk := HDataMethod.hanglechk(Key, Self.Handle);
  if chk then begin
    if key <> '' then begin
      chkName.Caption := '영어를 입력해주세요.';
      chkName.Show;
      key := #0;
    end;
  end else if not (EditName.Text = '') then begin
    chkName.Caption := '영어를 입력해주세요.';
    chkName.Hide;
  end;
end;

procedure TFindPWForm.EditIDKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if EditID.Text <> '' then begin
    cxLabel15.hide;
  end else begin
    cxLabel15.show;
  end;
end;

procedure TFindPWForm.EditNameKeyPress(Sender: TObject; var Key: Char);
var
  chk: Boolean;
begin
  chk := HDataMethod.hanglechk(Key, Self.Handle);
  if not (chk) then begin
    if key <> '' then begin
      chkName.Caption := '한글을 입력해주세요.';
      chkName.Show;
      key := #0;
    end;
  end else if not (EditName.Text = '') then begin
    chkName.Hide;
  end;
end;

procedure TFindPWForm.FormCreate(Sender: TObject);
begin
  chkID.Hide;
  chkName.Hide;
  chkEmail.Hide;
end;

procedure TFindPWForm.EditNameEnter(Sender: TObject);
begin
  cxLabel1.Style.Color := $00FFFCF9;
  Panel5.Color         := $00FFFCF9;
end;

procedure TFindPWForm.EditNameExit(Sender: TObject);
begin
  cxLabel1.Style.Color := clWindow;
  Panel5.Color         := clWindow;

  if EditName.Text = '' then
  begin
    chkName.Caption := '이름을 입력해주세요.';
    chkName.Show;
  end
  else if EditName.Text <> '' then
  begin
    chkName.Hide;
  end;

end;

procedure TFindPWForm.EditNameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EditName.Text <> '' then begin
    cxLabel1.hide;
  end else begin
    cxLabel1.show;
  end;
end;

end.
