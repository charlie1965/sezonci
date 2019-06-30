unit uRadnici;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, Forms, Controls, Graphics, Dialogs, DBGrids, DBCtrls,
  StdCtrls, rxdbgrid, rxlookup, rxdbcomb, ZDataset, ZSqlUpdate, ZConnection,
  cyAdvPanel, cyAdvButton;

type

  { TfRadnici }

  TfRadnici = class(TForm)
    btnZapamti: TcyAdvButton;
    btnIzlaz: TcyAdvButton;
    cyAdvPanel1: TcyAdvPanel;
    cyAdvPanel2: TcyAdvPanel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    dbgRadnici: TDBGrid;
    dsRadnici: TDataSource;
    dsOpstine: TDataSource;
    dsDrzave: TDataSource;
    Label1: TLabel;
    lblPol: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lblPol1: TLabel;
    qDrzavenazivDrzave: TStringField;
    qDrzaverecNo: TLongintField;
    qDrzavesifrraDrzave: TStringField;
    qOpstinenazivOpstine: TStringField;
    qOpstinerbr: TLongintField;
    qOpstinerecNo: TLongintField;
    qOpstinesifra: TStringField;
    qRadnici: TZQuery;
    qOpstine: TZReadOnlyQuery;
    qDrzave: TZReadOnlyQuery;
    qRadnicibroj: TStringField;
    qRadniciime: TStringField;
    qRadniciimePrezime: TStringField;
    qRadniciimeroditelja: TStringField;
    qRadnicijmbg: TStringField;
    qRadnicimesto: TStringField;
    qRadnicinazivDrzave: TStringField;
    qRadnicipol: TStringField;
    qRadniciprezime: TStringField;
    qRadnicisifra: TLargeintField;
    qRadnicisifraDrzave: TStringField;
    qRadnicisifraOpstine: TStringField;
    qRadnicitel: TStringField;
    qRadniciulica: TStringField;
    dblDrzava: TRxDBLookupCombo;
    dblOpstine: TRxDBLookupCombo;
    StringField1: TStringField;
    usqlRadnici: TZUpdateSQL;
    procedure btnIzlazClick(Sender: TObject);
    procedure btnZapamtiClick(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure dblDrzavaEnter(Sender: TObject);
    procedure dblDrzavaExit(Sender: TObject);
    procedure dblOpstineChange(Sender: TObject);

    procedure FormCreate(Sender: TObject);
    procedure qRadniciNewRecord(DataSet: TDataSet);


  private

  public
    exitColor : TColor;
    enterColor: TColor;
  end;

var
  fRadnici: TfRadnici;


implementation

uses uMain;

{$R *.lfm}


{ TfRadnici }

procedure TfRadnici.FormCreate(Sender: TObject);
begin
  if not qDrzave.Active then qDrzave.Active:=true;
  if not  qOpstine.Active then qOpstine.Active:=true;
  if not qRadnici.Active then qRadnici.Active:=true;
  enterColor:=clYellow;
end;

procedure TfRadnici.qRadniciNewRecord(DataSet: TDataSet);
begin
  //qRadnicisifradrzave.AsString:='688';  //99 %  radnika su nasi drzavljani
end;


procedure TfRadnici.btnIzlazClick(Sender: TObject);
begin
  Close;
end;

procedure TfRadnici.btnZapamtiClick(Sender: TObject);
begin
  qRadnici.First;
  while not qRadnici.EOF do
  begin
    qRadnici.edit;
    qRadniciimePrezime.AsString:=qRadniciprezime.AsString+' '+qRadniciime.AsString;
    qRadnici.next;
  end;
  qRadnici.ApplyUpdates;
  qRadnici.Close;
  qRadnici.Open;
end;

procedure TfRadnici.DBEdit1Enter(Sender: TObject);
begin
   exitColor:=(Sender as TDbEdit).Color;
  (Sender as tDbEdit).Color:=enterColor;

end;

procedure TfRadnici.DBEdit1Exit(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=exitColor;
end;

procedure TfRadnici.dblDrzavaEnter(Sender: TObject);
begin

end;

procedure TfRadnici.dblDrzavaExit(Sender: TObject);
begin

end;

procedure TfRadnici.dblOpstineChange(Sender: TObject);
begin

end;

end.

