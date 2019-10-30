unit Analysisthds;


interface

uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs;

type  MFT_REF = Packed Record
    indexLow: dword;
    indexHigh: word;
    ordinal: word;
  end;
 type  FILE_FRAGMENT = Packed Record
      lcnLow: dword;
      lcnHigh: dword;
      count: dword;
  end;


  PMFT_RECORD=^MFT_REF;
  PFILE_FRAGMENT=^FILE_FRAGMENT;
  PPointer = ^pointer;

 type TAnalysisthds = class(TThread)

  private

    exMFT_REF:MFT_REF  ; found,found1:integer;

    { Private declarations }


  
  protected
    procedure Execute; override;
  public
    Procedure updateprogress;
    constructor Create();
    function StringToPWide(sStr: string; var iNewSize: integer): PWideChar;
     procedure clearcontext();
  end;

implementation
uses  MainUnit;
//������ � �����������     ntfs.dll
 //f                   unction Get_MFT_EntryForPath (path : PWideChar; pathlen:Integer; var exMFT_REF: MFT_REF{PMFT_RECORD}) : DWord; stdcall; external 'ntfs.dll';
var  s:pwidechar;  // ����
  cindex: DWORD;// index of disk context
  found:integer;
  exMFT_REF:MFT_REF; // ����� ������
  fragments:PFILE_FRAGMENT;  // �������
  i:integer;    // ��� �����
  count:cardinal;   // ���������� ��������
    pcontext:array[0..25] of pointer; // �������� �����
  buflen:DWORD;  // ���������� ��������
  mass:PDWORD;   // ������ ��������

 function Get_MFT_EntryForPath (pcontext: PPointer; path : PWideChar; pathlen:Integer; found1: PMFT_RECORD) : DWord; stdcall; external 'ntfs.dll';
function GetFileClusters(context:pointer; fileref:MFT_REF; buflen:PDWORD; lcn_len_pairs:PDWORD):DWord; stdcall; external 'ntfs.dll';
function FreeNTFSContext(context:pointer):DWord; stdcall; external 'ntfs.dll';

 function TAnalysisthds.StringToPWide(sStr: string; var iNewSize: integer): PWideChar;
 
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

  constructor TAnalysisthds.Create();
    begin
      inherited Create(False);
    end;

Procedure TAnalysisthds.updateprogress;
begin
  MainUnit.MainForm.ProgressBar4.Position:=MainUnit.MainForm.ProgressBar4.Position+1;
end;

procedure TAnalysisthds.Execute;
  var i,ii,p,k:dword;
  custRecPtr : PMFT_RECORD;
  exMFT_REF1:MFT_REF;
  iSize: integer;  stemp,stek:string;
  nrec, nfirst:int64;
begin
 //MainForm.memo2.Clear;
 p:=0;
    while (not Terminated) and (p<length(mainform._maspath))  do
     begin
         if   Terminated then exit;

 New(custRecptr);
    custRecPtr:=@exMFT_REF1;
buflen:=50;  // ���������� ��������
s:= StringToPWide(mainform._maspath[p],iSize);
if  fileexists(s)    then
begin
cindex:=DWORD(s[0]); // �� ����� �����
cindex:=cindex or 32;// ���������� ��������� ����� � ������� ��������
cindex :=cindex - $61; {cindex=lowcase(s[0])-'a'}  //���������� ������� � 'a'

if (cindex<26) then
begin    // ���� ������ � ��������� A..Z
GetMem(mass, sizeof(DWORD)*3*50); // �������� ������ ��� 50 ��������
// �������� ������� ����� pcontext[cindex]
found:=Get_MFT_EntryForPath (@pcontext[cindex], s, -1, custRecptr);
mainform.memo2.Lines.Add(mainform._maspath[p]);
nrec:=(custRecptr.indexHigh shl 32) + custRecptr.indexLow;
 // mainform.memo2.Lines.Add('����� ������ = ' + inttostr(custRecptr.indexLow));

     mainform.memo2.Lines.Add('����� ������ = ' + inttostr(nrec));
found:=GetFileClusters(pcontext[cindex],exMFT_REF1,@buflen,mass);   // ���� buflen ������, ��� 50 (��� ������� � GetMem ����)
if (found=0) and (GetLastError()=ERROR_INSUFFICIENT_BUFFER) then
begin
	FreeMem(mass);
	GetMem(mass, sizeof(DWORD)*3*buflen);
	found:=GetFileClusters(pcontext[cindex],exMFT_REF1,@buflen,mass);
end;

count:=buflen;
if (buflen = 0) then   mainform.memo2.Lines.Add('������� $DATA �����������')
else
begin
mainform.memo2.Lines.Add('�������: ');
    k:=0; stemp:='';
for i:=1 to count do
begin
fragments:=PFILE_FRAGMENT(mass);
if  ((fragments.lcnHigh+fragments.lcnLow) <>0) and  (fragments.count<>0) then
begin
 nfirst:=(fragments.lcnHigh shl 32) + fragments.lcnLow;
//stek:='����� 1-�� �������� = ' + inttostr(fragments.lcnHigh+fragments.lcnLow) +'; ����� � ��������� = ' + inttostr(fragments.count) ;
 stek:='����� 1-�� �������� = ' + inttostr(nfirst) +'; ����� � ��������� = ' + inttostr(fragments.count) ;
 if stek<>stemp then
 begin
    inc(k);
  mainform.memo2.Lines.Add('�'+inttostr(k)+': '
		+stek );
    stemp:=stek;
    end;


        end;
        inc(mass,3);
        dec(count);
        end;

//if (buflen = 0) then   mainform.memo2.Lines.Add('������� $DATA �����������');

dec(mass, buflen*3); // ����� � FreeMem ���������� ��������� �����
FreeMem(mass);
updateprogress;
end; // ���� ������ � A..Z
end;
mainform.memo2.Lines.Add('') ;
inc(p);
end;
end;


 mainform.flaganaliza:=false;
 mainform.ProgressBar4.Position:=0;


end;

{ TMoveThread }
procedure TAnalysisthds.clearcontext;
var k:integer;
begin
for k:=0 to 25 do begin     // �������� ����� ��������� ���������� ��� ���� ��������� ���������
if pcontext[k]<>nil
  then FreeNTFSContext(pcontext[k]);
  end;
end;

end.

