unit StrBox;
{$N+}
interface

uses
  //MathBox, 
  Math, SysUtils, Winprocs, WinTypes, Classes, ComCtrls, Variants {, ppRichTx};

const
  CR = #13#10;
  CP_NONE = 'ccsdzCCSDZ';
  CP_1250 = 'ËÊöû»∆ä–é';
  CP_YUSCI = '~}{|`^][\@';
  CP_852 = '~}{|`^][\@';
  CP_RIDDLE = 'üÜÁ–ß¨èÊ—¶';
  CP_ZOP = '!!!!!ß©•®°'; //
  CP_ZOP1 = '!!!!!!™¶!!'; // öiroke moguÊnosti za svako slovo posebno

type
  TReplaceFlagsEnh = set of (rfReplaceAllEnh, rfIgnoreCaseEnh, rfWholeWordsEnh);

type
  Str12 = string[12];
  DirStr = string[67];
  PathStr = string[79];
  NameStr = string[8];
  ExtStr = string[4];
  pStrings = ^TStrings;
function IsNumber(Ch: Char): Boolean;
function ReverseStr(s: string): string;

{
function Address2Str(Addr: Pointer): string;
procedure IncPtr(var pPtr: Pointer; const i: integer);
function AddBackSlash(S: string): string;
function CleanString(S: string): string;
function GetFirstWord(S: string): string;
function GetFirstToken(S: string; Token: Char): string;
function GetHexWord(w: Word): string;
function GetLastToken(S: string; Token: Char): string;
function LeftSet(src: string; Width: Integer; var Trunc: Boolean): string;
function ReplaceChars(S: string; OldCh, NewCh: Char): string;
function RightCharSet(Src: string; Width: Integer;
  Ch: Char; var Trunc: Boolean): string;
function RemoveFirstWord(var S: string): string;
function ReplaceString(NewStr, ReplaceStr, Data: string): string;
function Shorten(S: string; Cut: Integer): string;
procedure SplitDirName(Path: PathStr; var Dir: DirStr; var WName: Str12);
function StripBlanks(S: string): string;
function StripEndChars(S: string; Ch: Char): string;
function StripFirstWord(S: string): string;
function StripFirstToken(S: string; Ch: Char): string;
function StripFrontChars(S: string; Ch: Char): string;
function StripFromFront(S: string; Len: Integer): string;
function StripLastToken(S: string; Token: Char): string;
}

// Ovo sto sledi je Dule ...
function StrTran(s: string; sSearch: string; sReplace: string): string;
//function  StrToReal         (MyString : String): Real;
function StrReplicate(s: string; iRepl: Integer): string;
function StrToCurrF(s: string): Currency;
procedure ReplaceInStrings(pS: pStrings; sSearch: string; sReplace: string);
procedure StringToStringList(var s: string; var List: TStringList);
procedure DeleteEmptyStrings(sList: TStringList);
function StrCPConvert(s: string; sCP_Source, sCP_Dest: string): string;
function IsDigit(s: string): Boolean;
function VarToStrN(v: Variant): string;
//function  ReplaceRichText   (RichEdit: TppRichText;     sSearch, sReplace: String): String; overload;
// ako ovo bude nekad trebalo prebaciti u drugi unit, jer ovako kad nije potrebno poveca exe za 0.5 MB!
function ReplaceRichText(RichEdit: TCustomRichEdit; sSearch, sReplace: string): string; overload;
function IsStringInList(List: TStringList; s: string): Boolean;
function StreamToString(Stream: TStream): string;
procedure StringToStream(s: string; Stream: TStream);
function AreStringsSame(StringsA, StringsB: TstringList; IgnoreCase: Boolean = True; IgnoreBlankLines: Boolean = True): Boolean;
procedure StringToTrimStringList(s: string; var List: TStringList);
function StringReplaceEnh(const S, OldPattern, NewPattern: string; Flags: TReplaceFlagsEnh): string;
procedure ReplaceInStringsEnh(List: TStringList; const OldPattern, NewPattern: string; Flags: TReplaceFlagsEnh);
function NewGUID: string;

implementation

(*
function Address2Str(Addr: Pointer): string;
begin
  Result := Format('%p', [Addr]);
end;

procedure IncPtr(var pPtr: Pointer; const i: integer);
var
  ptrByte: Pointer;
begin
  ptrByte := pPtr;
  asm
  mov eax, [longint ptr ptrByte];
  add eax, i;
  mov longint ptr ptrByte, eax;
  end;
  pPtr := ptrByte;
end;

function AddBackSlash(S: string): string;
var
  Temp: string;
begin
  Temp := S;
  if S[Length(Temp)] <> '\' then
    Temp := Temp + '\';
  AddBackSlash := Temp;
end;

{----------------------------------------------------
       Name: CleanString function
Declaration: CleanString(S: String): string;
       Unit: StrBox
       Code: S
       Date: 05/05/94
Description: Erase blanks from end and beginning of
             a string
-----------------------------------------------------}

function CleanString(S: string): string;
var
  Temp: string;
begin
  Temp := '';
  if Length(S) <> 0 then begin
    Temp := StripFrontChars(S, #32);
    Temp := StripBlanks(Temp);
  end;
  CleanString := Temp;
end;

{----------------------------------------------------
       Name: GetFirstWord function
Declaration: GetFirstWord(var S: string): string;
       Unit: StrBox
       Code: S
       Date: 05/02/94
Description: Get the first word from a string
-----------------------------------------------------}

function GetFirstWord(S: string): string;
var
  i: Integer;
  S1: string;
begin
  i := 1;
  while (S[i] <> ' ') and (i < Length(S)) do begin
    S1[i] := S[i];
    Inc(i);
  end;
  Dec(i);
  SetLength(S1, i);
  GetFirstWord := S1;
end;

function GetHexWord(w: Word): string;
const
  HexChars: array[0..$F] of Char = '0123456789ABCDEF';
var
  Addr: string;
begin
  Addr[1] := hexChars[Hi(w) shr 4];
  Addr[2] := hexChars[Hi(w) and $F];
  Addr[3] := hexChars[Lo(w) shr 4];
  Addr[4] := hexChars[Lo(w) and $F];
  SetLength(Addr, 4);
  GetHexWord := addr;
end;

function GetFirstToken(S: string; Token: Char): string;
var
  Temp: string;
  Index: INteger;
begin
  Index := Pos(Token, S);
  if Index < 1 then begin
    GetFirstToken := '';
    Exit;
  end;
  Dec(Index);
  SetLength(Temp, Index);
  Move(S[1], Temp[1], Index);
  GetFirstToken := Temp;
end;

{ Get the last part of a string, from a token onward.
  Given "Sam.Txt", and "." as a token, this returns "Txt" }

function GetLastToken(S: string; Token: Char): string;
var
  Temp: string;
  Index: INteger;
begin
  S := ReverseStr(S);
  Index := Pos(Token, S);
  if Index < 1 then begin
    GetLastToken := '';
    Exit;
  end;
  Dec(Index);
  SetLength(Temp, Index);
  Move(S[1], Temp[1], Index);
  GetLastToken := ReverseStr(Temp);
end;

{----------------------------------------------------
       Name: LeftSet function
Declaration: LeftSet(src: string; Width: Integer;
                     var Trunc: Boolean): string;
       Unit: StrBox
       Code: S
       Date: 03/01/94
Description: Pad a string on the left
-----------------------------------------------------}

function LeftSet(src: string; Width: Integer; var Trunc: Boolean): string;
var
  I: Integer;
  Temp: string[80];
begin
  Trunc := False;
  Temp := src;
  if (Length(Temp) > Width) and (Width > 0) then begin
    Temp[0] := CHR(Width);
    Trunc := True;
  end else
    for i := Length(Temp) to width do
      Temp := Temp + ' ';
  LeftSet := Temp;
end;

{----------------------------------------------------
       Name: RemoveFirstWord function
Declaration: RemoveFirstWord(var S : String) : String;
       Unit: StrBox
       Code: S
       Date: 03/02/94
Description: Strip the first word from a sentence,
             return word and a shortened sentence.
             Return an empty string if there is no
             first word.
-----------------------------------------------------}

function RemoveFirstWord(var S: string): string;
var
  i, Size: Integer;
  S1: string;
begin
  i := Pos(#32, S);
  if i = 0 then begin
    RemoveFirstWord := '';
    Exit;
  end;
  SetLength(S1, i);
  Move(S[1], S1[1], i);
  SetLength(S1, i - 1);
  Size := (Length(S) - i);
  Move(S[i + 1], S[1], Size);
  SetLength(S, Size);
  RemoveFirstWord := S1;
end;

{----------------------------------------------------
       Name: ReplaceString
Declaration: ReplaceString(NewStr, ReplaceStr, Data: string): string;
       Unit: StrBox
       Code: S
       Date: 06/06/95
Description: Given a long string, replace one substring with another.
             Take the string: "Football Delight"
             The job is to replace the word Delight with Night:
             S := ReplaceString(Night, Delight, 'Football Delight');
             where S ends up equaling "Football Night';
-----------------------------------------------------}

function ReplaceString(NewStr, ReplaceStr, Data: string): string;
var
  OffSet: Integer;
begin
  OffSet := Pos(ReplaceStr, Data);
  Delete(Data, OffSet, Length(ReplaceStr));
  Insert(NewStr, Data, OffSet);
  Result := Data;
end;

function ReplaceChars(S: string; OldCh, NewCh: Char): string;
var
  Len: Integer;
  i: Integer;
begin
  Len := Length(S);
  for i := 1 to Len do
    if S[i] = OldCh then
      S[i] := NewCh;
  Result := S;
end;

function RightCharSet(Src: string; Width: Integer;
  Ch: Char; var Trunc: Boolean): string;
var
  I: Integer;
  Temp: string[80];
begin
  Trunc := False;
  Temp := Src;
  if (Length(Temp) > Width) and (Width > 0) then begin
    Temp[0] := CHR(Width);
    Trunc := True;
  end else
    for i := Length(Temp) to (width - 1) do
      Temp := Ch + Temp;
  RightCharSet := Temp;
end;

function Shorten(S: string; Cut: Integer): string;
begin
  SetLength(S, Length(S) - Cut);
  Shorten := S;
end;

procedure SplitDirName(Path: PathStr; var Dir: DirStr; var WName: Str12);
begin
  Dir := ExtractFilePath(Path);
  WName := ExtractFileName(Path);
end;
{
procedure SplitDirName(Path : PathStr; var Dir: DirStr; var WName: Str12);
begin
  FSplit(Path, Dir, Name, Ext);
  WName := ExtractFileName(Path);
end;
}

{----------------------------------------------------
       Name: StripBlanks function
Declaration: function StripBlanks(var S: string): String;
       Unit: StrBox
       Code: S
       Date: 03/02/94
Description: Strip any stray spaces from the end of
             a string
-----------------------------------------------------}

function StripBlanks(S: string): string;
var
  i: Integer;
begin
  i := Length(S);
  while (Length(S) <= i) and (Length(S) > 0) and (S[i] = ' ') do begin
    Delete(S, i, 1);
    Dec(i);
  end;
  StripBlanks := S;
end;

function StripEndChars(S: string; Ch: Char): string;
var
  i: Integer;
begin
  i := Length(S);
  while (length(S) > 0) and (S[i] = Ch) do begin
    Delete(S, i, 1);
    Dec(i);
  end;
  StripEndChars := S;
end;

function StripFirstToken(S: string; Ch: Char): string;
var
  i, Size: Integer;
begin
  i := Pos(Ch, S);
  if i = 0 then begin
    StripFirstToken := S;
    Exit;
  end;
  Size := (Length(S) - i);
  Move(S[i + 1], S[1], Size);
  SetLength(S, Size);
  StripFirstToken := S;
end;

{----------------------------------------------------
       Name: StripFirstWord function
Declaration: StripFirstWord(S : string) : string;
       Unit: StrBox
       Code: S
       Date: 03/02/94
Description: Strip the first word from a sentence,
             return the shortened sentence. Return original
             string if there is no first word.
-----------------------------------------------------}

function StripFirstWord(S: string): string;
var
  i, Size: Integer;
begin
  i := Pos(#32, S);
  if i = 0 then begin
    StripFirstWord := S;
    Exit;
  end;
  Size := (Length(S) - i);
  Move(S[i + 1], S[1], Size);
  SetLength(S, Size);
  StripFirstWord := S;
end;

{----------------------------------------------------
       Name: StripFrontChars function
Declaration: StripFrontChars(S: string; Ch: Char) : String;
       Unit: StrBox
       Code: S
       Date: 03/02/94
Description: Strips any occurances of charact Ch that
             might precede a string.
-----------------------------------------------------}

function StripFrontChars(S: string; Ch: Char): string;
begin
  while (Length(S) > 0) and (S[1] = Ch) do
    S := Copy(S, 2, Length(S) - 1);
  StripFrontChars := S;
end;

function StripFromFront(S: string; Len: Integer): string;
begin
  S := ReverseStr(S);
  S := Shorten(S, Len);
  S := ReverseStr(S);
  StripFromFront := S;
end;

{----------------------------------------------------
       Name: StripLastToken function
Declaration: function RemoveLastToken(var S: String): String;
       Unit: StrBox
       Code: S
       Date: 03/02/94
Description: Given a string like "c:\sam\file.txt"
             This returns: "c:\sam"
             But not specific to files any token will do
-----------------------------------------------------}

function StripLastToken(S: string; Token: Char): string;
var
  Temp: string;
  Index: INteger;
begin
  SetLength(Temp, Length(S));
  S := ReverseStr(S);
  Index := Pos(Token, S);
  Inc(Index);
  Move(S[Index], Temp[1], Length(S) - (Index - 1));
  SetLength(Temp, Length(S) - (Index - 1));
  StripLastToken := ReverseStr(Temp);
end;
*)

function IsNumber(Ch: Char): Boolean;
begin
  IsNumber := ((Ch >= '0') and (Ch <= '9'));
end;

function ReverseStr(s: string): string;
var
  Len: Integer;
  i, j: Integer;
begin
  Len := Length(S);
  SetLength(Result, Len);
  j := Len;
  for i := 1 to Len do
  begin
    Result[i] := S[j];
    dec(j);
  end;
end;

{----------------------------------------------------------------------------------
 Dule.
 ----------------------------------------------------------------------------------}

function StrTran(s: string; sSearch: string; sReplace: string): string;

var
  iPos: Integer;
  iLength: Integer;
begin
  iLength := Length(sSearch);
  Result := '';
  while True do
  begin
    iPos := Pos(sSearch, s);
    if iPos = 0 then
    begin
      Result := Result + s;
      exit;
    end;
    Delete(s, iPos, iLength);
    Result := Result + Copy(s, 1, iPos - 1) + sReplace;
    s := Copy(s, iPos, Length(s));
  end;
end;

{
function StrToReal (MyString : String): Real;
begin
  Result := StrToCurr(MyString);
end;
}
{
var
   ErrCode: Integer;
   Temp:    Real;
begin
  if (Length (MyString) = 0) then
    Result := 0
  else
    begin
      MyString := StrTran (MyString, ThousandSeparator, '');
      begin
        Val (MyString, Temp, ErrCode);
        if ErrCode = 0 then
          Result := Temp
        else
          raise Exception.Create('Brboje');
      end;
    end;
end;
}

function StrReplicate(s: string; iRepl: Integer): string;

var
  i: Integer;
begin
  Result := '';
  for i := 1 to iRepl do
    Result := Result + s;
end;

procedure ReplaceInStrings(pS: pStrings; sSearch: string; sReplace: string);

var
  i: Integer;
begin
  with pS^ do
  begin
    for i := 0 to (Count - 1) do
      Strings[i] := StrTran(Strings[i], sSearch, sReplace);
  end;
end;

procedure StringToStringList(var s: string; var List: TStringList);

{
var
  iPos13: Integer;
  iPos10: Integer;
  iPos: Integer;
  sRed: string;
  PCh: PChar;
}
begin
  //  PCh := s;
  s := AdjustLineBreaks(s);
  List.Text := s;
  {
  repeat
    iPos13 := Pos(#13, s);
    iPos10 := Pos(#10, s);
    if (iPos13 <> 0) and (iPos10 <> 0) then
      iPos := Min(iPos10, iPos13)
    else if (iPos13 <> 0) then
      iPos := iPos13
    else if (iPos10 <> 0) then
      iPos := iPos10
    else
      iPos := 0;
    if iPos <> 0 then
      sRed := Copy(s, 1, iPos)
    else
      sRed := s;
    sRed := StrTran(sRed, #10, '');
    sRed := StrTran(sRed, #13, '');
    if (iPos13 <> 0) and (iPos10 <> 0) and (Abs(iPos13 - iPos10) = 1) then
      s := Copy(s, iPos + 2, Length(s)) // dodato...
    else
      s := Copy(s, iPos + 1, Length(s));
    sList.Add(sRed);
  until iPos = 0;
  }
end;

procedure StringToTrimStringList(s: string; var List: TStringList);
var
  Line: string;
begin
  StringToStringList(s, List);
  with List do
  begin
    while True do
    begin
      if (Count > 0) then
      begin
        Line := Trim(Strings[0]);
        if (Line = '') then
          Delete(0)
        else
          Break;
      end
      else
        Break;
    end;
    while True do
    begin
      if (Count > 0) then
      begin
        Line := Trim(Strings[Count - 1]);
        if (Line = '') then
          Delete(Count - 1)
        else
          Break;
      end
      else
        Break;
    end;
  end;
end;

procedure DeleteEmptyStrings(sList: TStringList);

var
  i: Integer;
begin
  for i := sList.Count - 1 downto 0 do
    if Trim(sList[i]) = '' then
      sList.Delete(i);
end;

function StrCPConvert(s: string; sCP_Source, sCP_Dest: string): string;

var
  IntegerList: TList;
  pInteger: ^Integer;

  function PositionChanged(iPos: Integer): Boolean;

  var
    i: Integer;
  begin
    Result := False;
    with IntegerList do
    begin
      for i := 0 to (Count - 1) do
      begin
        pInteger := IntegerList.Items[i];
        if (pInteger^ = iPos) then
          Result := True;
      end;
    end;
  end;

  function StrTran(s: string; sSearch: string; sReplace: string): string;

  var
    iPos: Integer;
    iAbsPos: Integer;
    iLength: Integer;
  begin
    iLength := Length(sSearch);
    Result := '';
    iAbsPos := 0;
    while True do
    begin
      iPos := Pos(sSearch, s);
      Inc(iAbsPos, iPos);
      if ((iPos = 0) or PositionChanged(iAbsPos)) then
      begin
        Result := Result + s;
        exit;
      end;
      New(pInteger);
      pInteger^ := iAbsPos;
      IntegerList.Add(pInteger);
      Delete(s, iPos, iLength);
      Result := Result + Copy(s, 1, iPos - 1) + sReplace;
      s := Copy(s, iPos, Length(s));
    end;
  end;

var
  i: Integer;
begin
  IntegerList := TList.Create;
  Result := s;
  for i := 1 to 10 do
    Result := StrTran(Result, sCP_Source[i], sCP_Dest[i]);
  IntegerList.Free;
end;

{---------------------------------------------------------------------
 pretvara string sa ThousandSeparator karakterom u Currency
----------------------------------------------------------------------}

function StrToCurrF(s: string): Currency;
var
  i: integer;
begin
  if s = '' then
  begin
    Result := 0;
    Exit;
  end;
  i := Pos(ThousandSeparator, s);
  while i <> 0 do
  begin
    Delete(s, i, 1);
    i := Pos(ThousandSeparator, s);
  end;
  Result := StrToCurr(s);
end;

function IsDigit(s: string): Boolean;

var
  i: Integer;
begin
  if Length(s) = 0 then
  begin
    Result := False;
    Exit;
  end;
  Result := True;
  for i := 1 to Length(s) do
  begin
    if not IsNumber(s[i]) then
    begin
      Result := False;
      Exit;
    end;
  end;
end;

function VarToStrN(v: Variant): string;

begin
  if (v = null) then
    Result := ''
  else
    Result := v;
end;

function ReplaceRichText(RichEdit: TCustomRichEdit; sSearch, sReplace: string): string;

var
  iFoundPos,
    iLength: Integer;
begin
  iFoundPos := 0;
  iLength := Length(sSearch);
  with RichEdit do
  begin
    while True do
    begin
      iFoundPos := FindText(sSearch, iFoundPos, 100000, []);
      if (iFoundPos = -1) then
        Exit;
      SelStart := iFoundPos;
      SelLength := iLength;
      SelText := sReplace;
    end;
  end;
end;

{
function ReplaceRichText(RichEdit: TppRichText; sSearch, sReplace: String): String;
var iFoundPos,
    iLength:        Integer;
begin
  iFoundPos := 0;
  iLength   := Length(sSearch);
  with RichEdit do
  begin
    while True do
    begin
      iFoundPos := FindText(sSearch, iFoundPos, 100000, []);
      if (iFoundPos = -1) then
        Exit;
      SelStart  := iFoundPos;
      SelLength := iLength;
      SelText   := sReplace;
    end;
  end;
end;
}

function IsStringInList(List: TStringList; s: string): Boolean;

var
  i: Integer;
begin
  Result := False;
  with List do
  begin
    for i := 0 to (Count - 1) do
    begin
      if s = Strings[i] then
      begin
        Result := True;
        Exit;
      end;
    end;
  end;
end;

const
  BLOCKSIZE = $FFFF;

function StreamToString(Stream: TStream): string;

var
  i, j: Integer;
  iRemainder: Integer;
  iBlocks: Integer;
  iSize: Integer;
  Block: array[1..BLOCKSIZE] of Char;
begin
  with Stream do
  begin
    SetLength(Result, Size);
    iBlocks := Size div BLOCKSIZE;
    iRemainder := Size mod BLOCKSIZE;
    for i := 0 to (iBlocks) do
    begin
      if (i = iBlocks) then
        iSize := iRemainder
      else
        iSize := BLOCKSIZE;
      Read(Block, iSize);
      for j := 1 to iSize do
        Result[i * BLOCKSIZE + j] := Block[j];
    end;
  end;
end;

procedure StringToStream(s: string; Stream: TStream);

var
  i, j: Integer;
  iRemainder: Integer;
  iBlocks: Integer;
  iSize: Integer;
  iLength: Integer;
  Block: array[1..BLOCKSIZE] of Char;
begin
  with Stream do
  begin
    iLength := Length(s);
    iBlocks := iLength div BLOCKSIZE;
    iRemainder := iLength mod BLOCKSIZE;
    for i := 0 to (iBlocks) do
    begin
      if (i = iBlocks) then
        iSize := iRemainder
      else
        iSize := BLOCKSIZE;
      for j := 1 to iSize do
        Block[j] := s[i * BLOCKSIZE + j];
      Write(Block, iSize);
    end;
    Position := 0;
  end;
end;

function AreStringsSame(StringsA, StringsB: TstringList; IgnoreCase: Boolean = True; IgnoreBlankLines: Boolean = True): Boolean;

  function CompareStrings(Strings0, Strings1: TStringList): Boolean;

  var
    i: Integer;
    s0, s1: string;
  begin
    Result := True;
    if (Strings0.Count <> Strings1.Count) then
      Result := False
    else
    begin
      for i := 0 to (Strings0.Count - 1) do
      begin
        if IgnoreCase then
        begin
          s0 := LowerCase(Strings0[i]);
          s1 := LowerCase(Strings1[i]);
        end
        else
        begin
          s0 := Strings0[i];
          s1 := Strings1[i];
        end;
        if (s0 <> s1) then
        begin
          Result := False;
          Break
        end;
      end;
    end;
  end;

var
  TmpA: TStringList;
  TmpB: TStringList;
begin
  if IgnoreBlankLines then
  begin
    TmpA := TStringList.Create;
    TmpB := TStringList.Create;
    TmpA.AddStrings(StringsA);
    TmpB.AddStrings(StringsB);
    DeleteEmptyStrings(TmpA);
    DeleteEmptyStrings(TmpB);
    Result := CompareStrings(TmpA, TmpB);
    TmpA.Free;
    TmpB.Free;
  end
  else
    Result := CompareStrings(StringsA, StringsB);
end;

function StringReplaceEnh(const S, OldPattern, NewPattern: string; Flags: TReplaceFlagsEnh): string;

const
  IdentifierChars = ['a'..'z'] + ['A'..'Z'] + ['_'] + ['0'..'9'];
var
  SearchStr, Patt, NewStr: string;
  Offset: Integer;
  WholeWord: Boolean;
  ChStart: char;
  ChEnd: char;
begin
  if rfIgnoreCaseEnh in Flags then
  begin
    SearchStr := AnsiUpperCase(S);
    Patt := AnsiUpperCase(OldPattern);
  end
  else
  begin
    SearchStr := S;
    Patt := OldPattern;
  end;
  NewStr := S;
  Result := '';
  while SearchStr <> '' do
  begin
    Offset := AnsiPos(Patt, SearchStr);
    if Offset = 0 then
    begin
      Result := Result + NewStr;
      Break;
    end;
    if rfWholeWordsEnh in Flags then
    begin
      WholeWord := True;
      if (Offset > 1) then
      begin
        ChStart := SearchStr[OffSet - 1];
        WholeWord := not (ChStart in IdentifierChars);
      end;
      ChEnd := SearchStr[OffSet + Length(Patt)];
      if ((Offset + Length(Patt)) <= Length(SearchStr)) then
        WholeWord := WholeWord and (not (ChEnd in IdentifierChars));
      if WholeWord then
      begin
        Result := Result + Copy(NewStr, 1, Offset - 1) + NewPattern;
        NewStr := Copy(NewStr, Offset + Length(OldPattern), MaxInt);
      end
      else
      begin
        Result := Result + Copy(NewStr, 1, Offset - 1 + Length(OldPattern));
        NewStr := Copy(NewStr, Offset + Length(OldPattern), MaxInt);
      end;
    end
    else
    begin
      Result := Result + Copy(NewStr, 1, Offset - 1) + NewPattern;
      NewStr := Copy(NewStr, Offset + Length(OldPattern), MaxInt);
    end;
    if not (rfReplaceAllEnh in Flags) then
    begin
      Result := Result + NewStr;
      Break;
    end;
    SearchStr := Copy(SearchStr, Offset + Length(Patt), MaxInt);
  end;
end;

procedure ReplaceInStringsEnh(List: TStringList; const OldPattern, NewPattern: string; Flags: TReplaceFlagsEnh);
var
  i: Integer;
begin
  for i := 0 to (List.Count - 1) do
    List[i] := StringReplaceEnh(List[i], OldPattern, NewPattern, Flags);
end;

function NewGUID: string;

var
  Dummy: array[0..3] of LongWord;
  i: Integer;
begin
  Randomize;
  for i := 0 to 3 do
    Dummy[i] := Random(4294967295);
  Result := GUIDToString(TGUID(Dummy));
end;

end.

