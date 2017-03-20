object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 171
  Width = 944
  object ADOConnection: TADOConnection
    ConnectionString = 'FILE NAME=C:\Arquivos de Projeto\Controle Financeiro\Conexao.udl'
    LoginPrompt = False
    Provider = 'C:\Arquivos de Projeto\Controle Financeiro\Conexao.udl'
    Left = 80
    Top = 40
  end
end
