program projectSezonci;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, uMain, uDrzave, zcomponent, uOpstine, uRadnici, rxnew, uConfig,
  uObracuni, uPoslodavci, datetimectrls, printer4lazarus, uParametri, uPoslovi,
  uIspLista
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.

