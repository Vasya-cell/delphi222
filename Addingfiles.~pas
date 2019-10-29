unit Addingfiles;     // поток добавления файлов

interface

uses
  Classes, Graphics, ExtCtrls, SysUtils, FileCtrl, windows, dialogs ,shellapi ;

 type TAddingfiles = class(TThread)
  private
  SourceDir, TargetDir,panel: string;
  StopIfNotAllCopied,
  OverWriteFiles: Boolean;
    { Private declarations }
  protected
    procedure Execute; override;
  public
   

    Procedure updateprogress;
    constructor Create(a: string);

   function __Folder(SourceDir: string): integer;
   function __addFile(fSource: String): Longint;

  end;

implementation
uses  MainUnit;
var startrename:boolean;

 var priznakf:boolean;



function TAddingfiles.__addFile(fSource:string): Longint;
  var p:longint;
begin
 if MainForm.proverkaPath(MainForm._maspath,fSource,p) then
     try
     try
setlength(mainform._maspath,length(mainform._maspath)+1);
  mainform._maspath[ length(mainform._maspath)-1]:=fSource;
   mainform.ListBox1.Items.Add(  fSource);
  finally
     Synchronize(updateprogress);
  end ;
  except on E: Exception do
    begin

    end
    end;

end;

function TAddingfiles.__Folder(SourceDir: string): integer;
var
  sr : TSearchRec;
  i : integer;
    s: String;
begin
  Result := 1;
  try
      SourceDir := IncludeTrailingPathDelimiter(SourceDir);

    i := FindFirst(SourceDir + '*', faAnyFile, sr);
  
    try
      while i = 0 do
      begin
        if (sr.Name <> '') and (sr.Name <> '.') and (sr.Name <> '..') then
        begin
          if (SR.Attr and faDirectory) = faDirectory then
            __Folder(SourceDir + SR.Name)
          else
            __AddFile(Pchar(SourceDir + SR.Name))
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

  constructor TAddingfiles.Create(a: string);
var
  e:string;
  i:integer;
begin

  SourceDir:=a;
  i:=length(SourceDir);
  if i>0 then begin
    while (SourceDir[i]<>'\') and (i>0) do begin
      dec(i);
    end;
      end;

  inherited Create(False);
end;



Procedure TAddingfiles.updateprogress;
begin

  MainUnit.MainForm.ProgressBar3.Position:=MainUnit.MainForm.ProgressBar3.Position+1;

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
    //  Application.ProcessMessages;

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
procedure TAddingfiles.Execute;
var
  I,k,p: longint;
  result: boolean; s:string;
begin
k:=0;
MainUnit.MainForm.ProgressBar3.Position:=1;
       MainUnit.MainForm.StatusBar3.Panels[0].Text:='Идет подсчет файлов';
       for i:=0 to length(masp2)-1  do
  k := k+CountOfFiles(masp2[i].SourceDir);

  MainUnit.MainForm.ProgressBar3.Max:=k+1;

   Synchronize(updateprogress);
  MainUnit.MainForm.StatusBar3.Panels[0].Text:='Идет добавление файлов';


 for i:=0 to length(masp2)-1 do

 if  masp2[i].priznakefile then
 begin

  BEGIN
   __addFile((masp2[i].SourceDir))  ;
    Synchronize(updateprogress);
    end;

 end


    else         __Folder(masp2[i].SourceDir +'\' );



    MainUnit.MainForm.ProgressBar3.Position:=0;
   MainUnit.MainForm.StatusBar3.Panels[0].Text:='';
  MainUnit.MainForm.ProgressBar3.Position:=0;
  MainForm.AddFile(MainForm.lDirectoryLabel2.Caption + '*.*', faAnyFile,MainForm.ListView3,MainForm.lDirectoryLabel2);
    MainForm.lcountfiles.caption:=inttostr(length(  MainForm._maspath));
     MainForm.flaginsertfiles:=false;

end;
 
{ TMoveThread }


end.

