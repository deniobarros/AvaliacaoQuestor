unit PersistenciaDb;

interface

uses
   Data.DB;

type
  IPersistenciaDb = interface
    ['{65C4693D-A981-4C75-AB9D-F5AA5A33FC00}']
    procedure InserirDadosBD;
    procedure ApagarDadosDb;
    procedure ExecutarSql;
    function DataSet: TDataSet;
  end;

implementation

end.
