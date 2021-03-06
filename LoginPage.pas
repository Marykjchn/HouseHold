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

    // --------------- 로그인 입력란 이벤트 ---------------
    procedure EditEnter(Sender: TObject);
    procedure EditExit(Sender: TObject);
    procedure EditIDKeyPress(Sender: TObject; var Key: Char);
    procedure EditIDKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxLabel1Click(Sender: TObject);
    procedure EditPWKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxLabel2Click(Sender: TObject);
    procedure EditKeyPress(Sender: TObject; var Key: Char);

    // --------------- 마우스 호버시 색 변경 ---------------
    procedure BtnStyle_1MouseEnter(Sender: TObject);
    procedure BtnStyle_1MouseLeave(Sender: TObject);

    // --------------- 아이디 찾기폼 생성 ---------------
    procedure LabFindIDClick(Sender: TObject);
    procedure LabFindPWClick(Sender: TObject);
    procedure LabMouseEnter(Sender: TObject);
    procedure LabMouseLeave(Sender: TObject);

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

procedure TLoginForm.BtnStyle_1MouseEnter(Sender: TObject);
begin
  DataModule1.SetBtnStyle_1(TWinControl(Sender), True);
end;

procedure TLoginForm.BtnStyle_1MouseLeave(Sender: TObject);
begin
  DataModule1.SetBtnStyle_1(TWinControl(Sender), False);
end;

procedure TLoginForm.cxLabel1Click(Sender: TObject);
begin
  EditID.SetFocus;
end;


procedure TLoginForm.cxLabel2Click(Sender: TObject);
begin
  EditPW.SetFocus;
end;

procedure TLoginForm.EditEnter(Sender: TObject);
begin
  DataModule1.SetEditStyle(TWinControl(Sender).Parent, True);
end;

procedure TLoginForm.EditExit(Sender: TObject);
begin
  DataModule1.SetEditStyle(TWinControl(Sender).Parent, False);
end;

procedure TLoginForm.EditIDKeyPress(Sender: TObject; var Key: Char);
var
  chk : Boolean;
begin

  chk := HDataMethod.hanglechk(Key, Self.Handle);

  if chk then begin
    if key <> #9 then begin
      cxlabel3.Caption := '아이디를 영어로 입력해주세요.';
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
  TotalAdd          : String;
  add, detailAdd    : String;
  FindIndex         : Integer;
begin
  id  := HDataMethod.HITSEncrypt(EditID.Text, KEY);
  pw  := HDataMethod.HITSHashEncrypt(EditPW.Text);

  cxLabel3.Hide;
  cxLabel4.Hide;

  if id = '' then begin
    EditID.SetFocus;
    cxLabel3.Caption := '아이디를 입력해주세요.';
    cxLabel3.Show;

  end else if pw = '' then begin
    //Windows.SetFocus(EditPW.Handle);
    EditPW.SetFocus;
    cxLabel4.Show;

  end else begin
    try
      with DataModule1.QH_DML do begin
        SQL.Clear;
        SQL.ADD('SELECT * FROM household         ');
        SQL.ADD('  WHERE mid = :ID AND mpw = :PW ');

        ParamByName('ID').AsString   := id;
        ParamByName('PW').AsString   := pw;

        Open;

        cid       := FieldByName('mid').AsString;
        cpw       := FieldByName('mpw').AsString;
        use       := FieldByName('muse').AsInteger;
        TotalAdd  := HITSDecrypt(FieldByName('madd').AsString, KEY);
        FindIndex := Pos('|', TotalAdd);
        add       := Copy(TotalAdd, 0, FindIndex - 1);
        detailadd := Copy(TotalAdd, FindIndex + 2, Length(TotalAdd));

        if (id = cid) AND (pw = cpw) AND (use = 1) then begin
          with DataModule1.recMemDate do begin
            mnum        := FieldByName('mnum').AsInteger;
            mname       := HITSDecrypt(FieldByName('mname').AsString, KEY);
            mid         := cid;
            mpw         := cpw;
            mbirth      := HITSDecrypt(FieldByName('mbirth').AsString, KEY);
            mage        := IntToStr(StrToInt(FormatDateTime('YYYY', Now)) - StrToInt(FormatDateTime('YYYY', StrToDate(mbirth))) + 1);
            msex        := FieldByName('msex').AsString;
            mpostcode   := HITSDecrypt(FieldByName('mpostcode').AsString, KEY);
            madd        := add;
            mdetailadd  := detailadd;
            mphone      := HITSDecrypt(FieldByName('mphone').AsString, KEY);
            memail      := HITSDecrypt(FieldByName('memail').AsString, KEY);
            mgrade      := FieldByName('mgrade').AsString;
            muse        := use;

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

        end else if use <> 1 then begin
          ShowMessage('탈퇴한 회원입니다.');
        end else begin
          idx := idx + 1;
          if idx >= 4 then begin
            ShowMessage(IntToStr(idx) + '번 로그인 실패하셧습니다.');
            Self.Free;
          end else begin
            ShowMessage('아이디나 패스워드가 일치하지 않습니다.');
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

procedure TLoginForm.LabMouseEnter(Sender: TObject);
begin
  TcxLabel(Sender).Style.TextStyle := [fsUnderline];
end;

procedure TLoginForm.LabMouseLeave(Sender: TObject);
begin
  TcxLabel(Sender).Style.TextStyle := [];
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
