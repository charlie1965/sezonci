unit uPoslodavci;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, Forms, Controls, Graphics, Dialogs, DBGrids, DBCtrls,
  StdCtrls, ZDataset, ZSqlUpdate, cyAdvPanel, cyAdvButton;

type

  { TfPoslodavci }

  TfPoslodavci = class(TForm)
    btnZapamti: TcyAdvButton;
    btnIzlaz: TcyAdvButton;
    cyAdvPanel1: TcyAdvPanel;
    cyAdvPanel2: TcyAdvPanel;
    dbeUlica: TDBEdit;
    dbeBroj: TDBEdit;
    dbeMesto: TDBEdit;
    dbeTel: TDBEdit;
    DBEdit5: TDBEdit;
    dbeFax: TDBEdit;
    dbeMatBr: TDBEdit;
    dbgPoslodavci: TDBGrid;
    dsPoslodavci: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    qPoslodavci: TZQuery;
    qPoslodavcibanka: TLongintField;
    qPoslodavcibroj: TStringField;
    qPoslodavcifax: TStringField;
    qPoslodavcikontakt: TStringField;
    qPoslodavcimatBroj: TStringField;
    qPoslodavcinaziv: TStringField;
    qPoslodavcinazivBanke: TStringField;
    qPoslodavcinazivMesta: TStringField;
    qPoslodavciPIB: TStringField;
    qPoslodavciRecNo: TLongintField;
    qPoslodavcisifra: TLongintField;
    qPoslodavcitel: TStringField;
    qPoslodavciulica: TStringField;
    usqlPoslodavci: TZUpdateSQL;
    procedure btnIzlazClick(Sender: TObject);
    procedure btnZapamtiClick(Sender: TObject);
    procedure dbeBrojEnter(Sender: TObject);
    procedure dbeBrojExit(Sender: TObject);
    procedure dbeUlicaEnter(Sender: TObject);
    procedure dbeUlicaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public
    enterColor:TColor;
    exitColor:TColor;
  end;

var
  fPoslodavci: TfPoslodavci;

implementation

uses uMain;

{$R *.lfm}

{ TfPoslodavci }

procedure TfPoslodavci.btnIzlazClick(Sender: TObject);
begin
  Close;
end;

procedure TfPoslodavci.btnZapamtiClick(Sender: TObject);
begin
  qPoslodavci.ApplyUpdates ;
  qPoslodavci.Active:=false;
  qPoslodavci.Active:=true ;
end;

procedure TfPoslodavci.dbeBrojEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=enterColor;
end;

procedure TfPoslodavci.dbeBrojExit(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=exitColor;
end;

procedure TfPoslodavci.dbeUlicaEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=enterColor;
end;

procedure TfPoslodavci.dbeUlicaExit(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=exitColor;
end;

procedure TfPoslodavci.FormCreate(Sender: TObject);
begin
  enterColor:=clYellow;
  exitColor:=clWhite;
  if not qPoslodavci.Active then qPoslodavci.Active:=true;
end;

end.

