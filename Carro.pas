unit Carro;

interface

uses
   PersistenciaDb, FireDAC.Comp.Client, Data.DB, FireDac.Stan.Param,SysUtils;

type
  TCarro = Class(TInterfacedObject, IPersistenciaDb)
  private
  const
    {$REGION 'CONSULTA'}
    CONSULTA = 'SELECT        '+
               ' CODIGO,      '+
               ' MODELO,      '+
               ' DATALANCAMENTO '+
               'FROM CARROS   ';
    {$ENDREGION 'CONSULTA'}
    {$REGION 'SQL_INSERT'}
    SQL_INSERT = 'INSERT INTO CARROS '+
                 '(CODIGO,MODELO, DATALANCAMENTO) '+
                 ' VALUES '+
                 '(:CODIGO,:MODELO,:DATALANCAMENTO) ';
    {$ENDREGION 'SQL_INSERT'}

    {$REGION 'SQL_DELETE'}
    SQL_DELETE = 'DELETE FROM CARROS';
    {$ENDREGION 'SQL_DELETE'}
  var
    FCodigo: Integer;
    FModelo: String;
    FDtLancamento: TDate;
    FDQuery: TfdQuery;
    procedure setCodigo(const Avalue: Integer);
    procedure setModelo(const Avalue: String);
    procedure setDtLancamento(const Avalue: TDate);
  public
    Constructor Create(AConexao: TfdConnection);
    destructor Destroy;override;
    function DataSet: TDataSet;
    procedure ApagarDadosDb;
    property Codigo: Integer Read FCodigo Write setCodigo;
    property Modelo: String Read FModelo Write setModelo;
    property DataLancamento: TDate Read FDtLancamento Write setDtLancamento;
    procedure ExecutarSql;
    procedure InserirDadosBD;
  End;

implementation

procedure TCarro.setCodigo(const Avalue: Integer);
begin
  FCodigo := Avalue;
end;

procedure TCarro.setModelo(const Avalue: String);
begin
  FModelo := Avalue;
end;

procedure TCarro.setDtLancamento(const Avalue: TDate);
begin
  FDtLancamento := Avalue;
end;

procedure TCarro.ExecutarSql;
begin
 FDQuery.Close;
 FDQuery.SQL.Clear;
 FDQuery.SQL.Add(CONSULTA);
 FDQuery.Open;
end;

function TCarro.DataSet: TDataSet;
begin
  Result := FDQuery;
end;

procedure TCarro.InserirDadosBD;
begin
  FDQuery.Close;
  FDQuery.SQL.Clear;
  FDQuery.SQL.Add(SQL_INSERT);
  FDQuery.ParamByName('CODIGO').AsInteger := FCodigo;
  FDQuery.ParamByName('MODELO').AsString := FModelo;
  FDQuery.ParamByName('DATALANCAMENTO').AsDate := FDtLancamento;
  FDquery.ExecSQL;
end;

constructor TCarro.Create(AConexao: TfdConnection);
begin
  FDQuery := TFDQuery.Create(nil);
  FDQuery.Connection := AConexao;
end;

destructor TCarro.Destroy;
begin
  FDQuery.Close;
  FreeAndNil(FDQuery);
  inherited;
end;

procedure TCarro.ApagarDadosDb;
begin
 FDQuery.Close;
 FDQuery.SQL.Clear;
 FDQuery.SQL.Add(SQL_DELETE);
 FDQuery.ExecSQL;
end;

end.
