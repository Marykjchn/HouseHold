﻿unit DataModule;

interface

uses
  SysUtils, Classes, DCPcrypt2, DCPblockciphers, DCPrijndael, DB,
  MemDS, DBAccess, Ora, IdMessage, IdTCPConnection, IdTCPClient,
  IdMessageClient, IdSMTP, IdBaseComponent, IdComponent, IdIOHandler,
  IdIOHandlerSocket, IdSSLOpenSSL, Messages, Dialogs, DCPmd5, DCPsha256,
  IdCoder, IdCoder3to4, IdCoderMIME, cxGrid, Windows, Forms, Controls,
  cxExportGrid4Link , shellApi, asgprint, OraTransaction;

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
    mnum, muse                            : Integer;
    mname, mid, mpw, mbirth, mage         : String;
    msex, madd, memail, mgrade, mphone    : String;
  end;

// email인증시 해당 이메일주소와 내용 저장
type
  TemailC​erti  = record
    eemail, ebody                    : String;
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
    procedure DataModuleCreate(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
    recMemDate : TmemData;
    emailCerti : TemailC​erti;

    // --------------- 이메일 사용 ---------------
    function SendEmail(eSubject, ebody : String) : string;

    // --------------- 엑셀 파일 경로 저장 ---------------
    procedure ExcelRoute(FileName : String; GridName : TcxGrid; phandle : HWND);

  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

uses
  HDataMethod, LoginPage, HouseholdPage;

{ TDataModule1 }

procedure TDataModule1.DataModuleCreate(Sender: TObject);
var
  chk : Integer;
begin
  OraSession1.ConnectString := 'mary/"456527"@61.80.112.205:1521:XE';
  OraSession1.Connected     := True;

  QH_DML.Session            := OraSession1;

  LoginForm := TLoginForm.Create(Self);

  try
    chk := LoginForm.ShowModal;

  finally
    if chk = mrOk then begin
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

end.


