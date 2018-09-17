unit FixBreakdownEditPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, MemDS, DBAccess, Ora, cxContainer, cxLabel, ExtCtrls,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid;

type
  TAnniverData = record
    AField, AValue : String;
    ano            : Integer;
  end;

type
  TFixBreakdownEditForm = class(TForm)
    DH_AnniSelectAll: TOraDataSource;
    GRD_FixBreakdown: TcxGrid;
    Total_FixBreakdown: TcxGridDBTableView;
    Total_FixBreakdownColumn1: TcxGridDBColumn;
    Total_FixBreakdownColumn2: TcxGridDBColumn;
    Total_FixBreakdownColumn3: TcxGridDBColumn;
    Total_FixBreakdownColumn4: TcxGridDBColumn;
    Total_FixBreakdownColumn5: TcxGridDBColumn;
    Total_FixBreakdownColumn6: TcxGridDBColumn;
    GRD_FixBreakdownLevel1: TcxGridLevel;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    BtnClose: TPanel;
    BtnUpdateFBreakdown: TPanel;
    BtnDelFBreakdown: TPanel;
    BtnAddFBreakdown: TPanel;
    QH_AnniversaryEditSelect: TOraQuery;

    // �� ������ ����� ��� ���
    procedure FormCreate(Sender: TObject);
    // Form Close
    procedure BtnCloseClick(Sender: TObject);
    // ����� �߰� Form ����
    procedure BtnAddFBreakdownClick(Sender: TObject);
    // ����� ��ü��� procedure
    procedure SelectAnniversary;
    procedure BtnUpdateFBreakdownClick(Sender: TObject);

    // ����� ����
    procedure Total_AnniversaryMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    // ����� ����
    procedure AnniverDataUpdate;
    procedure BtnDelFBreakdownClick(Sender: TObject);

    // ����� ����
    procedure AnniverDataDelete;


    // -------------- ���콺 ȣ���� �� ���� ---------------
    procedure BtnCloseMouseLeave(Sender: TObject);
    procedure BtnCloseMouseEnter(Sender: TObject);
    procedure BtnAddFBreakdownMouseEnter(Sender: TObject);
    procedure BtnAddFBreakdownMouseLeave(Sender: TObject);
    procedure BtnUpdateFBreakdownMouseEnter(Sender: TObject);
    procedure BtnUpdateFBreakdownMouseLeave(Sender: TObject);
    procedure BtnDelFBreakdownMouseEnter(Sender: TObject);
    procedure BtnDelFBreakdownMouseLeave(Sender: TObject);

  private
    AnniverData : TAnniverData;
  public
    { Public declarations }
  end;

var
  FixBreakdownEditForm: TFixBreakdownEditForm;

implementation

{$R *.dfm}

{ TFixBreakdownEdit }

uses
  HouseholdPage, DataModule, AnniAddPage;

procedure TFixBreakdownEditForm.AnniverDataDelete;
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

procedure TFixBreakdownEditForm.AnniverDataUpdate;
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

procedure TFixBreakdownEditForm.BtnAddFBreakdownClick(Sender: TObject);
begin
  try
    AnniAddForm := TAnniAddForm.Create(self);
    AnniAddForm.ShowModal;
  finally
    AnniAddForm.Free;
  end;
  SelectAnniversary;
end;

procedure TFixBreakdownEditForm.BtnAddFBreakdownMouseEnter(Sender: TObject);
begin
  BtnAddFBreakdown.Color := $00FFAB57;
end;

procedure TFixBreakdownEditForm.BtnAddFBreakdownMouseLeave(Sender: TObject);
begin
  BtnAddFBreakdown.Color := $00FFBF80;
end;

procedure TFixBreakdownEditForm.BtnUpdateFBreakdownClick(Sender: TObject);
begin
  if BtnUpdateFBreakdown.Caption = '��  ��' then begin
    BtnUpdateFBreakdown.Caption                := '�������';
    BtnUpdateFBreakdown.Color                  := $00FFAB57;
    BtnDelFBreakdown.Enabled                   := False;
    BtnAddFBreakdown.Enabled                   := False;

  end else begin
    BtnUpdateFBreakdown.Caption                := '��  ��';
    BtnUpdateFBreakdown.Color                  := $00FFBF80;
    BtnDelFBreakdown.Enabled                   := True;
    BtnAddFBreakdown.Enabled                   := True;
  end;


end;

procedure TFixBreakdownEditForm.BtnUpdateFBreakdownMouseEnter(Sender: TObject);
begin
  BtnUpdateFBreakdown.Color := $00FFAB57;
end;

procedure TFixBreakdownEditForm.BtnUpdateFBreakdownMouseLeave(Sender: TObject);
begin
  if BtnUpdateFBreakdown.Caption = '��  ��' then begin
    BtnUpdateFBreakdown.Color := $00FFBF80;
  end;
end;

procedure TFixBreakdownEditForm.BtnCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFixBreakdownEditForm.BtnCloseMouseEnter(Sender: TObject);
begin
  BtnClose.Color := $00C66300;
end;

procedure TFixBreakdownEditForm.BtnCloseMouseLeave(Sender: TObject);
begin
  BtnClose.Color := $00FF9E3E;
end;

procedure TFixBreakdownEditForm.BtnDelFBreakdownClick(Sender: TObject);
begin
  if BtnDelFBreakdown.Caption = '��  ��' then begin
    BtnDelFBreakdown.Caption                := '���Ÿ��';
    BtnDelFBreakdown.Color                  := $00FFAB57;
    BtnUpdateFBreakdown.Enabled             := False;
    BtnAddFBreakdown.Enabled                := False;

  end else begin
    BtnDelFBreakdown.Caption                := '��  ��';
    BtnDelFBreakdown.Color                  := $00FFBF80;
    BtnUpdateFBreakdown.Enabled             := True;
    BtnAddFBreakdown.Enabled                := True;
  end;
end;

procedure TFixBreakdownEditForm.BtnDelFBreakdownMouseEnter(Sender: TObject);
begin
  BtnDelFBreakdown.Color := $00FFAB57;
end;

procedure TFixBreakdownEditForm.BtnDelFBreakdownMouseLeave(Sender: TObject);
begin
  if BtnDelFBreakdown.Caption = '��  ��' then begin
    BtnDelFBreakdown.Color := $00FFBF80;
  end;
end;


procedure TFixBreakdownEditForm.FormCreate(Sender: TObject);
begin

  AnniverData.AField := '';
  AnniverData.AValue := '';
  AnniverData.ano    := 0;

  QH_AnniversaryEditSelect.Session  := DataModule1.OraSession1;

  DH_AnniSelectAll.DataSet                      := QH_AnniversaryEditSelect;
  Total_FixBreakdown.DataController.DataSource   := DH_AnniSelectAll; 

  SelectAnniversary;

end;

procedure TFixBreakdownEditForm.SelectAnniversary;
begin
  try
    with QH_AnniversaryEditSelect do begin
      SQL.Clear;
      SQL.Add('SELECT * FROM hanniversary   ');
      SQL.Add('  WHERE aid = :AID           ');

      ParamByName('AID').AsString := DataModule1.recMemDate.mid;

      Open;
    end;

  finally

  end;
end;

procedure TFixBreakdownEditForm.Total_AnniversaryMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  CField, CValue : String;
  ano            : Integer;
begin

  if BtnUpdateFBreakdown.Caption = '�������' then begin
    CField := TcxGridDBColumn( Total_FixBreakdown.Controller.FocusedColumn ).DataBinding.FieldName;
    Cvalue := TcxGridDBColumn( Total_FixBreakdown.Controller.FocusedColumn ).DataBinding.Field.Text;
    ano    := Total_FixBreakdown.DataController.Values[Total_FixBreakdown.DataController.FocusedRecordIndex, 5];

    AnniverData.AField := CField;
    AnniverData.AValue := CValue;
    AnniverData.ano    := ano;

    if (CField = 'ACONTENTS') OR (CField = 'ANAME') then begin
      AnniverDataUpdate;
    end;
  end else if BtnDelFBreakdown.Caption = '���Ÿ��' then begin
    ano    := Total_FixBreakdown.DataController.Values[Total_FixBreakdown.DataController.FocusedRecordIndex, 5];

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
