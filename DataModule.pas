unit DataModule;

interface

uses
  SysUtils, Classes, DCPcrypt2, DCPblockciphers, DCPrijndael, DB,
  MemDS, DBAccess, Ora, IdMessage, IdTCPConnection, IdTCPClient,
  IdMessageClient, IdSMTP, IdBaseComponent, IdComponent, IdIOHandler,
  IdIOHandlerSocket, IdSSLOpenSSL, Messages, Dialogs, DCPmd5, DCPsha256,
  IdCoder, IdCoder3to4, IdCoderMIME, cxGrid, Windows, Forms, Controls,
  cxExportGrid4Link , shellApi, asgprint, OraTransaction, xmldom, XMLIntf,
  msxmldom, XMLDoc, IdHTTP, HTTPAPP, cxGridDBTableView, cxLabel, cxTextEdit,
  PlannerDatePicker, cxDropDownEdit, ExtCtrls, Graphics;

const
  CHAR_SET: array [0..35] of Char =
    (
      '0','1','2','3','4','5','6','7','8','9',
      'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'
    );
  KEY : String = 'household.kjckey';

// 로그인후 가지고있는 유저값 (ID만 암호화 상태 나머지정보는 복호화되어있음)
type
  TmemData = record
    mnum, muse                          : Integer;
    mname, mid, mpw, mbirth, mage       : String;
    msex, mpostcode, madd, mdetailadd   : String;
    memail, mgrade, mphone              : String;
  end;

// email인증시 해당 이메일주소와 내용 저장
type
  TemailC​erti  = record
    eemail, ebody                    : String;
  end;

// 주소검색시 해당 우편번호, 지번주소, 도로명주소 저장, 도로명저장여부
type
  TaddressSearch  = record
    AZipCode, ARoadAddr, AJibunAddr, ADetailAddr  : String;
    ARoadBool                                     : Boolean;
  end;

type
  TDataModule1 = class(TDataModule)
    OraSession1: TOraSession;
    QH_DML: TOraQuery;
    IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket;
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    SaveExcel: TSaveDialog;
    OraTransaction1: TOraTransaction;
    Indy: TIdHTTP;
    XMLDocument1: TXMLDocument;
    procedure DataModuleCreate(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
    recMemDate    : TmemData;
    emailCerti    : TemailC​erti;
    addressSearch : TaddressSearch;

    // --------------- 이메일 사용 ---------------
    function SendEmail(eSubject, ebody : String) : string;

    // --------------- 엑셀 파일 경로 저장 ---------------
    procedure ExcelRoute(FileName : String; GridName : TcxGrid; phandle : HWND);

    // --------------- 주소 검색 ------------------
    procedure JusoSearchApiCall(JusoEdit : String; PageNum : Integer);

    //// control 상의 Enable 지정 FControlColors 참조하여 구분
    procedure SetVisibleItems(AWinControl: TWinControl; AEnabled: Boolean);

    // Edit버튼 스타일 지정
    procedure SetEditStyle(AWinControl: TWinControl; AEnabled: Boolean);

    var
      TJusoTotNum  : Integer;  // 총 주소 row수
      TJusoTotPage : Integer;  // 총 주소 page수
      TJusoTotMod  : Integer;  // 주소를 countperpage로 나눈 나머지수

  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

uses
  HDataMethod, LoginPage, HouseholdPage, SearchJusoPage;

{ TDataModule1 }

procedure TDataModule1.DataModuleCreate(Sender: TObject);
var
  ModalResult : TModalResult;
begin

  ModalResult := 0;

  OraSession1.ConnectString := 'sg100/"*%(vmffosdlt)^("@devdb2.itshan.co.kr:3300:SALGU';
  OraSession1.Connected     := True;

  QH_DML.Session            := OraSession1;

  LoginForm := TLoginForm.Create(Self);

  addressSearch.AZipCode    := '';
  addressSearch.ARoadAddr   := '';
  addressSearch.AJibunAddr  := '';
  addressSearch.ARoadBool   := False;
  addressSearch.ADetailAddr := '';

  try
    ModalResult := LoginForm.ShowModal;

  finally
    if ModalResult = mrOk then begin
      LoginForm.Free;
      HouseHoldForm := THouseholdForm.Create(Self);

      try
        HouseHoldForm.ShowModal;
      finally
        HouseHoldForm.Free;
      end;
    end else begin
      LoginForm.Free;
    end;

  end;

end;

procedure TDataModule1.ExcelRoute(FileName : String; GridName : TcxGrid; phandle : HWND);
var
  Dpath : String;
begin
  with DataModule1.QH_DML do begin
    SQL.Clear;
    SQL.Add('SELECT eroute FROM hexcelstore ');
    SQL.Add('  WHERE eid = :EID             ');

    ParamByName('EID').AsString := DataModule1.recMemDate.mid;

    Open;

    Dpath := FieldByName('eroute').AsString;
  end;

  if Dpath = '$0000' then begin
    Dpath := HDataMethod.GetProgramFilesDir + '\';
  end;

  SaveExcel.FileName      := FileName + '.xls';
  SaveExcel.InitialDir    := Dpath;

  if SaveExcel.Execute then begin
    Dpath    := ExtractFilePath( SaveExcel.FileName );
    FileName := ExtractFileName( SaveExcel.FileName );

    ExportGrid4ToExcel(Dpath + FileName, GridName, true, true, false);
    Application.ProcessMessages;

    with DataModule1.QH_DML do begin
      SQL.Clear;
      SQL.Add('UPDATE hexcelstore       ');
      SQL.Add('  SET eroute = :EROUTE   ');
      SQL.Add('  WHERE eid = :EID       ');

      ParamByName('EROUTE').AsString  := Dpath;
      ParamByName('EID').AsString     := DataModule1.recMemDate.mid;

      ExecSQL;
    end;

    if MessageDlg('저장한 엑셀파일을 실행하시겠습니까?', mtInformation, [mbYes, mbNo], 0) = mrYes then begin
      ShellExecute(PHandle, PChar('OPEN'), PChar(Dpath + FileName), nil, nil, SW_SHOWMAXIMIZED);
      Application.ProcessMessages;
    end;
  end;
end;

function TDataModule1.SendEmail(eSubject, ebody : String) : string;
var
  SMTP        : TIdSMTP;
  idSSLGMail  : TIdSSLIOHandlerSocket;
  mMsg        : TIdMessage;

begin
  SMTP          := IdSMTP1;
  mMsg          := IdMessage1;
  idSSLGMail    := IdSSLIOHandlerSocket1;

  try

    try

      SMTP.AuthenticationType := atLogin;
      SMTP.IOHandler          := idSSLGMail;
      SMTP.Host               := 'smtp.gmail.com';
      SMTP.Port               := 465;
      SMTP.UserName           := 'mary.kjchn@gmail.com';
      SMTP.Password           := 'goowocksl08!';

      SMTP.Connect;

      mMsg.CharSet                    := 'utf-8';
      mMsg.ContentType                := 'text/plain';
      mMsg.From.Text                  := 'mary.kjchn@gmail.com';                //발신메일
      mMsg.ReplyTo.EMailAddresses     := '';                                    //회신메일
      mMsg.Subject                    := eSubject;                              //메일제목
      mMsg.Recipients.EMailAddresses  := emailCerti.eemail;                     //수신메일
      mMsg.Body.Add(emailCerti.ebody);                                          //메일내용

      SMTP.Send(mMsg);

      MessageDlg( '메일이 정상적으로 전송되었습니다. ', mtInformation, [ mbOk ], 0 );

      except on E:Exception do begin
        DataModule1.emailCerti.eemail    := '';
        DataModule1.emailCerti.ebody     := '';
        ShowMessage(E.Message);
        SMTP.Disconnect;
        Exit;
      end;
    end;

  finally
    SMTP.Disconnect;
  end;
end;

procedure TDataModule1.SetEditStyle(AWinControl: TWinControl;
  AEnabled: Boolean);
var
  i     : Integer;
  BoolItem : Boolean;
begin

  with AWinControl do begin 
    if AEnabled then begin
      TPanel(AWinControl).Color := $00FFFCF9;

      for i := 0 to AWinControl.ControlCount - 1 do begin
        BoolItem := (Controls[i] is TcxLabel);
        if BoolItem then begin
          TcxLabel(Controls[i]).Style.Color := $00FFFCF9;
          Continue;
        end;

        BoolItem := (Controls[i] is TcxComboBox);
        if BoolItem then begin
          TcxComboBox(Controls[i]).Style.Color := $00FFFCF9;
          Continue;
        end;

        BoolItem := (Controls[i] is TPlannerDatePicker);
        if BoolItem then begin
          TPlannerDatePicker(Controls[i]).Color := $00FFFCF9;
          Continue;
        end;

      end;

    end else begin
      TPanel(AWinControl).Color := clWindow;

      for i := 0 to AWinControl.ControlCount - 1 do begin
        BoolItem := (Controls[i] is TcxLabel);
        if BoolItem then begin
          TcxLabel(Controls[i]).Style.Color := clWindow;
          Continue;
        end;

        BoolItem := (Controls[i] is TcxComboBox);
        if BoolItem then begin
          TcxComboBox(Controls[i]).Style.Color := clWindow;
          Continue;
        end;

        BoolItem := (Controls[i] is TPlannerDatePicker);   
        if BoolItem then begin
          TPlannerDatePicker(Controls[i]).Color := clWindow;
          Continue;
        end;

      end;

    end;

  end;
end;

procedure TDataModule1.SetVisibleItems(AWinControl: TWinControl; AEnabled: Boolean);
var
  i     : Integer;
  IsTag : Integer;
begin
  with AWinControl do begin
    for i := 0 to AWinControl.ControlCount - 1 do begin
      IsTag := Controls[i].Tag;
      if IsTag = 7 then begin
        continue;
      end;
      Controls[i].Visible := AEnabled;
    end;
  end;
end;



procedure TDataModule1.JusoSearchApiCall(JusoEdit : String; PageNum : Integer);
var
  Key, SearchWord, Url  : String;
  Data, DResult         : TStringStream;
  sData                 : TStringList;
  OuterRoot, EntryNode  : iXmlNode;
  i, j, k               : Integer;
  nTotCnt               : Integer;
begin

  Data := TStringStream.Create('');
  sData := TStringList.Create;
  DResult := TStringStream.Create('');

  Screen.Cursor := crHourGlass;

  try
    // 승인키
    Key := HTTPEncode(Utf8Encode('U01TX0FVVEgyMDE4MTAwNDExMjMxNzEwODIxMTQ='));

    // 검색어
    SearchWord := HTTPEncode(Utf8Encode(JusoEdit));

    Url := 'http://www.juso.go.kr/addrlink/addrLinkApi.do';

    // 1페이지당 5개(countPerPage=5)씩 호출
    Url                       := Url + '?currentPage=' + intToStr(PageNum) + '&countPerPage=5&keyword=' + searchWord + '&confmKey=' + Key;
    Indy.Request.ContentType  := 'application/json';
    Indy.HTTPOptions          := [hoForceEncodeParams];
    Indy.get(Url, DResult);

    XMLDocument1.LoadFromStream(DResult);
    XMLDocument1.Active := True;

    OuterRoot := XMLDocument1.DocumentElement;
    nTotCnt   := 0;

    //검색결과의 common 영역에서 totalcount, currentPage, countPerPage를 읽어 들임
    //currentPage > 0 (def 1), 0 < countPerPage <= 100 (max 100)이므로 지정범위를 벗어난 값을 호출하면 기본값으로 변경되어 호출시 보낸 값과 다른 값 나옴
    for i:=0 to OuterRoot.ChildNodes.Count-1 do begin
      if OuterRoot.ChildNodes[i].NodeName = 'common' then begin
        EntryNode := OuterRoot.ChildNodes[i];

        for j:=0 to EntryNode.ChildNodes.Count-1 do begin
          if EntryNode.ChildNodes[j].NodeName = 'totalCount' then begin
            nTotCnt := strtoint(EntryNode.ChildNodes[j].Text);
            Break;
          end;
        end;
      end;
    end;

    TJusoTotNum  := nTotCnt;

    if (TJusoTotNum MOD 5) = 0 then begin
      TJusoTotPage := nTotCnt div 5;
    end else begin
      TJusoTotPage := (nTotCnt div 5) + 1;
    end;

    if ((TJusoTotPage = PageNum) AND ((TJusoTotNum MOD 5) = 0)) then begin
      TJusoTotMod  := 5;
    end else if TJusoTotNum = 0 then begin
      TJusoTotMod  := 0;
    end else begin
      TJusoTotMod  := TJusoTotNum MOD 5;
    end;

    //주소 그리드 세팅
    if nTotCnt > 0 then begin

      k := 1; //Search_Juso 데이터 시작 행

      for i:=0 to OuterRoot.ChildNodes.Count-1 do  begin

        if OuterRoot.ChildNodes[i].NodeName = 'juso' then begin
          EntryNode := OuterRoot.ChildNodes[i];

          for j:=0 to EntryNode.ChildNodes.Count-1 do begin
            with SearchJusoForm do begin

              if EntryNode.ChildNodes[j].NodeName = 'zipNo'       then begin
                TcxLabel(FindComponent('ZipNo'+intToStr(k))).Caption     := EntryNode.ChildNodes[j].Text;
              end;
              if EntryNode.ChildNodes[j].NodeName = 'roadAddr'    then begin
                TcxLabel(FindComponent('roadAddr'+intToStr(k))).Caption  := EntryNode.ChildNodes[j].Text;
              end;
              if EntryNode.ChildNodes[j].NodeName = 'jibunAddr'   then begin
                TcxLabel(FindComponent('jibunAddr'+intToStr(k))).Caption := EntryNode.ChildNodes[j].Text;
              end;

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
    Screen.Cursor := crDefault;
  end;

end;

end.


