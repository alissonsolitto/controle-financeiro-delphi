object frmCadConta: TfrmCadConta
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'frmCadConta'
  ClientHeight = 326
  ClientWidth = 545
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object shp5: TShape
    Left = 0
    Top = 0
    Width = 545
    Height = 33
    Align = alTop
    Brush.Color = clSilver
    Pen.Color = clWhite
    Pen.Width = 2
    ExplicitLeft = 106
    ExplicitTop = 180
    ExplicitWidth = 822
  end
  object lbl5: TLabel
    Left = 6
    Top = 3
    Width = 914
    Height = 24
    AutoSize = False
    Caption = 'Nova Conta'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -20
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl1: TLabel
    Left = 16
    Top = 64
    Width = 75
    Height = 16
    Caption = 'Nome Conta:'
    FocusControl = edtNM_Conta
  end
  object lbl2: TLabel
    Left = 16
    Top = 112
    Width = 37
    Height = 16
    Caption = 'Saldo:'
    FocusControl = edtVL_Saldo
  end
  object dbnvgr1: TDBNavigator
    Left = 75
    Top = 33
    Width = 160
    Height = 25
    DataSource = dsoConta
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
    TabOrder = 0
  end
  object dbnvgr2: TDBNavigator
    Left = 3
    Top = 33
    Width = 66
    Height = 25
    DataSource = dsoConta
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
    TabOrder = 1
  end
  object dbnvgr3: TDBNavigator
    Left = 377
    Top = 158
    Width = 160
    Height = 25
    DataSource = dsoConta
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
  object edtNM_Conta: TDBEdit
    Left = 16
    Top = 80
    Width = 521
    Height = 24
    DataField = 'NM_Conta'
    DataSource = dsoConta
    TabOrder = 3
  end
  object edtVL_Saldo: TDBEdit
    Left = 16
    Top = 128
    Width = 113
    Height = 24
    DataField = 'VL_Saldo'
    DataSource = dsoConta
    TabOrder = 4
  end
  object dbgrd1: TDBGrid
    Left = 16
    Top = 197
    Width = 521
    Height = 121
    DataSource = dsoConta
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect]
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NM_Conta'
        Title.Caption = 'Conta'
        Width = 362
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_Saldo'
        Title.Caption = 'Saldo'
        Width = 131
        Visible = True
      end>
  end
  object qryConta: TADOQuery
    Connection = DM.ADOConnection
    CursorType = ctStatic
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      'SELECT ID_Conta,'
      'NM_Conta,'
      'VL_Saldo'
      'FROM CONTA')
    Left = 256
    Top = 136
    object qryContaID_Conta: TAutoIncField
      FieldName = 'ID_Conta'
      ReadOnly = True
    end
    object qryContaNM_Conta: TStringField
      FieldName = 'NM_Conta'
      Size = 100
    end
    object qryContaVL_Saldo: TBCDField
      Alignment = taLeftJustify
      FieldName = 'VL_Saldo'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object dsoConta: TDataSource
    DataSet = qryConta
    Left = 296
    Top = 136
  end
end
