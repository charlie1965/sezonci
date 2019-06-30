unit uOpstine;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, Forms, Controls, Graphics, Dialogs, DBGrids, ZDataset,
  ZConnectionGroup, ZSqlUpdate, cyAdvPaintBox, cyAdvPanel, cyAdvButton;

type

  { TfOpstine }

  TfOpstine = class(TForm)
    cyAdvButton1: TcyAdvButton;
    cyAdvButton2: TcyAdvButton;
    cyAdvPanel1: TcyAdvPanel;
    cyAdvPanel2: TcyAdvPanel;
    dsOpstine: TDataSource;
    DBGrid1: TDBGrid;
    qOpstine: TZQuery;
    usqlOpstine: TZUpdateSQL;
    procedure cyAdvButton1Click(Sender: TObject);
    procedure cyAdvButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  fOpstine: TfOpstine;

implementation

uses uMain;

{$R *.lfm}

{ TfOpstine }

procedure TfOpstine.cyAdvButton2Click(Sender: TObject);
begin
  close;
end;

procedure TfOpstine.cyAdvButton1Click(Sender: TObject);
begin
  qOpstine.ApplyUpdates;
  qOpstine.Active:=false;
  qOpstine.Active:=true;
end;

procedure TfOpstine.FormCreate(Sender: TObject);
begin
  if not qOpstine.Active then qOpstine.Open;
end;

end.

