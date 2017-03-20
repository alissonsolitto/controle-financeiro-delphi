unit uDataModule;

interface

uses
  SysUtils, Classes, Windows, Forms, DB,
  ADODB;

type
  TMsg = class
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DlgInformation(txt: String);
    procedure DlgWarning(txt: String);
    procedure DlgError(txt: String);
    function  DlgConfirmation(txt: String): Boolean;
  end;

type
  TDM = class(TDataModule)
    ADOConnection: TADOConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ConectaBD();

  public
    { Public declarations }
  end;

var
  DM: TDM;
  Msg: TMsg;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ Msg }

function TMsg.DlgConfirmation(txt: String): Boolean;
begin
  case Application.MessageBox(PChar(txt), 'Controle Financeiro', MB_YESNO + MB_ICONQUESTION) of
    IDYES: Result := true;
    IDNO:  Result := false;
  end;
end;

procedure TMsg.DlgError(txt: String);
begin
  Application.MessageBox(PChar(txt), 'Controle Financeiro', MB_OK + MB_ICONSTOP);
end;

procedure TMsg.DlgInformation(txt: String);
begin
  Application.MessageBox(PChar(txt), 'Controle Financeiro', MB_OK + MB_ICONINFORMATION);
end;

procedure TMsg.DlgWarning(txt: String);
begin
  Application.MessageBox(PChar(txt), 'Controle Financeiro', MB_OK + MB_ICONWARNING);
end;

{ TDM }

procedure TDM.ConectaBD;
begin
  try
    ADOConnection.Connected := False;
    ADOConnection.ConnectionString := 'File Name=' + ExtractFilePath( Application.ExeName ) + 'Conexao.udl';
    ADOConnection.Connected := True;
  except
    Msg.DlgError('Base de dados não encontrada. O sistema será encerrado.');
    Application.Terminate;
  end;

end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  ConectaBD;
end;

end.
