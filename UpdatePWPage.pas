unit UpdatePWPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls;

type
  TUpdatePWForm = class(TForm)
    Panel1: TPanel;
    cxLabel3: TcxLabel;
    Panel3: TPanel;
    EditPW: TcxTextEdit;
    cxLabel16: TcxLabel;
    Panel4: TPanel;
    EditPWchk: TcxTextEdit;
    cxLabel17: TcxLabel;
    chkPWTrue: TcxLabel;
    BtnMemInsert: TPanel;
    cxLabel10: TcxLabel;
    chkPW: TcxLabel;
    Panel2: TPanel;
    procedure EditEnter(Sender: TObject);
    procedure EditExit(Sender: TObject);
    procedure EditPWKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditPWchkKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnMemInsertClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    var
      Email : String;
  public
    { Public declarations }
    procedure SetEmail(Semail : String);

    var
      pwchk, pwchk2 : Boolean;
  end;

var
  UpdatePWForm: TUpdatePWForm;

implementation

{$R *.dfm}

uses
  DataModule, FindPWPage, HDataMethod;

procedure TUpdatePWForm.BtnMemInsertClick(Sender: TObject);
var
  pw, pwchk: string;
begin
  pw := EditPW.Text;
  pwchk := EditPWchk.Text;

  if pwchk = '' then begin
    chkPWTrue.Caption := '비밀번호확인을 입력해주세요.';
    chkPWTrue.Show;
    chkPW.Hide;
    UpdatePWForm.pwchk2 := False;
  end else begin
    if not (pwchk = pw) then begin
      chkPWTrue.Caption := '비밀번호가 일치하지 않습니다.';
      chkPWTrue.Show;
      chkPW.Hide;
      UpdatePWForm.pwchk2 := False;
    end else begin
      chkPWTrue.Hide;
      UpdatePWForm.pwchk2 := True;
      if UpdatePWForm.pwchk AND UpdatePWForm.pwchk2 then begin
        with DataModule1.QH_DML do begin
          SQL.Clear;
          SQL.Add('UPDATE household           ');
          SQL.Add('  SET mpw = :MPW           ');
          SQL.Add('  WHERE memail = :MEMAIL   ');

          ParamByName('MPW').AsString     := HDataMethod.HITSHashEncrypt(EditPW.Text);
          ParamByName('MEMAIL').AsString  := HDataMethod.HITSEncrypt(Email, KEY);

          ExecSQL;
        end;

        DataModule1.recMemDate.mpw        := HDataMethod.HITSHashEncrypt(EditPW.Text);
        ShowMessage('비밀번호 변경 완료');
        ModalResult := mrCancel;

      end else begin
        ShowMessage('입력정보가 올바르지 않습니다.');
      end;
    end;
  end;


end;

procedure TUpdatePWForm.EditPWchkKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EditPWChk.Text <> '' then begin
    cxLabel17.hide;
  end else begin
    cxLabel17.show;
  end;
end;

procedure TUpdatePWForm.EditEnter(Sender: TObject);
begin
  DataModule1.SetEditStyle(TWinControl(Sender).Parent, True);
end;

procedure TUpdatePWForm.EditExit(Sender: TObject);
var
  pw, pw2   : string;
  PWlength  : Integer;
  ControlN  : TWinControl;
begin
  ControlN := TWinControl(Sender);

  DataModule1.SetEditStyle(ControlN.Parent, False);

  pw        := EditPW.Text;
  pw2       := EditPWchk.Text;
  PWlength  := Length(pw);    

  if ControlN.Name = 'EditPW' then begin

    if pw = '' then begin
      chkpw.Caption := '비밀번호를 입력해주세요.';
      chkpw.Show;
      chkPWTrue.Hide;
      UpdatePWForm.pwchk := False;
    end else begin
      if (PWlength < 6) or (PWlength > 18) then  begin
        chkpw.Caption := '비밀번호를 8~16자로 입력해주세요.';
        chkPW.Show;
        chkPWTrue.Hide;
        UpdatePWForm.pwchk := False;
      end else begin
        chkPW.Hide;
        UpdatePWForm.pwchk := True;
      end;
    end;

  end else if ControlN.Name = 'EditPWChk' then begin   
    if pw2 = '' then begin
      chkPWTrue.Caption := '비밀번호확인을 입력해주세요.';
      chkPWTrue.Show;
      chkPW.Hide;
      UpdatePWForm.pwchk2 := False;
    end else begin
      if not (pw2 = pw) then begin
        chkPWTrue.Caption := '비밀번호가 일치하지 않습니다.';
        chkPWTrue.Show;
        chkPW.Hide;
        UpdatePWForm.pwchk2 := False;
      end else begin
        chkPWTrue.Hide;
        UpdatePWForm.pwchk2 := True;
      end;

    end;

  end;

end;

procedure TUpdatePWForm.EditPWKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EditPW.Text <> '' then begin
    cxLabel16.hide;
  end else begin
    cxLabel16.show;
  end;
end;

procedure TUpdatePWForm.FormCreate(Sender: TObject);
begin
  chkPW.Hide;
  chkPWTrue.Hide;
end;

procedure TUpdatePWForm.SetEmail(Semail : String);
begin
  Email := Semail;
end;

end.
