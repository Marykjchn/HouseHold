unit UpdateAddPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxControls,
  cxContainer, cxEdit, cxLabel, ExtCtrls;

type
  TUpdateAddForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtnClose: TPanel;
    BtnAddUpdate: TPanel;
    cxLabel10: TcxLabel;
    cxLabel8: TcxLabel;
    Panel14: TPanel;
    EditAdd: TcxTextEdit;
    cxLabel22: TcxLabel;
    chkAdd: TcxLabel;

    // --------------- 폼 생성시 이벤트 ---------------
    procedure FormCreate(Sender: TObject);

    // --------------- 입력란 이벤트 처리 ---------------
    procedure EditAddEnter(Sender: TObject);
    procedure EditAddExit(Sender: TObject);
    procedure EditAddKeyPress(Sender: TObject; var Key: Char);
    procedure EditAddKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxLabel22Click(Sender: TObject);
    
    // --------------- 버튼 호버시 색 변경 ---------------
    procedure BtnAddUpdateMouseEnter(Sender: TObject);
    procedure BtnAddUpdateMouseLeave(Sender: TObject);

    // --------------- 버튼 클릭시 이벤트 ---------------
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnAddUpdateClick(Sender: TObject);
    procedure BtnCloseMouseEnter(Sender: TObject);
    procedure BtnCloseMouseLeave(Sender: TObject);



    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpdateAddForm: TUpdateAddForm;

implementation

{$R *.dfm}

uses
  HDataMethod, DataModule;

procedure TUpdateAddForm.BtnAddUpdateClick(Sender: TObject);
var
  UAdd, EnAdd : String;
begin
  if EditAdd.Text = '' then begin
    chkAdd.Show;
    EditAdd.SetFocus;
  end else begin
    UAdd  := EditAdd.Text;
    EnAdd := HDataMethod.HITSEncrypt(UAdd, KEY);
    with DataModule1.QH_DML do begin
      SQL.Clear;
      SQL.Add('UPDATE household    ');
      SQL.Add('  SET madd = :MADD  ');
      SQL.Add('  WHERE mid = :MID  ');

      ParamByName('MADD').AsString := EnAdd;
      ParamByName('MID').AsString  := DataModule1.recMemDate.mid;

      ExecSQL;
    end;

    ShowMessage('주소 변경이 완료되었습니다.');
    DataModule1.recMemDate.madd := UAdd;
    ModalResult                 := mrCancel;

  end;
end;

procedure TUpdateAddForm.BtnAddUpdateMouseEnter(Sender: TObject);
begin
  BtnAddUpdate.Color := $00C66300;
end;

procedure TUpdateAddForm.BtnAddUpdateMouseLeave(Sender: TObject);
begin
  BtnAddUpdate.Color := $00FF9E3E;
end;

procedure TUpdateAddForm.BtnCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TUpdateAddForm.BtnCloseMouseEnter(Sender: TObject);
begin
  BtnClose.Color := $00C66300;
end;

procedure TUpdateAddForm.BtnCloseMouseLeave(Sender: TObject);
begin
  BtnClose.Color := $00FF9E3E;
end;

procedure TUpdateAddForm.cxLabel22Click(Sender: TObject);
begin
  EditAdd.SetFocus;
end;

procedure TUpdateAddForm.EditAddEnter(Sender: TObject);
begin
  cxLabel22.Style.Color  := $00FFFCF9;
  Panel14.Color          := $00FFFCF9;
end;

procedure TUpdateAddForm.EditAddExit(Sender: TObject);
begin
  cxLabel22.Style.Color := clWindow;
  Panel14.Color         := clWindow;
end;

procedure TUpdateAddForm.EditAddKeyPress(Sender: TObject; var Key: Char);
var
  chk: Boolean;
begin
  chk := HDataMethod.hanglechk(Key, Self.Handle);
  if not (chk) then begin
    if key <> '' then begin
      chkAdd.Caption := '한글을 입력해주세요.';
      chkAdd.Show;
      key := #0;
    end;
  end else if EditAdd.Text <> '' then begin
    chkAdd.Hide;
  end;
end;

procedure TUpdateAddForm.EditAddKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EditAdd.Text <> '' then begin
    cxLabel22.hide;
  end else begin
    cxLabel22.show;
  end;
end;

procedure TUpdateAddForm.FormCreate(Sender: TObject);
begin
  chkAdd.Hide;
end;

end.
