object frmCadReceitaDespesa: TfrmCadReceitaDespesa
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'frmCadReceitaDespesa'
  ClientHeight = 514
  ClientWidth = 558
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
    Width = 558
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
    Caption = 'Novo Lan'#231'amento'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -20
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl6: TLabel
    Left = 16
    Top = 43
    Width = 60
    Height = 16
    Caption = 'Descri'#231#227'o:'
    FocusControl = edtDescricao
  end
  object lbl7: TLabel
    Left = 16
    Top = 184
    Width = 35
    Height = 16
    Caption = 'Valor:'
    FocusControl = edtVL_Receita_Despesa
  end
  object lbl8: TLabel
    Left = 415
    Top = 184
    Width = 31
    Height = 16
    Caption = 'Data:'
  end
  object lbl9: TLabel
    Left = 16
    Top = 230
    Width = 72
    Height = 16
    Caption = 'Observa'#231#227'o:'
  end
  object lbl1: TLabel
    Left = 16
    Top = 89
    Width = 38
    Height = 16
    Caption = 'Conta:'
    FocusControl = edtDescricao
  end
  object lbl2: TLabel
    Left = 16
    Top = 136
    Width = 60
    Height = 16
    Caption = 'Categoria:'
    FocusControl = edtDescricao
  end
  object img2: TImage
    Left = 513
    Top = 106
    Width = 24
    Height = 24
    Cursor = crHandPoint
    AutoSize = True
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
      001808020000006F15AAAF0000009B4944415478DAD594410AC3201444F3CFA4
      6750F418BAF340EEF4188A9E41CF647F48285994D2D8DF92CCC285328F619081
      31C64221D8403146EF7DEFFD949931E69C33C6EC20A4586BA7B3841090B58238
      E79825A5A4943A85C8396BAD31576B6D050100DECE95F5F4DE1124A5C4B394F2
      2DE8C3D7BB80B0975AEB4BA710E2D8D7BF40D7EBE82720B20FF95E1707910D1B
      D9D42E54E33F9DE5A807422201E06A2030130000000049454E44AE426082}
    OnClick = img2Click
  end
  object img3: TImage
    Left = 513
    Top = 155
    Width = 24
    Height = 24
    Cursor = crHandPoint
    AutoSize = True
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
      001808020000006F15AAAF0000009B4944415478DAD594410AC3201444F3CFA4
      6750F418BAF340EEF4188A9E41CF647F48285994D2D8DF92CCC285328F619081
      31C64221D8403146EF7DEFFD949931E69C33C6EC20A4586BA7B3841090B58238
      E79825A5A4943A85C8396BAD31576B6D050100DECE95F5F4DE1124A5C4B394F2
      2DE8C3D7BB80B0975AEB4BA710E2D8D7BF40D7EBE82720B20FF95E1707910D1B
      D9D42E54E33F9DE5A807422201E06A2030130000000049454E44AE426082}
    OnClick = img3Click
  end
  object chk1: TCheckBox
    Left = 16
    Top = 349
    Width = 521
    Height = 17
    Caption = 'Lan'#231'amento repete por mais          mese(s)'
    TabOrder = 8
  end
  object dbnvgr3: TDBNavigator
    Left = 377
    Top = 372
    Width = 160
    Height = 25
    DataSource = dsoReceitaDespesa
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
    TabOrder = 6
  end
  object dblkcbbNM_Categoria: TDBLookupComboBox
    Left = 16
    Top = 155
    Width = 496
    Height = 24
    DataField = 'ID_Categoria'
    DataSource = dsoReceitaDespesa
    KeyField = 'ID_Categoria'
    ListField = 'NM_Categoria'
    ListSource = dsoCategoria
    TabOrder = 2
  end
  object dblkcbbID_Categoria: TDBLookupComboBox
    Left = 16
    Top = 106
    Width = 496
    Height = 24
    DataField = 'ID_Conta'
    DataSource = dsoReceitaDespesa
    KeyField = 'ID_Conta'
    ListField = 'NM_Conta'
    ListSource = dsoConta
    TabOrder = 1
  end
  object edtDescricao: TDBEdit
    Left = 16
    Top = 59
    Width = 521
    Height = 24
    DataField = 'Descricao'
    DataSource = dsoReceitaDespesa
    TabOrder = 0
  end
  object edtVL_Receita_Despesa: TDBEdit
    Left = 16
    Top = 200
    Width = 122
    Height = 24
    DataField = 'VL_Receita_Despesa'
    DataSource = dsoReceitaDespesa
    TabOrder = 3
  end
  object dtp1: TDateTimePicker
    Left = 415
    Top = 200
    Width = 122
    Height = 24
    Date = 42004.791978136570000000
    Time = 42004.791978136570000000
    TabOrder = 4
  end
  object dbmmoObservacao: TDBMemo
    Left = 16
    Top = 248
    Width = 521
    Height = 89
    DataField = 'Observacao'
    DataSource = dsoReceitaDespesa
    ScrollBars = ssVertical
    TabOrder = 5
  end
  object edt2: TEdit
    Left = 205
    Top = 345
    Width = 33
    Height = 24
    MaxLength = 3
    TabOrder = 7
    Text = '000'
  end
  object qryReceitaDespesa: TADOQuery
    Connection = DM.ADOConnection
    CursorType = ctStatic
    AfterInsert = qryReceitaDespesaAfterInsert
    BeforePost = qryReceitaDespesaBeforePost
    AfterPost = qryReceitaDespesaAfterPost
    AfterCancel = qryReceitaDespesaAfterCancel
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      'SELECT ID_Receita_Despesa,'
      'ID_Conta,'
      'ID_Categoria,'
      'ST_Lancamento,'
      'Descricao,'
      'VL_Receita_Despesa,'
      'DT_Receita_Despesa,'
      'Observacao'
      'FROM RECEITA_DESPESA')
    Left = 232
    Top = 376
    object qryReceitaDespesaID_Receita_Despesa: TAutoIncField
      FieldName = 'ID_Receita_Despesa'
      ReadOnly = True
    end
    object qryReceitaDespesaID_Conta: TIntegerField
      FieldName = 'ID_Conta'
    end
    object qryReceitaDespesaID_Categoria: TIntegerField
      FieldName = 'ID_Categoria'
    end
    object qryReceitaDespesaST_Lancamento: TStringField
      FieldName = 'ST_Lancamento'
      FixedChar = True
      Size = 1
    end
    object qryReceitaDespesaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 100
    end
    object qryReceitaDespesaVL_Receita_Despesa: TBCDField
      FieldName = 'VL_Receita_Despesa'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryReceitaDespesaObservacao: TStringField
      FieldName = 'Observacao'
      Size = 500
    end
    object qryReceitaDespesaDT_Receita_Despesa: TWideStringField
      FieldName = 'DT_Receita_Despesa'
      Size = 10
    end
  end
  object dsoReceitaDespesa: TDataSource
    DataSet = qryReceitaDespesa
    Left = 272
    Top = 376
  end
  object qryCategoria: TADOQuery
    Connection = DM.ADOConnection
    CursorType = ctStatic
    CommandTimeout = 0
    Parameters = <
      item
        Name = 'ST_Categoria'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT ID_Categoria,'
      '       NM_Categoria,'
      'ST_Categoria'
      'FROM CATEGORIA'
      'WHERE ST_Categoria = :ST_Categoria')
    Left = 120
    Top = 448
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
    Left = 160
    Top = 448
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
    Left = 24
    Top = 448
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
    Left = 64
    Top = 448
  end
  object spRepeteLancamento: TADOStoredProc
    Connection = DM.ADOConnection
    CommandTimeout = 0
    ProcedureName = 'st_LancaRD;1'
    Parameters = <
      item
        Name = 'ID_Receita_Despesa'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'NO_Lancamentos'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 314
    Top = 376
  end
end
