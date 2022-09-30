unit uSessao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FGX.LinkedLabel, FMX.Controls.Presentation;

type
  TFrmSessao = class(TForm)
    ToolBar1: TToolBar;
    Button1: TButton;
    Label1: TLabel;
    BtnSessao: TButton;
    BtnCadastro: TButton;
    Label2: TLabel;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure BtnSessaoClick(Sender: TObject);
    procedure BtnCadastroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSessao: TFrmSessao;

implementation

{$R *.fmx}

uses uPrincipal, uLogin, uCadCliente;

procedure TFrmSessao.Button1Click(Sender: TObject);
begin
Close;
end;

procedure TFrmSessao.BtnCadastroClick(Sender: TObject);
begin
FrmCadCliente.Show;
Close;
end;

procedure TFrmSessao.BtnSessaoClick(Sender: TObject);
begin
FrmLogin.Show;
Close;
end;

end.
