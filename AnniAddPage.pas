unit AnniAddPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxRadioGroup, AdvEdit, AdvEdBtn, PlannerDatePicker, cxControls, cxContainer,
  cxEdit, cxLabel, ExtCtrls, DB, MemDS, DBAccess, Ora;

type
  TAnniAddForm = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    DatePickerAnni: TPlannerDatePicker;
    RadCycle1: TcxRadioButton;
    RadCycle2: TcxRadioButton;
    RadType1: TcxRadioButton;
    RadType2: TcxRadioButton;
    cxLabel6: TcxLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    BtnAnniStore: TPanel;
    BtnClose: TPanel;
    Panel4: TPanel;
    EditContents: TcxTextEdit;
    cxLabel7: TcxLabel;
    Panel5: TPanel;
    EditName: TcxTextEdit;
    cxLabel8: TcxLabel;
    Panel6: TPanel;
    cxLabel9: TcxLabel;
    // �ݱ� ��ư Ŭ���� �� Close
    procedure BtnCloseClick(Sender: TObject);
    // �� close �޸� ����
    procedure BtnAnniStoreClick(Sender: TObject);
    // ��¥ ���ö��� �Է� ����
    procedure DatePickerAnniKeyPress(Sender: TObject; var Key: Char);

    // -------------- �Է¶� �̺�Ʈ --------------
    // Ŭ���� �� ����
    procedure EditEnter(Sender: TObject);
    procedure EditExit(Sender: TObject);

    procedure EditContentsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditNameKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DatePickerAnniChange(Sender: TObject);
    procedure LabelClick(Sender: TObject);


    // -------------- ���콺 ȣ���� �� ���� ---------------
    procedure BtnStyle_1MouseEnter(Sender: TObject);
    procedure BtnStyle_1MouseLeave(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AnniAddForm: TAnniAddForm;

implementation

{$R *.dfm}

uses
  HouseholdPage, DataModule;

procedure TAnniAddForm.BtnAnniStoreClick(Sender: TObject);
begin
  if EditContents.Text = '' then begin
    EditContents.SetFocus;
    ShowMessage('�з��� �Է����ּ���. ex)����');
  end else if EditName.Text = '' then begin
    EditName.SetFocus;
    ShowMessage('����� ����ڸ� �Է����ּ���.');
  end else if DatePickerAnni.Text = '' then begin
    DatePickerAnni.SetFocus;
    ShowMessage('��¥�� �������ּ���.');
  end else begin

    try
      with DataModule1.QH_DML do begin
        SQL.Clear;
        SQL.Add('INSERT INTO hanniversary                                                                           ');
        SQL.Add('  VALUES (hanniversary_seq.nextval, :AID, :ATYPE, :ACONTENTS, :ANAME, :ACYCLE, :AANNIVERSARY)      ');

        ParamByName('AID').AsString           := DataModule1.recMemDate.mid;
        ParamByName('ACONTENTS').AsString     := EditContents.Text;
        ParamByName('ANAME').AsString         := EditName.Text;
        ParamByName('AANNIVERSARY').AsDate    := StrToDate(DatePickerAnni.Text);

        if RadType1.Checked = True then begin
          ParamByName('ATYPE').AsString         := RadType1.Caption;
        end else begin
          ParamByName('ATYPE').AsString         := RadType2.Caption;
        end;

        if RadCycle1.Checked = True then begin
          ParamByName('ACYCLE').AsString        := RadCycle1.Caption;
        end else begin
          ParamByName('ACYCLE').AsString        := RadCycle2.Caption;
        end;

        ExecSQL;

      end;

      ShowMessage('����� ��� �Ϸ�');

    finally
    end;        

  end;

end;

procedure TAnniAddForm.BtnStyle_1MouseEnter(Sender: TObject);
begin
  DataModule1.SetBtnStyle_1(TWinControl(Sender), True);
end;

procedure TAnniAddForm.BtnStyle_1MouseLeave(Sender: TObject);
begin
  DataModule1.SetBtnStyle_1(TWinControl(Sender), False);
end;

procedure TAnniAddForm.BtnCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TAnniAddForm.LabelClick(Sender: TObject);
begin
  DataModule1.EditSetFocus(TwinControl(Sender).Parent);
end;

procedure TAnniAddForm.DatePickerAnniChange(Sender: TObject);
begin
  if DatePickerAnni.Text <> '' then begin
    cxLabel9.hide;
  end else begin
    cxLabel9.Show;
  end;

end;

procedure TAnniAddForm.DatePickerAnniKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TAnniAddForm.EditEnter(Sender: TObject);
begin
  DataModule1.SetEditStyle(TWinControl(Sender).Parent, True);
end;

procedure TAnniAddForm.EditExit(Sender: TObject);
begin
  DataModule1.SetEditStyle(TWinControl(Sender).Parent, False);
end;

procedure TAnniAddForm.EditContentsKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EditContents.Text <> '' then begin
    cxLabel7.hide;
  end else begin
    cxLabel7.show;
  end;
end;

procedure TAnniAddForm.EditNameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EditName.Text <> '' then begin
    cxLabel8.hide;
  end else begin
    cxLabel8.show;
  end;
end;

end.
