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

    // --------------- �� ���� �� �ݱ� ---------------
    procedure BtnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);


    // --------------- ��й�ȣ ã��� �̺�Ʈ ---------------
    // --- ���̵� ---
    procedure EditEnter(Sender: TObject);
    procedure EditExit(Sender: TObject);
    procedure EditIDKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    // --- �̸� ---
    procedure EditNameKeyPress(Sender: TObject; var Key: Char);
    procedure EditNameKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);

    // --------------- ��ư ȣ���� �̺�Ʈ ---------------
    procedure BtnStyle_1MouseEnter(Sender: TObject);
    procedure BtnStyle_1MouseLeave(Sender: TObject);
    procedure EditEmail1KeyPress(Sender: TObject; var Key: Char);
    procedure EditEmail2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboEmailSelPropertiesChange(Sender: TObject);
    procedure BtnStyle_2MouseEnter(Sender: TObject);
    procedure BtnStyle_2MouseLeave(Sender: TObject);

    // ---------------  ��ư Ŭ���� �̸������� ---------------
   procedure BtnEmailChkClick(Sender: TObject);
    
    // --------------- ��ư Ŭ���� ��й�ȣ ���� ---------------  
    procedure BtnIdSelectClick(Sender: TObject);
    procedure EditIDKeyPress(Sender: TObject; var Key: Char);
    procedure LabelClick(Sender: TObject);



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

procedure TFindPWForm.BtnEmailChkClick(Sender: TObject);
var
  MID, MName, MEmail : String;
  eemail, ebody      : String;
  chk                : Integer;

begin
  if EditID.Text = '' then begin
    chkID.Show;
    chkID.SetFocus;
    Exit;

  end else if EditName.Text = '' then begin
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

        Screen.Cursor := crHourGlass;

        eemail := EditEmail1.Text + '@' + EditEmail2.Text;
        ebody  := HDataMethod.GetRandomString;

        DataModule1.emailCerti.eemail    := eemail;
        DataModule1.emailCerti.ebody     := ebody;

        DataModule1.SendEmail('����� ��й�ȣã�� �̸��� ������ȣ �Դϴ�.', ebody);

        Screen.Cursor := crDefault;

        EmailchkForm := TEmailchkForm.Create(Application);

        chk := EmailchkForm.ShowModal;

        if chk = 1 then begin
          chkEmail.Style.TextColor          := clGreen;
          chkEmail.Caption                  := '�̸��� ������ �Ϸ�Ǿ����ϴ�.';
          EditEmail1.Properties.ReadOnly    := True;
          EditEmail2.Properties.ReadOnly    := True;
          ComboEmailSel.Properties.ReadOnly := True;
          FindPWChk                         := True;
          MemPW                             := FieldByName('mpw').AsString;
          chkEmail.Show;

        end else if chk = 7 then begin
          ShowMessage('�����ð��� �ʰ��Ǿ����ϴ�.');

        end;

        DataModule1.emailCerti.eemail    := '';
        DataModule1.emailCerti.ebody := '';
        EmailchkForm.Free;

      end else begin
        ShowMessage('��ġ�ϴ� �н����尡 �����ϴ�.');
      end;
    end;

  end;

end;

procedure TFindPWForm.BtnStyle_2MouseEnter(Sender: TObject);
begin
  DataModule1.SetBtnStyle_1(TWinControl(Sender), True);
end;

procedure TFindPWForm.BtnStyle_2MouseLeave(Sender: TObject);
begin
  DataModule1.SetBtnStyle_1(TWinControl(Sender), False);
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
    ShowMessage('�̸��� ������ ���ּ���.');
  end;
end;

procedure TFindPWForm.BtnStyle_1MouseEnter(Sender: TObject);
begin
  DataModule1.SetBtnStyle_1(TWinControl(Sender), True);
end;

procedure TFindPWForm.BtnStyle_1MouseLeave(Sender: TObject);
begin
  DataModule1.SetBtnStyle_1(TWinControl(Sender), False);
end;

procedure TFindPWForm.ComboEmailSelPropertiesChange(Sender: TObject);
begin
  if ComboEmailSel.Text <> '�����Է�' then begin
    EditEmail2.Properties.ReadOnly := True;
    EditEmail2.Text := ComboEmailSel.Text;
    chkEmail.Hide;
  end else begin
    EditEmail2.Properties.ReadOnly := False;
    EditEmail2.Text := '';
    EditEmail2.SetFocus;
  end;
end;

procedure TFindPWForm.LabelClick(Sender: TObject);
begin
  DataModule1.EditSetFocus(TwinControl(Sender).Parent);
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
      chkEmail.Caption := '�������� �̸����� �Է����ּ���.';
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

procedure TFindPWForm.EditEmail2KeyPress(Sender: TObject; var Key: Char);
var
  chk: Boolean;
begin

  chk := HDataMethod.hanglechk(Key, Self.Handle);
  if chk then begin
    if key <> #9 then begin
      chkEmail.Caption := '�������� �̸����� �Է����ּ���.';
      chkEmail.Show;
      key := #0;
    end;
  end else begin
    if key <> '' then begin
      chkEmail.Hide;
    end;
  end;
end;

procedure TFindPWForm.EditEnter(Sender: TObject);
begin
  DataModule1.SetEditStyle(TWinControl(Sender).Parent, True);
end;

procedure TFindPWForm.EditExit(Sender: TObject);
var
  ControlN : TWinControl;
begin
  ControlN := TWinControl(Sender);

  DataModule1.SetEditStyle(ControlN.Parent, False);

  if ControlN.Name = 'EditID' then begin
    if EditID.Text = '' then begin
      chkID.Caption := '���̵� �Է����ּ���.';
      chkID.Show;
    end else if EditID.Text <> '' then begin
      chkID.Hide;
    end;  
  end else if ControlN.Name = 'EditName' then begin
    if EditName.Text = '' then begin
      chkName.Caption := '�̸��� �Է����ּ���.';
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

procedure TFindPWForm.EditIDKeyPress(Sender: TObject; var Key: Char);
var
  chk: Boolean;
begin
  chk := HDataMethod.hanglechk(Key, Self.Handle);
  if chk then begin
    if key <> '' then begin
      chkName.Caption := '��� �Է����ּ���.';
      chkName.Show;
      key := #0;
    end;
  end else if not (EditName.Text = '') then begin
    chkName.Caption := '��� �Է����ּ���.';
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
      chkName.Caption := '�ѱ��� �Է����ּ���.';
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
