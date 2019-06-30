unit uPoslovi;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, Forms, Controls, Graphics, Dialogs, DBGrids, ZDataset,
  ZSqlUpdate, cyAdvPanel, cyAdvButton;

type

  { TfPoslovi }

  TfPoslovi = class(TForm)
    btnZapamti: TcyAdvButton;
    btnIzlaz: TcyAdvButton;
    cyAdvPanel1: TcyAdvPanel;
    cyAdvPanel2: TcyAdvPanel;
    dsPoslovi: TDataSource;
    dbgPoslovi: TDBGrid;
    qPoslovi: TZQuery;
    qPosloviopisPosla: TStringField;
    qPoslovirecNo: TLargeintField;
    qPoslovirowid: TLargeintField;
    qPoslovisifra: TStringField;
    usqlPoslovi: TZUpdateSQL;
    procedure btnIzlazClick(Sender: TObject);
    procedure btnZapamtiClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  fPoslovi: TfPoslovi;

implementation

{$R *.lfm}

uses uMain;

{ TfPoslovi }

procedure TfPoslovi.btnIzlazClick(Sender: TObject);
begin
  Close;
end;

procedure TfPoslovi.btnZapamtiClick(Sender: TObject);
begin
  qPoslovi.ApplyUpdates;
  qPoslovi.Active:=false;
  qPoslovi.Active:=true ;
end;

procedure TfPoslovi.FormCreate(Sender: TObject);
begin
  if not qPoslovi.Active then qPoslovi.Active:=true;
end;

end.

