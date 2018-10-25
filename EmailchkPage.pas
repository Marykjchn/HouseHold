unit EmailchkPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls,
  DBAccess, Ora, DB, DateUtils;

type
  TEmailchkForm = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    Panel5: TPanel;
    EditCodeVal: TcxTextEdit;
    cxLabel4: TcxLabel;
    chkCodeVal: TcxLabel;
    BtnCodeVal: TPanel;
    cxLabel2: TcxLabel;
    Timer1: TTimer;

    procedure FormCreate(Sender: TObject);

    // --------------- 남은시간 설정 ---------------
    procedure Timer1Timer(Sender: TObject);


    // -------------- 버튼 호버시 색 변경 ---------------
    procedure EditEnter(Sender: TObject);
    procedure EditExit(Sender: TObject);
    procedure EditCodeValKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnStyle_1MouseEnter(Sender: TObject);
    procedure BtnStyle_1MouseLeave(Sender: TObject);

    // --------------- 닫기 ---------------
    procedure BtnCodeValClick(Sender: TObject);
  private
    { Private declarations }
    var chkTime : TDateTime;
  public
    { Public declarations }

  end;

var
  EmailchkForm: TEmailchkForm;

implementation

{$R *.dfm}

uses
  DataModule;

procedure TEmailchkForm.BtnCodeValClick(Sender: TObject);
begin
  if EditCodeVal.Text = DataModule1.emailCerti.ebody then begin
    ModalResult := mrOk;
  end else begin
    chkCodeVal.Show;
  end;
  
end;

procedure TEmailchkForm.BtnStyle_1MouseEnter(Sender: TObject);
begin
  DataModule1.SetBtnStyle_1(TWinControl(Sender), True);
end;

procedure TEmailchkForm.BtnStyle_1MouseLeave(Sender: TObject);
begin
  DataModule1.SetBtnStyle_1(TWinControl(Sender), False);
end;

procedure TEmailchkForm.EditEnter(Sender: TObject);
begin
  DataModule1.SetEditStyle(TWinControl(Sender).Parent, True);
end;

procedure TEmailchkForm.EditExit(Sender: TObject);
begin
  DataModule1.SetEditStyle(TWinControl(Sender).Parent, False);
end;

procedure TEmailchkForm.EditCodeValKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EditCodeVal.Text <> '' then begin
    cxLabel4.hide;
  end else begin
    cxLabel4.show;
  end;
end;

procedure TEmailchkForm.FormCreate(Sender: TObject);
begin
  chkCodeVal.Hide;
end;

procedure TEmailchkForm.Timer1Timer(Sender: TObject);
var
  chk : String;
begin

  if DateToStr(chkTime) = '1899-12-30' then begin
    chkTime := Now + (3/(24*60));
  end;

  chk := Copy(TimeToStr(chkTime - Now), 9, 5);

  cxLabel2.Caption := chk;

  if chk = '00:00' then begin
    ModalResult := mrNo;
  end;


end;

end.
