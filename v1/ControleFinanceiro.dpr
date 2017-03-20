program ControleFinanceiro;

uses
  Forms,
  uMain in 'uMain.pas' {frmMain},
  uDataModule in 'uDataModule.pas' {DM: TDataModule},
  uCadCategoria in 'uCadCategoria.pas' {frmCadCategoria},
  uCadConta in 'uCadConta.pas' {frmCadConta},
  uCadReceitaDespesa in 'uCadReceitaDespesa.pas' {frmCadReceitaDespesa},
  uCadTransferencia in 'uCadTransferencia.pas' {frmCadTransferencia},
  uDescricao in 'uDescricao.pas' {frmDescricao},
  uDemostrativo in 'uDemostrativo.pas' {frmDemostrativo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmCadCategoria, frmCadCategoria);
  Application.CreateForm(TfrmCadConta, frmCadConta);
  Application.CreateForm(TfrmCadReceitaDespesa, frmCadReceitaDespesa);
  Application.CreateForm(TfrmCadTransferencia, frmCadTransferencia);
  Application.CreateForm(TfrmDescricao, frmDescricao);
  Application.CreateForm(TfrmDemostrativo, frmDemostrativo);
  Application.Run;
end.
