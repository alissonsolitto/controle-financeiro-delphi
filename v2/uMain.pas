unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ComCtrls, StdCtrls,
  pngimage, ExtCtrls, ImgList, Grids, DBGrids,
  Calendar, DB, ADODB;

type
  TfrmMain = class(TForm)
    hcMenu: THeaderControl;
    imgMenu: TImageList;
    hcSubMenu: THeaderControl;
    imgSubMenu: TImageList;
    pnl1: TPanel;
    shp1: TShape;
    lbl1: TLabel;
    dbgrd1: TDBGrid;
    shp2: TShape;
    shp3: TShape;
    lbl2: TLabel;
    dbgrd2: TDBGrid;
    shp4: TShape;
    pnl2: TPanel;
    lbl3: TLabel;
    pnl3: TPanel;
    lbl4: TLabel;
    shp5: TShape;
    lbl5: TLabel;
    shp6: TShape;
    imgResumoFin: TImageList;
    img2: TImage;
    img3: TImage;
    img4: TImage;
    img5: TImage;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    shp7: TShape;
    lbl10: TLabel;
    shp8: TShape;
    gdrAgenda: TStringGrid;
    lbl11: TLabel;
    HeaderControl1: THeaderControl;
    lv1: TListView;
    qry1: TADOQuery;
    ds1: TDataSource;
    qry1Descricao: TStringField;
    qry1VL_Receita_Despesa: TBCDField;
    qry1DT_Receita_Despesa: TWideStringField;
    procedure hcMenuSectionClick(HeaderControl: THeaderControl;
      Section: THeaderSection);
    procedure FormCreate(Sender: TObject);
    procedure gdrAgendaDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure gdrAgendaExit(Sender: TObject);
  private
    { Private declarations }
    procedure criaSubMenu(vetor: array of String);
  public
    { Public declarations }
    calAgenda: TCalendar;
  end;

var
  frmMain: TfrmMain;

  const
  ItensCadastro: array[0..2] of string = ('Usuários',
                                          'Categorias',
                                          'Contas');

  ItensLancamento: array[0..2] of string = ('Receita',
                                            'Despesa',
                                            'Transferência');

  ItensDemonstrativo: array[0..0] of string = ('Projeção');

implementation

{$R *.dfm}

uses uTelaCadastro, uDataModule;

procedure TfrmMain.criaSubMenu(vetor: array of String);
var
 i:Integer;
begin
  for i := 0 to Length(vetor) - 1 do
  begin
    hcSubMenu.Sections.Add;
    hcSubMenu.Sections.Items[i].Alignment  := taCenter;
    hcSubMenu.Sections.Items[i].Text       := vetor[i];
    hcSubMenu.Sections.Items[i].ImageIndex := 0;
    hcSubMenu.Sections.Items[i].Width      := 120;
    hcSubMenu.Sections.Items[i].FixedWidth := True;
  end;
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
  gdrAgenda.Selection := TGridRect(Rect(-1,-1,-1,-1));
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  i,j: Integer;
begin
  calAgenda := TCalendar.Create(Self);

  for i := 0 to 7 do
  begin
    for j := 1 to 7 do
    begin
      gdrAgenda.Cells[i,j] := calAgenda.CellText[i,j];
    end;
  end;
end;

procedure TfrmMain.gdrAgendaDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Bitmap: TBitmap;
begin
  Bitmap:= TBitmap.Create;

  //Selecionar o dia atual
  if(gdrAgenda.Cells[ACol, ARow] = IntToStr(calAgenda.Day)) then
    gdrAgenda.Canvas.Brush.Color := $00FFEFDF;

  gdrAgenda.Canvas.FillRect(Rect);

  //Define a imagem para cada dia
  if(gdrAgenda.Cells[ACol, ARow] = '13') then
  imgSubMenu.GetBitmap(2, Bitmap);

  if(gdrAgenda.Cells[ACol, ARow] = '26') then
    imgSubMenu.GetBitmap(1, Bitmap);

  if(gdrAgenda.Cells[ACol, ARow] = '10') then
  imgSubMenu.GetBitmap(3, Bitmap);


  gdrAgenda.Canvas.Draw(Rect.Left, Rect.Top ,Bitmap); //coloca em uma determina posicao
  gdrAgenda.Canvas.TextOut(Rect.Left + 30, Rect.Top + 20 , gdrAgenda.Cells[ACol,ARow]); //Alinha o texto ao centro

  Bitmap.Free;
end;

procedure TfrmMain.gdrAgendaExit(Sender: TObject);
begin
  gdrAgenda.Selection := TGridRect(Rect(-1,-1,-1,-1));
end;

procedure TfrmMain.hcMenuSectionClick(HeaderControl: THeaderControl;
  Section: THeaderSection);
begin
  hcSubMenu.Sections.Clear;

  if(Section.Text = 'Cadastros')then
  begin
    criaSubMenu(ItensCadastro);
  end
  else
  if(Section.Text = 'Lançamentos')then
  begin
    criaSubMenu(ItensLancamento);
  end
  else
  if(Section.Text = 'Demonstrativos')then
  begin
    criaSubMenu(ItensDemonstrativo);
  end;
end;

end.
