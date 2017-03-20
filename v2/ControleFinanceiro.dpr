program ControleFinanceiro;

uses
  Forms,
  uLogin in 'uLogin.pas' {frmLogin},
  uMain in 'uMain.pas' {frmMain},
  Themes,
  uTelaCadastro in 'uTelaCadastro.pas' {frmTelaCadastro},
  uDataModule in 'uDataModule.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
//  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
