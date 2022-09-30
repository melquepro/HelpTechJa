unit uPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.MultiView, FMX.Objects, Data.DB, MemDS, DBAccess, Uni, FGX.ProgressDialog,
  System.Sensors, System.Sensors.Components, FMX.WebBrowser,
  System.Actions, FMX.ActnList, FMX.Controls.Presentation, FMX.Edit,
  FMX.AndroidLike.Toast;


type
  TFrmPrincipal = class(TForm)
    StyleBook1: TStyleBook;
    tlb1: TToolBar;
    QListaCliente: TUniQuery;
    DSListaCliente: TUniDataSource;
    Brush1: TBrushObject;
    fgActivityDialog1: TfgActivityDialog;
    MultiView1: TMultiView;
    BtnEntrarNovo: TSpeedButton;
    btn2: TSpeedButton;
    btn3: TSpeedButton;
    btn4: TSpeedButton;
    BtnConfig: TSpeedButton;
    Panel1: TPanel;
    ImgLogo: TImage;
    Label1: TLabel;
    Label2: TLabel;
    BtnBuscar: TSpeedButton;
    ActionList1: TActionList;
    Menu: TAction;
    BtnLogin: TSpeedButton;
    Panel2: TPanel;
    CFoto: TCircle;
    LbEmail: TLabel;
    LbNome: TLabel;
    Toast1: TToast;
    EdtCEP: TEdit;
    procedure BtnEntrarNovoClick(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure MenuExecute(Sender: TObject);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnLoginClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Listar;
  end;

var
  FrmPrincipal: TFrmPrincipal;
  Acao : String;
  logado : Boolean;
implementation

{$R *.fmx}

uses uSessao, uDM,uLocaLoja, uLogin, uCadCliente, uContaCliente, uEmpresa,
  uOpcao;


procedure TFrmPrincipal.Listar;
var
 ImgSalvar : TMemoryStream;
 BlobStream : TStream;

begin
QListaCliente.Close;
QListaCliente.SQL.Clear;
QListaCliente.SQL.Add('SELECT ID_CLIENTE,NOME,TELEFONE,EMAIL,FOTO FROM CLIENTE ORDER BY ID_CLIENTE,NOME,TELEFONE,EMAIL,FOTO');
QListaCliente.Open();
QListaCliente.First;
while QListaCliente.Eof do
begin
LbNome.Text := QListaCliente.FieldByName('NOME').AsString;
lbEmail.Text :=  QListaCliente.FieldByName('EMAIL').AsString;
QListaCliente.Next;
if QListaCliente.FieldByName('FOTO').AsString = null then
begin
BlobStream := QListaCliente.CreateBlobStream(QListaCliente.FieldByName('FOTO'),
   TBlobStreamMode.bmRead);
CFoto.Fill.Bitmap.Bitmap.LoadFromStream(BlobStream);
FrmContaCliente.Foto.Fill.Bitmap.Bitmap.LoadFromStream(BlobStream);
end
else
begin
Null;
end;
Null;
end;
end;





procedure TFrmPrincipal.MenuExecute(Sender: TObject);
begin
MultiView1.ShowMaster;
end;

procedure TFrmPrincipal.BtnEntrarNovoClick(Sender: TObject);
begin

FrmSessao.Show;
end;

procedure TFrmPrincipal.BtnLoginClick(Sender: TObject);
begin
FrmContaCliente.Show;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
LbEmail.Text := '';
LbNome.Text := '';
end;

procedure TFrmPrincipal.btn3Click(Sender: TObject);
begin
FrmLocaLoja.Show;
end;

procedure TFrmPrincipal.BtnBuscarClick(Sender: TObject);
begin
FrmLocaLoja.Show;
end;

end.
