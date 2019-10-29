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
   
    function FullDirectoryCopy(SourceDir, TargetDir: string; StopIfNotAllCopied, OverWriteFiles: Boolean): Boolean;
    Procedure updateprogress;
    constructor Create(a,b,pan: string; c,d,priznakfile: Boolean);

   function __CopyFolder(SourceDir, TargetDir: string): integer;
   function __CopyFile(fSource, fDest: String): Longint;
   function GetFileCount(Dir: string):integer;
   Procedure CopyFile2(InFileName,OutFileName:String);


  end;

implementation
uses  MainUnit;
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

function TMoveThread.__CopyFile(fSource, fDest: String): Longint;
var
  fsIn, fsOut: TFileStream; s,s1:string;
begin
s:=  fSource+'-->' +fDest; s1:='.ok';
 try
  fsOut := TFileStream.Create(fDest, fmCreate);
  fsIn := TFileStream.Create(fSource, fmOpenRead);
   except on E: Exception do
    begin
      fsIn.Free;
      fsOut.Free;
      Result := 0;
        s1:='.Ошибка';
// тут можно вывести сообщение
mainform.memo1.Lines.Add(s+s1);
exit;
    end;
    end;

  try
    try
      fsIn.Seek(0, soFromBeginning);
      Result := fsOut.CopyFrom(fsIn, 0);
    finally
      fsIn.Free;
      fsOut.Free;
       Synchronize(updateprogress);
    end;

  except on E: Exception do
    begin
      fsIn.Free;
      fsOut.Free;
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

Procedure TMoveThread.CopyFile2(InFileName,OutFileName:String);
Const
  BufSize=512;
Var
  InFile,OutFile:TStream;
  Buffer:Array[1..BufSize] Of Byte;
  ReadBufSize:Integer;
Begin
  InFile:=Nil;
  OutFile:=Nil;
  Try
    InFile:=TFileStream.Create(InFileName,fmOpenRead);
    OutFile:=TFileStream.Create(OutFileName,fmCreate);
    Repeat
      ReadBufSize:=InFile.Read(Buffer,BufSize);
      OutFile.Write(Buffer,ReadBufSize);
    Until ReadBufSize<>BufSize;
  Finally
    InFile.Free;
    OutFile.Free;
  End;{Try}
End;{CopyFile}

Procedure TMoveThread.updateprogress;
begin
if panel='L' then
  MainUnit.MainForm.ProgressBar1.Position:=MainUnit.MainForm.ProgressBar1.Position+1;
  if panel='R' then
  MainUnit.MainForm.ProgressBar2.Position:=MainUnit.MainForm.ProgressBar2.Position+1;
end;

function TMoveThread.FullDirectoryCopy(SourceDir, TargetDir: string; StopIfNotAllCopied,
  OverWriteFiles: Boolean): Boolean;
var
  SR: TSearchRec;
  I: Integer;
  s: String;
begin
  Result := False;
  SourceDir := IncludeTrailingBackslash(SourceDir);
  TargetDir := IncludeTrailingBackslash(TargetDir);
  if not DirectoryExists(SourceDir) then
    Exit;
  if not ForceDirectories(TargetDir) then
    Exit;
  s := TargetDir;
  if dialogrename(s) then TargetDir:=s;


  I := FindFirst(SourceDir + '*', faAnyFile, SR);
  try
    while I = 0 do
    begin
      if (SR.Name <> '') and (SR.Name <> '.') and (SR.Name <> '..') then
      begin
        if SR.Attr = faDirectory then
          {Result := } FullDirectoryCopy(SourceDir + SR.Name, TargetDir + SR.NAME,
            StopIfNotAllCopied, OverWriteFiles)
        else if not (not OverWriteFiles and FileExists(TargetDir + SR.Name))
          then
            begin
                  CopyFile2(Pchar(SourceDir + SR.Name), Pchar(TargetDir + SR.Name));
                  Synchronize(updateprogress);
            end
        else
          Result := True;
        if not Result and StopIfNotAllCopied then
          exit;
      end;
      I := FindNext(SR);
    end;
  finally
    SysUtils.FindClose(SR);
  end;
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
  I,k: Integer;
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
    Synchronize(updateprogress);

 end


    else         __CopyFolder(masp[i].SourceDir +'\', masp[i].TargetDir );


  if panel='L' then
  begin
   MainUnit.MainForm.StatusBar1.Panels[0].Text:='';
  MainUnit.MainForm.ProgressBar1.Position:=0;
  MainForm.AddFile(MainForm.rDirectoryLabel.Caption + '*.*', faAnyFile,MainForm.ListView2,MainForm.rDirectoryLabel);
  end;
    if panel='R' then
  begin
   MainUnit.MainForm.StatusBar2.Panels[0].Text:='';
  MainUnit.MainForm.ProgressBar2.Position:=0;
MainForm.AddFile(MainForm.lDirectoryLabel.Caption + '*.*', faAnyFile,MainForm.ListView1,MainForm.lDirectoryLabel);
 end;

end;

{ TMoveThread }


end.

