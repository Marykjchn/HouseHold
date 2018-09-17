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
    procedure EditPWEnter(Sender: TObject);
    procedure EditPWExit(Sender: TObject);
    procedure EditPWKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditPWchkEnter(Sender: TObject);
    procedure EditPWchkExit(Sender: TObject);
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
    chkPWTrue.Caption := '��й�ȣȮ���� �Է����ּ���.';
    chkPWTrue.Show;
    chkPW.Hide;
    UpdatePWForm.pwchk2 := False;
  end else begin
    if not (pwchk = pw) then begin
      chkPWTrue.Caption := '��й�ȣ�� ��ġ���� �ʽ��ϴ�.';
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
        ShowMessage('��й�ȣ ���� �Ϸ�');
        ModalResult := mrCancel;

      end else begin
        ShowMessage('�Է������� �ùٸ��� �ʽ��ϴ�.');
      end;
    end;
  end;


end;

procedure TUpdatePWForm.EditPWchkEnter(Sender: TObject);
begin
  cxLabel17.Style.Color := $00FFFCF9;
  Panel4.Color          := $00FFFCF9;
end;

procedure TUpdatePWForm.EditPWchkExit(Sender: TObject);
var
  pw, pwchk: string;
begin
  cxLabel17.Style.Color := clWindow;
  Panel4.Color          := clWindow;

  pw := EditPW.Text;
  pwchk := EditPWchk.Text;

  if pwchk = '' then begin
    chkPWTrue.Caption := '��й�ȣȮ���� �Է����ּ���.';
    chkPWTrue.Show;
    chkPW.Hide;
    UpdatePWForm.pwchk2 := False;
  end else begin
    if not (pwchk = pw) then begin
      chkPWTrue.Caption := '��й�ȣ�� ��ġ���� �ʽ��ϴ�.';
      chkPWTrue.Show;
      chkPW.Hide;
      UpdatePWForm.pwchk2 := False;
    end else begin
      chkPWTrue.Hide;
      UpdatePWForm.pwchk2 := True;
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

procedure TUpdatePWForm.EditPWEnter(Sender: TObject);
begin
  cxLabel16.Style.Color := $00FFFCF9;
  Panel3.Color          := $00FFFCF9;
end;

procedure TUpdatePWForm.EditPWExit(Sender: TObject);
var
  pw      : string;
  PWlength: Integer;
begin

  cxLabel16.Style.Color := clWindow;
  Panel3.Color          := clWindow;

  pw := EditPW.Text;
  PWlength := Length(pw);
  if pw = '' then begin
    chkpw.Caption := '��й�ȣ�� �Է����ּ���.';
    chkpw.Show;
    chkPWTrue.Hide;
    UpdatePWForm.pwchk := False;
  end else begin
    if (PWlength < 6) or (PWlength > 18) then  begin
      chkpw.Caption := '��й�ȣ�� 8~16�ڷ� �Է����ּ���.';
      chkPW.Show;
      chkPWTrue.Hide;
      UpdatePWForm.pwchk := False;
    end else begin
      chkPW.Hide;
      UpdatePWForm.pwchk := True;
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
