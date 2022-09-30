unit uCadCliente;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit,  FMX.Objects, Data.DB, MemDS,
  DBAccess, Uni, FMX.AndroidLike.Toast, FGX.ProgressDialog, FMX.Styles.Objects,
  FMX.Layouts, FMX.ListBox;

type
  TFrmCadCliente = class(TForm)
    ToolBar1: TToolBar;
    BtnSair: TSpeedButton;
    Label1: TLabel;
    QCadCliente: TUniQuery;
    QCadClienteNOME: TStringField;
    QCadClienteSOBRENOME: TStringField;
    QCadClienteEMAIL: TStringField;
    QCadClienteSENHA: TStringField;
    QCadClienteFOTO: TBlobField;
    fgActivityDialog1: TfgActivityDialog;
    Label3: TLabel;
    Toast1: TToast;
    ListBox1: TListBox;
    EdtRepSenha: TEdit;
    Label4: TLabel;
    Label7: TLabel;
    EdtSenha: TEdit;
    EdtEmail: TEdit;
    Label2: TLabel;
    EdtFone: TEdit;
    Label6: TLabel;
    EdtNome: TEdit;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    procedure BtnSairClick(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure LimparEdits;

    procedure VerificarEdts;
    procedure GravarDados;
  public
    { Public declarations }
  end;

var
  FrmCadCliente: TFrmCadCliente;
  ID : Integer;
  login : Boolean;

implementation

{$R *.fmx}

uses uDM, uPrincipal, uSessao;

procedure TFrmCadCliente.Label3Click(Sender: TObject);
begin
FrmSessao.Show;
Close;
end;
procedure TFrmCadCliente.GravarDados;
begin
fgActivityDialog1.Show;
fgActivityDialog1.Message := '                                ';

QCadCliente.Active  := False;
QCadCliente.SQL.Clear;

QCadCliente.SQL.Add('INSERT INTO CLIENTE(NOME, TELEFONE, EMAIL, ' +
   'SENHA) VALUES (:NOME, :TELEFONE, :EMAIL, :SENHA)');

   QCadCliente.ParamByName('NOME').AsString := EdtNome.Text;
   QCadCliente.ParamByName('TELEFONE').AsString := EdtFone.Text;
   QCadCliente.ParamByName('EMAIL').AsString := EdtEmail.Text;
   QCadCliente.ParamByName('SENHA').AsString := EdtSenha.Text;
   dm.Transaction.StartTransaction;
 try
  Toast1.Now('Cadastrado com sucesso.');
  QCadCliente.ExecSQL;
  DM.Transaction.Commit;
  Toast1.Now('Cadastrado com sucesso.');
  Sleep(1000);
 fgActivityDialog1.Hide;
  LimparEdits;
  Close;
   except
   LimparEdits;
   fgActivityDialog1.Hide;
   DM.Transaction.Rollback;
   Toast1.Now('Ocorreu um erro ao cadastrar.');
   Close;
 end;
end;

procedure TFrmCadCliente.VerificarEdts;
begin

  if (EdtNome.Text)  = EmptyStr then
    Toast1.Now('Informe um nome')
     else
    if EdtFone.Text = EmptyStr then
     Toast1.Now('Informe um telefone')
    else
    if EdtEmail.Text = EmptyStr then
      Toast1.Now('Informe um email')
    else
   if EdtSenha.Text = EmptyStr then
        Toast1.Now('Informe uma senha')
        else
        GravarDados;
 end;

procedure TFrmCadCliente.LimparEdits;
begin
  EdtNome.Text := '';
  EdtFone.Text := '';
  EdtEmail.Text:= '';
  EdtSenha.Text := '';

end;

procedure TFrmCadCliente.SpeedButton1Click(Sender: TObject);
begin
VerificarEdts;
end;

procedure TFrmCadCliente.BtnSairClick(Sender: TObject);
begin
Close;
end;

end.
