object frmCadTransferencia: TfrmCadTransferencia
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'frmCadTransferencia'
  ClientHeight = 345
  ClientWidth = 547
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
    Width = 547
    Height = 33
    Align = alTop
    Brush.Color = clSilver
    Pen.Color = clWhite
    Pen.Width = 2
    ExplicitTop = 67
    ExplicitWidth = 829
  end
  object lbl7: TLabel
    Left = 16
    Top = 136
    Width = 35
    Height = 16
    Caption = 'Valor:'
    FocusControl = edtVL_Receita_Despesa
  end
  object lbl8: TLabel
    Left = 390
    Top = 136
    Width = 31
    Height = 16
    Caption = 'Data:'
  end
  object lbl9: TLabel
    Left = 16
    Top = 182
    Width = 72
    Height = 16
    Caption = 'Observa'#231#227'o:'
  end
  object lbl1: TLabel
    Left = 16
    Top = 41
    Width = 80
    Height = 16
    Caption = 'Transferir de:'
  end
  object lbl5: TLabel
    Left = 5
    Top = 4
    Width = 542
    Height = 24
    AutoSize = False
    Caption = 'Transfer'#234'nia'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -20
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 16
    Top = 89
    Width = 31
    Height = 16
    Caption = 'Para:'
  end
  object dbnvgr3: TDBNavigator
    Left = 352
    Top = 299
    Width = 160
    Height = 25
    DataSource = dsoTransferencia
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
    TabOrder = 0
  end
  object dblkcbbID_Categoria: TDBLookupComboBox
    Left = 16
    Top = 58
    Width = 496
    Height = 24
    DataField = 'ID_Conta_Origem'
    DataSource = dsoTransferencia
    KeyField = 'ID_Conta'
    ListField = 'NM_Conta'
    ListSource = dsoConta
    TabOrder = 1
  end
  object edtVL_Receita_Despesa: TDBEdit
    Left = 16
    Top = 152
    Width = 122
    Height = 24
    DataField = 'VL_Transferencia'
    DataSource = dsoTransferencia
    TabOrder = 2
  end
  object dtp1: TDateTimePicker
    Left = 390
    Top = 152
    Width = 122
    Height = 24
    Date = 42004.791978136570000000
    Time = 42004.791978136570000000
    Enabled = False
    TabOrder = 3
  end
  object dbmmoObservacao: TDBMemo
    Left = 16
    Top = 204
    Width = 496
    Height = 89
    DataField = 'Descricao'
    DataSource = dsoTransferencia
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object dblkcbbID_Conta: TDBLookupComboBox
    Left = 16
    Top = 106
    Width = 496
    Height = 24
    DataField = 'ID_Conta_Destino'
    DataSource = dsoTransferencia
    KeyField = 'ID_Conta'
    ListField = 'NM_Conta'
    ListSource = dsoConta
    TabOrder = 5
  end
  object qryTransferencia: TADOQuery
    Connection = DM.ADOConnection
    CursorType = ctStatic
    AfterInsert = qryTransferenciaAfterInsert
    BeforePost = qryTransferenciaBeforePost
    AfterPost = qryTransferenciaAfterPost
    AfterCancel = qryTransferenciaAfterCancel
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      'SELECT ID_Transferencia,'
      'ID_Conta_Origem,'
      'ID_Conta_Destino,'
      'DT_Transferencia,'
      'VL_Transferencia,'
      'Descricao'
      'FROM TRANSFERENCIA')
    Left = 200
    Top = 303
    object qryTransferenciaID_Transferencia: TAutoIncField
      FieldName = 'ID_Transferencia'
      ReadOnly = True
    end
    object qryTransferenciaID_Conta_Origem: TIntegerField
      FieldName = 'ID_Conta_Origem'
    end
    object qryTransferenciaID_Conta_Destino: TIntegerField
      FieldName = 'ID_Conta_Destino'
    end
    object qryTransferenciaDT_Transferencia: TDateTimeField
      FieldName = 'DT_Transferencia'
    end
    object qryTransferenciaVL_Transferencia: TBCDField
      FieldName = 'VL_Transferencia'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryTransferenciaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 1000
    end
  end
  object dsoTransferencia: TDataSource
    DataSet = qryTransferencia
    Left = 232
    Top = 303
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
    Left = 104
    Top = 303
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
    Left = 144
    Top = 303
  end
  object spTransferencia: TADOStoredProc
    Connection = DM.ADOConnection
    CommandTimeout = 0
    ProcedureName = 'st_Transferencia;1'
    Parameters = <
      item
        Name = 'ID_Transferencia'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 274
    Top = 309
  end
end
