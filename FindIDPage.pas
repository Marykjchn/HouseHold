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
    procedure EditEnter(Sender: TObject);
    procedure EditNameKeyPress(Sender: TObject; var Key: Char);
    procedure EditNameKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditExit(Sender: TObject);
    procedure LabelClick(Sender: TObject);

    // --- 이메일 ---
    procedure EditEmail1KeyPress(Sender: TObject; var Key: Char);
    procedure EditEmail2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboEmailSelPropertiesChange(Sender: TObject);

    // --------------- 버튼 호버시 색 변경 ---------------
    procedure BtnStyle_1MouseEnter(Sender: TObject);
    procedure BtnStlye_1MouseLeave(Sender: TObject);


    // --------------- 검색 버튼 클릭시 전처리후 저장 ---------------
    procedure BtnIdSelectClick(Sender: TObject);
    procedure BtnStyle_2MouseEnter(Sender: TObject);
    procedure BtnStyle_2MouseLeave(Sender: TObject);
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

procedure TFindIDForm.BtnEmailChkClick(Sender: TObject);
var
  MName, MEmail : String;
  eemail, ebody : String;
  chk           : Integer;

begin
  if EditName.Text = '' then begin
    chkName.Show;
    chkName.SetFocus;
    Exit;

  end else if EditEmail1.Text = '' then begin
    chkEmail.Show;
    EditEmail1.SetFocus;
    Exit;

  end else if EditEmail2.Text = '' then begin
    chkEmail.Show;
    EditEmail2.SetFocus;
    Exit;

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

        Screen.Cursor := crHourGlass;

        eemail := EditEmail1.Text + '@' + EditEmail2.Text;
        ebody  := HDataMethod.GetRandomString;

        DataModule1.emailCerti.eemail    := eemail;
        DataModule1.emailCerti.ebody     := ebody;

        DataModule1.SendEmail('가계부 아이디찾기 이메일 인증번호 입니다.', ebody);

        Screen.Cursor := crDefault;

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

procedure TFindIDForm.BtnStyle_2MouseEnter(Sender: TObject);
begin
  DataModule1.SetBtnStyle_2(TWinControl(Sender), True);
end;

procedure TFindIDForm.BtnStyle_2MouseLeave(Sender: TObject);
begin
  DataModule1.SetBtnStyle_2(TWinControl(Sender), False);
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

procedure TFindIDForm.BtnStyle_1MouseEnter(Sender: TObject);
begin
  DataModule1.SetBtnStyle_1(TWinControl(Sender), True);
end;

procedure TFindIDForm.BtnStlye_1MouseLeave(Sender: TObject);
begin
  DataModule1.SetBtnStyle_1(TWinControl(Sender), False);
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

procedure TFindIDForm.LabelClick(Sender: TObject);
begin
  DataModule1.EditSetFocus(TwinControl(Sender).Parent);
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


procedure TFindIDForm.EditEnter(Sender: TObject);
begin
  DataModule1.SetEditStyle(TWinControl(Sender).Parent, True);
end;

procedure TFindIDForm.EditExit(Sender: TObject);
var
  ControlN : TWinControl;
begin
  ControlN := TWinControl(Sender);

  DataModule1.SetEditStyle(ControlN.Parent, False);

  if ControlN.Name = 'EditName' then begin
    if EditName.Text = '' then begin
      chkName.Caption := '이름을 입력해주세요.';
      chkName.Show;
    end else if EditName.Text <> '' then begin
      chkName.Hide;
    end;
  end else if ControlN.Name = 'EditEmail1' then begin
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
