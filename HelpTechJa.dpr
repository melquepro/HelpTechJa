program HelpTechJa;

uses
  System.StartUpCopy,
  FMX.Forms,
  uCadCliente in 'uCadCliente.pas' {FrmCadCliente},
  uDM in 'uDM.pas' {DM: TDataModule},
  uLocaLoja in 'uLocaLoja.pas' {FrmLocaLoja},
  uLogin in 'uLogin.pas' {FrmLogin},
  uOpcao in 'uOpcao.pas' {FrmMenu},
  uPrincipal in 'uPrincipal.pas' {FrmPrincipal},
  uSessao in 'uSessao.pas' {FrmSessao},
  uEmpresa in 'uEmpresa.pas' {FrmEmpresa},
  uContaCliente in 'uContaCliente.pas' {FrmContaCliente};

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait, TFormOrientation.InvertedPortrait, TFormOrientation.Landscape, TFormOrientation.InvertedLandscape];
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmCadCliente, FrmCadCliente);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmLocaLoja, FrmLocaLoja);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TFrmMenu, FrmMenu);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmSessao, FrmSessao);
  Application.CreateForm(TFrmEmpresa, FrmEmpresa);
  Application.CreateForm(TFrmContaCliente, FrmContaCliente);
  Application.Run;
end.
