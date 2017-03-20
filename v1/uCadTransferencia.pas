unit uCadTransferencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, DB, ADODB, StdCtrls,
  DBCtrls, ComCtrls, Mask, ExtCtrls, pngimage;

type
  TfrmCadTransferencia = class(TForm)
    shp5: TShape;
    lbl5: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl1: TLabel;
    dbnvgr3: TDBNavigator;
    dblkcbbID_Categoria: TDBLookupComboBox;
    edtVL_Receita_Despesa: TDBEdit;
    dtp1: TDateTimePicker;
    dbmmoObservacao: TDBMemo;
    qryTransferencia: TADOQuery;
    dsoTransferencia: TDataSource;
    qryConta: TADOQuery;
    qryContaID_Conta: TAutoIncField;
    qryContaNM_Conta: TStringField;
    qryContaVL_Saldo: TBCDField;
    dsoConta: TDataSource;
    lbl3: TLabel;
    dblkcbbID_Conta: TDBLookupComboBox;
    qryTransferenciaID_Transferencia: TAutoIncField;
    qryTransferenciaID_Conta_Origem: TIntegerField;
    qryTransferenciaID_Conta_Destino: TIntegerField;
    qryTransferenciaDT_Transferencia: TDateTimeField;
    qryTransferenciaVL_Transferencia: TBCDField;
    qryTransferenciaDescricao: TStringField;
    spTransferencia: TADOStoredProc;
    procedure FormShow(Sender: TObject);
    procedure qryTransferenciaBeforePost(DataSet: TDataSet);
    procedure qryTransferenciaAfterPost(DataSet: TDataSet);
    procedure qryTransferenciaAfterInsert(DataSet: TDataSet);
    procedure qryTransferenciaAfterCancel(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTransferencia: TfrmCadTransferencia;

implementation

uses
  uDataModule, uMain;

{$R *.dfm}

procedure TfrmCadTransferencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.qryConta.Requery();
  frmMain.qryTotal.Requery();
end;

procedure TfrmCadTransferencia.FormShow(Sender: TObject);
begin
  qryConta.Close;
  qryConta.Open;

  qryTransferencia.Close;
  qryTransferencia.Open;

  qryTransferencia.Insert;

  dtp1.Date := Now;

end;

procedure TfrmCadTransferencia.qryTransferenciaAfterCancel(DataSet: TDataSet);
begin
  Close;
end;

procedure TfrmCadTransferencia.qryTransferenciaAfterInsert(DataSet: TDataSet);
begin
  qryTransferenciaDescricao.AsString := '';
end;

procedure TfrmCadTransferencia.qryTransferenciaAfterPost(DataSet: TDataSet);
begin
  spTransferencia.Parameters.ParamByName('ID_Transferencia').Value := qryTransferenciaID_Transferencia.OldValue;
  spTransferencia.ExecProc;

  Msg.DlgInformation('Transferência efetuada com sucesso!');
  qryTransferencia.Insert;
end;

procedure TfrmCadTransferencia.qryTransferenciaBeforePost(DataSet: TDataSet);
begin
  qryTransferenciaDT_Transferencia.Value := dtp1.Date;
end;

end.
