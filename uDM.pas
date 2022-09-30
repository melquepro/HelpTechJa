unit uDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, DBAccess, Uni, MemDS, UniProvider,
  MySQLUniProvider, SQLiteUniProvider, FMX.Types, FMX.AndroidLike.Toast;

type
  TDM = class(TDataModule)
    Transaction: TUniTransaction;
    MySQLUniProvider1: TMySQLUniProvider;
    Banco: TUniConnection;
    Toast1: TToast;
    procedure BancoBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

uses  System.IOUtils, uPrincipal;

procedure TDM.BancoBeforeConnect(Sender: TObject);
begin

try
dm.Banco.Connected := True;
except

  end;
end;

end.
