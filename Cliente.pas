unit Cliente;

interface

uses
   PersistenciaDb, FireDAC.Comp.Client, Data.DB, FireDac.Stan.Param,SysUtils;


type
  TCliente = Class(TInterfacedObject, IPersistenciaDb)
  private
  const
    {$REGION 'CONSULTA'}
    CONSULTA = 'SELECT        '+
               ' CODIGO,      '+
               ' CPF          '+
               'FROM CLIENTE  ';
    {$ENDREGION 'CONSULTA'}
    {$REGION 'SQL_INSERT'}
    SQL_INSERT = 'INSERT INTO CLIENTE '+
                 '(CODIGO,CPF) '+
                 ' VALUES '+
                 '(:CODIGO,:CPF) ';
    {$ENDREGION 'SQL_INSERT'}

    {$REGION 'SQL_DELETE'}
    SQL_DELETE = 'DELETE FROM CLIENTE';
    {$ENDREGION 'SQL_DELETE'}

  var
    FCodigo: Integer;
    FCpf: String;
    FDQuery: TfdQuery;
    procedure setCodigo(const Avalue: Integer);
    procedure setCpf(const Avalue: String);
  public
    Constructor Create(AConexao: TfdConnection);
    destructor Destroy;override;
    function DataSet: TDataSet;
    property Codigo: Integer Read FCodigo Write setCodigo;
    property Cpf: String Read FCpf Write setCpf;
    procedure ExecutarSql;
    procedure InserirDadosBD;
    procedure ApagarDadosDb;

  end;

implementation

procedure TCliente.setCodigo(const Avalue: Integer);
begin
  FCodigo := Avalue;
end;

procedure TCliente.setCpf(const Avalue: String);
begin
  FCpf := Avalue;
end;

procedure TCliente.ExecutarSql;
begin
 FDQuery.Close;
 FDQuery.SQL.Clear;
 FDQuery.SQL.Add(CONSULTA);
 FDQuery.Open;
end;

function TCliente.DataSet: TDataSet;
begin
  Result := FDQuery;
end;

procedure TCliente.InserirDadosBD;
begin
  FDQuery.Close;
  FDQuery.SQL.Clear;
  FDQuery.SQL.Add(SQL_INSERT);
  FDQuery.ParamByName('CODIGO').AsInteger := FCodigo;
  FDQuery.ParamByName('CPF').AsString := FCpf;
  FDQuery.ExecSQL;
end;

constructor TCliente.Create(AConexao: TfdConnection);
begin
  FDQuery := TFDQuery.Create(nil);
  FDQuery.Connection := AConexao;
end;

destructor TCliente.Destroy;
begin
  FDQuery.Close;
  FreeAndNil(FDQuery);
  inherited;
end;

procedure TCliente.ApagarDadosDb;
begin
 FDQuery.Close;
 FDQuery.SQL.Clear;
 FDQuery.SQL.Add(SQL_DELETE);
 FDQuery.ExecSQL;
end;


end.
