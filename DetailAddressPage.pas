unit DetailAddressPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit;

type
  TDetailAddressForm = class(TForm)
    Panel1: TPanel;
    Panel19: TPanel;
    EditPostCode: TcxTextEdit;
    Panel14: TPanel;
    EditAdd: TcxTextEdit;
    Panel18: TPanel;
    EditDetailAddress: TcxTextEdit;
    LabDetailAddress: TcxLabel;
    BtnDetailAddress: TPanel;
    cxLabel10: TcxLabel;
    procedure cxTextEdit1PropertiesChange(Sender: TObject);
    procedure EditDetailAddressKeyPress(Sender: TObject; var Key: Char);
    procedure LabelClick(Sender: TObject);

    //Edit창 Enter시 스타일 변경
    procedure EditEnter(Sender: TObject);
    procedure EditExit(Sender: TObject);


    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnDetailAddressClick(Sender: TObject);
    procedure BtnStyle_1MouseEnter(Sender: TObject);
    procedure BtnStyle_1MouseLeave(Sender: TObject);
    procedure EditDetailAddressKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DetailAddressForm: TDetailAddressForm;

implementation

{$R *.dfm}

uses
  DataModule;

procedure TDetailAddressForm.BtnDetailAddressClick(Sender: TObject);
begin
  if EditDetailAddress.Text = '' then begin
    ShowMessage('상세주소를 입력해주세요');
  end else begin
    DataModule1.addressSearch.ADetailAddr := EditDetailAddress.Text;
    ModalResult := mrOk;
  end;
end;

procedure TDetailAddressForm.BtnStyle_1MouseEnter(Sender: TObject);
begin
  DataModule1.SetBtnStyle_1(TWinControl(Sender), True);
end;

procedure TDetailAddressForm.BtnStyle_1MouseLeave(Sender: TObject);
begin
  DataModule1.SetBtnStyle_1(TWinControl(Sender), False);
end;

procedure TDetailAddressForm.cxTextEdit1PropertiesChange(Sender: TObject);
begin
  if EditDetailAddress.Text = '' then begin
    LabDetailAddress.Show;
  end else begin
    LabDetailAddress.Hide;
  end;
end;    

procedure TDetailAddressForm.EditEnter(Sender: TObject);
begin
  DataModule1.SetEditStyle(TWinControl(Sender).Parent, True);
end;

procedure TDetailAddressForm.EditExit(Sender: TObject);
begin
  DataModule1.SetEditStyle(TWinControl(Sender).Parent, False);
end;

procedure TDetailAddressForm.EditDetailAddressKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then begin
    BtnDetailAddress.OnClick(nil);
  end;
end;

procedure TDetailAddressForm.EditDetailAddressKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if TcxTextEdit(Sender).Text <> '' then begin
    Datamodule1.EditValueChange(TWinControl(Sender).Parent, False);
  end else begin
    Datamodule1.EditValueChange(TWinControl(Sender).Parent, True);
  end;
end;

procedure TDetailAddressForm.FormCreate(Sender: TObject);
begin
  with DataModule1 do begin
    EditPostCode.Text := addressSearch.AZipCode;

    if addressSearch.ARoadBool then begin
      EditAdd.Text    := addressSearch.ARoadAddr;
    end else begin
      EditAdd.Text    := addressSearch.AJibunAddr;
    end;
  end;
end;

procedure TDetailAddressForm.FormShow(Sender: TObject);
begin
  EditDetailAddress.SetFocus;
end;

procedure TDetailAddressForm.LabelClick(Sender: TObject);
begin
  DataModule1.EditSetFocus(TwinControl(Sender).Parent);
end;

end.
