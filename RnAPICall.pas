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
  //검색 결과 조회 그리드
  with jusoGrid do
  begin
    RowCount := 2;
    if chkExtending.Checked then ColCount := 21
    else ColCount := 8;

    Cells[0, 0] := '건물관리번호';
    Cells[1, 0] := '도로명코드';
    Cells[2, 0] := '도로명주소';
    Cells[3, 0] := '지번주소';
    Cells[4, 0] := '영문주소';
    Cells[5, 0] := '우편번호';
    Cells[6, 0] := '법정동코드';
    Cells[7, 0] := '상세건물명';

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
      Cells[8, 0] := '건물명';
      Cells[9, 0] := '공동주택여부';
      Cells[10, 0] := '시도명';
      Cells[11, 0] := '시군구명';
      Cells[12, 0] := '읍면동명';
      Cells[13, 0] := '리명';
      Cells[14, 0] := '도로명';
      Cells[15, 0] := '지하여부';
      Cells[16, 0] := '건물본번';
      Cells[17, 0] := '건물부번';
      Cells[18, 0] := '산여부';
      Cells[19, 0] := '지번본번';
      Cells[20, 0] := '지번부번';

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


//도로명주소 검색API 호출 
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
    edKey.Text := '승인키';  //신청한 승인키가 없는 경우 테스트용 승인키 'TESTJUSOGOKR' 사용. (고정된 결과값만 리턴됨)
    code := HttpEncode(UTF8Encode(edKey.Text));
    
    //검색어
    searchword := HttpEncode(Utf8Encode(edText.Text));  

    //API 요청 URL
    sUrl := 'http://www.juso.go.kr/addrlink/addrLinkApi.do';  
    Indy.Request.Referer := 'http://www.juso.go.kr/addrlink/addrLinkApi.do';

    //GET방식, POST 방식 구분 (화면에서 라디오버튼으로 선택)
    if rbMethod.ItemIndex = 0 then
      begin
        // Get 방식 호출
        sUrl := sUrl + '?currentPage=' +  inttostr(CurPage) + '&countPerPage=' + inttostr(CountPerPage) + '&keyword=' + searchWord + '&confmKey=' + Code;
//        Showmessage(sUrl);
        Indy.Request.ContentType := 'application/json';
        Indy.HTTPOptions := [hoForceEncodeParams];
        Indy.get(sUrl, DResult);
      end
    else
      begin
        //Post 방식 호출
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

    //검색결과의 common 영역에서 totalcount, currentPage, countPerPage를 읽어 들임
    //currentPage > 0 (def 1), 0 < countPerPage <= 100 (max 100)이므로 지정범위를 벗어난 값을 호출하면 기본값으로 변경되어 호출시 보낸 값과 다른 값 나옴
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

    //주소 그리드 세팅
    if nTotCnt > 0 then
    begin
      //grid initialization
      initjusoGrid();

      if (nTotCnt mod CountPerPage) > 0 then UpDown1.Max := (nTotCnt div CountPerPage) + 1
      else UpDown1.Max := (nTotCnt div CountPerPage) ;
      UpDown1.Position := CurPage;

      //jusoGrid 셋팅
      jusoGrid.RowCount := CountPerPage + 1;

      k := 1; //jusoGrid의 데이터 시작 행

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
