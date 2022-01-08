unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.PG, FireDAC.Phys.PGDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.UI,
  Carro,Cliente,Vendas, PersistenciaDb;

type
  TForm1 = class(TForm)
    Conexao: TFDConnection;
    DBGrid1: TDBGrid;
    DS: TDataSource;
    BtnCadastroCarro: TButton;
    BtnVendas: TButton;
    BtnCadastroCliente: TButton;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    lblTabela: TLabel;
    procedure BtnCadastroCarroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnCadastroClienteClick(Sender: TObject);
    procedure BtnVendasClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    FCarro: TCarro;
    FCliente: TCliente;
    FVendas: TVendas;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BtnCadastroCarroClick(Sender: TObject);
begin
  lblTabela.Caption := 'Carros';
  if FCarro.DataSet.RecordCount = 0 then
  begin
    FCarro.Codigo := 1;
    FCarro.Modelo := 'Marea';
    FCarro.DataLancamento := StrToDate('07/01/2021');
    FCarro.InserirDadosBD;

    FCarro.Codigo := 2;
    FCarro.Modelo := 'Uno';
    FCarro.DataLancamento := StrToDate('07/01/2021');
    FCarro.InserirDadosBD;

    FCarro.Codigo := 3;
    FCarro.Modelo := 'Gol';
    FCarro.DataLancamento := StrToDate('07/01/2021');
    FCarro.InserirDadosBD;

    FCarro.Codigo := 4;
    FCarro.Modelo := 'Palio';
    FCarro.DataLancamento := StrToDate('07/01/2021');
    FCarro.InserirDadosBD;

    FCarro.Codigo := 5;
    FCarro.Modelo := 'Golf';
    FCarro.DataLancamento := StrToDate('07/01/2021');
    FCarro.InserirDadosBD;
  end;
  FCarro.ExecutarSql;
  DS.DataSet := FCarro.DataSet;
end;

procedure TForm1.BtnCadastroClienteClick(Sender: TObject);
begin
  lblTabela.Caption := 'Clientes';
  if FCliente.DataSet.RecordCount = 0 then
  begin
    FCliente.Codigo := 1;
    FCliente.Cpf := '012.256.885-42';
    FCliente.InserirDadosBD;

    FCliente.Codigo := 2;
    FCliente.Cpf := '022.566.156-10';
    FCliente.InserirDadosBD;

    FCliente.Codigo := 3;
    FCliente.Cpf := '023.444.789-22';
    FCliente.InserirDadosBD;

    FCliente.Codigo := 4;
    FCliente.Cpf := '001.785.347-44';
    FCliente.InserirDadosBD;

    FCliente.Codigo := 5;
    FCliente.Cpf := '089.241.625-40';
    FCliente.InserirDadosBD;
  end;
  FCliente.ExecutarSql;
  DS.DataSet := FCliente.DataSet;
end;

procedure TForm1.BtnVendasClick(Sender: TObject);
begin
  lblTabela.Caption := 'Vendas';
  if FVendas.DataSet.RecordCount = 0 then
  begin
    FVendas.Codigo := 1;
    FVendas.CodigoCliente := 1;
    FVendas.CodigoCarro := 1;
    FVendas.InserirDadosBD;

    FVendas.Codigo := 2;
    FVendas.CodigoCliente := 2;
    FVendas.CodigoCarro := 2;
    FVendas.InserirDadosBD;

    FVendas.Codigo := 3;
    FVendas.CodigoCliente := 3;
    FVendas.CodigoCarro := 3;
    FVendas.InserirDadosBD;

    FVendas.Codigo := 4;
    FVendas.CodigoCliente := 4;
    FVendas.CodigoCarro := 4;
    FVendas.InserirDadosBD;

    FVendas.Codigo := 5;
    FVendas.CodigoCliente := 5;
    FVendas.CodigoCarro := 5;
    FVendas.InserirDadosBD;
  end;
  FVendas.ExecutarSql;
  DS.DataSet := FVendas.DataSet;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FCarro := TCarro.Create(Conexao);
  FCliente := TCliente.Create(Conexao);
  FVendas := TVendas.Create(Conexao);

  FVendas.ApagarDadosDb;
  FCliente.ApagarDadosDb;
  FCarro.ApagarDadosDb;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FCarro.Destroy;
  FCliente.Destroy;
  FVendas.Destroy;
end;

end.
