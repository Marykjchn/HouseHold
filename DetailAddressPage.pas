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
    procedure LabDetailAddressClick(Sender: TObject);
    procedure EditDetailAddressEnter(Sender: TObject);
    procedure EditDetailAddressExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnDetailAddressClick(Sender: TObject);
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

procedure TDetailAddressForm.cxTextEdit1PropertiesChange(Sender: TObject);
begin
  if EditDetailAddress.Text = '' then begin
    LabDetailAddress.Show;
  end else begin
    LabDetailAddress.Hide;
  end;
end;    

procedure TDetailAddressForm.EditDetailAddressEnter(Sender: TObject);
begin
  LabDetailAddress.Style.Color  := $00FFFCF9;
  Panel18.Color                 := $00FFFCF9;
end;

procedure TDetailAddressForm.EditDetailAddressExit(Sender: TObject);
begin
  LabDetailAddress.Style.Color  := clWindow;
  Panel18.Color                 := clWindow;
end;

procedure TDetailAddressForm.EditDetailAddressKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then begin
    BtnDetailAddress.OnClick(nil);
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

procedure TDetailAddressForm.LabDetailAddressClick(Sender: TObject);
begin
  EditDetailAddress.SetFocus;
end;

end.
