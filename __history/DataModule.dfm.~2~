object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 256
  Width = 424
  object OraSession1: TOraSession
    Options.Direct = True
    Left = 20
    Top = 16
  end
  object QH_DML: TOraQuery
    Left = 65
    Top = 16
  end
  object IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket
    SSLOptions.Method = sslvSSLv23
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 200
    Top = 16
  end
  object IdSMTP1: TIdSMTP
    MaxLineAction = maException
    Port = 0
    AuthenticationType = atNone
    Left = 155
    Top = 16
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    DeleteTempFiles = False
    Encoding = meMIME
    Recipients = <>
    ReplyTo = <>
    Left = 110
    Top = 16
  end
  object SaveExcel: TSaveDialog
    Filter = #50641#49472#54028#51068'(*.XML)|*.XML'
    Left = 248
    Top = 16
  end
  object OraTransaction1: TOraTransaction
    DefaultSession = OraSession1
    Left = 24
    Top = 64
  end
end
