unit uTelaCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls, ImgList,
  ComCtrls, ToolWin, DBCtrls, Buttons, pngimage,
  Mask, DB, ADODB;

type
  TfrmTelaCadastro = class(TForm)
    shp1: TShape;
    imgMenu: TImageList;
    hcMenu: THeaderControl;
    pnl2: TPanel;
    btn1: TSpeedButton;
    btn2: TSpeedButton;
    pnl1: TPanel;
    imgInfo: TImage;
    lblInfo: TLabel;
    imgWarning: TImage;
    qryCadastro: TADOQuery;
    dsoCadastro: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
    modo: TDataSetState;
    param: string;
    valor: Variant;
  public
    { Public declarations }
    procedure modoQuery( modo: TDataSetState; param: string;  valor: Variant);

  end;

var
  frmTelaCadastro: TfrmTelaCadastro;

implementation

uses uDataModule;

{$R *.dfm}

procedure TfrmTelaCadastro.btn1Click(Sender: TObject);
begin
  try
    qryCadastro.Post;
    Msg.DlgInformation('Registro salvo com sucesso');
  except
    imgInfo.Visible    := False;
    imgWarning.Visible := True;
    lblInfo.Caption    := 'Ocorreu um erro ao salvar o registro.';
  end;
end;

procedure TfrmTelaCadastro.btn2Click(Sender: TObject);
begin
  if(Msg.DlgConfirmation('Deseja cancelar a operação atual?')) then
  begin
    qryCadastro.Close;
    Close;
  end;
end;

procedure TfrmTelaCadastro.FormShow(Sender: TObject);
begin
  imgWarning.Visible := False;
  qryCadastro.Close;

  if(modo = dsInsert)then
  begin
    qryCadastro.Open;
    qryCadastro.Insert;

    lblInfo.Caption := 'Cadastro em andamento...';
  end
  else if(modo = dsEdit) then
  begin
    qryCadastro.Parameters.ParamByName(param).Value := valor;
    qryCadastro.Open;
    qryCadastro.Edit;

    lblInfo.Caption := 'Edição em andamento...';
  end;
end;

procedure TfrmTelaCadastro.modoQuery(modo: TDataSetState; param: string;
  valor: Variant);
begin
  Self.modo  := modo;
  Self.param := param;
  Self.valor := valor;
end;

end.
