unit FindIDPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, ExtCtrls,
  cxGraphics, cxMaskEdit, cxDropDownEdit, Menus, cxLookAndFeelPainters,
  StdCtrls, cxButtons, imm, DB, MemDS, DBAccess, Ora;

type
  TFindIDForm = class(TForm)
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
    BtnEmailChk: TPanel;
    Panel2: TPanel;
    procedure BtnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    // --------------- 아이디 찾기란 이벤트 ---------------
    // --- 이름 ---
    procedure EditNameEnter(Sender: TObject);
    procedure EditNameKeyPress(Sender: TObject; var Key: Char);
    procedure EditNameKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditNameExit(Sender: TObject);
    procedure cxLabel1Click(Sender: TObject);

    // --- 이메일 ---
    procedure EditEmail1Enter(Sender: TObject);
    procedure EditEmail1Exit(Sender: TObject);
    procedure EditEmail2Enter(Sender: TObject);
    procedure EditEmail2Exit(Sender: TObject);
    procedure ComboEmailSelEnter(Sender: TObject);
    procedure ComboEmailSelExit(Sender: TObject);
    procedure EditEmail1KeyPress(Sender: TObject; var Key: Char);
    procedure EditEmail2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboEmailSelPropertiesChange(Sender: TObject);


    // --------------- 버튼 호버시 색 변경 ---------------
    procedure BtnIdSelectMouseEnter(Sender: TObject);
    procedure BtnIdSelectMouseLeave(Sender: TObject);
    procedure BtnCloseMouseEnter(Sender: TObject);
    procedure BtnCloseMouseLeave(Sender: TObject);


    // --------------- 검색 버튼 클릭시 전처리후 저장 ---------------
    procedure BtnIdSelectClick(Sender: TObject);
    procedure BtnEmailChkMouseEnter(Sender: TObject);
    procedure BtnEmailChkMouseLeave(Sender: TObject);
    procedure BtnEmailChkClick(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
    var
      FindIDChk : Boolean;
      MemID     : String;
  end;

var
  FindIDForm: TFindIDForm;

implementation

{$R *.dfm}

uses
  DataModule, HDataMethod, EmailchkPage;

procedure TFindIDForm.BtnCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;



procedure TFindIDForm.BtnCloseMouseEnter(Sender: TObject);
begin
  BtnClose.Color := $00C66300;
end;

procedure TFindIDForm.BtnCloseMouseLeave(Sender: TObject);
begin
  BtnClose.Color := $00FF9E3E;
end;

procedure TFindIDForm.BtnEmailChkClick(Sender: TObject);
var
  MName, MEmail : String;
  eemail, ebody : String;
  chk           : Integer;

begin
  if EditName.Text = '' then begin
    chkName.Show;
    chkName.SetFocus;

  end else if EditEmail1.Text = '' then begin
    chkEmail.Show;
    EditEmail1.SetFocus;

  end else if EditEmail2.Text = '' then begin
    chkEmail.Show;
    EditEmail2.SetFocus;

  end else begin
    MName  := HDataMethod.HITSEncrypt(EditName.Text, KEY);
    MEmail := HDataMethod.HITSEncrypt(EditEmail1.Text + '@' + EditEmail2.Text, KEY);

    with DataModule1.QH_DML do begin
      SQL.Clear;
      SQL.Add('SELECT mid FROM household                   ');
      SQL.Add('  WHERE mname = :MNAME AND memail = :MEMAIL ');

      ParamByName('MNAME').AsString  := MName;
      ParamByName('MEMAIL').AsString := MEmail;

      Open;

      if RecordCount > 0 then begin
        eemail := EditEmail1.Text + '@' + EditEmail2.Text;
        ebody  := HDataMethod.GetRandomString;

        DataModule1.emailCerti.eemail    := eemail;
        DataModule1.emailCerti.ebody     := ebody;

        DataModule1.SendEmail('가계부 아이디찾기 이메일 인증번호 입니다.', ebody);

        EmailchkForm := TEmailchkForm.Create(Application);

        chk := EmailchkForm.ShowModal;

        if chk = 1 then begin
          chkEmail.Style.TextColor          := clGreen;
          chkEmail.Caption                  := '이메일 인증이 완료되었습니다.';
          EditEmail1.Properties.ReadOnly    := True;
          EditEmail2.Properties.ReadOnly    := True;
          ComboEmailSel.Properties.ReadOnly := True;
          FindIDChk                         := True;
          MemID                             := HDataMethod.HITSDecrypt(FieldByName('mid').AsString, KEY);
          chkEmail.Show;

        end else if chk = 7 then begin
          ShowMessage('인증시간이 초과되었습니다.');

        end;

        DataModule1.emailCerti.eemail    := '';
        DataModule1.emailCerti.ebody := '';
        EmailchkForm.Free;

      end else begin
        ShowMessage('일치하는 아이디가 없습니다.');
      end;
    end;

  end;

end;

procedure TFindIDForm.BtnEmailChkMouseEnter(Sender: TObject);
begin
  BtnEmailChk.Color := $00FFAB57;
end;

procedure TFindIDForm.BtnEmailChkMouseLeave(Sender: TObject);
begin
  BtnEmailChk.Color := $00FFBF80;
end;

procedure TFindIDForm.BtnIdSelectClick(Sender: TObject);
begin
  if FindIDChk then begin
    ShowMessage('회원님의 아이디는 ' + MemID + ' 입니다.');
    ModalResult := mrCancel;

  end else begin
    ShowMessage('이메일 인증을 해주세요.');
  end;
end;

procedure TFindIDForm.BtnIdSelectMouseEnter(Sender: TObject);
begin
  BtnIdSelect.Color := $00C66300;
end;

procedure TFindIDForm.BtnIdSelectMouseLeave(Sender: TObject);
begin
  BtnIdSelect.Color := $00FF9E3E;
end;

procedure TFindIDForm.ComboEmailSelEnter(Sender: TObject);
begin
  Panel17.Color          := $00FFFCF9;
end;

procedure TFindIDForm.ComboEmailSelExit(Sender: TObject);
begin
  Panel17.Color          := clWindow;
end;

procedure TFindIDForm.ComboEmailSelPropertiesChange(Sender: TObject);
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

procedure TFindIDForm.cxLabel1Click(Sender: TObject);
begin
  EditName.SetFocus;
end;

procedure TFindIDForm.EditEmail1Enter(Sender: TObject);
begin
  Panel15.Color          := $00FFFCF9;
end;

procedure TFindIDForm.EditEmail1Exit(Sender: TObject);
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

procedure TFindIDForm.EditEmail1KeyPress(Sender: TObject; var Key: Char);
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

procedure TFindIDForm.EditEmail2Enter(Sender: TObject);
begin
  Panel16.Color          := $00FFFCF9;
end;

procedure TFindIDForm.EditEmail2Exit(Sender: TObject);
begin
  Panel16.Color          := clWindow;

  if EditEmail2.Text = '' then
  begin
    chkEmail.Show;
  end
  else
  begin
    chkEmail.Hide;
  end;
end;

procedure TFindIDForm.EditEmail2KeyPress(Sender: TObject; var Key: Char);
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

  if Key = #13 then begin
    BtnEmailChkClick(Application);
  end;

end;


procedure TFindIDForm.EditNameEnter(Sender: TObject);
begin
  cxLabel1.Style.Color := $00FFFCF9;
  Panel5.Color         := $00FFFCF9;
end;

procedure TFindIDForm.EditNameExit(Sender: TObject);
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

procedure TFindIDForm.EditNameKeyPress(Sender: TObject; var Key: Char);
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
  end
  else if not (EditName.Text = '') then
  begin
    chkName.Hide;
  end;
end;

procedure TFindIDForm.EditNameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EditName.Text <> '' then begin
    cxLabel1.hide;
  end else begin
    cxLabel1.show;
  end;
end;

procedure TFindIDForm.FormCreate(Sender: TObject);
begin
  chkName.Hide;
  chkEmail.Hide;

  FindIDChk := False;

end;

end.
