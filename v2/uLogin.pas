unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, pngimage, ExtCtrls,
  StdCtrls;

type
  TfrmLogin = class(TForm)
    img1: TImage;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    img2: TImage;
    img3: TImage;
    lbl1: TLabel;
    lbl2: TLabel;
    pnlLogin: TPanel;
    pnlSair: TPanel;
    procedure pnlLoginClick(Sender: TObject);
    procedure pnlSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses uMain;

procedure TfrmLogin.pnlLoginClick(Sender: TObject);
begin
  frmMain.ShowModal();
end;

procedure TfrmLogin.pnlSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
