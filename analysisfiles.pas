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

type NTFS_VOLUME_CONTEXT=record
hvolume:	THANDLE;
sectorsize:	cardinal; // Двоичный логарифм длины сектора
clustersize:	cardinal; // Двоичный логарифм длины кластера
mft_begin:array[0..1] of 	DWORD;
mft_record_size:	DWORD; // Двоичный логарифм размера записи MFT
index_block_size:	DWORD; // Размер блока индекса в байтах
 mft_cache:	BYTE;
 indexdata:	BYTE;
UpCase:	WCHAR;
cacheline:array[0..1] of 	DWORD;
volumesize:	cardinal;
mft_fragments:	cardinal; // Количество фрагментов MFT
mft_fragment_lens:array[0..63] of  	DWORD;
mft_fragment_offsets:array[0..63] of 	DWORD;   // Считаем, что фрагментов MFT меньше 32
end;
type TPMyPointer = ^MFT_REF;
  type clasters1= array [0..23] of  dword;
 type  ppointer= array [0..25] of  NTFS_VOLUME_CONTEXT;
 type Tanalysisfiles = class(TThread)
 
  private

    exMFT_REF:MFT_REF  ; found,found1:integer;

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
 //f                   unction Get_MFT_EntryForPath (path : PWideChar; pathlen:Integer; var exMFT_REF: MFT_REF{PMFT_RECORD}) : DWord; stdcall; external 'ntfs.dll';
  function Get_MFT_EntryForPath (var pcontext: NTFS_VOLUME_CONTEXT; var path : PWideChar;  pathlen:integer;  exMFT_REF: TPMyPointer) : DWord; stdcall; external 'ntfs.dll';
  function GetFileClusters(var context:NTFS_VOLUME_CONTEXT; var fileref:TPMyPointer; var buflen:DWORD; var lcn_len_pairs:clasters1):DWord; stdcall; external 'ntfs.dll';


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

  s,	fmt :pwidechar; s2,s3:string;
  iSize: integer;
    context:ppointer;
    inputlen:integer; written :DWORD;
     letter :char;
     read,i,ii,j:dword;
    clusters: clasters1;
    Myrec:TPMyPointer;
    //var PInt: ^Integer;
begin
 MainForm.memo2.Clear;
 i:=0;   Myrec:=@exMFT_REF;
       while (not Terminated) and (i<length(mainform._maspath))  do
        begin
          s:=   StringToPWide(mainform._maspath[i],iSize);
              s3:=' путь'+' '+mainform._maspath[i];
               s2:='';
           s2:=s2+mainform._maspath[i][1];
           if (s2[1] >= 'a') and  (s2[1] <= 'z') then  letter :=Chr(Ord(letter) - 32);
         //     showmessage(inttostr(ord(s2[1])-ord('A')));
         // mainform.memo2.Lines.Add(s);
         inputlen:=-1;
      //   context[ord(s2[1])-ord('A')]:=null;
          found:=Get_MFT_EntryForPath (context[ord(mainform._maspath[i][1])-ord('A')],s, inputlen, Myrec);
       mainform.memo2.Lines.Add(mainform._maspath[i]+' '+inttostr(found)+' '+inttostr(context[ord(s2[1])-ord('A')].clustersize)+' '+inttostr(Myrec.indexHigh)+' '+inttostr(Myrec.ordinal));

 //  sleep(100);
          if found=0 then
          begin
         // letter:=s[0];
         read:=8;

  //if (s2[1] >= 'a') and  (s2[1] <= 'z') then  letter :=Chr(Ord(letter) - 32);
 // mainform.memo2.Lines.Add(s3+' '+s2[1]+' '+inttostr(context[ord(s2[1])-ord('A')].sectorsize) );
         // mainform.memo2.Lines.Add(mainform._maspath[i]+' '+inttostr(found)+' '+inttostr(exMFT_REF.indexLow)+' '+inttostr(exMFT_REF.indexHigh)+' '+inttostr(exMFT_REF.ordinal));
found1 := GetFileClusters(context[ord(s2[1])-ord('A')], Myrec, read, clusters);


    {  written:= 0;
		  mainform.memo2.Lines.Add('File fragments:');
      j:=0;

			for  ii:= 0 to read-1 do
      begin
   //     if (clusters[j + 1] = 0) then


	 //		fmt:= '%x%08x';

				mainform.memo2.Lines.Add('Start cluster : '+ inttostr(clusters[j + 1]));
        j:=j+3;
		 //		WriteConsoleW(consoleOut, L", length: ", sizeof(L", length: ")/2-1, &written, 0);
		 //		buffer[written = wsprintfW(buffer, L"%08x\r\n", clusters[j + 2])] = 0;
		 //		WriteConsoleW(consoleOut, buffer, written, &written, 0);
		    end;   }


          end
          else      mainform.memo2.Lines.Add (mainform._maspath[i]+' '+'не найдено')  ;
          updateprogress;
          inc(i);
        end;
 mainform.flaganaliza:=false;
 mainform.ProgressBar4.Position:=0;

end;

{ TMoveThread }
end.

