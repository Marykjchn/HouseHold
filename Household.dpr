program household;

uses
  Forms,
  LoginPage in 'LoginPage.pas' {LoginForm},
  MemInsertPage in 'MemInsertPage.pas' {MemInsertForm},
  DataModule in 'DataModule.pas' {DataModule1: TDataModule},
  HouseholdPage in 'HouseholdPage.pas' {HouseHoldForm},
  ReportPage in 'ReportPage.pas' {ReportForm},
  SolnLun in 'SolnLun.pas',
  AnniversaryEditPage in 'AnniversaryEditPage.pas' {AnniversaryEditForm},
  AnniAddPage in 'AnniAddPage.pas' {AnniAddForm},
  FixBreakdownEditPage in 'FixBreakdownEditPage.pas' {FixBreakdownEditForm},
  FindIDPage in 'FindIDPage.pas' {FindIDForm},
  EmailchkPage in 'EmailchkPage.pas' {EmailchkForm},
  FindPWPage in 'FindPWPage.pas' {FindPWForm},
  HDataMethod in 'HDataMethod.pas',
  UpdatePWPage in 'UpdatePWPage.pas' {UpdatePWForm},
  MemInfoPage in 'MemInfoPage.pas' {MemInfoForm},
  UpdatePhonePage in 'UpdatePhonePage.pas' {UpdatePhoneForm},
  UpdateEmailPage in 'UpdateEmailPage.pas' {UpdateEmailForm},
  UpdateAddPage in 'UpdateAddPage.pas' {UpdateAddForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '°¡°èºÎ';
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
