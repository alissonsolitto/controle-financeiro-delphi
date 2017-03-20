unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ActnList,
  ImgList, ActnMan, ToolWin, ActnCtrls, Ribbon,
  RibbonLunaStyleActnCtrls, RibbonObsidianStyleActnCtrls,
  RibbonSilverStyleActnCtrls, ActnMenus, RibbonActnMenus,
  StdCtrls, CheckLst, ExtCtrls, Grids, DBGrids,
  pngimage, Buttons, TeEngine,
  Series, TeeProcs, Chart, DB, ADODB,
  DBCtrls, Calendar, DateUtils, Menus, DBChart;

type
  TfrmMain = class(TForm)
    Ribbon1: TRibbon;
    rbLancamentos: TRibbonPage;
    RibbonGroup1: TRibbonGroup;
    ActionManager: TActionManager;
    imgMenu: TImageList;
    actReceita: TAction;
    actDespesa: TAction;
    actTransferir: TAction;
    shp1: TShape;
    dbgrd1: TDBGrid;
    lblMes: TLabel;
    shp2: TShape;
    lbl2: TLabel;
    img1: TImage;
    shp3: TShape;
    lbl3: TLabel;
    img2: TImage;
    shp4: TShape;
    lblSaldoMes: TLabel;
    img3: TImage;
    img4: TImage;
    lbl5: TLabel;
    shp5: TShape;
    dbgrd3: TDBGrid;
    RibbonGroup8: TRibbonGroup;
    actCategoria: TAction;
    actContas: TAction;
    qryReceita: TADOQuery;
    qryReceitaID_Receita_Despesa: TAutoIncField;
    qryReceitaID_Conta: TIntegerField;
    qryReceitaID_Categoria: TIntegerField;
    qryReceitaST_Lancamento: TStringField;
    qryReceitaDescricao: TStringField;
    qryReceitaVL_Receita_Despesa: TBCDField;
    qryReceitaObservacao: TStringField;
    dsoReceita: TDataSource;
    dbgrd2: TDBGrid;
    qryDespesa: TADOQuery;
    AutoIncField1: TAutoIncField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    BCDField1: TBCDField;
    StringField3: TStringField;
    dsDespesa: TDataSource;
    RibbonGroup9: TRibbonGroup;
    qryConta: TADOQuery;
    qryContaID_Conta: TAutoIncField;
    qryContaNM_Conta: TStringField;
    qryContaVL_Saldo: TBCDField;
    dsoConta: TDataSource;
    shp7: TShape;
    lbl7: TLabel;
    dbtxtVL_Saldo_Total: TDBText;
    dsTotal: TDataSource;
    qryTotal: TADOQuery;
    qryTotalVL_Saldo_Total: TFMTBCDField;
    calendar: TCalendar;
    qrySaldoMes: TADOQuery;
    dsoSaldoMes: TDataSource;
    dbtxtVL_Saldo_Total1: TDBText;
    qrySaldoMesVL_Total_Mensal: TBCDField;
    spAtualizaSaldo: TADOStoredProc;
    actDemonstrativoFinan: TAction;
    actDReceita: TAction;
    actDDespesa: TAction;
    RibbonGroup4: TRibbonGroup;
    RibbonGroup6: TRibbonGroup;
    actDContas: TAction;
    actAtualizar: TAction;
    dsoGrafico: TDataSource;
    qryGrafico: TADOQuery;
    qryGraficoROWID: TAutoIncField;
    qryGraficoID_Categoria: TIntegerField;
    qryGraficoST_Lancamento: TStringField;
    qryGraficoNM_Categoria: TStringField;
    qryGraficoJaneiro: TBCDField;
    qryGraficoFevereiro: TBCDField;
    qryGraficoMarco: TBCDField;
    qryGraficoAbril: TBCDField;
    qryGraficoMaio: TBCDField;
    qryGraficoJunho: TBCDField;
    qryGraficoJulho: TBCDField;
    qryGraficoAgosto: TBCDField;
    qryGraficoSetembro: TBCDField;
    qryGraficoOutubro: TBCDField;
    qryGraficoNovembro: TBCDField;
    qryGraficoDezembro: TBCDField;
    dbcht1: TDBChart;
    Series1: TBarSeries;
    Series2: TBarSeries;
    qryReceitaDT_Receita_Despesa: TWideStringField;
    qryDespesaDT_Receita_Despesa: TWideStringField;
    procedure actReceitaExecute(Sender: TObject);
    procedure actDespesaExecute(Sender: TObject);
    procedure actTransferirExecute(Sender: TObject);
    procedure actCategoriaExecute(Sender: TObject);
    procedure actContasExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure img4Click(Sender: TObject);
    procedure img3Click(Sender: TObject);
    procedure actDReceitaExecute(Sender: TObject);
    procedure actDDespesaExecute(Sender: TObject);
    procedure actDemonstrativoFinanExecute(Sender: TObject);
    procedure actDContasExecute(Sender: TObject);
    procedure actAtualizarExecute(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaMes();
    function AjustaData(d,m,y: Integer): TDateTime;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses uDataModule, uCadCategoria, uCadConta, uCadReceitaDespesa,
  uCadTransferencia, uDescricao, uDemostrativo;

{$R *.dfm}

procedure TfrmMain.actReceitaExecute(Sender: TObject);
begin
  frmCadReceitaDespesa.ST_Lancamento := 'R';
  frmCadReceitaDespesa.ShowModal;
end;

procedure TfrmMain.actAtualizarExecute(Sender: TObject);
begin
  spAtualizaSaldo.Parameters.ParamByName('DT_Base').Value := Now;
  spAtualizaSaldo.ExecProc;

  AtualizaMes;

  Msg.DlgInformation('Lançamentos atualizados até ' + FormatDateTime('dd/mm/yyyy', now));
end;

procedure TfrmMain.actCategoriaExecute(Sender: TObject);
begin
  frmCadCategoria.ShowModal;
end;

procedure TfrmMain.actContasExecute(Sender: TObject);
begin
  frmCadConta.ShowModal;
end;

procedure TfrmMain.actDContasExecute(Sender: TObject);
begin
  ShowMessage('');
end;

procedure TfrmMain.actDDespesaExecute(Sender: TObject);
begin
  ShowMessage('');
end;

procedure TfrmMain.actDemonstrativoFinanExecute(Sender: TObject);
begin
  frmDemostrativo.ShowModal;
end;

procedure TfrmMain.actDespesaExecute(Sender: TObject);
begin
  frmCadReceitaDespesa.ST_Lancamento := 'D';
  frmCadReceitaDespesa.ShowModal;
end;

procedure TfrmMain.actDReceitaExecute(Sender: TObject);
begin
  ShowMessage('');
end;

procedure TfrmMain.actTransferirExecute(Sender: TObject);
begin
  frmCadTransferencia.ShowModal;
end;

function TfrmMain.AjustaData(d, m, y: Integer): TDateTime;
const
  mj: array[1..12] of Integer=(31,28,31,30,31,30,31,31,30,31,30,31);
var
add: Integer;
begin
  while(true) do
   begin
   y := y+(m-1) div 12;
   m := (m-1) mod 12 +1;
   if m <= 0 then
      begin
      Inc(m,12);
      Dec(y);
      end;
   if ((y mod 4 = 0) and ((y mod 100<>0) or (y mod 400=0))) and (m=2) then
      begin
      add :=1; //add one day in February
      end
   else
      begin
      add := 0;
      end;
   if (d > 0) and (d <=(mj[m]+add)) then
      begin
      break;
      end;
   if d > 0 then
      begin
      Dec(d,mj[m]+add); Inc(m);
      end
   else
      begin
      Inc(d,mj[m]+add); Dec(m);
      end;
   end;
  Result:=EncodeDate(y,m,d);
end;

procedure TfrmMain.AtualizaMes;
begin
  qryReceita.Close;
  qryReceita.Parameters.ParamByName('DT_I').Value := StartOfTheMonth(calendar.CalendarDate);
  qryReceita.Parameters.ParamByName('DT_F').Value := AjustaData(DayOf(EndOfTheMonth(calendar.CalendarDate)), MonthOf(EndOfTheMonth(calendar.CalendarDate)), YearOf(EndOfTheMonth(calendar.CalendarDate)));
  qryReceita.Open;

  qryDespesa.Close;
  qryDespesa.Parameters.ParamByName('DT_I').Value := StartOfTheMonth(calendar.CalendarDate);
  qryDespesa.Parameters.ParamByName('DT_F').Value := AjustaData(DayOf(EndOfTheMonth(calendar.CalendarDate)), MonthOf(EndOfTheMonth(calendar.CalendarDate)), YearOf(EndOfTheMonth(calendar.CalendarDate)));
  qryDespesa.Open;

  qrySaldoMes.Close;
  qrySaldoMes.Parameters.ParamByName('DT_I').Value := StartOfTheMonth(calendar.CalendarDate);
  qrySaldoMes.Parameters.ParamByName('DT_F').Value := AjustaData(DayOf(EndOfTheMonth(calendar.CalendarDate)), MonthOf(EndOfTheMonth(calendar.CalendarDate)), YearOf(EndOfTheMonth(calendar.CalendarDate)));
  qrySaldoMes.Open;

  qryConta.Close;
  qryconta.Open;

  qryTotal.Close;
  qryTotal.Open;

  lblMes.Caption := UpperCase(FormatDateTime('mmmm  yyyy', calendar.CalendarDate));
  lblSaldoMes.Caption := 'Saldo ' + FormatDateTime('mmmm: ', calendar.CalendarDate);

end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  spAtualizaSaldo.Parameters.ParamByName('DT_Base').Value := Now;
  spAtualizaSaldo.ExecProc;

  AtualizaMes;
end;

procedure TfrmMain.img3Click(Sender: TObject);
begin
  calendar.PrevMonth;

  AtualizaMes;
end;

procedure TfrmMain.img4Click(Sender: TObject);
begin
  calendar.NextMonth;

  AtualizaMes;
end;

end.
