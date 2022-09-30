unit uContaCliente;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Edit, FGX.ProgressDialog,
  FMX.AndroidLike.Toast, Data.DB, MemDS, DBAccess, Uni;

type
  TFrmContaCliente = class(TForm)
    ToolBar1: TToolBar;
    BtnClose: TSpeedButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Foto: TCircle;
    Label2: TLabel;
    EdtNome: TEdit;
    LbNome: TLabel;
    LbEmail: TLabel;
    EdtEmail: TEdit;
    LbFOne: TLabel;
    EdtFone: TEdit;
    BtnSair: TButton;
    BtnEditInfo: TSpeedButton;
    Rectangle1: TRectangle;
    PnEdit: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    EdNome: TEdit;
    EdFone: TEdit;
    BtnCancel: TSpeedButton;
    BtnSalvar: TSpeedButton;
    Toast1: TToast;
    fgActivityDialog1: TfgActivityDialog;
    QUpdate: TUniQuery;
    DSUpdate: TDataSource;
    EdtID: TEdit;
    UniQuery1: TUniQuery;
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnEditInfoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure ListarCliente;
  public
    { Public declarations }

  end;

var
  FrmContaCliente: TFrmContaCliente;
  ID : Integer;

implementation

{$R *.fmx}


uses uDM, uPrincipal, uCadCliente, uEmpresa, uLocaLoja, uLogin, uOpcao, uSessao;


procedure TFrmContaCliente.ListarCliente;
var
BlobStream : TStream;
begin
QUpdate.SQL.Add('SELECT NOME,TELEFONE,EMAIL,FOTO FROM CLIENTE WHERE NOME=:NOME');
QUpdate.Open();
QUpdate.First;
if QUpdate.RecordCount > 0 then
EdtNome.Text := QUpdate.FieldByName('NOME').AsString;
EdtFone.Text := QUpdate.FieldByName('TELEFONE').AsString;
//EdtID.Text   := IntToStr(QUpdate.FieldByName('ID_CLIENTE').AsInteger);
FrmPrincipal.LbNome.Text := QUpdate.FieldByName('NOME').AsString;
FrmPrincipal.lbEmail.Text :=  QUpdate.FieldByName('EMAIL').AsString;
FrmPrincipal.BtnLogin.Text := QUpdate.FieldByName('NOME').AsString;
QUpdate.Next;
if QUpdate.FieldByName('FOTO').AsString = null then
begin
BlobStream := QUpdate.CreateBlobStream(QUpdate.FieldByName('FOTO'),
   TBlobStreamMode.bmRead);
Foto.Fill.Bitmap.Bitmap.LoadFromStream(BlobStream);
end
else
begin
    Null;
  end;
  QUpdate.Close;
  QUpdate.Free;
end;


procedure TFrmContaCliente.BtnEditInfoClick(Sender: TObject);
begin

Rectangle1.Visible := True;
PnEdit.Visible := True;

end;

procedure TFrmContaCliente.BtnSairClick(Sender: TObject);
begin
if login = true then
begin
FrmPrincipal.LbNome.Text := '';
FrmPrincipal.LbEmail.Text := '';
FrmPrincipal.BtnLogin.Visible := False;
FrmPrincipal.BtnEntrarNovo.Visible := True;
Close;
end;
QUpdate.Close;
FrmPrincipal.QListaCliente.Close;

end;
procedure TFrmContaCliente.FormShow(Sender: TObject);
begin

PnEdit.Visible := False;



end;

procedure TFrmContaCliente.BtnCancelClick(Sender: TObject);
begin
PnEdit.Visible :=False;
Rectangle1.Visible := False;
end;

procedure TFrmContaCliente.BtnSalvarClick(Sender: TObject);
begin
try
  DM.Transaction.StartTransaction;
  QUpdate.Active := False;
  QUpdate.SQL.Clear;
  QUpdate.SQL.Add('UPDATE CLIENTE SET NOME = :NOME, TELEFONE = :TELEFONE WHERE ' +
    'ID_CLIENTE=:ID_CLIENTE');
  QUpdate.ParamByName('NOME').AsString := EdNome.Text;
  QUpdate.ParamByName('TELEFONE').AsString := EdFone.Text;
  QUpdate.ParamByName('ID_CLIENTE').AsInteger := StrToInt(EdtID.Text);
  QUpdate.ExecSQL;
  dm.Transaction.Commit;
  toast1.Now('Alterado com sucesso.');
    fgActivityDialog1.Hide;
PnEdit.Visible := False;
Rectangle1.Visible := false;
  except
  toast1.Now('Não foi possível fazer alterações.');
  fgActivityDialog1.Hide;
PnEdit.Visible := False;
Rectangle1.Visible := false;
end;
  fgActivityDialog1.Hide;
PnEdit.Visible := False;
Rectangle1.Visible := false;
QUpdate.close;
QUpdate.SQL.Clear;
QUpdate.SQL.Add('SELECT  NOME, TELEFONE, EMAIL, FOTO FROM CLIENTE ORDER BY NOME, TELEFONE,EMAIL,FOTO');
QUpdate.Open();
if QUpdate.RecordCount > 0 then
begin

  EdtNome.Text := QUpdate.FieldByName('NOME').AsString;
  EdtFone.Text := QUpdate.FieldByName('TELEFONE').AsString;
  FrmPrincipal.LbNome.Text := QUpdate.FieldByName('NOME').AsString;
  FrmPrincipal.lbEmail.Text := QUpdate.FieldByName('EMAIL').AsString;
  FrmPrincipal.BtnLogin.Text := QUpdate.FieldByName('NOME').AsString;
  QUpdate.Refresh;
  fgActivityDialog1.Hide;
PnEdit.Visible := False;
Rectangle1.Visible := false;
end;
  fgActivityDialog1.Hide;
PnEdit.Visible := False;
Rectangle1.Visible := false;
end;



{
QUpdate.SQL.Clear;
QUpdate.SQL.Add('UPDATE CLIENTE SET NOME = :NOME, TELEFONE = :TELEFONE WHERE ID_CLIENTE=:ID_CLIENTE');
QUpdate.ParamByName('NOME').AsString := EdNome.Text;
QUpdate.ParamByName('TELEFONE').AsString := EdFone.Text;
DM.Transaction.StartTransaction;
try
QUpdate.ParamByName('ID_CLIENTE').AsInteger := StrToInt(EdtID.Text);
QUpdate.ExecSQL;
dm.Transaction.Commit;
ListarCliente;
toast1.Now('Alterado com sucesso.');
fgActivityDialog1.Hide;
PnEdit.Visible := False;
Rectangle1.Visible := false;

except
  DM.Transaction.Rollback;
  toast1.Now('Não foi possível fazer alterações.');
  fgActivityDialog1.Hide;
PnEdit.Visible := False;
Rectangle1.Visible := false;
  dm.Transaction.Rollback;

   end;
   QUpdate.Refresh;
end;
}

procedure TFrmContaCliente.BtnCloseClick(Sender: TObject);
begin
Close;
end;


end.
