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
    procedure EditCodeValEnter(Sender: TObject);
    procedure EditCodeValExit(Sender: TObject);
    procedure EditCodeValKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnCodeValMouseEnter(Sender: TObject);
    procedure BtnCodeValMouseLeave(Sender: TObject);

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

procedure TEmailchkForm.BtnCodeValMouseEnter(Sender: TObject);
begin
  BtnCodeVal.Color := $00C66300;
end;

procedure TEmailchkForm.BtnCodeValMouseLeave(Sender: TObject);
begin
  BtnCodeVal.Color := $00FF9E3E;
end;

procedure TEmailchkForm.EditCodeValEnter(Sender: TObject);
begin
  cxLabel4.Style.Color := $00FFFCF9;
  Panel5.Color         := $00FFFCF9;
end;

procedure TEmailchkForm.EditCodeValExit(Sender: TObject);
begin
  cxLabel4.Style.Color := clWindow;
  Panel5.Color         := clWindow;
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
