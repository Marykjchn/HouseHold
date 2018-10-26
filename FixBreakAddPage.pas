unit FixBreakAddPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxControls, cxContainer, cxEdit, cxLabel, cxTextEdit,
  StdCtrls, cxRadioGroup, AdvEdit, AdvEdBtn, PlannerDatePicker;

type
  TFixBreakAddForm = class(TForm)
    Panel1: TPanel;
    cxLabel6: TcxLabel;
    cxLabel5: TcxLabel;
    Panel6: TPanel;
    DatePickerFixBreak: TPlannerDatePicker;
    LabDatePicker: TcxLabel;
    cxLabel2: TcxLabel;
    Panel2: TPanel;
    RadDiv1: TcxRadioButton;
    RadDiv2: TcxRadioButton;
    cxLabel3: TcxLabel;
    Panel5: TPanel;
    EditItem: TcxTextEdit;
    LabItem: TcxLabel;
    cxLabel1: TcxLabel;
    Panel3: TPanel;
    RadMeans2: TcxRadioButton;
    RadMeans3: TcxRadioButton;
    cxLabel4: TcxLabel;
    Panel4: TPanel;
    EditType: TcxTextEdit;
    LabType: TcxLabel;
    cxLabel10: TcxLabel;
    Panel7: TPanel;
    EidtAmount: TcxTextEdit;
    LabAmount: TcxLabel;
    RadMeans1: TcxRadioButton;
    BtnFixBreakStore: TPanel;
    BtnClose: TPanel;
    procedure BtnCloseClick(Sender: TObject);
    procedure EditEnter(Sender: TObject);
    procedure EditExit(Sender: TObject);
    procedure BtnStyle_1MouseEnter(Sender: TObject);
    procedure BtnStyle_1MouseLeave(Sender: TObject);
    procedure LabelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FixBreakAddForm: TFixBreakAddForm;

implementation

{$R *.dfm}

uses
  DataModule;

procedure TFixBreakAddForm.BtnCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFixBreakAddForm.EditExit(Sender: TObject);
begin
  DataModule1.SetEditStyle(TWinControl(Sender).Parent, False);
end;

procedure TFixBreakAddForm.LabelClick(Sender: TObject);
begin
  DataModule1.EditSetFocus(TwinControl(Sender).Parent);
end;

procedure TFixBreakAddForm.BtnStyle_1MouseEnter(Sender: TObject);
begin
  DataModule1.SetBtnStyle_1(TWinControl(Sender), True);
end;

procedure TFixBreakAddForm.BtnStyle_1MouseLeave(Sender: TObject);
begin
  DataModule1.SetBtnStyle_1(TWinControl(Sender), False);
end;

procedure TFixBreakAddForm.EditEnter(Sender: TObject);
begin
  DataModule1.SetEditStyle(TWinControl(Sender).Parent, True);

end;

end.
