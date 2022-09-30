object DM: TDM
  OldCreateOrder = False
  Height = 414
  Width = 591
  object Transaction: TUniTransaction
    Left = 56
    Top = 96
  end
  object MySQLUniProvider1: TMySQLUniProvider
    Left = 56
    Top = 152
  end
  object Banco: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'techja'
    DefaultTransaction = Transaction
    Username = 'root'
    Server = 'localhost'
    Connected = True
    LoginPrompt = False
    BeforeConnect = BancoBeforeConnect
    Left = 56
    Top = 56
    EncryptedPassword = 'CEFFCDFFCCFF'
  end
  object Toast1: TToast
    AppearanceDuration = 300
    DisappearanceDuration = 300
    ToastBoxStrokeColor = claNull
    TextColor = claBlack
    ToastBoxColor = claGray
    ToastBoxStrokeDash = Solid
    TextAlign = Center
    Duration = 3000
    Opacity = 1.000000000000000000
    OptimalWidth = False
    ToastBoxAlign = Center
    ToastBoxHeight = 50.000000000000000000
    ToastBoxStrokeThickness = 1.000000000000000000
    ToastBoxWidth = 100.000000000000000000
    WordWrap = True
    Left = 192
    Top = 112
  end
end
