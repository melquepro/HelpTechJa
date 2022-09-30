unit uLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit,  FMX.Objects, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.DB, MemDS, DBAccess, Uni,
  FGX.ProgressDialog, FMX.AndroidLike.Toast;

type
  TFrmLogin = class(TForm)
    ToolBar1: TToolBar;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BtnIniciar: TButton;
    Label4: TLabel;
    qryLogin: TUniQuery;
    StatusBar1: TStatusBar;
    Label5: TLabel;
    fgActivityDialog1: TfgActivityDialog;
    Toast1: TToast;
    EdtEmail: TEdit;
    EdtSenha: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure BtnIniciarClick(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure StatusBar1Click(Sender: TObject);

     procedure StartSessao;  //Logar no sistema


  private
    { Private declarations }
    procedure VerificarEdts;
  public
    { Public declarations }

  end;

var
  FrmLogin: TFrmLogin;

  login : boolean;

implementation

{$R *.fmx}

uses uPrincipal, uDM, uCadCliente, uContaCliente, uEmpresa, uLocaLoja, uOpcao,
  uSessao;


 procedure TFrmLogin.VerificarEdts;
 begin
   if EdtEmail.Text = EmptyStr then
      Toast1.Now('Informe um email')
    else
   if EdtSenha.Text = EmptyStr then
        Toast1.Now('Informe uma senha')
        else
      ///
 end;
// Entrar no sistema
procedure TFrmLogin.StartSessao;
begin

  fgActivityDialog1.Show;
  VerificarEdts;

  Sleep(1000);
   fgActivityDialog1.Message := '';
qryLogin.Close;
qryLogin.SQL.Clear;
qryLogin.SQL.Add('SELECT * FROM CLIENTE WHERE LOGIN='+QuotedStr(EdtlGOIN.Text)+
   ' AND SENHA='+QuotedStr(EdtSenha.Text));
qryLogin.Open;

if qryLogin.Eof then
begin
    login := False;
    edtSenha.Text:='';
    EdtEmail.text:='';
    EdtEmail.SetFocus;
    Sleep(2000);
    fgActivityDialog1.Hide;
    Toast1.Now('Usuário ou Senha Inválida');
end
else
begin
  login:=true;
  fgActivityDialog1.Hide;
  FrmPrincipal. BtnEntrarNovo.Visible := False; // Deixar o Botao de ENtrar false;
  FrmPrincipal.BtnLogin.Visible := True;
  FrmPrincipal.BtnLogin.Align :=  TAlignLayout(4);


  FrmPrincipal.BtnLogin.Text := qryLogin.FieldByName('NOME').AsString;
  FrmPrincipal.LbNome.Text := qryLogin.FieldByName('NOME').AsString;
  FrmPrincipal.LbEmail.Text := qryLogin.FieldByName('EMAIL').AsString;
  FrmContaCliente.EdtEmail.Text := qryLogin.FieldByName('EMAIL').AsString;
  FrmContaCliente.EdFone.Text := qryLogin.FieldByName('TELEFONE').AsString;
  FrmContaCliente.EdNome.Text := qryLogin.FieldByName('NOME').AsString;
  FrmContaCliente.EdtID.Text  := IntToStr(qryLogin.FieldByName('ID_CLIENTE').AsInteger);
  FrmContaCliente.EdtNome.Text := qryLogin.FieldByName('NOME').AsString;
  FrmContaCliente.EdtFone.Text := qryLogin.FieldByName('TELEFONE').AsString;

    Toast1.Now('Logado com sucesso!');
    Sleep(2000);
    Close;
end;
end;


procedure TFrmLogin.StatusBar1Click(Sender: TObject);
begin
FrmCadCliente.Show;
end;

procedure TFrmLogin.BtnIniciarClick(Sender: TObject);
begin
StartSessao; // Entrar no sistema

end;



procedure TFrmLogin.Button1Click(Sender: TObject);
begin
Close;
end;

procedure TFrmLogin.Label5Click(Sender: TObject);
begin
FrmCadCliente.Show;
end;

end.
