unit analysisfiles; //поток анализа, поиска записей в ntfs

interface

uses
  Classes, Graphics, ExtCtrls, SysUtils, FileCtrl, windows, dialogs ,shellapi;

type  MFT_REF = Packed Record
    indexLow: dword;
    indexHigh: word;
    ordinal: word;
  end;
 type
PMFT_REF = ^MFT_REF;


 type Tanalysisfiles = class(TThread)
  private

    exMFT_REF:MFT_REF  ; found:integer;

    { Private declarations }
  protected
    procedure Execute; override;
  public
    Procedure updateprogress;
    constructor Create();
    function StringToPWide(sStr: string; var iNewSize: integer): PWideChar;
  end;

implementation
uses  MainUnit;
//работа с библиотекой     ntfs.dll
 function Get_MFT_EntryForPath (path : PWideChar; pathlen:Integer; var exMFT_REF: MFT_REF{PMFT_RECORD}) : DWord; stdcall; external 'ntfs.dll';

 function Tanalysisfiles.StringToPWide(sStr: string; var iNewSize: integer): PWideChar;
var
  pw: PWideChar;
  iSize: integer;
begin
  iSize := Length(sStr) + 1;
  iNewSize := iSize * 2;

  pw := AllocMem(iNewSize);

  MultiByteToWideChar(CP_ACP, 0, PChar(sStr), iSize, pw, iNewSize);

  Result := pw;
end;

  constructor Tanalysisfiles.Create();
    begin
      inherited Create(False);
    end;

Procedure Tanalysisfiles.updateprogress;
begin
  MainUnit.MainForm.ProgressBar4.Position:=MainUnit.MainForm.ProgressBar4.Position+1;
end;

procedure Tanalysisfiles.Execute;
var
  I: longint;
  s:pwidechar;
  iSize: integer;
begin
 MainForm.memo2.Clear;
 i:=0;
       while (not Terminated) and (i<length(mainform._maspath))  do
        begin
          s:=   StringToPWide(mainform._maspath[i],iSize);;
          found:=Get_MFT_EntryForPath (s, -1, exMFT_REF);
          mainform.memo2.Lines.Add(mainform._maspath[i]+' '+inttostr(found)+' '+inttostr(exMFT_REF.indexLow)+' '+inttostr(exMFT_REF.indexHigh)+' '+inttostr(exMFT_REF.ordinal));
          updateprogress;
          inc(i);
        end;
 mainform.flaganaliza:=false;
 mainform.ProgressBar4.Position:=0;

end;

{ TMoveThread }
end.

