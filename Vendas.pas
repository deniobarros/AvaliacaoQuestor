unit Vendas;

interface

uses
PersistenciaDb, FireDAC.Comp.Client, Data.DB, FireDac.Stan.Param,SysUtils;

type
  TVendas = Class(TInterfacedObject, IPersistenciaDb)

  private
  const
    {$REGION 'CONSULTA'}
    CONSULTA = 'SELECT         '+
               ' CODIGO,       '+
               ' CODIGOCLIENTE,'+
               ' CODIGOCARRO   '+
               'FROM VENDAS    ';
    {$ENDREGION 'CONSULTA'}
    {$REGION 'SQL_INSERT'}
    SQL_INSERT = 'INSERT INTO VENDAS '+
                 '(CODIGO,CODIGOCLIENTE, CODIGOCARRO) '+
                 ' VALUES '+
                 '(:CODIGO,:CODIGOCLIENTE,:CODIGOCARRO) ';
    {$ENDREGION 'SQL_INSERT'}

    {$REGION 'SQL_DELETE'}
    SQL_DELETE = 'DELETE FROM VENDAS';
    {$ENDREGION 'SQL_DELETE'}
  var
    FCodigo: Integer;
    FCodigoCliente: Integer;
    FCodigoCarro: Integer;
    FDQueryVendas: TfdQuery;
    procedure setCodigo(const Avalue: Integer);
    procedure setCodigoCliente(const Avalue: Integer);
    procedure setCodigoCarro(const Avalue: Integer);
  public
    Constructor Create(AConexao: TfdConnection);
    destructor Destroy;override;
    function DataSet: TDataSet;
    property Codigo: Integer Read FCodigo Write setCodigo;
    property CodigoCliente: Integer Read FCodigo Write setCodigoCliente;
    property CodigoCarro: Integer Read FCodigo Write setCodigoCarro;
    procedure ExecutarSql;
    procedure InserirDadosBD;
    procedure ApagarDadosDb;
  end;

implementation

procedure TVendas.setCodigo(const Avalue: Integer);
begin
  FCodigo := Avalue;
end;

procedure TVendas.setCodigoCliente(const Avalue: Integer);
begin
  FCodigoCliente := Avalue;
end;

procedure TVendas.setCodigoCarro(const Avalue: Integer);
begin
  FCodigoCarro := Avalue;
end;

procedure TVendas.ExecutarSql;
begin
 FDQueryVendas.Close;
 FDQueryVendas.SQL.Clear;
 FDQueryVendas.SQL.Add(CONSULTA);
 FDQueryVendas.Open;
end;

function TVendas.DataSet: TDataSet;
begin
  Result := FDQueryVendas;
end;

procedure TVendas.InserirDadosBD;
begin
  FDQueryVendas.Close;
  FDQueryVendas.SQL.Clear;
  FDQueryVendas.SQL.Add(SQL_INSERT);
  FDQueryVendas.ParamByName('CODIGO').AsInteger := FCodigo;
  FDQueryVendas.ParamByName('CODIGOCLIENTE').AsInteger := FCodigoCliente;
  FDQueryVendas.ParamByName('CODIGOCARRO').AsInteger := FCodigoCarro;
  FDQueryVendas.ExecSQL;
end;

constructor TVendas.Create(AConexao: TfdConnection);
begin
  FDQueryVendas := TFDQuery.Create(nil);
  FDQueryVendas.Connection := AConexao;
end;

destructor TVendas.Destroy;
begin
  FDQueryVendas.Close;
  FreeAndNil(FDQueryVendas);
  inherited;
end;

procedure TVendas.ApagarDadosDb;
begin
 FDQueryVendas.Close;
 FDQueryVendas.SQL.Clear;
 FDQueryVendas.SQL.Add(SQL_DELETE);
 FDQueryVendas.ExecSQL;
end;

end.
