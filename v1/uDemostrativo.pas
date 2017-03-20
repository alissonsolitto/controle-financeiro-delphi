unit uDemostrativo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ExtCtrls, DB,
  ADODB, Grids, DBGrids, pngimage, StdCtrls, DateUtils,
  DBCtrls;

type
  TfrmDemostrativo = class(TForm)
    qryDemonstrativoReceita: TADOQuery;
    dsoDemonstrativoReceita: TDataSource;
    dbgrd1: TDBGrid;
    qryDemonstrativoReceitaROWID: TAutoIncField;
    qryDemonstrativoReceitaID_Categoria: TIntegerField;
    qryDemonstrativoReceitaNM_Categoria: TStringField;
    qryDemonstrativoReceitaJaneiro: TBCDField;
    qryDemonstrativoReceitaFevereiro: TBCDField;
    qryDemonstrativoReceitaMarco: TBCDField;
    qryDemonstrativoReceitaAbril: TBCDField;
    qryDemonstrativoReceitaMaio: TBCDField;
    qryDemonstrativoReceitaJunho: TBCDField;
    qryDemonstrativoReceitaJulho: TBCDField;
    qryDemonstrativoReceitaAgosto: TBCDField;
    qryDemonstrativoReceitaSetembro: TBCDField;
    qryDemonstrativoReceitaOutubro: TBCDField;
    qryDemonstrativoReceitaNovembro: TBCDField;
    qryDemonstrativoReceitaDezembro: TBCDField;
    spDemonstrativo: TADOStoredProc;
    qryDemonstrativoReceitaST_Lancamento: TStringField;
    img1: TImage;
    lbl1: TLabel;
    dbgrd2: TDBGrid;
    qryDemonstrativoDespesa: TADOQuery;
    dsoDemonstrativoDespesa: TDataSource;
    qryDemonstrativoDespesaROWID: TAutoIncField;
    qryDemonstrativoDespesaID_Categoria: TIntegerField;
    qryDemonstrativoDespesaST_Lancamento: TStringField;
    qryDemonstrativoDespesaNM_Categoria: TStringField;
    qryDemonstrativoDespesaJaneiro: TBCDField;
    qryDemonstrativoDespesaFevereiro: TBCDField;
    qryDemonstrativoDespesaMarco: TBCDField;
    qryDemonstrativoDespesaAbril: TBCDField;
    qryDemonstrativoDespesaMaio: TBCDField;
    qryDemonstrativoDespesaJunho: TBCDField;
    qryDemonstrativoDespesaJulho: TBCDField;
    qryDemonstrativoDespesaAgosto: TBCDField;
    qryDemonstrativoDespesaSetembro: TBCDField;
    qryDemonstrativoDespesaOutubro: TBCDField;
    qryDemonstrativoDespesaNovembro: TBCDField;
    qryDemonstrativoDespesaDezembro: TBCDField;
    lbl2: TLabel;
    pnl1: TPanel;
    shp3: TShape;
    lbl3: TLabel;
    pnl2: TPanel;
    shp1: TShape;
    lbl4: TLabel;
    pnl3: TPanel;
    shp2: TShape;
    lbl5: TLabel;
    qryTotal: TADOQuery;
    dsoTotal: TDataSource;
    qryTotalJaneiro: TFMTBCDField;
    qryTotalFevereiro: TFMTBCDField;
    qryTotalMarco: TFMTBCDField;
    qryTotalAbril: TFMTBCDField;
    qryTotalMaio: TFMTBCDField;
    qryTotalJunho: TFMTBCDField;
    qryTotalJulho: TFMTBCDField;
    qryTotalAgosto: TFMTBCDField;
    qryTotalSetembro: TFMTBCDField;
    qryTotalOutubro: TFMTBCDField;
    qryTotalNovembro: TFMTBCDField;
    qryTotalDezembro: TFMTBCDField;
    dbgrd3: TDBGrid;
    qryTotalVL_Saldo_Anual: TFMTBCDField;
    qryTotalVL_Saldo_Total: TFMTBCDField;
    pnl4: TPanel;
    shp4: TShape;
    dbtxtVL_Saldo_Total: TDBText;
    dbtxtVL_Saldo_Total1: TDBText;
    procedure FormShow(Sender: TObject);
    procedure dbgrd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrd2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrd3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDemostrativo: TfrmDemostrativo;

implementation

uses uDataModule;

{$R *.dfm}

procedure TfrmDemostrativo.dbgrd1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if(qryDemonstrativoReceitaID_Categoria.Value = 0) then
  begin
    dbgrd1.Canvas.Brush.Color:= clGreen;
    dbgrd1.Canvas.Font.Color := clWhite;
  end
  else
  begin
    if gdSelected in State then
    begin
      dbgrd1.Canvas.Brush.Color:= clBtnFace;
      dbgrd1.Canvas.Font.Color := clBlack;
    end;
  end;

  dbgrd1.Canvas.FillRect(Rect);
  dbgrd1.DefaultDrawDataCell(Rect, Column.Field, State);

end;

procedure TfrmDemostrativo.dbgrd2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if(qryDemonstrativoDespesaID_Categoria.Value = 0) then
  begin
    dbgrd2.Canvas.Brush.Color:= clRed;
    dbgrd2.Canvas.Font.Color := clWhite;
  end
  else
  begin
    if gdSelected in State then
    begin
      dbgrd2.Canvas.Brush.Color:= clBtnFace;
      dbgrd2.Canvas.Font.Color := clBlack;
    end;
  end;

  dbgrd2.Canvas.FillRect(Rect);
  dbgrd2.DefaultDrawDataCell(Rect, Column.Field, State);
end;

procedure TfrmDemostrativo.dbgrd3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if gdSelected in State then
  begin
    dbgrd3.Canvas.Brush.Color:= clBtnFace;
    dbgrd3.Canvas.Font.Color := clBlack;
  end;

  dbgrd3.Canvas.FillRect(Rect);
  dbgrd3.DefaultDrawDataCell(Rect, Column.Field, State);
end;

procedure TfrmDemostrativo.FormShow(Sender: TObject);
begin
  spDemonstrativo.Parameters.ParamByName('Ano').Value := YearOf(now);
  spDemonstrativo.ExecProc;

  qryDemonstrativoReceita.Close;
  qryDemonstrativoReceita.Open;

  dbgrd1.Height := 46 +((qryDemonstrativoReceita.RecordCount - 1) * 24);

  qryDemonstrativoDespesa.Close;
  qryDemonstrativoDespesa.Open;

  dbgrd2.Height := 46 +((qryDemonstrativoDespesa.RecordCount - 1) * 24);

  qryTotal.Close;
  qryTotal.Open;
end;

end.
