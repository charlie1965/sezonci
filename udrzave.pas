unit uDrzave;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, Forms, Controls, Graphics, Dialogs, DBGrids,
  StdCtrls, ZDataset, ZSqlUpdate, cyAdvPanel, cyAdvButton;

type

  { TfDrzave }

  TfDrzave = class(TForm)
    cyAdvButton1: TcyAdvButton;
    cyAdvButton2: TcyAdvButton;
    cyAdvPanel1: TcyAdvPanel;
    cyAdvPanel2: TcyAdvPanel;
    DBGrid1: TDBGrid;
    dsDrzave: TDataSource;
    eNazivDrzave: TEdit;
    Label1: TLabel;
    qDrzave: TZQuery;
    qDrzavenazivDrzave: TStringField;
    qDrzaverecNo: TLongintField;
    qDrzavesifrraDrzave: TStringField;
    usqlDrzave: TZUpdateSQL;
    procedure cyAdvButton1Click(Sender: TObject);
    procedure cyAdvButton2Click(Sender: TObject);
    procedure eNazivDrzaveKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure qDrzaveFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure qDrzavesifrraDrzaveChange(Sender: TField);
  private

  public

  end;

var
  fDrzave: TfDrzave;

implementation

uses uMain;

{$R *.lfm}

{ TfDrzave }

procedure TfDrzave.FormCreate(Sender: TObject);
begin
 if not qDrzave.Active then qDrzave.Active:=true;
end;

procedure TfDrzave.eNazivDrzaveKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  qDrzave.Filtered:=false;
  if length(eNazivDrzave.Text)>0 then qDrzave.Filtered:=true;
end;

procedure TfDrzave.cyAdvButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfDrzave.cyAdvButton1Click(Sender: TObject);
begin
  qDrzave.Close;;
  qDrzave.Open;
end;

procedure TfDrzave.qDrzaveFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept:=Pos(UpperCase(eNazivDrzave.Text),UpperCase(qDrzavenazivDrzave.AsString))>0;

end;

procedure TfDrzave.qDrzavesifrraDrzaveChange(Sender: TField);
begin
  showmessage('evo ga');
end;

end.

