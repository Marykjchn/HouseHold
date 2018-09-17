unit HDataMethod;

interface

uses
  SysUtils, Windows, DCPrijndael, DCPcrypt2, DCPsha256, imm, Forms, Shlobj;

// ---------- 양방향 ----------
// --- 암호화 ---
function HITSEncrypt(Data: String; _key : String): String;
// --- 복호화 ---
function HITSDecrypt(Data: String; _key : String): String;


// -------- 단반향 --------
function HITSHashEncrypt(Data: string): string;


// -------- 문자입력 한글인지 영어인지 확인 --------
function hanglechk(namechk: string; phandle : HWND): Boolean;


// ---------- 랜덤 이메일 인증번호 생성 ---------------
function GetRandomString: String;

// ---------- 엑셀 저장 경로 ----------
function GetProgramFilesDir: String;

implementation


uses
DataModule, ReportPage;

function StringToBytes(const S: string ) : TBytes;
var
  Bytes: TBytes;
  i: integer;
begin
  SetLength(Bytes,length(S));
  for i := 0 to length(S) - 1 do begin
    Bytes[i] := Ord(S[i+1]);
  end;

  Result := Bytes;
end;

function StringToHex(const S: string): string;
var
  Index: Integer;
begin
  Result := '';
  for Index := 1 to Length(S) do
    Result := Result + IntToHex( Byte( S[Index] ), 2 );
end;

function HexToInt(Str : string): integer;
var i, r : integer;
begin
  val('$'+Trim(Str),r, i);
  if i<>0 then HexToInt := 0
  else HexToInt := r;
end;

function EncryptData(Data: WideString; AKey,  AIv: AnsiString): WideString;
var
  cipher: TDCP_rijndael;
  key, iv, src, dest     : TBytes;

  //, b64
  index, slen, bsize, pad: integer;

  sSrc  : UTF8String;
  i     : integer;
  Bytes,
  SOut: String;
begin
  key := StringToBytes(AKey);
  iv  := StringToBytes(AIv);

  /// xe2 에서 = TEncoding.UTF8.GetBytes(Data);
  sSrc   := UTF8Encode(Data);
  src    := StringToBytes(sSrc);

  cipher := TDCP_rijndael.Create(nil);
  try
    cipher.CipherMode := cmCBC;
    // padding 추가 처리...
    // 해당 컴포넌트에서는 padding 기능을 제공하고 있지 않아 직접 처리 필요
    {--------------------------------------------------------------------------}
    slen := Length(src);    // 원래 문자 byte에 대한 길이

    bsize := (cipher.BlockSize div 8);   // BlockSize = 128 / 8 = 16 [byte szie 구하기]
    pad := bsize - (slen mod bsize);     // 16byte 기준 부족한 부분 구하기
    Inc(slen, pad);                      // 부족한 부분만큼 추가
    SetLength(src, slen);                // 다시 source에 대해서 길이 조정
    // 부족한 길이에 padding 길이 셋팅
    for index := pad downto 1 do
    begin
      src[slen - index] := pad;
    end;
    {--------------------------------------------------------------------------}

    SetLength(dest, slen);
    // key 초기화.
    cipher.Init(key[0], 128, @iv[0]); //

    // 암호화 처리..
    cipher.Encrypt(src[0], dest[0], slen);

    SOut := '';
    // 암호화된 결과 가져오기...
    for i := 0 to Length(dest) - 1 do
    begin
       SOut := SOut + Chr(dest[i]);
       Bytes := Bytes + IntToStr(dest[i]) + ' ';
    end;

    result := StringToHex(SOut);
  finally
    cipher.Free;
  end;
end;

function HITSEncrypt(Data: string; _key : string): string;
var
   strTmp     : WideString;

   sKey,
   sIv        : AnsiString;
begin
  Result  := '';

  sKey    := _key;
  sIv     := _key;

  strTmp  := EncryptData( PWideChar( WideString(Data)), sKey, sIv );

  Result  := LowerCase( strTmp );
end;

function DecryptData(Data: PWideChar; AKey: String; AIv: String): PWideChar;
var
  key, iv, src, dest: TBytes;
  cipher: TDCP_rijndael;

  SOut: utf8string;

  //l,
  i,
  slen, pad: integer;
  sReturn  : WideString;
begin
  sReturn  := '';
  Result   := '';

  try
    key := StringToBytes(AKey);
    iv  := StringToBytes(AIv);

    SetLength( src, Length(Data) DIV 2 );
    //l := Length(Data) DIV 2;
    for i := 0 to high( src ) do begin
      src[i] := HexToInt(Copy(Data,2*i+1,2));
    end;
    cipher := TDCP_rijndael.Create(nil);
    try
      cipher.CipherMode := cmCBC;
      try
        slen := Length(src);
        SetLength(dest, slen);
        cipher.Init(key[0], 128, @iv[0]); //
        Cipher.Decrypt( src[0], dest[0], slen );

    //    // padding 제거
        pad := dest[slen - 1];
        SetLength(dest, slen - pad);

        for i := 0 to Length(dest) - 1 do
        begin
           SOut := SOut + Chr(dest[i]);
        end;

        sReturn :=  UTF8Decode( SOut );
        result  := PWideChar( sReturn );
      except
         ;
      end;
    finally
      cipher.Free;
    end;
  except
    ;
  end;
end;

function HITSDecrypt(Data: string; _key : string): string;
var
   strTmp     : WideString;

   sKey,
   sIv        : AnsiString;
begin
  Result  := '';

  sKey  := _key;
  sIv   := _key;

  strTmp  := DecryptData( PWideChar( WideString(Data)), sKey, sIv );

  Result := strTmp;
end;

function HITSHashEncrypt(Data: string): string;
var
  Src : AnsiString;
  Digest: array[0..31] of Byte;

  Hash: TDCP_sha256;
  i : integer;
  Bytes,
  SOut: String;
  sReturn : WideString;
begin
  Result  := '';

  try
    Src   := AnsiString(Data);
    Hash := TDCP_sha256.Create(nil);
    try
      Hash.Init;
      Hash.UpdateStr(Src);
      Hash.Final(Digest);

      for i := 0 to Length(Digest) - 1 do
      begin
         SOut := SOut + Chr(Digest[i]);
         Bytes := Bytes + IntToStr(Digest[i]) + ' ';
      end;

      sReturn:=  StringToHex(SOut);
      result := LowerCase( PWideChar( sReturn ) );
    finally
      Hash.Free;
    end;
  except
    result  := 'encrypt error';
  end;
end;

function GetRandomChar: Char;
begin
  Result:=CHAR_SET[Random(High(CHAR_SET))];
end;

function GetRandomString: String;
var
  i, Range : Integer;
begin
  Range := 7;
  Result:='';

  Randomize;

  for I := 0 to Range do begin
    Result:=Result+GetRandomChar;
  end;

end;

function hanglechk(namechk: string; phandle : HWND): Boolean;
var
  IMC: HIMC;
begin
  IMC := ImmGetContext(phandle);

  if ImmGetOpenStatus(IMC) then begin
    Result := True
  end else begin
    Result := False;
  end;
  ImmReleaseContext(phandle, IMC);
end;

function GetProgramFilesDir: String;
const
  CSIDL_PROGRAM_FILES = $0000;
var
  pidl: PItemIDList;
  Path: array [0..MAX_PATH-1] of char;
begin
  if Succeeded(SHGetSpecialFolderLocation(Application.Handle, CSIDL_PROGRAM_FILES, pidl)) then begin
    if SHGetPathFromIDList(pidl, Path) then begin
      Result := StrPas(path);
    end;
   end;
end;

end.
