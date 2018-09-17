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

    // --------------- �� ������ ���� ��� ---------------
    procedure FormCreate(Sender: TObject);

    // --------------- ���� ���� ---------------
    procedure OnlyNumber2(Sender: TObject; var Key: Char);

    // --------------- ��ư ȣ���� �� ���� ---------------
    procedure BtnPhoneUpdateMouseEnter(Sender: TObject);
    procedure BtnPhoneUpdateMouseLeave(Sender: TObject);
    procedure BtnCloseMouseEnter(Sender: TObject);
    procedure BtnCloseMouseLeave(Sender: TObject);

    // --------------- �Է¶� �̺�Ʈ ---------------
    procedure ComboFPhoneEnter(Sender: TObject);
    procedure ComboFPhoneExit(Sender: TObject);
    procedure EditMPhoneEnter(Sender: TObject);
    procedure EditMPhoneExit(Sender: TObject);
    procedure EditLPhoneEnter(Sender: TObject);
    procedure EditLPhoneExit(Sender: TObject);


    // --------------- ��ư Ŭ���� ---------------
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnPhoneUpdateClick(Sender: TObject);


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

procedure TUpdatePhoneForm.BtnCloseMouseEnter(Sender: TObject);
begin
  BtnClose.Color := $00C66300;
end;

procedure TUpdatePhoneForm.BtnCloseMouseLeave(Sender: TObject);
begin
  BtnClose.Color := $00FF9E3E;
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

        ShowMessage('�޴��� ��ȣ ���� �Ϸ�');

        DataModule1.recMemDate.mphone := UPhone;

        ModalResult := mrCancel;
      end else if Sphone = EnPhone then begin
        ShowMessage('���� ��ϵ� �޴�����ȣ �Դϴ�.');
        EditMPhone.SetFocus;
      end else begin
        ShowMessage('�ߺ��� �޴�����ȣ �Դϴ�.');
        EditMPhone.SetFocus;
      end;


    end;
  end;

end;

procedure TUpdatePhoneForm.BtnPhoneUpdateMouseEnter(Sender: TObject);
begin
  BtnPhoneUpdate.Color := $00C66300;
end;

procedure TUpdatePhoneForm.BtnPhoneUpdateMouseLeave(Sender: TObject);
begin
  BtnPhoneUpdate.Color := $00FF9E3E;
end;

procedure TUpdatePhoneForm.ComboFPhoneEnter(Sender: TObject);
begin
  Panel11.Color          := $00FFFCF9;
end;

procedure TUpdatePhoneForm.ComboFPhoneExit(Sender: TObject);
begin
  Panel11.Color          := clWindow;

  if ComboFPhone.Text = '' then begin
    chkPhone.Show;
  end else begin
    chkPhone.Hide;
  end;
end;

procedure TUpdatePhoneForm.EditLPhoneEnter(Sender: TObject);
begin
  Panel13.Color          := $00FFFCF9;
end;

procedure TUpdatePhoneForm.EditLPhoneExit(Sender: TObject);
begin
  Panel13.Color          := clWindow;

  if EditLPhone.Text = '' then begin
    chkPhone.Show;
  end else begin
    chkPhone.Hide;
  end;
end;

procedure TUpdatePhoneForm.EditMPhoneEnter(Sender: TObject);
begin
  Panel12.Color          := $00FFFCF9;
end;

procedure TUpdatePhoneForm.EditMPhoneExit(Sender: TObject);
begin
  Panel12.Color          := clWindow;

  if EditMPhone.Text = '' then begin
    chkPhone.Show;
  end else begin
    chkPhone.Hide;
  end;
end;

procedure TUpdatePhoneForm.FormCreate(Sender: TObject);
begin
  chkPhone.Hide;
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
