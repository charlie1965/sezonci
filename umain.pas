unit uMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqlite3conn, Forms, Controls, Graphics, Dialogs,
  ZConnection, cyAdvPanel, cyAdvButton, cyBitBtn, cyAdvSpeedButton;

type

  { TfMain }

  TfMain = class(TForm)
    conn: TZConnection;
    cyAdvPanel1: TcyAdvPanel;
    cyAdvPanel2: TcyAdvPanel;
    cyAdvSpeedButton1: TcyAdvSpeedButton;
    cyAdvSpeedButton2: TcyAdvSpeedButton;
    cyAdvSpeedButton3: TcyAdvSpeedButton;
    cyAdvSpeedButton4: TcyAdvSpeedButton;
    cyAdvSpeedButton5: TcyAdvSpeedButton;
    cyAdvSpeedButton6: TcyAdvSpeedButton;
    cyAdvSpeedButton7: TcyAdvSpeedButton;
    cyAdvSpeedButton8: TcyAdvSpeedButton;
    btnObracuni: TcyAdvSpeedButton;
    procedure btnConfigClick(Sender: TObject);
    procedure btnDrzaveClick(Sender: TObject);
    procedure btnIzlazClick(Sender: TObject);
    procedure btnObracuniClick(Sender: TObject);
    procedure btnOpstineClick(Sender: TObject);
    procedure btnRadniciClick(Sender: TObject);
    procedure connAfterConnect(Sender: TObject);
    procedure cyAdvSpeedButton1Click(Sender: TObject);
    procedure cyAdvSpeedButton2Click(Sender: TObject);
    procedure cyAdvSpeedButton3Click(Sender: TObject);
    procedure cyAdvSpeedButton4Click(Sender: TObject);
    procedure cyAdvSpeedButton5Click(Sender: TObject);
    procedure cyAdvSpeedButton6Click(Sender: TObject);
    procedure cyAdvSpeedButton7Click(Sender: TObject);
    procedure cyAdvSpeedButton8Click(Sender: TObject);
    procedure ZConnection1AfterConnect(Sender: TObject);

  private

  public

  end;

var
  fMain: TfMain;

implementation

uses uDrzave,uOpstine,uRadnici,uConfig,uObracuni,uPoslodavci,uParametri,uPoslovi;

{$R *.lfm}

{ TfMain }

procedure TfMain.btnIzlazClick(Sender: TObject);
begin

end;

procedure TfMain.btnObracuniClick(Sender: TObject);
begin
  with tfParametri.Create(nil) do
  begin
    showModal;
    free;
  end;
end;

procedure TfMain.btnOpstineClick(Sender: TObject);
begin

end;

procedure TfMain.btnRadniciClick(Sender: TObject);
begin
end;

procedure TfMain.connAfterConnect(Sender: TObject);
begin

end;


procedure TfMain.cyAdvSpeedButton1Click(Sender: TObject);
begin
   with tfDrzave.Create(nil) do
  begin
    showModal;
    free;
  end;
end;

procedure TfMain.cyAdvSpeedButton2Click(Sender: TObject);
begin
    with tfOpstine.Create(nil) do
  begin
    showModal;
    free;
  end;
end;

procedure TfMain.cyAdvSpeedButton3Click(Sender: TObject);
begin
  with tfRadnici.Create(nil) do
begin
  showModal;
  free;
end;

end;

procedure TfMain.cyAdvSpeedButton4Click(Sender: TObject);
begin
  with tfPoslodavci.Create(nil) do
  begin
    showModal;
    free;
  end;
end;

procedure TfMain.cyAdvSpeedButton5Click(Sender: TObject);
begin
  with tfPoslovi.Create(nil) do
  begin
    showModal;
    free;
  end;
end;

procedure TfMain.cyAdvSpeedButton6Click(Sender: TObject);
begin
  with tfConfig.Create(nil) do
  begin
    showModal;
    free;
  end;
end;

procedure TfMain.cyAdvSpeedButton7Click(Sender: TObject);
begin
  with tfObracuni.Create(nil) do
  begin
    showModal;
    free;
  end;
end;

procedure TfMain.cyAdvSpeedButton8Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfMain.ZConnection1AfterConnect(Sender: TObject);
begin

end;


procedure TfMain.btnDrzaveClick(Sender: TObject);
begin

end;

procedure TfMain.btnConfigClick(Sender: TObject);
begin

end;

end.

