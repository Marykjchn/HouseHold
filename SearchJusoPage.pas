unit SearchJusoPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls,
  cxContainer, cxTextEdit, StdCtrls, Menus, cxLabel, jpeg;

type
  TAddressContents = record
    SPostCode       : String;
    SSelectAddress  : String;
  end;

type
  TSearchJusoForm = class(TForm)
    Panel1: TPanel;
    PlEditAddress: TPanel;
    EditAddress: TcxTextEdit;
    LabEditAddress: TcxLabel;
    plJusoTitle: TPanel;
    plPagenation: TPanel;
    plJusoLine1: TPanel;
    plJusoLine2: TPanel;
    plJusoLine3: TPanel;
    plJusoLine4: TPanel;
    plJusoLine5: TPanel;
    LabPostCode: TcxLabel;
    LabAddress: TcxLabel;
    ZipNo1: TcxLabel;
    ZipNo2: TcxLabel;
    ZipNo3: TcxLabel;
    ZipNo4: TcxLabel;
    ZipNo5: TcxLabel;
    roadAddr1: TcxLabel;
    jibunAddr1: TcxLabel;
    roadAddr2: TcxLabel;
    jibunAddr2: TcxLabel;
    roadAddr3: TcxLabel;
    jibunAddr3: TcxLabel;
    roadAddr4: TcxLabel;
    jibunAddr4: TcxLabel;
    roadAddr5: TcxLabel;
    jibunAddr5: TcxLabel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    BtnBeforePage: TPanel;
    BtnNextPage: TPanel;
    plJusoList: TPanel;
    BtnSearchAddress: TImage;
    BtnPageNum1: TcxLabel;
    BtnPageNum2: TcxLabel;
    BtnPageNum3: TcxLabel;
    BtnPageNum4: TcxLabel;
    BtnPageNum5: TcxLabel;
    LabNotFindAddress: TcxLabel;
    LabTotAddList: TcxLabel;


    procedure BtnBeforeNextMouseEnter(Sender: TObject);
    procedure BtnBeforeNextMouseLeave(Sender: TObject);

    // 조회 버튼 클릭시 조회이벤트 호출
    procedure BtnSearchAddressClick(Sender: TObject);

    // 조회 버튼 클릭시 Page버튼 Visible여부
    procedure PageBtnVisible;

    // 주소검색시 이전,다음버튼 Visible여부
    procedure BtnBeforeNextVisible;

    // 페이지 버튼 클릭시 버튼 Visible여부
    procedure BtnPageNumClick(Sender: TObject);

    // 버튼 클릭시 Color 지정
    procedure ButtonColorChange(PageName : String);

    // 버튼 호버시 Color 지정
    procedure PageNumMouseEnter(Sender: TObject);
    procedure PageNumMouseLeave(Sender: TObject);

    // Edit 버튼 이벤트
    procedure EditAddressEnter(Sender: TObject);
    procedure EditAddressExit(Sender: TObject);
    procedure EditAddressKeyPress(Sender: TObject; var Key: Char);
    procedure EditAddressKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure LabEditAddressClick(Sender: TObject);

    // 폼생성시 이벤트
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnBeforeNextPageClick(Sender: TObject);
    procedure LabJusoMouseEnter(Sender: TObject);
    procedure LabJusoMouseLeave(Sender: TObject);
    procedure AddressClick(Sender: TObject);

  private
    { Private declarations }
    var
      TPageName     : String;     //현재 page버튼 이름
      TJusoEditVal  : String;     //현재 검색한 주소
      TPageCaption  : Integer;    //현재 page버튼 Caption

    // 주소 개수만큼 주소 리스트 Visible여부
    procedure JusoLineVisibel;

  public
    { Public declarations }
  end;

var
  SearchJusoForm: TSearchJusoForm;
  PanelList : TList;

implementation

{$R *.dfm}

uses
  DataModule, DetailAddressPage;

procedure TSearchJusoForm.ButtonColorChange(PageName: String);
var
  FindLabel : TLabel;
  I: Integer;
begin
  for I := 1 to 5 do begin
    FindLabel := TLabel(FindComponent('BtnPageNum' + IntToStr(I)));

    if PageName = FindLabel.Name then begin
      FindLabel.Color       := $00FF8D1C;
      FindLabel.Font.Color  := clWindow;
    end else begin
      FindLabel.Color       := clWindow;
      FindLabel.Font.Color  := $00FF8D1C;
    end;
  end;
end;

procedure TSearchJusoForm.LabEditAddressClick(Sender: TObject);
begin
  EditAddress.SetFocus;
end;

procedure TSearchJusoForm.EditAddressEnter(Sender: TObject);
begin
  LabEditAddress.Style.Color := $00FFFCF9;
  PlEditAddress.Color        := $00FFFCF9;
end;

procedure TSearchJusoForm.EditAddressExit(Sender: TObject);
begin
  LabEditAddress.Style.Color := clWindow;
  PlEditAddress.Color        := clWindow;
end;

procedure TSearchJusoForm.EditAddressKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    BtnSearchAddressClick(nil);
  end;
end;

procedure TSearchJusoForm.EditAddressKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EditAddress.Text <> '' then begin
    LabEditAddress.hide;
  end else begin
    LabEditAddress.show;
  end;
end;

procedure TSearchJusoForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with DataModule1 do begin
    TJusoTotNum   := 0;
    TJusoTotPage  := 0;
    TJusoTotMod   := 0;
  end;
end;

procedure TSearchJusoForm.FormCreate(Sender: TObject);
begin
  with DataModule1 do begin
    TJusoTotNum   := 0;
    TJusoTotPage  := 0;
    TJusoTotMod   := 0;
  end;

  BtnPageNum1.Visible := False;
  BtnPageNum2.Visible := False;
  BtnPageNum3.Visible := False;
  BtnPageNum4.Visible := False;
  BtnPageNum5.Visible := False;
//
  BtnBeforePage.Visible := False;
  BtnNextPage.Visible   := False;

  TPageName    := '';
  TJusoEditVal := '';
  TPageCaption := 0;

  JusoLineVisibel;

  LabNotFindAddress.Visible := True;
  LabTotAddList.Visible     := False;

  BtnBeforeNextPageClick(BtnSearchAddress);

end;

procedure TSearchJusoForm.AddressClick(Sender: TObject);
var
  SName       : String;
  NameLength  : Integer;
  NameNum     : String;
  RoadAddr, JibunAddr, ZipNo : String;
  GetModal    : TModalResult;

begin
  GetModal    := 0;
  SName       := TSearchJusoForm(Sender).Name;
  NameLength  := Length(SName);

  NameNum     := Copy(SName, NameLength, 1);

  RoadAddr    := TcxLabel(FindComponent('roadAddr'   + NameNum)).Caption;
  JibunAddr   := TcxLabel(FindComponent('jibunAddr'  + NameNum)).Caption;
  ZipNo       := TcxLabel(FindComponent('ZipNo'      + NameNum)).Caption;

  with DataModule1 do begin
    addressSearch.ARoadAddr  := RoadAddr;
    addressSearch.AJibunAddr := JibunAddr;
    addressSearch.AZipCode   := ZipNo;

    SName := Copy(SName, 0, NameLength - 1);

    if (SName = 'roadAddr') OR (SName = 'ZipNo') then begin
      addressSearch.ARoadBool := True;
    end else begin
      addressSearch.ARoadBool := False;
    end;
    
  end;

  DetailAddressForm := TDetailAddressForm.Create(Self);

  try
    GetModal := DetailAddressForm.ShowModal;
  finally
    if GetModal = mrOk then begin
      ModalResult := mrOK;
    end else begin
      with DataModule1 do begin
        addressSearch.ARoadAddr   := '';
        addressSearch.AJibunAddr  := '';
        addressSearch.AZipCode    := '';
        addressSearch.ADetailAddr := '';
        addressSearch.ARoadBool   := False;
      end;
    end;
  end;

end;

procedure TSearchJusoForm.JusoLineVisibel;
//var
//  I         : Integer;
//  FindPanel : TPanel;
begin
  with DataModule1 do begin
//    오류원인 못찾음
//    for I := 1 to 5 do begin
//      FindPanel := TPanel(FindComponent('plJusoLine' + IntToStr(I)));
//      if (I <= TjusoTotMod) AND (TjusoTotMod <> 0) then begin
//        SetVisibleItems(FindPanel, True);
//      end else begin
//        SetVisibleItems(FindPanel, False);
//      end;
//    end;

    SetVisibleItems(plJusoLine1, True);
    SetVisibleItems(plJusoLine2, True);
    SetVisibleItems(plJusoLine3, True);
    SetVisibleItems(plJusoLine4, True);
    SetVisibleItems(plJusoLine5, True);

    with DataModule1 do begin

      if TPageCaption = TJusoTotPage then begin
        if TJusoTotMod = 0 then begin

          SetVisibleItems(plJusoLine1, False);
          SetVisibleItems(plJusoLine2, False);
          SetVisibleItems(plJusoLine3, False);
          SetVisibleItems(plJusoLine4, False);
          SetVisibleItems(plJusoLine5, False);
        end else if TJusoTotMod = 1 then begin

          SetVisibleItems(plJusoLine1, True);
          SetVisibleItems(plJusoLine2, False);
          SetVisibleItems(plJusoLine3, False);
          SetVisibleItems(plJusoLine4, False);
          SetVisibleItems(plJusoLine5, False);
        end else if TJusoTotMod = 2 then begin

          SetVisibleItems(plJusoLine1, True);
          SetVisibleItems(plJusoLine2, True);
          SetVisibleItems(plJusoLine3, False);
          SetVisibleItems(plJusoLine4, False);
          SetVisibleItems(plJusoLine5, False);
        end else if TJusoTotMod = 3 then begin

          SetVisibleItems(plJusoLine1, True);
          SetVisibleItems(plJusoLine2, True);
          SetVisibleItems(plJusoLine3, True);
          SetVisibleItems(plJusoLine4, False);
          SetVisibleItems(plJusoLine5, False);
        end else if TJusoTotMod = 4 then begin

          SetVisibleItems(plJusoLine1, True);
          SetVisibleItems(plJusoLine2, True);
          SetVisibleItems(plJusoLine3, True);
          SetVisibleItems(plJusoLine4, True);
          SetVisibleItems(plJusoLine5, False);
        end;

      end else if TJusoTotNum = 0 then begin
        SetVisibleItems(plJusoLine1, False);
        SetVisibleItems(plJusoLine2, False);
        SetVisibleItems(plJusoLine3, False);
        SetVisibleItems(plJusoLine4, False);
        SetVisibleItems(plJusoLine5, False);
      end;
    end;
  end;
end;

procedure TSearchJusoForm.BtnSearchAddressClick(Sender: TObject);
begin
  TJusoEditVal := EditAddress.Text;

  DataModule1.JusoSearchApiCall(TJusoEditVal, 1);

  BtnPageNum1.Caption := '1';
  BtnPageNum2.Caption := '2';
  BtnPageNum3.Caption := '3';
  BtnPageNum4.Caption := '4';
  BtnPageNum5.Caption := '5';

  TPageName     := 'BtnPageNum1';
  TPageCaption  := 1;

  // 현재 페이지 버튼 색 변경
  ButtonColorChange(TPageName);

  // 현재페이지 검색된 라인만 출력
  JusoLineVisibel;

  // 이전,다음 버튼 Visible여부
  BtnBeforeNextVisible;

  // 페이지 버튼 visible여부
  PageBtnVisible;

  LabTotAddList.Caption := '총 ' + IntToStr(DataModule1.TJusoTotNum) + '건';
  LabTotAddList.Visible := True;

  if DataModule1.TJusoTotNum = 0 then begin
    LabNotFindAddress.Visible := True;
    BtnPageNum1.Visible := False;
    BtnPageNum2.Visible := False;
    BtnPageNum3.Visible := False;
    BtnPageNum4.Visible := False;
    BtnPageNum5.Visible := False;

    BtnBeforePage.Visible := False;
    BtnNextPage.Visible   := False;

    ShowMessage('검색한 주소가 존재하지 않습니다.');
  end else begin
    LabNotFindAddress.Visible := False;
  end;

end;

procedure TSearchJusoForm.BtnPageNumClick(Sender: TObject);
begin
  TPageCaption  := StrToInt(TSearchJusoForm(Sender).Caption);
  TPageName     := TSearchJusoForm(Sender).Name;

  DataModule1.JusoSearchApiCall(TJusoEditVal, TPageCaption);

  ButtonColorChange(TPageName);

  BtnBeforeNextVisible;

  PageBtnVisible;

  JusoLineVisibel;     

end;

procedure TSearchJusoForm.PageBtnVisible;
var
//  I           : Integer;
//  FindLabel   : TLabel;
  JusoModNum : Integer;

begin

  with Datamodule1 do begin

//    PageNumMOD := TJusoTotPage MOD 5;
//
//    if (PageNumMOD = 0) AND (TJusoTotPage <> 0) then begin
//      PageNumMOD := 5;
//    end;
//
//    if PageNumMOD = 0 then begin
//      Exit;
//    end;
//
//    for I := 1 to 5 do begin
//      FindLabel := TLabel(FindComponent('BtnPageNum' + IntToStr(I)));
//      if I <= PageNumMOD then begin
//        FindLabel.Visible := True;
//        FindLabel.Left    := ((175-(35 * PageNumMOD)) div 2) + (I * 35) - 35;
//      end else begin
//        FindLabel.Visible := False;
//      end;
//
//    end;

    if TJusoTotMod = 0 then begin
      Exit;
    end;

    JusoModNum := TJusoTotPage MOD 5;

    if TPageCaption > TJusoTotPage - JusoModNum then begin

      if JusoModNum = 1 then begin
        BtnPageNum1.Visible := True;
        BtnPageNum2.Visible := False;
        BtnPageNum3.Visible := False;
        BtnPageNum4.Visible := False;
        BtnPageNum5.Visible := False;

      end else if JusoModNum = 2 then begin
        BtnPageNum1.Visible := True;
        BtnPageNum2.Visible := True;
        BtnPageNum3.Visible := False;
        BtnPageNum4.Visible := False;
        BtnPageNum5.Visible := False;

      end else if JusoModNum = 3 then begin
        BtnPageNum1.Visible := True;
        BtnPageNum2.Visible := True;
        BtnPageNum3.Visible := True;
        BtnPageNum4.Visible := False;
        BtnPageNum5.Visible := False;

      end else if JusoModNum = 4 then begin
        BtnPageNum1.Visible := True;
        BtnPageNum2.Visible := True;
        BtnPageNum3.Visible := True;
        BtnPageNum4.Visible := True;
        BtnPageNum5.Visible := False;

      end else if JusoModNum = 5 then begin
        BtnPageNum1.Visible := True;
        BtnPageNum2.Visible := True;
        BtnPageNum3.Visible := True;
        BtnPageNum4.Visible := True;
        BtnPageNum5.Visible := True;

      end;

      BtnPageNum1.Left    := ((175-(35 * JusoModNum)) div 2) + (1 * 35) - 35;
      BtnPageNum2.Left    := ((175-(35 * JusoModNum)) div 2) + (2 * 35) - 35;
      BtnPageNum3.Left    := ((175-(35 * JusoModNum)) div 2) + (3 * 35) - 35;
      BtnPageNum4.Left    := ((175-(35 * JusoModNum)) div 2) + (4 * 35) - 35;
      BtnPageNum5.Left    := ((175-(35 * JusoModNum)) div 2) + (5 * 35) - 35;

    end else begin
      BtnPageNum1.Visible := True;
      BtnPageNum2.Visible := True;
      BtnPageNum3.Visible := True;
      BtnPageNum4.Visible := True;
      BtnPageNum5.Visible := True;

      BtnPageNum1.Left    := ((175-(35 * 5)) div 2) + (1 * 35) - 35;
      BtnPageNum2.Left    := ((175-(35 * 5)) div 2) + (2 * 35) - 35;
      BtnPageNum3.Left    := ((175-(35 * 5)) div 2) + (3 * 35) - 35;
      BtnPageNum4.Left    := ((175-(35 * 5)) div 2) + (4 * 35) - 35;
      BtnPageNum5.Left    := ((175-(35 * 5)) div 2) + (5 * 35) - 35;
    end;

  end;
end;

procedure TSearchJusoForm.PageNumMouseEnter(Sender: TObject);
begin
  if TSearchJusoForm(Sender).Name <> TPageName then begin
    TSearchJusoForm(Sender).Color       := $00FF8D1C;
    TSearchJusoForm(Sender).Font.Color  := clWindow;
  end;
end;

procedure TSearchJusoForm.PageNumMouseLeave(Sender: TObject);
begin
  if TSearchJusoForm(Sender).Name <> TPageName then begin
    TSearchJusoForm(Sender).Color       := clWindow;
    TSearchJusoForm(Sender).Font.Color  := $00FF8D1C;
  end;
end;

procedure TSearchJusoForm.LabJusoMouseEnter(Sender: TObject);
begin
  TcxLabel(Sender).Style.TextStyle := [fsUnderline];
end;

procedure TSearchJusoForm.LabJusoMouseLeave(Sender: TObject);
begin
  TcxLabel(Sender).Style.TextStyle := [];
end;

procedure TSearchJusoForm.BtnBeforeNextMouseEnter(Sender: TObject);
begin
  TSearchJusoForm(Sender).Color       := $00FF8D1C;
  TSearchJusoForm(Sender).Font.Color  := clWindow;
end;

procedure TSearchJusoForm.BtnBeforeNextMouseLeave(Sender: TObject);
begin
  TSearchJusoForm(Sender).Color       := clWindow;
  TSearchJusoForm(Sender).Font.Color  := clBlack;
end;

procedure TSearchJusoForm.BtnBeforeNextPageClick(Sender: TObject);
var
  NBtnCaption : Integer;
//  FindBtn     : TcxLabel;
  BtnName     : String;
//  I           : Integer;
begin
  BtnName     := TSearchJusoForm(Sender).Name;

  if BtnName = 'BtnSearchAddress' then begin
    Exit;
  end;


//  with DataModule1 do begin
//    if (BtnName = 'BtnNextPage') AND (StrToInt(BtnPageNum1.Caption) < TJusoTotPage-(TJusoTotPage MOD 5)) then begin
//      for I := 1 to 5 do begin
//        FindBtn := TcxLabel(FindComponent('BtnPageNum' + IntToStr(I)));
//        ShowMessage(FindBtn.Caption);
//        NBtnCaption := StrToInt(FindBtn.Caption) + 5;
//        FindBtn.Caption := IntToStr(NBtnCaption);
//      end;
//
//    end else if (BtnName = 'BtnBeforePage') AND (StrToInt(BtnPageNum1.Caption) > 5) then begin
//      for I := 1 to 5 do begin
//        FindBtn := TcxLabel(FindComponent('BtnPageNum' + IntToStr(I)));
//        NBtnCaption := StrToInt(FindBtn.Caption) - 5;
//        FindBtn.Caption := IntToStr(NBtnCaption);
//      end;
//
//    end;
//  end;
  NBtnCaption := StrToInt(BtnPageNum1.Caption);

  with DataModule1 do begin
    if (BtnName = 'BtnNextPage') AND (StrToInt(BtnPageNum1.Caption) < TJusoTotPage-(TJusoTotPage MOD 5)) then begin
      BtnPageNum1.Caption := IntToStr(NBtnCaption + 5);
      BtnPageNum2.Caption := IntToStr(NBtnCaption + 6);
      BtnPageNum3.Caption := IntToStr(NBtnCaption + 7);
      BtnPageNum4.Caption := IntToStr(NBtnCaption + 8);
      BtnPageNum5.Caption := IntToStr(NBtnCaption + 9);

      BtnPageNumClick(BtnPageNum1);

    end else if (BtnName = 'BtnBeforePage') AND (StrToInt(BtnPageNum1.Caption) > 5) then begin
      BtnPageNum1.Caption := IntToStr(NBtnCaption - 5);
      BtnPageNum2.Caption := IntToStr(NBtnCaption - 4);
      BtnPageNum3.Caption := IntToStr(NBtnCaption - 3);
      BtnPageNum4.Caption := IntToStr(NBtnCaption - 2);
      BtnPageNum5.Caption := IntToStr(NBtnCaption - 1);

      BtnPageNumClick(BtnPageNum5);

    end;
  end;



end;

procedure TSearchJusoForm.BtnBeforeNextVisible;
var
  JusoTotPage : Integer;
begin
  //
  with DataModule1 do begin
    if TPageCaption <= 5 then begin
      BtnBeforePage.Visible := False;

    end else begin
      BtnBeforePage.Visible := True;
    end;

    if (TJusoTotNum <> 0) AND ((TJusoTotPage MOD 5) = 0) then begin
      JusoTotPage := 5;
    end else begin
      JusoTotPage := TJusoTotPage MOD 5;
    end;

    if (TPageCaption <= TJusoTotPage) AND (TPageCaption > TJusoTotPage-JusoTotPage) then begin
      BtnNextPage.Visible := False;

    end else begin
      BtnNextPage.Visible := True;
    end;

  end;

end;

end.
