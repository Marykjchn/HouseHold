{*****************************************************}
{     TSolLun Component 1.0 for Delphi 1.0 .. 5.0     }
{                                                     }
{     Copyright (c) 2000   Jee, Sang-Young            }
{     Tel      :     +82-2-3141-7755                  }
{     Mobile   :     +82-16-722-7745                  }
{     Homepage : http://mrjee.pe.kr                   }
{     E-mail   : webmaster@mrjee.pe.kr                }
{*****************************************************}
{     This Component will convert                     }
{     between solar date and lunar date.              }
{*****************************************************}
unit SolnLun;

interface

uses
  Classes;

type
  TSolLun = class(TComponent)
  private
    FsolYear  : Word;
    FsolMonth : Word;
    FsolDay   : Word;
    FlunYear  : Word;
    FlunMonth : Word;
    FlunDay   : Word;
    FisLeap   : Boolean;
  private
    procedure SetsolYear(const value: Word);
    procedure SetsolMonth(const value: Word);
    procedure SetsolDay(const value: Word);
    procedure SetlunYear(const value: Word);
    procedure SetlunMonth(const value: Word);
    procedure SetlunDay(const value: Word);
    procedure SetLeap(const value: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Solar2Lunar;
    procedure Lunar2Solar;
  published
    property  solYear: Word read FsolYear  write SetsolYear;
    property  solMonth: Word read FsolMonth  write SetsolMonth;
    property  solDay: Word read FsolDay  write SetsolDay;
    property  lunYear: Word read FlunYear  write SetlunYear;
    property  lunMonth: Word read FlunMonth  write SetlunMonth;
    property  lunDay: Word read FlunDay  write SetlunDay;
    property  isLeap: Boolean read FisLeap  write SetLeap;
  end;

procedure Register;

implementation

{$R *.dcr}

uses
  SysUtils;

const
  kk : array [0..162, 0..12] of char
       =('1212122322121', // 1881
         '1212121221220',
         '1121121222120',
         '2112132122122',
         '2112112121220',
         '2121211212120',
         '2212321121212',
         '2122121121210',
         '2122121212120',
         '1232122121212',

         '1212121221220', // 1891
         '1121123221222',
         '1121121212220',
         '1212112121220',
         '2121231212121',
         '2221211212120',
         '1221212121210',
         '2123221212121',
         '2121212212120',
         '1211212232212',

         '1211212122210', // 1901
         '2121121212220',
         '1212132112212',
         '2212112112210',
         '2212211212120',
         '1221412121212',
         '1212122121210',
         '2112212122120',
         '1231212122212',
         '1211212122210',

         '2121123122122', // 1911
         '2121121122120',
         '2212112112120',
         '2212231212112',
         '2122121212120',
         '1212122121210',
         '2132122122121',
         '2112121222120',
         '1211212322122',
         '1211211221220',

         '2121121121220', // 1921
         '2122132112122',
         '1221212121120',
         '2121221212110',
         '2122321221212',
         '1121212212210',
         '2112121221220',
         '1231211221222',
         '1211211212220',
         '1221123121221',

         '2221121121210', // 1931
         '2221212112120',
         '1221241212112',
         '1212212212120',
         '1121212212210',
         '2114121212221',
         '2112112122210',
         '2211211412212',
         '2211211212120',
         '2212121121210',

         '2212214112121', // 1941
         '2122122121120',
         '1212122122120',
         '1121412122122',
         '1121121222120',
         '2112112122120',
         '2231211212122',
         '2121211212120',
         '2212121321212',
         '2122121121210',

         '2122121212120', //1951
         '1212142121212',
         '1211221221220',
         '1121121221220',
         '2114112121222',
         '1212112121220',
         '2121211232122',
         '1221211212120',
         '1221212121210',
         '2121223212121',

         '2121212212120', // 1961
         '1211212212210',
         '2121321212221',
         '2121121212220',
         '1212112112210',
         '2223211211221',
         '2212211212120',
         '1221212321212',
         '1212122121210',
         '2112212122120',

         '1211232122212', // 1971
         '1211212122210',
         '2121121122210',
         '2212312112212',
         '2212112112120',
         '2212121232112',
         '2122121212110',
         '2212122121210',
         '2112124122121',
         '2112121221220',

         '1211211221220', // 1981
         '2121321122122',
         '2121121121220',
         '2122112112322',
         '1221212112120',
         '1221221212110',
         '2122123221212',
         '1121212212210',
         '2112121221220',
         '1211231212222',

         '1211211212220', // 1991
         '1221121121220',
         '1223212112121',
         '2221212112120',
         '1221221232112',
         '1212212122120',
         '1121212212210',
         '2112132212221',
         '2112112122210',
         '2211211212210',

         '2221321121212', //2001
         '2212121121210',
         '2212212112120',
         '1232212122112',
         '1212122122120',
         '1121212322122',
         '1121121222120',
         '2112112122120',
         '2211231212122',
         '2121211212120',

         '2122121121210', // 2011
         '2124212112121',
         '2122121212120',
         '1212121223212',
         '1211212221220',
         '1121121221220',
         '2112132121222',
         '1212112121220',
         '2121211212120',
         '2122321121212',

         '1221212121210', // 2021
         '2121221212120',
         '1232121221212',
         '1211212212210',
         '2121123212221',
         '2121121212220',
         '1212112112220',
         '1221231211221',
         '2212211211220',
         '1212212121210',

         '2123212212121', // 2031
         '2112122122120',
         '1211212322212',
         '1211212122210',
         '2121121122120',
         '2212114112122',
         '2212112112120',
         '2212121211210',
         '2212232121211',
         '2122122121210',

         '2112122122120', // 2041
         '1231212122212',
         '1211211221220');

  dt : array [0..162] of Integer
      =(384, 355, 354, 384, 354, 354, 384, 354, 355, 384,
        355, 384, 354, 354, 383, 355, 354, 384, 355, 384,
        354, 355, 383, 354, 355, 384, 354, 355, 384, 354,
        384, 354, 354, 384, 355, 354, 384, 355, 384, 354,
        354, 384, 354, 354, 385, 354, 355, 384, 354, 383,
        354, 355, 384, 355, 354, 384, 354, 384, 354, 354,
        384, 355, 355, 384, 354, 354, 384, 354, 384, 354,
        355, 384, 355, 354, 384, 354, 384, 354, 354, 384,
        355, 354, 384, 355, 353, 384, 355, 384, 354, 355,
        384, 354, 354, 384, 354, 384, 354, 355, 384, 355,
        354, 384, 354, 384, 354, 354, 385, 354, 355, 384,
        354, 354, 383, 355, 384, 355, 354, 384, 354, 354,
        384, 354, 355, 384, 355, 384, 354, 354, 384, 354,
        354, 384, 355, 384, 355, 354, 384, 354, 354, 384,
        354, 355, 384, 354, 384, 355, 354, 383, 355, 354,
        384, 355, 384, 354, 354, 384, 354, 354, 384, 355,
        355, 384, 354);

  m : array[0..11] of byte = (31,28,31,30,31,30,31,31,30,31,30,31);




procedure Register;
begin
  RegisterComponents('mrjee', [TSolLun]);
end;


constructor TSolLun.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DecodeDate(date, FsolYear, FsolMonth, FsolDay);
  Solar2Lunar;
end;

destructor TSolLun.Destroy;
begin
  inherited Destroy;
end;

procedure TSolLun.SetsolYear(const value: Word);
begin
  FsolYear := value;
end;

procedure TSolLun.SetsolMonth(const value: Word);
begin
  FsolMonth := value;
end;

procedure TSolLun.SetsolDay(const value: Word);
begin
  FsolDay := value;
end;

procedure TSolLun.SetlunYear(const value: Word);
begin
  FlunYear := value;
end;

procedure TSolLun.SetlunMonth(const value: Word);
begin
  FlunMonth := value;
end;

procedure TSolLun.SetlunDay(const value: Word);
begin
  FlunDay := value;
end;

procedure TSolLun.SetLeap(const value: Boolean);
begin
  FisLeap := value;
end;


procedure TSolLun.Solar2Lunar;
var
  m0, m1, m2 : Integer;
  i, j : Integer;
  temp : Integer;
  acc_day : LongInt;
  buff_day : LongInt;
  total_day : LongInt;
begin
  // 총 일수를 계산한다.
  temp := solYear - 1;
  total_day := temp*365 + Trunc(temp/4) - Trunc(temp/100) + Trunc(temp/400);
  if ((solYear mod 4=0) and not (solYear mod 100=0)) or
     (solYear mod 400=0) then  m[1] := 29  else  m[1] := 28;
  for i := 0 to solMonth-2 do  total_day := total_day + m[i];
  total_day := total_day + solDay;

  // 총 일수 - 1880년까지의 총 일수
  acc_day  := total_day - 686686 + 1;

  // Lunar Year
  buff_day := dt[0];
  for i := 0 to 162 do begin
    if acc_day <= buff_day then  break;
    buff_day := buff_day + dt[i+1];
  end;
  lunYear := i + 1881;

  // Lunar Month
  buff_day := buff_day - dt[i];
  acc_day  := acc_day - buff_day;
  if kk[i][12] <> '0' then temp := 13  else  temp := 12;
  m2 := 0;
  for j := 0 to temp-1 do begin
   if kk[i][j] <= '2' then begin
      inc(m2);
      m1 := StrToInt(kk[i][j]) + 28;
   end else
      m1 := StrToInt(kk[i][j]) + 26;
   if acc_day <= m1 then break;
   acc_day := acc_day - m1;
  end;
  m0 := j;
  lunMonth := m2;

  // Lunar Day
  lunDay := acc_day;

  if (kk[lunYear-1881][12] <> '0') and (kk[lunYear-1881][m0] > '2') then
  isLeap := true  else  isLeap := false;
end;


procedure TSolLun.Lunar2Solar;
var
  yy, mm, n2,
  i, j, r : Integer;
  acc_day : LongInt;
begin
   yy := -1;
   acc_day := 0;

   if lunYear <> 1881 then begin
     yy := lunYear - 1882;
     for i := 0 to yy do begin
       for j := 0 to 12 do acc_day := acc_day + StrToInt(kk[i][j]);
       if kk[i][12]='0' then acc_day := acc_day + 336
       else                  acc_day := acc_day + 362;
     end;
   end;

   Inc(yy);
   n2 := lunMonth - 1;
   mm := -1;

   r  := 2;
   repeat
     Inc(mm);
     if kk[yy][mm] > '2' then begin
        acc_day := acc_day + 26 + StrToInt(kk[yy][mm]);
        Inc(n2);
     end
     else
     if mm = n2 then
        break
     else
        acc_day := acc_day + 28 + StrToInt(kk[yy][mm]);
   until r = 1;

   // 윤달이면...
   if isLeap then acc_day := acc_day + 28 + StrToInt(kk[yy][mm]);
   acc_day := acc_day + lunDay + 29;
   yy := 1880;

   r := 2;
   repeat
     Inc(yy);
     mm := 365;
     if ((yy mod 4=0) and not (yy mod 100=0)) or
        (yy mod 400=0) then  mm := 366;
     if acc_day <= mm then  break;
     acc_day := acc_day - mm;
   until r=1;

   solYear := yy;
   m[1]  := mm - 337;
   yy    := 0;

   r := 2;
   repeat
     Inc(yy);
     if (acc_day <= m[yy-1]) then  break;
     acc_day := acc_day - m[yy-1];
   until r = 1;

   solMonth := yy;
   solDay   := acc_day;
end;


end.
