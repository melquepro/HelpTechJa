unit uLocaLoja;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit,  FMX.Objects,
  FMX.ListView.Types, MultiDetailAppearanceU, FMX.ListView, Data.DB, MemDS,
  DBAccess, Uni, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope, FMX.ListBox, FMX.Layouts,
  FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base;

type
  TFrmLocaLoja = class(TForm)
    Label2: TLabel;
    ToolBar1: TToolBar;
    BtnMenu: TButton;
    ImgLogo: TImage;
    TbPesquisa: TToolBar;
    BtnClose: TSpeedButton;
    EdtBuscar: TEdit;
    BtnPesquisa: TSpeedButton;
    ListLoja: TListView;
    UniQuery1: TUniQuery;
    UniQuery1ID_EMPRESA: TLongWordField;
    UniQuery1NOME: TStringField;
    UniQuery1ENDERECO: TStringField;
    UniQuery1NUMERO: TStringField;
    UniQuery1BAIRRO: TStringField;
    UniQuery1CEP: TStringField;
    UniQuery1FOTO: TBlobField;
    BindingsList1: TBindingsList;
    procedure BtnMenuClick(Sender: TObject);
    procedure TbPesquisaClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnPesquisaClick(Sender: TObject);
    procedure ListLojaItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

  private
    { Private declarations}
     Acao : String;
     ID : Integer;

  end;

var
  FrmLocaLoja: TFrmLocaLoja;

implementation

{$R *.fmx}

uses uPrincipal, uDM;


procedure TFrmLocaLoja.BtnCloseClick(Sender: TObject);
begin
TbPesquisa.Visible := False;
ToolBar1.Visible := True;
end;

procedure TFrmLocaLoja.BtnMenuClick(Sender: TObject);
begin
FrmPrincipal.MultiView1.ShowMaster;
end;

procedure TFrmLocaLoja.BtnPesquisaClick(Sender: TObject);
begin
ToolBar1.Visible := False;
TbPesquisa.Visible := True;
EdtBuscar.SetFocus;
end;

procedure TFrmLocaLoja.FormShow(Sender: TObject);
begin
//ListarLoja;
end;

procedure TFrmLocaLoja.ListLojaItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemObject);
var
QCarregar : TUniQuery;
BlobStream : TStream;
begin
  QCarregar := TUniQuery.Create(nil);
    QCarregar.Connection := DM.Banco;
    QCarregar.SQL.Clear;


if LocalClickPos.X >= TListView(Sender).Width -65 then
begin
   QCarregar.SQL.Add('SELECT * FROM EMPRESA WHERE ID_EMPRESA=:ID_EMPRESA');

QCarregar.ParamByName('ID_EMPRESA').AsInteger := StrToIntDef(ListLoja.Items[
   ItemIndex].Detail,0);

QCarregar.Open();

if QCarregar.RecordCount > 0 then
begin

ID :=  QCarregar.FieldByName('ID_EMPRESA').AsInteger;
    {
FrmCadDoenca.EdtNome.Text := QCarregar.FieldByName('NOME').AsString;
FrmCadDoenca.EdtNomeCientifico.Text := QCarregar.FieldByName('NOME_CIENTIFICO').AsString;
FrmCadDoenca.MDescricao.Lines.Text := QCarregar.FieldByName('DESCRICAO').AsString;
     FrmCadDoenca.EdtSintoma.Text := QCarregar.FieldByName('SINTOMA').AsString;
       FrmCadDoenca.EdtTratamento.Text := QCarregar.FieldByName('TRATAMENTO').AsString;
      // FrmCadDoenca.EdtDataCad.Text := QCarregar.FieldByName('DATA_CAD').AsString;
FrmCadDoenca.EdtAtivo.IsChecked := QCarregar.FieldByName('ATIVO').AsBoolean;

BlobStream := QCarregar.CreateBlobStream(QCarregar.FieldByName('FOTO_PRINCIPAL'),TBlobStreamMode.bmRead);

FrmCadDoenca.Foto.Bitmap.LoadFromStream(BlobStream);
}
 end;


  QCarregar.Close;
  QCarregar.Free;
end;
end;

procedure TFrmLocaLoja.TbPesquisaClick(Sender: TObject);
begin
TbPesquisa.Visible := False;
ToolBar1.Visible := True;
end;

end.


uses uPrincipal;


uses uPrincipal;


uses uDM;


uses uDM;
