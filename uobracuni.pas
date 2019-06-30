unit uObracuni;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, Forms, Controls, Graphics, Dialogs, DBGrids, ExtCtrls,
  DBCtrls, StdCtrls, DBDateTimePicker, PrintersDlgs, LR_Class, LR_DBSet,
  LR_View, LR_Desgn, rxdbgrid, RxDBGridFooterTools, rxdbverticalgrid,
  rxpickdate, ZDataset, ZSqlUpdate, cyAdvPanel, cyAdvButton, cyBitBtn,
  dateutils, Grids, Messages, LMessages, ZReport, windows, LR_DSet;

type

  { TfObracuni }

  TfObracuni = class(TForm)
    btnZapamti: TcyAdvButton;
    btnIzlaz: TcyAdvButton;
    btnXML: TcyAdvButton;
    btnFaktura: TcyAdvButton;
    btnIsplatnaLista: TcyAdvButton;
    Button1: TButton;
    cyAdvPanel1: TcyAdvPanel;
    cyAdvPanel2: TcyAdvPanel;
    btnObracun: TcyBitBtn;
    dbBrojDana: TDBEdit;
    dbeAdmTroskovi: TDBEdit;
    dbeBrutoDin: TDBEdit;
    dbeNetoZarada: TDBEdit;
    dbeBrutoZarada: TDBEdit;
    dbeTroskoviDin: TDBEdit;
    dbeNeto: TDBEdit;
    dsLista: TfrDBDataSet;
    qStavkeimeroditelja: TStringField;
    rptPojedinacno: TfrReport;
    Label30: TLabel;
    rptFaktura: TfrReport;
    rptDesigner: TfrDesigner;
    rptLista: TfrReport;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    qStavkebrutoDin: TCurrencyField;
    qStavkebrutoZarada: TCurrencyField;
    qStavkedoDana: TDateTimeField;
    qStavkeime: TStringField;
    qStavkejmbg: TStringField;
    qStavkeneto: TFloatField;
    qStavkeodDana: TDateTimeField;
    qStavkeosnovica: TFloatField;
    qStavkePIO: TFloatField;
    qStavkePIOdin: TFloatField;
    qStavkepol: TStringField;
    qStavkeporez: TFloatField;
    qStavkeporezDIN: TFloatField;
    qStavkeprezime: TStringField;
    qStavkeradnik: TLongintField;
    qStavkerbr: TLongintField;
    qStavkerecNo: TLongintField;
    qStavkerowid: TLargeintField;
    qStavkesati: TCurrencyField;
    qStavkesifraDrzave: TStringField;
    qStavkesifraOpstine: TStringField;
    qStavkesifraPosla: TStringField;
    qStavkesmena: TLongintField;
    qStavketel: TStringField;
    qStavketroskovi: TFloatField;
    qStavketroskoviDIN: TFloatField;
    qStavketroskoviDIN1: TCurrencyField;
    qStavkeukDoprinosiDin: TCurrencyField;
    qStavkeukPIODin: TCurrencyField;
    qStavkeukPorezDin: TCurrencyField;
    qStavkeukZdravstvoDin: TCurrencyField;
    qStavkezdravstvo: TFloatField;
    qStavkezdravstvoDIN: TFloatField;
    sDialog: TSaveDialog;
    Shape1: TShape;
    StringField1: TStringField;
    ukPorez: TDBEdit;
    ukPIO: TDBEdit;
    ukZdravstvo: TDBEdit;
    ukDoprinosi: TDBEdit;
    dbePorezDin: TDBEdit;
    dbePIOdin: TDBEdit;
    dbeZdravstvoDin: TDBEdit;
    dbePorez: TDBEdit;
    dbePIO: TDBEdit;
    dbeZdravstvo: TDBEdit;
    dbeOsnovica: TDBEdit;
    dtDoDana: TDBDateTimePicker;
    dtOdDana: TDBDateTimePicker;
    dsConfig: TDataSource;
    DBEdit15: TDBEdit;
    dsSumaNeto: TDataSource;
    dsParametri: TDataSource;
    dbeOsnovicaObracuna1: TDBEdit;
    dbeOsnovicaObracuna2: TDBEdit;
    dbeOsnovicaObracuna3: TDBEdit;
    DBGrid1: TDBGrid;
    dsPoslovi: TDataSource;
    dsRadnici: TDataSource;
    dsStavke: TDataSource;
    DBDateTimePicker1: TDBDateTimePicker;
    DBDateTimePicker2: TDBDateTimePicker;
    DBDateTimePicker3: TDBDateTimePicker;
    dbeOsnovicaObracuna: TDBEdit;
    dbeProcenatTroskova: TDBEdit;
    dbeMestoIzdavanja: TDBEdit;
    dbeOpisRadova: TDBEdit;
    dsFirme: TDataSource;
    dbeFirma: TDBEdit;
    dblFirma: TDBLookupComboBox;
    dsZaglavlje: TDataSource;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label27: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lblTroskovi: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    qConfigadresa: TStringField;
    qConfigbanka: TStringField;
    qConfigmesto: TStringField;
    qConfignaziv: TStringField;
    qConfigPIB: TStringField;
    qConfigrecNo: TLongintField;
    qConfigtekuci: TStringField;
    qFirmebanka: TLongintField;
    qFirmebroj: TStringField;
    qFirmefax: TStringField;
    qFirmekontakt: TStringField;
    qFirmematBroj: TStringField;
    qFirmemesto: TLongintField;
    qFirmenaziv: TStringField;
    qFirmenazivBanke: TStringField;
    qFirmenazivMesta: TStringField;
    qFirmePIB: TStringField;
    qFirmeRecNo: TLongintField;
    qFirmesifra: TLongintField;
    qFirmetel: TStringField;
    qFirmeulica: TStringField;
    qParametriadminTroskovi: TFloatField;
    qParametriosnovica: TFloatField;
    qParametriPIO: TFloatField;
    qParametriporez: TFloatField;
    qParametrizdravstvo: TFloatField;
    qPosloviopisPosla: TStringField;
    qPoslovisifra: TStringField;
    qRadnicibroj: TStringField;
    qRadniciime: TStringField;
    qRadniciimePrezime: TStringField;
    qRadniciimeroditelja: TStringField;
    qRadnicijmbg: TStringField;
    qRadnicimesto: TStringField;
    qRadnicipol: TStringField;
    qRadniciprezime: TStringField;
    qRadnicisifra: TLargeintField;
    qRadnicisifraDrzave: TStringField;
    qRadnicisifraOpstine: TStringField;
    qRadnicitel: TStringField;
    qRadniciulica: TStringField;
    qStavke: TZQuery;
    qStavkeSMENA1: TStringField;
    qSumaNetonetoSuma: TFloatField;
    qZaglavlje: TZQuery;
    qZaglavljedatum: TDateTimeField;
    qZaglavljedatumIzdavanja: TDateTimeField;
    qZaglavljedatumPocetka: TDateTimeField;
    qZaglavljedatumZavrsetka: TDateTimeField;
    qZaglavljefirma: TLongintField;
    qZaglavljemestoIzdavanja: TStringField;
    qZaglavljeopisRadova: TStringField;
    qZaglavljeosnovicaObracuna: TCurrencyField;
    qZaglavljePIO: TCurrencyField;
    qZaglavljePorez: TCurrencyField;
    qZaglavljeprocenatZadruge: TCurrencyField;
    qZaglavljerbr: TLongintField;
    qZaglavljerecNo: TLongintField;
    qZaglavljesifraPosla: TStringField;
    qZaglavljezdravstvo: TCurrencyField;
    dbgZaglavlje: TRxDBGrid;
    usqlZaglavlje: TZUpdateSQL;
    qFirme: TZReadOnlyQuery;
    usqlStavke: TZUpdateSQL;
    qRadnici: TZReadOnlyQuery;
    qParametri: TZReadOnlyQuery;
    qPoslovi: TZReadOnlyQuery;
    qSumaNeto: TZQuery;
    usqlSumaNeto: TZUpdateSQL;
    ZQuery1: TZQuery;
    ZQuery1doDana: TDateTimeField;
    ZQuery1ime: TStringField;
    ZQuery1imeroditelja: TStringField;
    ZQuery1jmbg: TStringField;
    ZQuery1neto: TFloatField;
    ZQuery1odDana: TDateTimeField;
    ZQuery1osnovica: TFloatField;
    ZQuery1PIO: TFloatField;
    ZQuery1PIOdin: TFloatField;
    ZQuery1pol: TStringField;
    ZQuery1porez: TFloatField;
    ZQuery1porezDIN: TFloatField;
    ZQuery1prezime: TStringField;
    ZQuery1radnik: TLongintField;
    ZQuery1rbr: TLongintField;
    ZQuery1recNo: TLongintField;
    ZQuery1rowid: TLargeintField;
    ZQuery1sati: TCurrencyField;
    ZQuery1sifraDrzave: TStringField;
    ZQuery1sifraDrzave_1: TStringField;
    ZQuery1sifraOpstine: TStringField;
    ZQuery1sifraOpstine_1: TStringField;
    ZQuery1sifraPosla: TStringField;
    ZQuery1smena: TLongintField;
    ZQuery1tel: TStringField;
    ZQuery1troskovi: TFloatField;
    ZQuery1troskoviDIN: TFloatField;
    ZQuery1zdravstvo: TFloatField;
    ZQuery1zdravstvoDIN: TFloatField;
    qConfig: TZQuery;
    usqlConfig: TZUpdateSQL;
    procedure btnFakturaClick(Sender: TObject);
    procedure btnIsplatnaListaClick(Sender: TObject);
    procedure btnIzlazClick(Sender: TObject);
    procedure btnXMLClick(Sender: TObject);
    procedure btnZapamtiClick(Sender: TObject);
    procedure btnObracunClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cyAdvPanel2Click(Sender: TObject);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: char);
    procedure dtOdDanaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure frDesigner1LoadReport(Report: TfrReport; var ReportName: String);
    procedure frDSstavkeCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure Panel3Click(Sender: TObject);
    procedure qRadniciCalcFields(DataSet: TDataSet);
    procedure qStavkeAfterOpen(DataSet: TDataSet);
    procedure qStavkeBeforeOpen(DataSet: TDataSet);
    procedure qStavkeCalcFields(DataSet: TDataSet);
    procedure qStavkeNewRecord(DataSet: TDataSet);
    procedure qZaglavljeAfterScroll(DataSet: TDataSet);
    procedure qZaglavljeNewRecord(DataSet: TDataSet);
  private

  public
    enterColor:TColor;
    exitColor:TColor;
  end;

var
  fObracuni: TfObracuni;

implementation

uses uMain,uParametri,uIspLista;

{$R *.lfm}

{ TfObracuni }

procedure TfObracuni.FormCreate(Sender: TObject);
begin
  enterColor:=clRed;
  exitColor:=clWhite;
//  showMessage('poceo');
  if not qFirme.Active then qFirme.Active:=true;
  if not qRadnici.Active then qRadnici.Active:=true;;
  if not qParametri.Active then qParametri.Active:=true;
  if not qPoslovi.Active then qPoslovi.Active:=true;
  if not qZaglavlje.Active then qZaglavlje.open
 // showMessage('prosao');
end;

procedure TfObracuni.frDesigner1LoadReport(Report: TfrReport;
  var ReportName: String);
begin

end;

procedure TfObracuni.frDSstavkeCheckEOF(Sender: TObject; var Eof: Boolean);
begin

end;



procedure TfObracuni.Panel3Click(Sender: TObject);
begin

end;

procedure TfObracuni.qRadniciCalcFields(DataSet: TDataSet);
begin

end;

procedure TfObracuni.qStavkeAfterOpen(DataSet: TDataSet);
begin
  qSumaNeto.Active:=false;
  qSumaNeto.ParamByName('rbr').AsInteger:=qZaglavljerbr.AsInteger;
  qSumaNeto.Active:=true;
end;

procedure TfObracuni.qStavkeBeforeOpen(DataSet: TDataSet);
begin
 // qStavke.ParamByName('rbr').AsInteger:=qZaglavljerbr.AsInteger;
end;

procedure TfObracuni.qStavkeCalcFields(DataSet: TDataSet);
begin
  qStavkeukPIODin.AsCurrency:=qStavkesati.AsInteger*qStavkePIODin.AsCurrency;
  qStavkeukPorezDin.AsCurrency:=qStavkeSati.AsInteger*qStavkePorezDin.AsCurrency;
  qStavkeukZdravstvoDin.AsCurrency:=qStavkesati.AsInteger*qStavkezdravstvoDIN.AsCurrency;
  qStavkeUkDoprinosiDin.AsCurrency:= qStavkeukPIODin.AsCurrency+
                                     qStavkeukPorezDin.AsCurrency+
                                     qStavkeukZdravstvoDin.AsCurrency;
  qStavkeTroskoviDin.AsCurrency:=qStavkeneto.AsCurrency*qStavketroskovi.AsCurrency/100;
  qStavkeBrutoDin.AsCurrency:=qStavkeUkDoprinosiDin.AsCurrency+qStavketroskovidin.AsCurrency;
  qStavkebrutoZarada.AsCurrency:=qStavkeneto.AsCurrency+qStavkeBrutoDin.AsCurrency;
end;


procedure TfObracuni.qStavkeNewRecord(DataSet: TDataSet);
begin
  qStavkerbr.AsInteger:=qZaglavljerbr.AsInteger;
  qStavkeneto.AsCurrency:=0;
  qStavkesmena.AsInteger:=0;
  qStavkeodDana.AsDateTime:=qZaglavljedatumPocetka.AsDateTime;
  qStavkedoDana.AsDateTime:=qZaglavljedatumZavrsetka.AsDateTime;
  qStavkeOsnovica.AsCurrency:=qZaglavljeosnovicaObracuna.AsCurrency;
  qStavkepio.AsCurrency:=qZaglavljepio.AsCurrency;
  qStavkezdravstvo.AsCurrency:=qZaglavljezdravstvo.AsCurrency;
  qStavketroskovi.AsCurrency:=qZaglavljeprocenatZadruge.AsCurrency;
  qStavkesati.AsInteger:=daysBetween(dtDoDana.Field.AsDateTime,dtOdDana.Field.AsDateTime)+1;

end;

procedure TfObracuni.qZaglavljeAfterScroll(DataSet: TDataSet);
begin
  qStavke.Active:=false;
  qStavke.ParamByName('rbr').AsInteger:=qZaglavljerbr.AsInteger;
  qStavke.Active:=true;
end;


procedure TfObracuni.btnIzlazClick(Sender: TObject);
begin
  qZaglavlje.ApplyUpdates;
  Close;
end;

procedure TfObracuni.btnFakturaClick(Sender: TObject);
begin
  rptFaktura.LoadFromFile('rptFaktura.lrf');
  rptFaktura.ShowReport;
end;

procedure TfObracuni.btnIsplatnaListaClick(Sender: TObject);
begin
  rptLista.LoadFromFile('rptLista.lrf');
  rptLista.ShowReport;
//  rptLista.DesignReport;
end;

procedure TfObracuni.btnXMLClick(Sender: TObject);
var
  sezonci:tStringList;
  i:integer;
  smena:string;
  fName:string;
begin
    sezonci:=TStringList.Create;
    sezonci.Add('<evidencija>');
    qStavke.First;
    while not qStavke.EOF do
    begin
    if qStavkesmena.AsInteger=0 then  smena:='PREPODNE' else smena:='POSLEPODNE';
                  sezonci.Add(' <angazovanje>');
                  sezonci.Add('   <jmbgEbs>'+qStavkeJMBG.AsString+'</jmbgEbs>');
                  sezonci.Add('   <datumPocetkaPrijave>'+FormatDateTime('yyyy-MM-dd',qStavkeodDana.AsDateTime)+'</datumPocetkaPrijave>');
                  sezonci.Add('   <datumZavrsetkaPrijave>'+FormatDateTime('yyyy-MM-dd',qStavkedoDana.AsDateTime)+'</datumZavrsetkaPrijave>');
                  sezonci.Add('   <smena>'+SMENA+'</smena>');
                  sezonci.Add('   <vrstaPosla>'+qStavkesifraposla.AsString+'</vrstaPosla>');
                  sezonci.Add('   <opstina>'+qStavkesifraopstine.asstring+'</opstina>');
                  sezonci.Add('   <brojMobilnogTelefona>'+qStavketel.AsString+'</brojMobilnogTelefona>');
                  sezonci.Add('   <ime>'+qStavkeime.AsString+'</ime>');
                  sezonci.Add('   <prezime>'+qStavkeprezime.AsString+'</prezime>');
                  sezonci.Add('   <srednjeIme>'+ qStavke.FieldByName('imeRoditelja').AsString +'</srednjeIme>');
                  sezonci.Add('   <drzavljanstvo>'+qStavkesifradrzave.AsString+'</drzavljanstvo>');
                  sezonci.Add('   <pol>'+qStavkepol.AsString+'</pol>');
                  sezonci.Add(' </angazovanje>');
                  qStavke.Next;
    end;

    sezonci.Add('</evidencija>');
    if sDialog.Execute then fName:=sDialog.FileName;
    sezonci.SaveToFile('prijavaSezonaca_Br_'+IntToStr(qZaglavljerbr.AsInteger)+'.XML');
    sezonci.Free;
end;

procedure TfObracuni.btnZapamtiClick(Sender: TObject);
begin
   qStavke.ApplyUpdates;
 // qZaglavlje.ApplyUpdates;
 // qZaglavlje.Close;
 // qZaglavlje.Open;
  qSumaNeto.Active:=false;
  qSumaNeto.ParamByName('rbr').AsInteger:=qZaglavljerbr.AsInteger;
  qSumaNeto.Active:=true;

end;

procedure TfObracuni.btnObracunClick(Sender: TObject);
begin
  qStavke.First;
  while not qStavke.EOF do
  begin
        qStavke.Edit;
        qStavkeOsnovica.AsCurrency:=qZaglavljeosnovicaObracuna.AsCurrency;
        qStavkePIO.AsCurrency:=qZaglavljePIO.AsCurrency;
        qStavkePorez.AsCurrency:=qZaglavljePorez.AsCurrency;
        qStavkezdravstvo.AsCurrency:=qZaglavljezdravstvo.AsCurrency;
        qStavketroskovi.AsCurrency:=qZaglavljeprocenatZadruge.AsCurrency;
        qStavkePIOdin.AsCurrency:=qStavkeosnovica.AsCurrency*qStavkePIO.AsCurrency/100;
        qStavkezdravstvoDIN.AsCurrency:=qStavkeosnovica.AsCurrency*qStavkezdravstvo.AsCurrency/100;

        qStavkePorezDin.AsCurrency:=qStavkeporez.AsCurrency*qStavkeosnovica.AsCurrency/100;
        qStavkesati.AsInteger:=daysBetween(qStavkeodDana.AsDateTime,qStavkeDoDana.AsCurrency)+1;
        qStavkeSmena.AsInteger:=0; //za zene je jedinica


        qStavke.Next;
  end;
  qStavke.ApplyUpdates;
  qStavke.First;
  qSumaNeto.Active:=false;
  qSumaNeto.ParamByName('rbr').AsInteger:=qZaglavljerbr.AsInteger;
  qSumaNeto.Active:=true;
end;

procedure TfObracuni.Button1Click(Sender: TObject);
var
  pocetak:TRangeBegin;
  kraj:TrangeEnd;
begin

  rptPojedinacno.LoadFromFile('listaObracun.lrf');
  rptPojedinacno.ShowReport;

end;

procedure TfObracuni.cyAdvPanel2Click(Sender: TObject);
begin

end;

procedure TfObracuni.DBGrid1ColEnter(Sender: TObject);
begin
end;

procedure TfObracuni.DBGrid1ColExit(Sender: TObject);
begin

end;

procedure TfObracuni.DBGrid1KeyPress(Sender: TObject; var Key: char);
begin

end;

procedure TfObracuni.dtOdDanaExit(Sender: TObject);
begin
  qStavke.Edit;
  qStavkesati.AsInteger:=daysBetween(dtDoDana.Field.AsDateTime,dtOdDana.Field.AsDateTime)+1;;
end;



procedure TfObracuni.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);

begin
end ;
procedure TfObracuni.qZaglavljeNewRecord(DataSet: TDataSet);
begin
  qZaglavljedatum.AsDateTime:=date;
  qZaglavljedatumPocetka.AsDateTime:=date;
  qZaglavljedatumZavrsetka.AsDateTime:=date;
  qZaglavljedatumIzdavanja.AsDateTime:=date;
  qZaglavljeprocenatZadruge.AsCurrency:=qParametriadminTroskovi.AsCurrency;
  qZaglavljeosnovicaObracuna.AsCurrency:=qParametriosnovica.AsCurrency;
  qZaglavljePIO.AsCurrency:=qParametriPIO.AsCurrency;
  qZaglavljezdravstvo.AsCurrency:=qParametrizdravstvo.AsCurrency;
  qZaglavljePorez.AsCurrency:=qParametriporez.AsCurrency;
end;


end.

