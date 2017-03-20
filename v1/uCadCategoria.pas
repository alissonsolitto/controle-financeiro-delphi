unit uCadCategoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, DB, ADODB, StdCtrls,
  ExtCtrls, DBCtrls, Mask, Grids, DBGrids;

type
  TfrmCadCategoria = class(TForm)
    qryCategoria: TADOQuery;
    qryCategoriaID_Categoria: TAutoIncField;
    qryCategoriaNM_Categoria: TStringField;
    lbl1: TLabel;
    edtNMCategoria: TDBEdit;
    dsoCategoria: TDataSource;
    lbl5: TLabel;
    shp5: TShape;
    qryCategoriaST_Categoria: TStringField;
    dbrgrpID_Categoria: TDBRadioGroup;
    dbnvgr3: TDBNavigator;
    dbgrd1: TDBGrid;
    qryCategoriaSituacao: TStringField;
    dbnvgr1: TDBNavigator;
    dbnvgr2: TDBNavigator;
    procedure qryCategoriaCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCategoria: TfrmCadCategoria;

implementation

uses uDataModule;

{$R *.dfm}

procedure TfrmCadCategoria.FormShow(Sender: TObject);
begin
  qryCategoria.Close;
  qryCategoria.Open;
end;

procedure TfrmCadCategoria.qryCategoriaCalcFields(DataSet: TDataSet);
begin
  if(qryCategoriaST_Categoria.AsString = 'R') then
    qryCategoriaSituacao.AsString := 'Receita'
  else
    qryCategoriaSituacao.AsString := 'Despesa';

end;

end.
