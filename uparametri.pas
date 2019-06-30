unit uParametri;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  ZDataset, ZSqlUpdate, cyAdvPanel, cyAdvButton;

type

  { TfParametri }

  TfParametri = class(TForm)
    btnIzlaz: TcyAdvButton;
    btnZapamti: TcyAdvButton;
    cyAdvPanel2: TcyAdvPanel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    dbeTroskoviObrade: TDBEdit;
    dbeStopaZdravstvo: TDBEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    qParametriobradaRSD: TCurrencyField;
    qParametriPIORSD: TCurrencyField;
    qParametriporezRSD: TCurrencyField;
    qParametrizdravstvoRSD: TCurrencyField;
    stopaPIO: TDBEdit;
    dbeStopaPoreza: TDBEdit;
    dbeOsnovica: TDBEdit;
    dsParametri: TDataSource;
    qParametri: TZQuery;
    qParametriadminTroskovi: TFloatField;
    qParametriosnovica: TFloatField;
    qParametriPIO: TFloatField;
    qParametriporez: TFloatField;
    qParametrirBr: TLargeintField;
    qParametrizdravstvo: TFloatField;
    usqlParametri: TZUpdateSQL;
    procedure btnIzlazClick(Sender: TObject);
    procedure btnZapamtiClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qParametriCalcFields(DataSet: TDataSet);
  private

  public

  end;

var
  fParametri: TfParametri;

implementation

uses uMain ;

{$R *.lfm}

{ TfParametri }

procedure TfParametri.btnIzlazClick(Sender: TObject);
begin
  Close;
end;

procedure TfParametri.btnZapamtiClick(Sender: TObject);
begin
  qParametri.ApplyUpdates;
  qParametri.close;
  qParametri.Open;
end;

procedure TfParametri.FormCreate(Sender: TObject);
begin
  if not qParametri.Active then qParametri.Active:=true;
end;

procedure TfParametri.qParametriCalcFields(DataSet: TDataSet);
begin
  qParametriPIORSD.AsCurrency:=qParametriosnovica.AsCurrency*qParametriPIO.AsCurrency/100;
  qParametriporezRSD.AsCurrency:=qParametriPorez.AsCurrency*qParametriosnovica.AsCurrency/100;
  qParametrizdravstvoRSD.AsCurrency:=qParametriosnovica.AsCurrency*qParametrizdravstvo.AsCurrency/100;
end;


end.

