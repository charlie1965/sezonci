unit uConfig;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, Forms, Controls, Graphics, Dialogs, DBCtrls, ZDataset,
  ZSqlUpdate, cyAdvPanel, cyAdvButton, cyHotLabel;

type

  { TfConfig }

  TfConfig = class(TForm)
    cyAdvButton1: TcyAdvButton;
    cyAdvButton2: TcyAdvButton;
    cyAdvPanel1: TcyAdvPanel;
    cyAdvPanel2: TcyAdvPanel;
    cyHotLabel1: TcyHotLabel;
    lblBanka: TcyHotLabel;
    lblPIB: TcyHotLabel;
    lblMesto: TcyHotLabel;
    lblNaziv: TcyHotLabel;
    lblAdresa: TcyHotLabel;
    dbeNaziv: TDBEdit;
    dbeAdresa: TDBEdit;
    dbeMesto: TDBEdit;
    dbePIB: TDBEdit;
    dbeTekuci: TDBEdit;
    dbeBanka: TDBEdit;
    dsConfig: TDataSource;
    qConfig: TZQuery;
    qConfigadresa: TStringField;
    qConfigbanka: TStringField;
    qConfigmesto: TStringField;
    qConfignaziv: TStringField;
    qConfigPIB: TStringField;
    qConfigrecNo: TLongintField;
    qConfigtekuci: TStringField;
    usqlConfig: TZUpdateSQL;
    procedure cyAdvButton1Click(Sender: TObject);
    procedure cyAdvButton2Click(Sender: TObject);
    procedure dbeNazivEnter(Sender: TObject);
    procedure dbeNazivExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public
    enterColor,exitColor:TColor;
  end;

var
  fConfig: TfConfig;

implementation

uses uMain;

{$R *.lfm}

{ TfConfig }

procedure TfConfig.cyAdvButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfConfig.dbeNazivEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=enterColor;;
end;

procedure TfConfig.dbeNazivExit(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=exitColor;
end;

procedure TfConfig.cyAdvButton1Click(Sender: TObject);
begin
  qConfig.ApplyUpdates ;
  qConfig.Active:=false;
  qConfig.Active:=true ;
end;

procedure TfConfig.FormCreate(Sender: TObject);
begin
  enterColor:=clYellow;
  exitColor:=clWhite;
  if not qConfig.Active then qConfig.Active:=true;
end;

end.

