object frmCadCategoria: TfrmCadCategoria
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'frmCadCategoria'
  ClientHeight = 328
  ClientWidth = 551
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object shp5: TShape
    Left = 0
    Top = 0
    Width = 551
    Height = 33
    Align = alTop
    Brush.Color = clSilver
    Pen.Color = clWhite
    Pen.Width = 2
    ExplicitLeft = 106
    ExplicitTop = 180
    ExplicitWidth = 822
  end
  object lbl1: TLabel
    Left = 16
    Top = 64
    Width = 38
    Height = 16
    Caption = 'Nome:'
    FocusControl = edtNMCategoria
  end
  object lbl5: TLabel
    Left = 6
    Top = 3
    Width = 914
    Height = 24
    AutoSize = False
    Caption = 'Nova Categoria'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -20
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtNMCategoria: TDBEdit
    Left = 16
    Top = 82
    Width = 521
    Height = 24
    DataField = 'NM_Categoria'
    DataSource = dsoCategoria
    TabOrder = 0
  end
  object dbrgrpID_Categoria: TDBRadioGroup
    Left = 16
    Top = 112
    Width = 521
    Height = 49
    Caption = 'Tipo:'
    Columns = 2
    DataField = 'ST_Categoria'
    DataSource = dsoCategoria
    Items.Strings = (
      'Receita'
      'Despesa')
    ParentBackground = True
    TabOrder = 1
    Values.Strings = (
      'R'
      'D')
  end
  object dbnvgr3: TDBNavigator
    Left = 376
    Top = 167
    Width = 160
    Height = 25
    DataSource = dsoCategoria
    VisibleButtons = [nbPost, nbCancel]
    Hints.Strings = (
      'First record'
      'Prior record'
      'Next record'
      'Last record'
      'Insert record'
      'Delete record'
      'Edit record'
      'Gravar'
      'Cancelar'
      'Refresh data'
      'Gravar'
      'Cancelar')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbgrd1: TDBGrid
    Left = 16
    Top = 197
    Width = 521
    Height = 121
    DataSource = dsoCategoria
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect]
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NM_Categoria'
        Title.Caption = 'Categoria'
        Width = 362
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Situacao'
        Title.Caption = 'Tipo'
        Width = 131
        Visible = True
      end>
  end
  object dbnvgr1: TDBNavigator
    Left = 75
    Top = 33
    Width = 160
    Height = 25
    DataSource = dsoCategoria
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Hints.Strings = (
      'Primeiro'
      'Anterior'
      'Pr'#243'ximo'
      #218'ltimo'
      'Insert record'
      'Delete record'
      'Edit record'
      'Post edit'
      'Cancel edit'
      'Refresh data'
      'Apply updates'
      'Cancel updates')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object dbnvgr2: TDBNavigator
    Left = 3
    Top = 33
    Width = 66
    Height = 25
    DataSource = dsoCategoria
    VisibleButtons = [nbInsert, nbDelete]
    Hints.Strings = (
      'First record'
      'Prior record'
      'Next record'
      'Last record'
      'Adicionar'
      'Excluir'
      'Edit record'
      'Post edit'
      'Cancel edit'
      'Refresh data'
      'Apply updates'
      'Cancel updates')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object qryCategoria: TADOQuery
    Connection = DM.ADOConnection
    CursorType = ctStatic
    OnCalcFields = qryCategoriaCalcFields
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      'SELECT ID_Categoria,'
      '       NM_Categoria,'
      'ST_Categoria'
      'FROM CATEGORIA')
    Left = 384
    Top = 48
    object qryCategoriaID_Categoria: TAutoIncField
      FieldName = 'ID_Categoria'
      ReadOnly = True
    end
    object qryCategoriaNM_Categoria: TStringField
      FieldName = 'NM_Categoria'
      Size = 100
    end
    object qryCategoriaST_Categoria: TStringField
      FieldName = 'ST_Categoria'
      FixedChar = True
      Size = 1
    end
    object qryCategoriaSituacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'Situacao'
      Size = 100
      Calculated = True
    end
  end
  object dsoCategoria: TDataSource
    DataSet = qryCategoria
    Left = 424
    Top = 48
  end
end
