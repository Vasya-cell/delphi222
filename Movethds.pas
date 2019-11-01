unit Movethds; // поток копирования

interface

uses
  Classes, Graphics, ExtCtrls, SysUtils, FileCtrl, windows, dialogs ,shellapi
  ;
const
  slowk=10;
  type maspath=array of string[255];
type


  TMemoryStatus = record
    dwLength: DWORD;
    dwMemoryLoad: DWORD;
    dwTotalPhys: DWORD;
    dwAvailPhys: DWORD;
    dwTotalPageFile: DWORD;
    dwAvailPageFile: DWORD;
    dwTotalVirtual: DWORD;
    dwAvailVirtual: DWORD;
  end;
  TMoveThread = class(TThread)
  private
  SourceDir, TargetDir,panel: string;
  StopIfNotAllCopied,
  OverWriteFiles: Boolean;
    { Private declarations }
  protected
    procedure Execute; override;
  public
   

    Procedure updateprogress;
    constructor Create(a,b,pan: string; c,d,priznakfile: Boolean);

   function __CopyFolder(SourceDir, TargetDir: string): integer;
   function __CopyFile(fSource, fDest: String): Longint;
   function GetFileCount(Dir: string):integer;
  function ExtractFileNameEx(FileName: string; ShowExtension: Boolean): string;

   function FileGetSize(const aFileName: string): Int64;


  end;

implementation
uses  MainUnit, UnitFormQuestion;
var startrename:boolean;

 var priznakf:boolean;
   function dialogrename(var s:string):boolean;
begin
  result:=false;
  if InputQuery('Копирование',
    'Копировать в '+s+
    ', (или измените имя каталог (имя файла))', s)
    then result:=true;
end;
function TMoveThread.FileGetSize(const aFileName: string): Int64;
var AttributeData: TWin32FileAttributeData;
begin
  if GetFileAttributesEx(PChar(aFileName), GetFileExInfoStandard, @AttributeData) then
  begin
    Int64Rec(Result).Lo := AttributeData.nFileSizeLow;
    Int64Rec(Result).Hi := AttributeData.nFileSizeHigh;
  end
  else
    Result := -1;
end;


function TMoveThread.ExtractFileNameEx(FileName: string; ShowExtension: Boolean): string;
//Функция возвращает имя файла, без или с его расширением.

//ВХОДНЫЕ ПАРАМЕТРЫ
//FileName - имя файла, которое надо обработать
//ShowExtension - если TRUE, то функция возвратит короткое имя файла
// (без полного пути доступа к нему), с расширением этого файла, иначе,
//возвратит
  // короткое имя файла, без расширения этого файла.
var
  I: Integer;
  S, S1: string;
begin
  //Определяем длину полного имени файла
  I := Length(FileName);
  //Если длина FileName <> 0, то
  if I <> 0 then
  begin
    //С конца имени параметра FileName ищем символ "\"
    while (FileName[i] <> '\') and (i > 0) do
      i := i - 1;
    // Копируем в переменную S параметр FileName начиная после последнего
    // "\", таким образом переменная S содержит имя файла с расширением, но без
    // полного пути доступа к нему
    S := Copy(FileName, i + 1, Length(FileName) - i);
    i := Length(S);
    //Если полученная S = '' то фукция возвращает ''
    if i = 0 then
    begin
      Result := '';
      Exit;
    end;
    //Иначе, получаем имя файла без расширения
    while (S[i] <> '.') and (i > 0) do
      i := i - 1;
    //... и сохраням это имя файла в переменную s1
    S1 := Copy(S, 1, i - 1);
    //если s1='' то , возвращаем s1=s
    if s1 = '' then
      s1 := s;
    //Если было передано указание функции возвращать имя файла с его
    // расширением, то Result = s,
    //если без расширения, то Result = s1
    if ShowExtension = TRUE then
      Result := s
    else
      Result := s1;
  end
    //Иначе функция возвращает ''
  else
    Result := '';
end;


function TMoveThread.__CopyFile(fSource, fDest: String): Longint;
Const

  BlockSize = 512;

var
  fsIn, fsOut: TFileStream; s,s1:string;
  free_size, total_size,rfree_size, rtotal_size:int64;

  ElapsedSize: Integer;

CopySize: Integer;
SourceStream: TFileStream;

TargetStream: TFileStream; fdestt:string;


begin
fDestt:=fDest;
    if fileexists (fDest)   then
    begin
        if  mainform.modecopy=1 then
                begin
          mainform.memo1.Lines.Add(fSource+'-->' +fDest+'.пропущен');
                      exit;
                      end;

         if mainform.modecopy=2 then
         begin
        fDestt:=fDest+' (2)';


      fDestt:=ExtractFilePath  (fDest)+
       ExtractFileNameEx(fDest,false)+ ' (2)'+ExtractFileExt   (fDest);

        end;
    end;
 mainform.GetDiskSize(fDestt[1],free_size, total_size) ;
                   if  (free_size)<FileGetSize(fSource) then
                   begin

                      s:=  fSource+'-->' +fDestt; s1:='.не хватает места';
                      mainform.memo1.Lines.Add(s+s1);
                      exit;
                   end;
 s:=  fSource+'-->' +fDestt; s1:='.ok';
try
    SourceStream := TFileStream.Create(fSource, fmOpenRead);
    TargetStream := TFileStream.Create(fDestt, fmCreate);

   except on E: Exception do
    begin
      SourceStream.Free;
      TargetStream.Free;
      Result := 0;
      s1:='.Ошибка';
// тут можно вывести сообщение
mainform.memo1.Lines.Add(s+s1);
exit;
    end;
    end;


  try


    try
       ElapsedSize := SourceStream.Size - SourceStream.Position;

while ElapsedSize > 0 do

begin

if ElapsedSize < BlockSize then

CopySize := ElapsedSize

else

CopySize := BlockSize;

TargetStream.CopyFrom(SourceStream, CopySize);

ElapsedSize := SourceStream.Size - SourceStream.Position;

 end


    finally
       TargetStream.Free;
      SourceStream.Free;
       Synchronize(updateprogress);
    end;

  except on E: Exception do
    begin
      TargetStream.Free;
      SourceStream.Free;
      Result := 0;
        s1:='.Ошибка';
// тут можно вывести сообщение
    end;
  end;
mainform.memo1.Lines.Add(s+s1);
end;

function TMoveThread.__CopyFolder(SourceDir, TargetDir: string): integer;
var
  sr : TSearchRec;
  i : integer;

begin
  Result := 1;
  try
    SourceDir := IncludeTrailingPathDelimiter(SourceDir);
    TargetDir := IncludeTrailingPathDelimiter(TargetDir);

        if not SysUtils.ForceDirectories(TargetDir) then  exit;
    i := FindFirst(SourceDir + '*', faAnyFile, sr);
    try
      while i = 0 do
      begin
        if (sr.Name <> '') and (sr.Name <> '.') and (sr.Name <> '..') then
        begin
          if (SR.Attr and faDirectory) = faDirectory then
            __CopyFolder(SourceDir + SR.Name, TargetDir + SR.NAME)
          else
            __CopyFile(Pchar(SourceDir + SR.Name), Pchar(TargetDir + SR.Name))
        end;
        i := FindNext(SR);
      end;
    finally
      SysUtils.FindClose(SR);
    end;
    Result := 0;
  except on E: Exception do
    begin
      Result := 2
// тут можно вывести сообщение
    end;
  end;
end;

  constructor TMoveThread.Create(a,b,pan: string; c,d,priznakfile: Boolean);
var
  e:string;
  i:integer;
begin
priznakf:=priznakfile  ;
Panel:=pan;
  SourceDir:=a;
  TargetDir:=b;

  StopIfNotAllCopied:=c;
  OverWriteFiles:=d;
  i:=length(SourceDir);

  if i>0 then begin
    while (SourceDir[i]<>'\') and (i>0) do begin
      dec(i);
    end;
    e:='';
    if TargetDir[Length(TargetDir)]<>'\' then TargetDir:=TargetDir+'\';
   if i<length(SourceDir) then for i:=i+1 to length(SourceDir) do TargetDir:=TargetDir+SourceDir[i];
   TargetDir:=TargetDir+'\';

   end;
   inherited Create(False);
end;



Procedure TMoveThread.updateprogress;
begin
if panel='L' then
  MainUnit.MainForm.ProgressBar1.Position:=MainUnit.MainForm.ProgressBar1.Position+1;
  if panel='R' then
  MainUnit.MainForm.ProgressBar2.Position:=MainUnit.MainForm.ProgressBar2.Position+1;
end;



function GetFileNum(SourceDir:string): Integer;
var
  SR: TSearchRec;
  I: Integer;
  b:boolean;
begin
  if not DirectoryExists(SourceDir) then
    Exit;
  Result := 0;
  b:=false;
  SourceDir := IncludeTrailingBackslash(SourceDir);
  if not DirectoryExists(SourceDir) then
    Exit;

  I := FindFirst(SourceDir + '*', faAnyFile, SR);

  try
    while I = 0 do
    begin
      if (SR.Name <> '') and (SR.Name <> '.') and (SR.Name <> '..') then
      begin
        if SR.Attr = faDirectory then
          Result := Result + GetFileNum(SourceDir + SR.Name)
        else begin
          Result := Result+1;
          b := True;
        end;
        if not b then
          exit;
      end;
      I := FindNext(SR);
    end;
  finally
    SysUtils.FindClose(SR);
  end;
end;
function TMoveThread.GetFileCount(Dir: string):integer;
var
  fs: TSearchRec; pics:integer;
begin
  pics:=0;
  if FindFirst(Dir+'*.*', faAnyFile - faDirectory - faVolumeID, fs) = 0
    then
    repeat
      inc(pics);
    until
      FindNext(fs) <> 0;
      SysUtils.FindClose(fs);
      Result := Pics;   //вот это добавить надо
end;
function  CountOfFiles(Dir: string) : integer;
var
  lResult : integer;
  SearchRec: TSearchRec;
begin
  Dir := IncludeTrailingBackslash(Dir);
  lResult := 0;

  if FindFirst(Dir + '*.*', faAnyFile, SearchRec) = 0 then
    repeat
       if (SearchRec.Attr and faDirectory) <> 0 then begin
        if (SearchRec.name <> '.') and (SearchRec.name <> '..') then
              lResult := lResult +  CountOfFiles(Dir + SearchRec.name);
      end
      else
        Inc(lResult);
    until FindNext(SearchRec) <> 0;
  SysUtils.FindClose(SearchRec);
  CountOfFiles := lResult;

end;
procedure TMovethread.Execute;
var
  I,k: Integer;s:string;
  begin



k:=0;   mainform.memo1.Clear;
            mainform.memo1.Lines.Add('Лог копирования');
       for i:=0 to length(masp)-1  do
  k := k+CountOfFiles(masp[i].SourceDir);
      if panel='L' then
 begin
  MainUnit.MainForm.ProgressBar1.Max:=k+1;
  MainUnit.MainForm.ProgressBar1.Position:=0;
  MainUnit.MainForm.StatusBar1.Panels[0].Text:='Копируется';
  end;
  if panel='R' then
 begin
  MainUnit.MainForm.ProgressBar2.Max:=k+1;
  MainUnit.MainForm.ProgressBar2.Position:=0;
  MainUnit.MainForm.StatusBar2.Panels[0].Text:='Копируется';
  end;

  startrename:=true;
   if not SysUtils.DirectoryExists(SourceDir) then        Exit;

 for i:=0 to length(masp)-1 do

 if  masp[i].priznakefile then  begin
   __CopyFile((masp[i].SourceDir), (masp[i].TargetDir))  ;
   // Synchronize(updateprogress);

 end


    else         __CopyFolder(masp[i].SourceDir +'\', masp[i].TargetDir );


  if panel='L' then
  begin
   MainUnit.MainForm.StatusBar1.Panels[0].Text:='';
  MainUnit.MainForm.ProgressBar1.Position:=0;
  MainForm.AddFile(MainForm.rDirectoryLabel.Caption + '*.*', faAnyFile,MainForm.ListView2,MainForm.rDirectoryLabel);
  s:=  MainForm.rDirectoryLabel.Caption ;
  MainForm.OutDiskInfo(s[1],MainForm.rLvsego,MainForm.rlZanyato,MainForm.rlFree);
  end;
    if panel='R' then
  begin
   MainUnit.MainForm.StatusBar2.Panels[0].Text:='';
  MainUnit.MainForm.ProgressBar2.Position:=0;
MainForm.AddFile(MainForm.lDirectoryLabel.Caption + '*.*', faAnyFile,MainForm.ListView1,MainForm.lDirectoryLabel);
  s:=  MainForm.lDirectoryLabel.Caption ;
  MainForm.OutDiskInfo(s[1],MainForm.lLvsego,MainForm.LlZanyato,MainForm.LlFree);
 end;

end;

{ TMoveThread }


end.

