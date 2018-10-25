unit AnniversaryEditPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxDBEdit, cxControls, cxContainer, cxListBox, DBCtrls, ExtCtrls,
  CheckLst, StdCtrls, Menus, cxLookAndFeelPainters, cxEdit, cxLabel, cxButtons,
  DB, MemDS, DBAccess, Ora, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  cxCalendar, cxTextEdit;

type
  TAnniverData = record
    AField, AValue : String;
    ano            : Integer;
  end;

type
  TAnniversaryEditForm = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    QH_AnniversaryEditSelect: TOraQuery;
    Total_Anniversary: TcxGridDBTableView;
    GRD_AnniversaryLevel1: TcxGridLevel;
    GRD_Anniversary: TcxGrid;
    DH_AnniSelectAll: TOraDataSource;
    Total_AnniversaryColumn1: TcxGridDBColumn;
    Total_AnniversaryColumn2: TcxGridDBColumn;
    Total_AnniversaryColumn3: TcxGridDBColumn;
    Total_AnniversaryColumn4: TcxGridDBColumn;
    Total_AnniversaryColumn5: TcxGridDBColumn;
    BtnClose: TPanel;
    BtnUpdateAnniver: TPanel;
    BtnDelAnniver: TPanel;
    BtnAddAnniver: TPanel;
    Total_AnniversaryColumn6: TcxGridDBColumn;

    // �� ������ ����� ��� ���
    procedure FormCreate(Sender: TObject);
    // Form Close
    procedure BtnCloseClick(Sender: TObject);
    // ����� �߰� Form ����
    procedure BtnAddAnniverClick(Sender: TObject);
    // ����� ��ü��� procedure
    procedure SelectAnniversary;
    procedure BtnUpdateAnniverClick(Sender: TObject);

    // ����� ����
    procedure Total_AnniversaryMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    // ����� ����
    procedure AnniverDataUpdate;
    procedure BtnDelAnniverClick(Sender: TObject);

    // ����� ����
    procedure AnniverDataDelete;

    
    // --------------- ���콺 ȣ���� �� ���� ---------------
    procedure BtnCloseMouseEnter(Sender: TObject);
    procedure BtnCloseMouseLeave(Sender: TObject);
    procedure BtnUpdateAnniverMouseLeave(Sender: TObject);
    procedure BtnStyle_2MouseLeave(Sender: TObject);
    procedure BtnStyle_2MouseEnter(Sender: TObject);
    procedure BtnDelAnniverMouseEnter(Sender: TObject);
    procedure BtnDelAnniverMouseLeave(Sender: TObject);

  private
    AnniverData : TAnniverData;
  public
    { Public declarations }
  end;

var
  AnniversaryEditForm: TAnniversaryEditForm;

implementation

{$R *.dfm}

uses
  HouseholdPage, DataModule, AnniAddPage;

procedure TAnniversaryEditForm.AnniverDataDelete;
var
  MessageVal : Integer;
begin
  MessageVal := MessageDlg( '���׸��� �����Ͻðڽ��ϱ�?', mtWarning, mbYesNo, 0 );

  if MessageVal = 6 then begin
    with DataModule1.QH_DML do begin
      SQL.Clear;
      SQL.Add('DELETE FROM hanniversary         ');
      SQL.Add('  WHERE ano = :ANO               ');

      ParamByName('ANO').AsInteger  := AnniverData.ano;

      ExecSQL;
    end;

    SelectAnniversary;

  end else begin
    Exit;
  end;



end;

procedure TAnniversaryEditForm.AnniverDataUpdate;
var
  InputVal : String;
begin
  if AnniverData.AField = 'ACONTENTS' then begin
    InputVal := InputBox('����� ����', '������ �з��� �Է����ּ���', AnniverData.AValue);
  end else begin
    InputVal := InputBox('����� ����', '������ �̸��� �Է����ּ���', AnniverData.AValue);
  end;
  with DataModule1.QH_DML do begin
    SQL.Clear;
    SQL.Add('UPDATE hanniversary              ');
    if AnniverData.AField = 'ACONTENTS' then begin
      SQL.Add('  SET acontents = :ACOUNTENTS  ');
    end else begin
      SQL.Add('  SET aname = :ANAME           ');
    end;
    SQL.Add('  WHERE ano = :ANO               ');

    if AnniverData.AField = 'ACONTENTS' then begin
      ParamByName('ACOUNTENTS').AsString  := InputVal;
    end else begin
      ParamByName('ANAME').AsString       := InputVal;
    end;
      ParamByName('ANO').AsInteger        := AnniverData.Ano;
    ExecSQL;
  end;

  QH_AnniversaryEditSelect.RefreshRecord;

end;

procedure TAnniversaryEditForm.BtnAddAnniverClick(Sender: TObject);
begin
  try
    AnniAddForm := TAnniAddForm.Create(self);
    AnniAddForm.ShowModal;
  finally
    AnniAddForm.Free;
  end;
  SelectAnniversary;
end;

procedure TAnniversaryEditForm.BtnStyle_2MouseEnter(Sender: TObject);
begin
  DataModule1.SetBtnStyle_2(TWinControl(Sender), True);
end;

procedure TAnniversaryEditForm.BtnStyle_2MouseLeave(Sender: TObject);
begin
  DataModule1.SetBtnStyle_2(TWinControl(Sender), False);
end;

procedure TAnniversaryEditForm.BtnUpdateAnniverClick(Sender: TObject);
begin
  if BtnUpdateAnniver.Caption = '��  ��' then begin
    BtnUpdateAnniver.Caption                := '�������';
    BtnUpdateAnniver.Color                  := $00FFAB57;
    BtnDelAnniver.Enabled                   := False;
    BtnAddAnniver.Enabled                   := False;
  end else begin
    BtnUpdateAnniver.Caption                := '��  ��';
    BtnUpdateAnniver.Color                  := $00FFBF80;
    BtnDelAnniver.Enabled                   := True;
    BtnAddAnniver.Enabled                   := True;
  end;


end;

procedure TAnniversaryEditForm.BtnUpdateAnniverMouseLeave(Sender: TObject);
begin
  if BtnUpdateAnniver.Caption = '��  ��' then begin
    BtnUpdateAnniver.Color := $00FFBF80;
  end;

end;

procedure TAnniversaryEditForm.BtnCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TAnniversaryEditForm.BtnCloseMouseEnter(Sender: TObject);
begin
  DataModule1.SetBtnStyle_1(TWinControl(Sender), True);
end;

procedure TAnniversaryEditForm.BtnCloseMouseLeave(Sender: TObject);
begin
 DataModule1.SetBtnStyle_1(TWinControl(Sender), False);
end;

procedure TAnniversaryEditForm.BtnDelAnniverClick(Sender: TObject);
begin
  if BtnDelAnniver.Caption = '��  ��' then begin
    BtnDelAnniver.Caption                := '���Ÿ��';
    BtnDelAnniver.Color                  := $00FFAB57;
    BtnUpdateAnniver.Enabled             := False;
    BtnAddAnniver.Enabled                := False;

  end else begin
    BtnDelAnniver.Caption                := '��  ��';
    BtnDelAnniver.Color                  := $00FFBF80;
    BtnUpdateAnniver.Enabled             := True;
    BtnAddAnniver.Enabled                := True;
  end;
end;

procedure TAnniversaryEditForm.BtnDelAnniverMouseEnter(Sender: TObject);
begin
  BtnDelAnniver.Color := $00FFAB57;
end;

procedure TAnniversaryEditForm.BtnDelAnniverMouseLeave(Sender: TObject);
begin
  if BtnDelAnniver.Caption = '��  ��' then begin
    BtnDelAnniver.Color := $00FFBF80;
  end;

end;

procedure TAnniversaryEditForm.FormCreate(Sender: TObject);
begin

  AnniverData.AField := '';
  AnniverData.AValue := '';
  AnniverData.ano    := 0;

  QH_AnniversaryEditSelect.Session  := DataModule1.OraSession1;

  DH_AnniSelectAll.DataSet                      := QH_AnniversaryEditSelect;
  Total_Anniversary.DataController.DataSource   := DH_AnniSelectAll; 

  SelectAnniversary;

end;

procedure TAnniversaryEditForm.SelectAnniversary;
begin
  try
    with QH_AnniversaryEditSelect do begin
      SQL.Clear;
      SQL.Add('SELECT * FROM hanniversary   ');
      SQL.Add('  WHERE aid = :AID           ');

      ParamByName('AID').AsString := DataModule1.recMemDate.mid;

      Open;
    end;

    Total_AnniversaryColumn5.DataBinding.FieldName

  finally

  end;
end;

procedure TAnniversaryEditForm.Total_AnniversaryMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  CField, CValue : String;
  ano            : Integer;
begin

  if BtnUpdateAnniver.Caption = '�������' then begin
    CField := TcxGridDBColumn( Total_Anniversary.Controller.FocusedColumn ).DataBinding.FieldName;
    Cvalue := TcxGridDBColumn( Total_Anniversary.Controller.FocusedColumn ).DataBinding.Field.Text;
    ano    := Total_Anniversary.DataController.Values[Total_Anniversary.DataController.FocusedRecordIndex, 5];

    AnniverData.AField := CField;
    AnniverData.AValue := CValue;
    AnniverData.ano    := ano;

    if (CField = 'ACONTENTS') OR (CField = 'ANAME') then begin
      AnniverDataUpdate;
    end;
  end else if BtnDelAnniver.Caption = '���Ÿ��' then begin
    ano    := Total_Anniversary.DataController.Values[Total_Anniversary.DataController.FocusedRecordIndex, 5];

    AnniverData.ano    := ano;

    AnniverDataDelete;

  end;

  AnniverData.AField := '';
  AnniverData.AValue := '';
  AnniverData.ano    := 0;

  // Ŭ���ѳ��� filed�̸�
  // TcxGridDBColumn( Total_Holding.Controller.FocusedColumn ).DataBinding.FieldName;

  // Ŭ���ѳ��� �����Ͱ�
  // TcxGridDBColumn( Total_Holding.Controller.FocusedColumn ).DataBinding.Field.Text;

  // Ŭ���ѳ� row�� Ư�� filed��
  // Total_Holding.DataController.Values[Total_Holding.DataController.FocusedRecordIndex, 0]

  // Ŭ���ѳ� row index��ȣ
  // IntToStr(Total_Holding.Controller.FocusedColumnIndex);
end;

end.
