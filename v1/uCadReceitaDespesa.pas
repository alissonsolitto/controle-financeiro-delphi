unit uCadReceitaDespesa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ExtCtrls, DBCtrls, StdCtrls,
  DB, ADODB, ComCtrls, Mask, Buttons,
  pngimage;

type
  TfrmCadReceitaDespesa = class(TForm)
    qryReceitaDespesa: TADOQuery;
    dsoReceitaDespesa: TDataSource;
    lbl5: TLabel;
    shp5: TShape;
    dbnvgr3: TDBNavigator;
    dblkcbbNM_Categoria: TDBLookupComboBox;
    qryCategoria: TADOQuery;
    qryCategoriaID_Categoria: TAutoIncField;
    qryCategoriaNM_Categoria: TStringField;
    qryCategoriaST_Categoria: TStringField;
    qryCategoriaSituacao: TStringField;
    dsoCategoria: TDataSource;
    qryReceitaDespesaID_Receita_Despesa: TAutoIncField;
    qryReceitaDespesaID_Conta: TIntegerField;
    qryReceitaDespesaID_Categoria: TIntegerField;
    qryReceitaDespesaST_Lancamento: TStringField;
    qryReceitaDespesaDescricao: TStringField;
    qryReceitaDespesaVL_Receita_Despesa: TBCDField;
    qryReceitaDespesaObservacao: TStringField;
    dblkcbbID_Categoria: TDBLookupComboBox;
    qryConta: TADOQuery;
    qryContaID_Conta: TAutoIncField;
    qryContaNM_Conta: TStringField;
    qryContaVL_Saldo: TBCDField;
    dsoConta: TDataSource;
    lbl6: TLabel;
    edtDescricao: TDBEdit;
    lbl7: TLabel;
    edtVL_Receita_Despesa: TDBEdit;
    lbl8: TLabel;
    lbl9: TLabel;
    dtp1: TDateTimePicker;
    lbl1: TLabel;
    lbl2: TLabel;
    dbmmoObservacao: TDBMemo;
    img2: TImage;
    img3: TImage;
    edt2: TEdit;
    chk1: TCheckBox;
    spRepeteLancamento: TADOStoredProc;
    qryReceitaDespesaDT_Receita_Despesa: TWideStringField;
    procedure qryReceitaDespesaAfterInsert(DataSet: TDataSet);
    procedure img3Click(Sender: TObject);
    procedure img2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryReceitaDespesaBeforePost(DataSet: TDataSet);
    procedure qryReceitaDespesaAfterPost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryReceitaDespesaAfterCancel(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    ST_Lancamento: string;
  end;

var
  frmCadReceitaDespesa: TfrmCadReceitaDespesa;

implementation


{$R *.dfm}

uses uCadConta, uCadCategoria, uDataModule, uMain;

procedure TfrmCadReceitaDespesa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.qryReceita.Requery();
  frmMain.qryDespesa.Requery();
  frmMain.qrySaldoMes.Requery();
end;

procedure TfrmCadReceitaDespesa.FormShow(Sender: TObject);
begin
  qryConta.Close;
  qryConta.Open;

  qryCategoria.Close;
  qryCategoria.Parameters.ParamByName('ST_Categoria').Value := ST_Lancamento;
  qryCategoria.Open;

  qryReceitaDespesa.Close;
  qryReceitaDespesa.Open;

  dtp1.Date := Now;

  qryReceitaDespesa.Insert;
end;

procedure TfrmCadReceitaDespesa.img2Click(Sender: TObject);
begin
  frmCadConta.ShowModal;

  qryConta.Close;
  qryConta.Open;
end;

procedure TfrmCadReceitaDespesa.img3Click(Sender: TObject);
begin
  frmCadCategoria.ShowModal;

  qryCategoria.Close;
  qryCategoria.Parameters.ParamByName('ST_Categoria').Value := ST_Lancamento;
  qryCategoria.Open;
end;

procedure TfrmCadReceitaDespesa.qryReceitaDespesaAfterCancel(DataSet: TDataSet);
begin
  Close;
end;

procedure TfrmCadReceitaDespesa.qryReceitaDespesaAfterInsert(DataSet: TDataSet);
begin
  qryReceitaDespesaST_Lancamento.AsString := ST_Lancamento;
  qryReceitaDespesaObservacao.AsString    := '';
end;

procedure TfrmCadReceitaDespesa.qryReceitaDespesaAfterPost(DataSet: TDataSet);
begin
  if(chk1.Checked) then
  begin
    spRepeteLancamento.Parameters.ParamByName('NO_Lancamentos').Value      := StrToInt(edt2.Text);
    spRepeteLancamento.Parameters.ParamByName('ID_Receita_Despesa').Value := qryReceitaDespesaID_Receita_Despesa.OldValue;
    spRepeteLancamento.ExecProc;
  end;

  qryReceitaDespesa.Insert;
  Msg.DlgInformation('Lançamento efetuado com sucesso!');
end;

procedure TfrmCadReceitaDespesa.qryReceitaDespesaBeforePost(DataSet: TDataSet);
begin
  qryReceitaDespesaDT_Receita_Despesa.Value := FormatDateTime('yyyy-mm-dd', dtp1.Date);
end;

end.
