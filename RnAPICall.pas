unit RnAPICall;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdHttp, xmldom, XMLIntf, StdCtrls, msxmldom, XMLDoc, ExtCtrls,
  Buttons, ComCtrls, OleCtrls, SHDocVw, HttpApp, Grids, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, Spin;

type
  TfrmRnAPICall = class(TForm)
    XMLDocument1: TXMLDocument;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    edText: TLabeledEdit;
    rbNet: TRadioGroup;
    jusoGrid: TStringGrid;
    edCountPerPage: TSpinEdit;
    Label1: TLabel;
    Panel2: TPanel;
    lblTotalCount: TLabel;
    UpDown1: TUpDown;
    lblCurrentPage: TLabel;
    Indy: TIdHTTP;
    edKey: TLabeledEdit;
    rbMethod: TRadioGroup;
    chkExtending: TCheckBox;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
  private
    { Private declarations }
     procedure initjusoGrid;
     procedure JusoSearchApiCall(CurPage: integer; CountPerPage: integer);
  public
    { Public declarations }
  end;

var
  frmRnAPICall: TfrmRnAPICall;

implementation

{$R *.dfm}
procedure TfrmRnAPICall.initjusoGrid;
begin
  //�˻� ��� ��ȸ �׸���
  with jusoGrid do
  begin
    RowCount := 2;
    if chkExtending.Checked then ColCount := 21
    else ColCount := 8;

    Cells[0, 0] := '�ǹ�������ȣ';
    Cells[1, 0] := '���θ��ڵ�';
    Cells[2, 0] := '���θ��ּ�';
    Cells[3, 0] := '�����ּ�';
    Cells[4, 0] := '�����ּ�';
    Cells[5, 0] := '�����ȣ';
    Cells[6, 0] := '�������ڵ�';
    Cells[7, 0] := '�󼼰ǹ���';

    ColWidths[0] := 25*8;
    ColWidths[1] := 12*8;
    ColWidths[2] := 50*8;
    ColWidths[3] := 50*8;
    ColWidths[4] := 50*8;
    ColWidths[5] := 5*8;
    ColWidths[6] := 10*8;
    ColWidths[7] := 20*8;

    if chkExtending.Checked then
    begin
      Cells[8, 0] := '�ǹ���';
      Cells[9, 0] := '�������ÿ���';
      Cells[10, 0] := '�õ���';
      Cells[11, 0] := '�ñ�����';
      Cells[12, 0] := '���鵿��';
      Cells[13, 0] := '����';
      Cells[14, 0] := '���θ�';
      Cells[15, 0] := '���Ͽ���';
      Cells[16, 0] := '�ǹ�����';
      Cells[17, 0] := '�ǹ��ι�';
      Cells[18, 0] := '�꿩��';
      Cells[19, 0] := '��������';
      Cells[20, 0] := '�����ι�';

      ColWidths[ 8] := 40*8;
      ColWidths[ 9] := 12*8;
      ColWidths[10] := 10*8;
      ColWidths[11] := 10*8;
      ColWidths[12] := 10*8;
      ColWidths[13] := 10*8;
      ColWidths[14] := 30*8;
      ColWidths[15] := 8*8;
      ColWidths[16] := 5*8;
      ColWidths[17] := 5*8;
      ColWidths[18] := 6*8;
      ColWidths[19] := 5*8;
      ColWidths[20] := 5*8;
    end;
  end;
end;


//���θ��ּ� �˻�API ȣ�� 
procedure TfrmRnAPICall.JusoSearchApiCall(CurPage: integer; CountPerPage: integer);
var sUrl: Widestring;
    Code, searchword : AnsiString;

    Data, DResult : TStringStream;

    OuterRoot, EntryNode:iXmlNode;
    i,j, nTotCnt, k: integer;
    sData: TStringList;
begin

  Data := TStringStream.Create('');
  sData := TStringList.Create;
  DResult := TStringStream.Create('');

  try
    edKey.Text := '����Ű';  //��û�� ����Ű�� ���� ��� �׽�Ʈ�� ����Ű 'TESTJUSOGOKR' ���. (������ ������� ���ϵ�)
    code := HttpEncode(UTF8Encode(edKey.Text));
    
    //�˻���
    searchword := HttpEncode(Utf8Encode(edText.Text));  

    //API ��û URL
    sUrl := 'http://www.juso.go.kr/addrlink/addrLinkApi.do';  
    Indy.Request.Referer := 'http://www.juso.go.kr/addrlink/addrLinkApi.do';

    //GET���, POST ��� ���� (ȭ�鿡�� ������ư���� ����)
    if rbMethod.ItemIndex = 0 then
      begin
        // Get ��� ȣ��
        sUrl := sUrl + '?currentPage=' +  inttostr(CurPage) + '&countPerPage=' + inttostr(CountPerPage) + '&keyword=' + searchWord + '&confmKey=' + Code;
//        Showmessage(sUrl);
        Indy.Request.ContentType := 'application/json';
        Indy.HTTPOptions := [hoForceEncodeParams];
        Indy.get(sUrl, DResult);
      end
    else
      begin
        //Post ��� ȣ��
        sData.Values['sendmsg']  := '&currentPage=' + inttostr(CurPage) + '&countPerPage=' + inttostr(CountPerPage) + '&keyword=' + searchWord + '&confmKey=' + Code;
//        Showmessage(sData.Values['sendmsg']);
        Indy.Request.ContentType := 'application/x-www-form-urlencoded';
        Indy.HTTPOptions := [];
        Indy.Post(sUrl, sData, DResult);
      end;

    XMLDocument1.LoadFromStream(DResult);
    XMLDocument1.Active := True;

    OuterRoot := XMLDocument1.DocumentElement;
    nTotCnt := 0;

    //�˻������ common �������� totalcount, currentPage, countPerPage�� �о� ����
    //currentPage > 0 (def 1), 0 < countPerPage <= 100 (max 100)�̹Ƿ� ���������� ��� ���� ȣ���ϸ� �⺻������ ����Ǿ� ȣ��� ���� ���� �ٸ� �� ����
    for i:=0 to OuterRoot.ChildNodes.Count-1 do
    begin
      if OuterRoot.ChildNodes[i].NodeName = 'common' then
      begin
        EntryNode := OuterRoot.ChildNodes[i];
        for j:=0 to EntryNode.ChildNodes.Count-1 do
          if EntryNode.ChildNodes[j].NodeName = 'totalCount' then
          begin
            nTotCnt := strtoint(EntryNode.ChildNodes[j].Text);
            Break;
          end;
          
        for j:=0 to EntryNode.ChildNodes.Count-1 do
          if EntryNode.ChildNodes[j].NodeName = 'currentPage' then
          begin
            CurPage := strtoint(EntryNode.ChildNodes[j].Text);
            Break;
          end;

        for j:=0 to EntryNode.ChildNodes.Count-1 do
          if EntryNode.ChildNodes[j].NodeName = 'countPerPage' then
          begin
            CountPerPage := strtoint(EntryNode.ChildNodes[j].Text);
            Break;
          end;

      end;
    end;

    lblTotalCount.Caption := 'Total Count = ' + inttostr(nTotCnt);
    lblCurrentPage.Caption := 'Current Page = ' + inttostr(CurPage);

    //�ּ� �׸��� ����
    if nTotCnt > 0 then
    begin
      //grid initialization
      initjusoGrid();

      if (nTotCnt mod CountPerPage) > 0 then UpDown1.Max := (nTotCnt div CountPerPage) + 1
      else UpDown1.Max := (nTotCnt div CountPerPage) ;
      UpDown1.Position := CurPage;

      //jusoGrid ����
      jusoGrid.RowCount := CountPerPage + 1;

      k := 1; //jusoGrid�� ������ ���� ��

      for i:=0 to OuterRoot.ChildNodes.Count-1 do
      begin
        if OuterRoot.ChildNodes[i].NodeName = 'juso' then
        begin
          EntryNode := OuterRoot.ChildNodes[i];
          for j:=0 to EntryNode.ChildNodes.Count-1 do
          begin

            if EntryNode.ChildNodes[j].NodeName = 'bdMgtSn'     then jusoGrid.Cells[0, k] := EntryNode.ChildNodes[j].Text;
            if EntryNode.ChildNodes[j].NodeName = 'rnMgtSn'     then jusoGrid.Cells[1, k] := EntryNode.ChildNodes[j].Text;
            if EntryNode.ChildNodes[j].NodeName = 'roadAddr'    then jusoGrid.Cells[2, k] := EntryNode.ChildNodes[j].Text;
            if EntryNode.ChildNodes[j].NodeName = 'jibunAddr'   then jusoGrid.Cells[3, k] := EntryNode.ChildNodes[j].Text;
            if EntryNode.ChildNodes[j].NodeName = 'engAddr'     then jusoGrid.Cells[4, k] := EntryNode.ChildNodes[j].Text;
            if EntryNode.ChildNodes[j].NodeName = 'zipNo'       then jusoGrid.Cells[5, k] := EntryNode.ChildNodes[j].Text;
            if EntryNode.ChildNodes[j].NodeName = 'admCd'       then jusoGrid.Cells[6, k] := EntryNode.ChildNodes[j].Text;
            if EntryNode.ChildNodes[j].NodeName = 'detBdNmList' then jusoGrid.Cells[7, k] := EntryNode.ChildNodes[j].Text;

            if chkExtending.Checked then
            begin
              if EntryNode.ChildNodes[j].NodeName = 'bdNm'     then jusoGrid.Cells[ 8, k] := EntryNode.ChildNodes[j].Text;
              if EntryNode.ChildNodes[j].NodeName = 'bdKdcd'   then jusoGrid.Cells[ 9, k] := EntryNode.ChildNodes[j].Text;
              if EntryNode.ChildNodes[j].NodeName = 'siNm'     then jusoGrid.Cells[10, k] := EntryNode.ChildNodes[j].Text;
              if EntryNode.ChildNodes[j].NodeName = 'sggNm'    then jusoGrid.Cells[11, k] := EntryNode.ChildNodes[j].Text;
              if EntryNode.ChildNodes[j].NodeName = 'emdNm'    then jusoGrid.Cells[12, k] := EntryNode.ChildNodes[j].Text;
              if EntryNode.ChildNodes[j].NodeName = 'liNm'     then jusoGrid.Cells[13, k] := EntryNode.ChildNodes[j].Text;
              if EntryNode.ChildNodes[j].NodeName = 'rn'       then jusoGrid.Cells[14, k] := EntryNode.ChildNodes[j].Text;
              if EntryNode.ChildNodes[j].NodeName = 'udrtyn'   then jusoGrid.Cells[15, k] := EntryNode.ChildNodes[j].Text;
              if EntryNode.ChildNodes[j].NodeName = 'buldMnnm' then jusoGrid.Cells[16, k] := EntryNode.ChildNodes[j].Text;
              if EntryNode.ChildNodes[j].NodeName = 'buldSlno' then jusoGrid.Cells[17, k] := EntryNode.ChildNodes[j].Text;
              if EntryNode.ChildNodes[j].NodeName = 'mtyn'     then jusoGrid.Cells[18, k] := EntryNode.ChildNodes[j].Text;
              if EntryNode.ChildNodes[j].NodeName = 'lnbrMnnm' then jusoGrid.Cells[19, k] := EntryNode.ChildNodes[j].Text;
              if EntryNode.ChildNodes[j].NodeName = 'lnbrSlno' then jusoGrid.Cells[20, k] := EntryNode.ChildNodes[j].Text;
            end;
          end;
          k := k+1;
        end;
      end;
    end;
  finally
    XMLDocument1.Active := False;
    Data.Free;
    sData.Free;
    DResult.Free;
  end;

end;

procedure TfrmRnAPICall.SpeedButton1Click(Sender: TObject);
begin
  JusoSearchApiCall(1, edCountPerPage.Value);
end;

procedure TfrmRnAPICall.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmRnAPICall.FormCreate(Sender: TObject);
begin
  initjusoGrid();
end;

procedure TfrmRnAPICall.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  JusoSearchApiCall(UpDown1.Position, edCountPerPage.Value);
end;

end.
