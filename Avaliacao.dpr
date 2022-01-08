program Avaliacao;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {Form1},
  Carro in 'Carro.pas',
  Cliente in 'Cliente.pas',
  Vendas in 'Vendas.pas',
  PersistenciaDb in 'PersistenciaDb.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
