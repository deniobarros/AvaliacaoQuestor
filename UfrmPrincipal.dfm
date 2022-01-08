object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 434
  ClientWidth = 756
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lblTabela: TLabel
    Left = 344
    Top = 45
    Width = 3
    Height = 13
  end
  object DBGrid1: TDBGrid
    Left = 72
    Top = 64
    Width = 609
    Height = 249
    DataSource = DS
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object BtnCadastroCarro: TButton
    Left = 304
    Top = 327
    Width = 121
    Height = 26
    Caption = 'Cadastrar Carros'
    TabOrder = 1
    OnClick = BtnCadastroCarroClick
  end
  object BtnVendas: TButton
    Left = 504
    Top = 327
    Width = 121
    Height = 26
    Caption = 'Vendas'
    TabOrder = 2
    OnClick = BtnVendasClick
  end
  object BtnCadastroCliente: TButton
    Left = 104
    Top = 327
    Width = 123
    Height = 26
    Caption = 'Cadastrar Clientes'
    TabOrder = 3
    OnClick = BtnCadastroClienteClick
  end
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=postgres'
      'User_Name=postgres'
      'Password=123'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 376
  end
  object DS: TDataSource
    Left = 72
    Top = 384
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    Left = 536
    Top = 385
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 616
    Top = 376
  end
end
