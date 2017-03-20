unit uCadConta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, Mask, DBCtrls,
  DB, ExtCtrls, ADODB, Grids, DBGrids;

type
  TfrmCadConta = class(TForm)
    qryConta: TADOQuery;
    dsoConta: TDataSource;
    lbl5: TLabel;
    shp5: TShape;
    dbnvgr1: TDBNavigator;
    dbnvgr2: TDBNavigator;
    dbnvgr3: TDBNavigator;
    qryContaID_Conta: TAutoIncField;
    qryContaNM_Conta: TStringField;
    qryContaVL_Saldo: TBCDField;
    lbl1: TLabel;
    edtNM_Conta: TDBEdit;
    lbl2: TLabel;
    edtVL_Saldo: TDBEdit;
    dbgrd1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadConta: TfrmCadConta;

implementation

{$R *.dfm}

uses uMain;

procedure TfrmCadConta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmMain.qryConta.Requery();
end;

procedure TfrmCadConta.FormShow(Sender: TObject);
begin
  qryConta.Close;
  qryConta.Open;
end;

end.
