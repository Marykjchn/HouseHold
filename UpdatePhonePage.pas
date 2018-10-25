unit UpdatePhonePage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxGraphics, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxControls, cxContainer, cxEdit, cxLabel;

type
  TUpdatePhoneForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxLabel12: TcxLabel;
    Panel11: TPanel;
    ComboFPhone: TcxComboBox;
    Panel12: TPanel;
    EditMPhone: TcxTextEdit;
    Panel13: TPanel;
    EditLPhone: TcxTextEdit;
    cxLabel14: TcxLabel;
    cxLabel13: TcxLabel;
    chkPhone: TcxLabel;
    BtnClose: TPanel;
    BtnPhoneUpdate: TPanel;
    cxLabel10: TcxLabel;

    // --------------- 폼 생성시 정보 출력 ---------------
    procedure FormCreate(Sender: TObject);

    // --------------- 숫자 구분 ---------------
    procedure OnlyNumber2(Sender: TObject; var Key: Char);

    // --------------- 버튼 호버시 색 변경 ---------------
    procedure BtnStyle_1MouseEnter(Sender: TObject);
    procedure BtnStyle_1MouseLeave(Sender: TObject);

    // --------------- 입력란 이벤트 ---------------
    procedure EditEnter(Sender: TObject);
    procedure EditExit(Sender: TObject);

    // --------------- 버튼 클릭시 ---------------
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnPhoneUpdateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpdatePhoneForm: TUpdatePhoneForm;

implementation

{$R *.dfm}

uses DataModule, HDataMethod;

procedure TUpdatePhoneForm.BtnCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TUpdatePhoneForm.BtnPhoneUpdateClick(Sender: TObject);
var
  Uphone, EnPhone, Sphone : String;
begin
  if Length(ComboFPhone.Text) <> 3 then begin
    ComboFPhone.SetFocus;
    chkPhone.Show;
  end else if Length(EditMPhone.Text) <> 4 then begin
    EditMPhone.SetFocus;
    chkPhone.Show;
  end else if Length(EditLPhone.Text) <> 4 then begin
    EditLPhone.SetFocus;
    chkPhone.Show;
  end else begin
    UPhone  := ComboFPhone.Text + '-' + EditMPhone.Text + '-' + EditLPhone.Text;
    EnPhone := HITSEncrypt(UPhone, KEY);
    with DataModule1.QH_DML do begin

      SQL.Clear;
      SQL.Add('SELECT mphone FROM household   ');
      SQL.Add('  WHERE mphone = :MPHONE       ');

      ParamByName('MPHONE').AsString := EnPhone;

      Open;

      Sphone := FieldByName('mphone').AsString;

      if Sphone = '' then begin
        SQL.Clear;
        SQL.Add('UPDATE household         ');
        SQL.Add('  SET mphone = :MPHONE   ');
        SQL.Add('  WHERE mid = :MID       ');

        ParamByName('MPHONE').AsString    := EnPhone;
        ParamByName('MID').AsString       := DataModule1.recMemDate.mid;

        ExecSQL;

        ShowMessage('휴대폰 번호 변경 완료');

        DataModule1.recMemDate.mphone := UPhone;

        ModalResult := mrCancel;
      end else if Sphone = EnPhone then begin
        ShowMessage('현재 등록된 휴대폰번호 입니다.');
        EditMPhone.SetFocus;
      end else begin
        ShowMessage('중복된 휴대폰번호 입니다.');
        EditMPhone.SetFocus;
      end;


    end;
  end;

end;

procedure TUpdatePhoneForm.BtnStyle_1MouseEnter(Sender: TObject);
begin
  DataModule1.SetBtnStyle_1(TWinControl(Sender), True);
end;

procedure TUpdatePhoneForm.BtnStyle_1MouseLeave(Sender: TObject);
begin
  DataModule1.SetBtnStyle_1(TWinControl(Sender), False);
end;

procedure TUpdatePhoneForm.EditEnter(Sender: TObject);
begin
  DataModule1.SetEditStyle(TWinControl(Sender).Parent, True);
end;

procedure TUpdatePhoneForm.EditExit(Sender: TObject);
var
  ControlN : TWinControl;
begin
  ControlN := TWinControl(Sender);

  DataModule1.SetEditStyle(ControlN.Parent, False);

  if ControlN.Name = 'EditMPhone' then begin
    if EditMPhone.Text = '' then begin
      chkPhone.Show;
    end else begin
      chkPhone.Hide;
    end;
  end else if ControlN.Name = 'EditLPhone' then begin
    if EditLPhone.Text = '' then begin
      chkPhone.Show;
    end else begin
      chkPhone.Hide;
    end;
  end;
end;

procedure TUpdatePhoneForm.FormCreate(Sender: TObject);
begin
  chkPhone.Hide;
end;

procedure TUpdatePhoneForm.FormShow(Sender: TObject);
begin
  EditMPhone.SetFocus;
end;

procedure TUpdatePhoneForm.OnlyNumber2(Sender: TObject; var Key: Char);
begin

  if KEY = #13 then begin
    BtnPhoneUpdateClick(nil);
  end;

  if not ((key in ['0'..'9']) or (Key = #8) or (key = '') or (key = #9) or(key = #13)) then
  begin
    chkPhone.Show;
    Key := #0;
  end;
end;

end.
