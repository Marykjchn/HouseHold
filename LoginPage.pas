unit LoginPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, DB, MemDS, DBAccess, Ora, StdCtrls,
  cxButtons, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls,
  Buttons, jpeg, Imm;


type
  TLoginForm = class(TForm)
    Panel1: TPanel;
    EditID: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    Panel2: TPanel;
    cxLabel1: TcxLabel;
    Panel3: TPanel;
    EditPW: TcxTextEdit;
    cxLabel2: TcxLabel;
    Panel4: TPanel;
    LabFindID: TcxLabel;
    LabFindPW: TcxLabel;
    LabMemInsert: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    BtnLogin: TPanel;
    procedure FormCreate(Sender: TObject);

    procedure BtnLoginClick(Sender: TObject);
    procedure LabMemInsertClick(Sender: TObject);

    // --------------- �α��� �Է¶� �̺�Ʈ ---------------
    procedure EditIDEnter(Sender: TObject);
    procedure EditIDExit(Sender: TObject);
    procedure EditIDKeyPress(Sender: TObject; var Key: Char);
    procedure EditIDKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxLabel1Click(Sender: TObject);
    procedure EditPWEnter(Sender: TObject);
    procedure EditPWExit(Sender: TObject);
    procedure EditPWKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxLabel2Click(Sender: TObject);
    procedure EditKeyPress(Sender: TObject; var Key: Char);

    // --------------- ���콺 ȣ���� �� ���� ---------------
    procedure BtnLoginMouseEnter(Sender: TObject);
    procedure BtnLoginMouseLeave(Sender: TObject);

    // --------------- ���̵� ã���� ���� ---------------
    procedure LabFindIDClick(Sender: TObject);
    procedure LabFindPWClick(Sender: TObject);

  private
    { Private declarations }
    idx           : Integer;
  public
    { Public declarations }
  end;

var
  LoginForm     : TLoginForm;          

implementation

{$R *.dfm}

uses
  HouseHoldPage, MemInsertPage, DataModule, FindIDPage, FindPWPage, HDataMethod;

procedure TLoginForm.BtnLoginMouseEnter(Sender: TObject);
begin
  BtnLogin.Color := $00C66300;
end;

procedure TLoginForm.BtnLoginMouseLeave(Sender: TObject);
begin
  BtnLogin.Color := $00FF9E3E;
end;

procedure TLoginForm.cxLabel1Click(Sender: TObject);
begin
  EditID.SetFocus;
end;


procedure TLoginForm.cxLabel2Click(Sender: TObject);
begin
  EditPW.SetFocus;
end;

procedure TLoginForm.EditIDEnter(Sender: TObject);
begin
  cxLabel1.Style.Color := $00FFFCF9;
  Panel2.Color         := $00FFFCF9;
end;

procedure TLoginForm.EditIDExit(Sender: TObject);
begin
  cxLabel1.Style.Color := clWindow;
  Panel2.Color         := clWindow;
end;

procedure TLoginForm.EditIDKeyPress(Sender: TObject; var Key: Char);
var
  chk : Boolean;
begin

  chk := HDataMethod.hanglechk(Key, Self.Handle);

  if chk then begin
    if key <> #9 then begin
      cxlabel3.Caption := '���̵� ����� �Է����ּ���.';
      cxlabel3.Show;
      key := #0;
    end;
  end else begin
    if key <> '' then begin
      cxlabel3.Hide;
    end;
  end;

  if Key = #13 then begin
    BtnLoginClick(nil);
  end;

end;

procedure TLoginForm.EditIDKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EditID.Text <> '' then begin
    cxLabel1.hide;
  end else begin
    cxLabel1.show;
  end;
end;

procedure TLoginForm.EditPWEnter(Sender: TObject);
begin
  cxLabel2.Style.Color := $00FFFCF9;
  Panel3.Color         := $00FFFCF9;
end;

procedure TLoginForm.EditPWExit(Sender: TObject);
begin
  cxLabel2.Style.Color := clWindow;
  Panel3.Color         := clWindow;
end;

procedure TLoginForm.EditPWKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EditPW.Text <> '' then begin
    cxLabel2.hide;
  end else begin
    cxLabel2.show;
  end;
end;

procedure TLoginForm.EditKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    BtnLoginClick(nil);
  end;
end;

Procedure TLoginForm.FormCreate(Sender: TObject);
begin
  cxLabel3.Hide;
  cxLabel4.Hide;
end;

procedure TLoginForm.BtnLoginClick(Sender: TObject);
var
  id, pw, cid, cpw  : String;
  use               : Integer;
begin
  id  := HDataMethod.HITSEncrypt(EditID.Text, KEY);
  pw  := HDataMethod.HITSHashEncrypt(EditPW.Text);

  cxLabel3.Hide;
  cxLabel4.Hide;

  if id = '' then begin
    EditID.SetFocus;
    cxLabel3.Caption := '���̵� �Է����ּ���.';
    cxLabel3.Show;

  end else if pw = '' then begin
    //Windows.SetFocus(EditPW.Handle);
    EditPW.SetFocus;
    cxLabel4.Show;

  end else begin
    try
      with DataModule1.QH_DML do begin
        SQL.Clear;
        SQL.ADD('SELECT * FROM household                          ');
        SQL.ADD('  WHERE mid = :ID AND mpw = :PW AND muse = :USE  ');

        ParamByName('ID').AsString   := id;
        ParamByName('PW').AsString   := pw;
        ParamByName('USE').AsInteger := 1;

        Open;

        cid     := FieldByName('mid').AsString;
        cpw     := FieldByName('mpw').AsString;
        use     := FieldByName('muse').AsInteger;

        if (id = cid) AND (pw = cpw) AND (use = 1) then begin
          with DataModule1.recMemDate do begin
            mnum    := FieldByName('mnum').AsInteger;
            mname   := HITSDecrypt(FieldByName('mname').AsString, KEY);
            mid     := FieldByName('mid').AsString;
            mpw     := FieldByName('mpw').AsString;
            mbirth  := HITSDecrypt(FieldByName('mbirth').AsString, KEY);
            mage    := IntToStr(StrToInt(FormatDateTime('YYYY', Now)) - StrToInt(FormatDateTime('YYYY', StrToDate(mbirth))) + 1);
            msex    := FieldByName('msex').AsString;
            madd    := HITSDecrypt(FieldByName('madd').AsString, KEY);
            mphone  := HITSDecrypt(FieldByName('mphone').AsString, KEY);
            memail  := HITSDecrypt(FieldByName('memail').AsString, KEY);
            mgrade  := FieldByName('mgrade').AsString;
            muse    := FieldByName('muse').AsInteger;

          end;

          try
            ModalResult := mrOk;
          finally
            EditID.Text := '';
            EditPW.Text := '';
            EditID.SetFocus;
            cxLabel1.Show;
            cxLabel2.Show;
          end;

        end else begin
          idx := idx + 1;
          if idx >= 4 then begin
            ShowMessage(IntToStr(idx) + '�� �α��� �����ϼ˽��ϴ�.');
            Self.Free;
          end else begin
            ShowMessage('���̵� �н����尡 ��ġ���� �ʽ��ϴ�.');
          end;
        end;

      end;

    finally

    end;

  end;

end;

procedure TLoginForm.LabFindIDClick(Sender: TObject);
var
  FindIdForm : TFindIDForm;
begin
  FindIdForm := TFindIDForm.Create(Self);  
  try    
    FindIdForm.ShowModal;
  finally
    FindIdForm.Free;
  end;
end;

procedure TLoginForm.LabFindPWClick(Sender: TObject);
begin
  FindPWForm := TFIndPWForm.Create(Self);
  try
    FindPWForm.ShowModal;
  finally
    FindPwForm.Free;
  end;
end;

procedure TLoginForm.LabMemInsertClick(Sender: TObject);
begin
  try
    MemInsertForm := TMemInsertForm.Create(Application);
    MemInsertForm.ShowModal;
  finally
    MemInsertForm.Free;
  end;
end;

end.
