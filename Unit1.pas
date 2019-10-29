unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);

    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    //procedure Button4Click(Sender: TObject);
   
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  MFT_REF = Packed Record
    indexLow: dword;
    indexHigh: word;
    ordinal: word;
  end;

  FILE_FRAGMENT = Packed Record
      lcnLow: dword;
      lcnHigh: dword;
      count: dword;
  end;

  NTFS_CONTEXT = Packed Record
      hvolume: Thandle;
      letter: dword;
      sectorsize: dword;
      clustersize: dword;
      mft_begin: dword;
      mft_record_size: dword;
      index_block_size: dword;
      mft_data: ^byte;
      mft_stack: ^byte;
      indexdata: ^byte;
      indexdata_stack: ^byte;
      indexdata_vcn: dword;
      dir_fragments: dword;
      max_dir_fragments: dword;
      dir_fragment_offsets: ^dword;
      dir_fragment_lens: ^dword;
      upcase: ^wchar;
      volumesize: dword;
      mft_fragments: dword;
      mft_fragment_lens: dword;
      mft_fragment_offsets: dword;
  end;

  PMFT_RECORD=^MFT_REF;
  PFILE_FRAGMENT=^FILE_FRAGMENT;
  PPointer = ^pointer;
  PNTFS_CONTEXT = NTFS_CONTEXT;

var
  Form1: TForm1;
  s:pwidechar;  // ����
  cindex: DWORD;// index of disk context
  found:integer;
  exMFT_REF:MFT_REF; // ����� ������
  fragments:PFILE_FRAGMENT;  // �������
  i,k:integer;    // ��� �����
  count:cardinal;   // ���������� ��������
  bitlen:dword; // ������ �������

  nrec:int64;   // ����� ������
  nfirst:int64; // ����� ������� ��������

  buflen:DWORD;  // ���������� ��������
  mass:PDWORD;   // ������ ��������
  pcontext:array[0..25] of pointer; // �������� �����

  letter: widechar;
  sec:PNTFS_CONTEXT;

function Get_MFT_EntryForPath (pcontext: PPointer; path : PWideChar; pathlen:Integer; found1: PMFT_RECORD) : DWord; stdcall; external 'ntfs.dll';
function GetFileClusters(context:pointer; fileref:MFT_REF; buflen:PDWORD; lcn_len_pairs:PDWORD):DWord; stdcall; external 'ntfs.dll';
function FreeNTFSContext(context:pointer):DWord; stdcall; external 'ntfs.dll';
function InitNTFSContext(lett: wchar):PNTFS_CONTEXT;stdcall; external 'ntfs.dll';

implementation
{$R *.dfm}
procedure TForm1.FormShow(Sender: TObject);
begin
//close;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin

buflen:=50;  // ���������� ��������
s:='G:\1.txt';
if not fileexists(s)    then exit;
cindex:=DWORD(s[0]); // �� ����� �����
cindex:=cindex or 32;// ���������� ��������� ����� � ������� ��������
cindex :=cindex - $61; {cindex=lowcase(s[0])-'a'}  //���������� ������� � 'a'

if (cindex<26) then begin    // ���� ������ � ��������� A..Z
GetMem(mass, sizeof(DWORD)*3*50); // �������� ������ ��� 50 ��������
// �������� ������� ����� pcontext[cindex]
found:=Get_MFT_EntryForPath (@pcontext[cindex], s, -1, @exMFT_REF);
nrec:=(exMFT_REF.indexHigh shl 32) + exMFT_REF.indexLow;
showmessage('����� ������ = ' + inttostr(nrec));

found:=GetFileClusters(pcontext[cindex],exMFT_REF,@buflen,mass);   // ���� buflen ������, ��� 50 (��� ������� � GetMem ����)
if (found=0) and (GetLastError()=ERROR_INSUFFICIENT_BUFFER) then begin
	FreeMem(mass);
	GetMem(mass, sizeof(DWORD)*3*buflen);
	found:=GetFileClusters(pcontext[cindex],exMFT_REF,@buflen,mass);
end;

count:=buflen;

for i:=1 to count do begin
fragments:=PFILE_FRAGMENT(mass);
nfirst:=(fragments.lcnHigh shl 32) + fragments.lcnLow;
showmessage('�������: ������� �'+inttostr(i)+chr(13)
		+'����� ������� �������� = ' + inttostr(nfirst) + chr(13)
        + '����� � ��������� = ' + inttostr(fragments.count) + chr(13));

        inc(mass,3);
        dec(count);
        end;

if (buflen = 0) then showmessage('������� $DATA �����������');

dec(mass, buflen*3); // ����� � FreeMem ���������� ��������� �����
FreeMem(mass);
end; // ���� ������ � A..Z
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
 for k:=0 to 25 do begin     // �������� ����� ��������� ���������� ��� ���� ��������� ���������
if pcontext[k]<>nil
  then FreeNTFSContext(pcontext[k]);
  end;
close;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  buflen:=50;  // ���������� ��������
s:='D:\��������\vbox\1\Project1.dpr';
if not fileexists(s)    then exit;
cindex:=DWORD(s[0]); // �� ����� �����
cindex:=cindex or 32;// ���������� ��������� ����� � ������� ��������
cindex :=cindex - $61; {cindex=lowcase(s[0])-'a'}  //���������� ������� � 'a'

if (cindex<26) then begin    // ���� ������ � ��������� A..Z
GetMem(mass, sizeof(DWORD)*3*50); // �������� ������ ��� 50 ��������
// �������� ������� ����� pcontext[cindex]
found:=Get_MFT_EntryForPath (@pcontext[cindex], s, -1, @exMFT_REF);
showmessage('����� ������ = ' + inttostr(exMFT_REF.indexHigh+exMFT_REF.indexLow));

found:=GetFileClusters(pcontext[cindex],exMFT_REF,@buflen,mass);   // ���� buflen ������, ��� 50 (��� ������� � GetMem ����)
if (found=0) and (GetLastError()=ERROR_INSUFFICIENT_BUFFER) then begin
	FreeMem(mass);
	GetMem(mass, sizeof(DWORD)*3*buflen);
	found:=GetFileClusters(pcontext[cindex],exMFT_REF,@buflen,mass);
end;

count:=buflen;

for i:=1 to count do begin
fragments:=PFILE_FRAGMENT(mass);
showmessage('�������: ������� �'+inttostr(i)+chr(13)
		+'����� ������� �������� = ' + inttostr(fragments.lcnHigh+fragments.lcnLow) + chr(13)
        + '����� � ��������� = ' + inttostr(fragments.count) + chr(13));

        inc(mass,3);
        dec(count);
        end;

if (buflen = 0) then showmessage('������� $DATA �����������');

dec(mass, buflen*3); // ����� � FreeMem ���������� ��������� �����
FreeMem(mass);
end; // ���� ������ � A..Z
end;


{procedure TForm1.Button4Click(Sender: TObject);
begin
  s:='D:\��������\vbox\1\Project1.dpr';
if not fileexists(s)    then exit;
cindex:=DWORD(s[0]); // �� ����� �����
cindex:=cindex or 32;// ���������� ��������� ����� � ������� ��������
cindex :=cindex - $61; {cindex=lowcase(s[0])-'a'}  //���������� ������� � 'a'

{if (cindex<26) then begin    // ���� ������ � ��������� A..Z
GetMem(mass, sizeof(DWORD)*3*50); // �������� ������ ��� 50 ��������
// �������� ������� ����� pcontext[cindex]
found:=Get_MFT_EntryForPath (@pcontext[cindex], s, -1, @exMFT_REF);

//letter:=s[0];
//InitNTFSContext(letter);
//showmessage(inttostr(sec.sectorsize));
end;
end;}


end.

