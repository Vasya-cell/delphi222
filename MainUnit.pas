unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, shellapi, ExtCtrls,MoveThds, Menus,Addingfiles,ComObj,PsApi,analysisfiles;
 type maspath= record
     SourceDir:   string;
     TargetDir: string[255];
     priznakefile:boolean;
   end;
   type smaspath=array of string;
type
  TAdvancedInfo = record
    Description: string;
    Addr: DWORD;
  end;
  TAdvancedInfos = array of TAdvancedInfo;

  TMainForm = class(TForm)
    ListView1: TListView;
    Label1: TLabel;
    DirUpButton: TButton;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    ComboBox1: TComboBox;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    LDirectoryLabel: TLabel;
    LLvsego: TLabel;
    LLZanyato: TLabel;
    LLFree: TLabel;
    StatusBar2: TStatusBar;
    Panel7: TPanel;
    Label2: TLabel;
    RDirectoryLabel: TLabel;
    RLVsego: TLabel;
    RLZanyato: TLabel;
    RLFree: TLabel;
    Button1: TButton;
    ComboBox2: TComboBox;
    ListView2: TListView;
    Button2: TButton;
    ProgressBar1: TProgressBar;
    Button3: TButton;
    ProgressBar2: TProgressBar;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Button4: TButton;
    Button5: TButton;
    Memo1: TMemo;
    Panel8: TPanel;
    Button6: TButton;
    RadioGroup1: TRadioGroup;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel9: TPanel;
    ListView3: TListView;
    Panel10: TPanel;
    Label3: TLabel;
    LDirectoryLabel2: TLabel;
    Lvsego2: TLabel;
    LZanyato2: TLabel;
    LLFREE2: TLabel;
    Button7: TButton;
    ComboBox3: TComboBox;
    Button8: TButton;
    StatusBar3: TStatusBar;
    ProgressBar3: TProgressBar;
    ListBox1: TListBox;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Memo2: TMemo;
    Panel15: TPanel;
    Splitter2: TSplitter;
    Panel16: TPanel;
    Splitter1: TSplitter;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    BitBtn1: TBitBtn;
    Button11: TButton;
    Label4: TLabel;
    Lcountfiles: TLabel;
    Label5: TLabel;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    Button12: TButton;
    Timer1: TTimer;
    btn_refresh: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Button13: TButton;
    ProgressBar4: TProgressBar;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    procedure FormCreate(Sender: TObject);
    procedure DirUpButtonClick(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    function obrezka(dirpath:string):string;
    procedure Button1Click(Sender: TObject);
    procedure getfizdrive(combobox:TCombobox);
    procedure ComboBox1Change(Sender: TObject);
    procedure OutDiskInfo(disk:char;Lvsego,LZanyato,LFree:tlabel);
    function GetDiskSize(drive: Char; var free_size, total_size: Int64): Boolean;
    procedure ComboBox2Change(Sender: TObject);
    procedure ListView2DblClick(Sender: TObject);
    procedure ListView2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    function AddFile(FileMask: string; FFileAttr: DWORD;var ListView:TListView;DirectoryLabel:tlabel): Boolean;
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Remove(const Dir: string);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure ListView3Click(Sender: TObject);
    procedure ListView3DblClick(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);


    function proverkaPath  ( mas:smaspath;path:string;var index:longint): Boolean;
    procedure Button11Click(Sender: TObject);
    procedure N4Click(Sender: TObject);

    procedure N5Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btn_refreshClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);

  private
    { Private declarations }

  public

      priznakfile:boolean;
      sourcedirchosen,targetdirchosen:boolean;
      ThreadCopy :TMoveThread;
      ThreadAddFile :TAddingfiles;
      exempanalysisfiles :Tanalysisfiles;
      SourceDir, TargetDir:String;
      CurrentPid: DWORD;
      AdvDataLen: Integer;
      AdvData: TAdvancedInfos;
      _maspath:smaspath;
      flaganaliza,flaginsertfiles:boolean;
    { Public declarations }
  end;

var
  MainForm: TMainForm;    lastdir:string;   flagcombo1,flagcombo2:boolean;
  masp,masp2: array of maspath;   mydir:  string;//переменная с именем текущего каталога

implementation

uses   UnitAbout;//,dos;//,  ;



    { **** UBPFD *********** by delphibase.endimus.com ****
>> Конвертация String в PWideChar

Зависимости: ???
Автор:       Gua, gua@ukr.net, ICQ:141585495, Simferopol
Copyright:   Andre .v.d. Merwe
Дата:        18 июля 2002 г.
***************************************************** }


{$R *.dfm}
function FileTimeToDateTimeStr (FileTime: TFileTime): string;                   // Функция перевода сист. времени в строку
var
  LocFTime : TFileTime;
  SysFTime : TSystemTime;
  DateStr  : String;
  Date,
  Time     : TDateTime;
begin
  FileTimeToLocalFileTime(FileTime, LocFTime);                                  // Переводим дату файла в унививерсальное глобальное время (по Гринвичу)
  FileTimeToSystemTime(LocFTime, SysFTime);                                     // Переводим  унививерсальное глобальное время в сист. время на комп-ре
  try
    with SysFTime do                                                            // теперь дата храниться в SysFTime. С помощью ее выполнять..
    begin
      {Превращаем данные в формат DateTime}
      Date    := EncodeDate(wYear, wMonth, wDay);
      DateStr := DateToStr(Date);
      Time    := EncodeTime(wHour, wMinute, wSecond, wMilliseconds);
    end;
    Result := DateTimeToStr(Date + Time);                                       // Объеденяем простым сложением и переводим дату в строку
  except
    Result := '';
  end;
end;
function SlashSep(Path, FName : String) : String;
begin
  if Path[Length(Path)] <> '\' then                                             // Если путь не заканчивается слешем '\'
    Result := Path + '\' + FName                                                // то его нужно добавить, а затем добавить имя файла
  else
    Result := Path + FName;                                                     // иначе не добавлять
end;
function TMainForm.AddFile(FileMask: string; FFileAttr: DWORD;   var ListView: TListView; DirectoryLabel: tlabel):Boolean;

{Объявляем локальные переменные}
var
  ShInfo    : TSHFileInfo;
  Attributes,
  FileName  : String;
  hFindFile : THandle;
  SearchRec : TSearchRec;

  {Объявляем локальную функцию}
  function AttrStr (Attr: Integer): string;
  begin
    Result:='';
    if (FILE_ATTRIBUTE_DIRECTORY and Attr) > 0 then Result := Result + '';
    if (FILE_ATTRIBUTE_ARCHIVE and Attr) > 0 then Result := Result + 'A';
    if (FILE_ATTRIBUTE_READONLY and Attr) > 0 then Result := Result + 'R';
    if (FILE_ATTRIBUTE_HIDDEN and Attr) > 0 then Result := Result + 'H';
    if (FILE_ATTRIBUTE_SYSTEM and Attr) > 0 then Result := Result + 'S';
   end;

begin
  ListView.Items.BeginUpdate;                                                  // Начинаем обновление элементов списка. BeginUpdate - для значительных изменений
  ListView.Items.Clear;                                                        // Очищаем ListView1

  Result := False;
  hFindFile := FindFirst(FileMask, FFileAttr, SearchRec);                       // Открываем поиск
  if hFindFile <> INVALID_HANDLE_VALUE then                                     // Проверяем корректность найденного файла
  try                                                                           // Пробуем выполнить
    repeat                                                                      // Повторять
      with SearchRec.FindData do
      begin
        if (SearchRec.Name = '.') or (SearchRec.Name = '..') or (SearchRec.Name = '') then
          Continue;
        FileName := SlashSep(DirectoryLabel.Caption, SearchRec.Name);               // Вызов функции SlashSep

        SHGetFileInfo(PChar(FileName), 0, ShInfo, SizeOf(ShInfo), SHGFI_TYPENAME or SHGFI_SYSICONINDEX); // Возвращаем инф-цию о файле
        Attributes:= AttrStr(dwFileAttributes);

        with ListView.Items.Add do                                             // Добавляю новый элемент
        begin
          Caption := SearchRec.Name;                                            // Присваиваю его имя
          ImageIndex := ShInfo.iIcon;                                           // Присваиваю индекс из системного списка изображений
          SubItems.Add(IntToStr(SearchRec.Size));                               // Добавляю поле "Размер"
          SubItems.Add(ShInfo.szTypeName);                                      // Добавляю поле "Тип"
          SubItems.Add(FileTimeToDateTimeStr(ftLastWriteTime));                 // Добавляю поле "Дата"
          SubItems.Add(Attributes);                                             // Добавляю поле "Аттрибуты"
          SubItems.Add(DirectoryLabel.Caption + cFileName);

          if (FILE_ATTRIBUTE_DIRECTORY and dwFileAttributes) > 0  then
            SubItems.Add('dir')
          else
            SubItems.Add('file');
        end;
        Result := True;
      end;
    until (FindNext(SearchRec) <> 0);
  finally                                                                       // выполняем  вне зависимости от резул-та
    FindClose(SearchRec);                                                       // Закрываем поиск
  end;
  ListView.Items.EndUpdate;                                                    // Заканчиваем обновление элементов списка. Прорисовываем все изменения сразу
end;


procedure TMainForm.DirUpButtonClick(Sender: TObject);
var s,s1:string;
begin

      s:=   LDirectoryLabel.Caption ;
      s1:=   obrezka(LDirectoryLabel.Caption);
      if s<>s1 then
      begin
          LDirectoryLabel.Caption:=s1;
          AddFile(LDirectoryLabel.Caption + '*.*', faAnyFile,ListView1,lDirectoryLabel);
          statusbar1.Panels[0].Text:='Каталог: ' + LDirectoryLabel.Caption  ;
      end;

end;
 //при создании формы
procedure TMainForm.FormCreate(Sender: TObject);
var
  SysImageList: uint;
  SFI: TSHFileInfo;
  var s:string;
begin
  flagcombo1:=false;
  lcountfiles.caption:='0';
  flaganaliza :=false;
  flaginsertfiles:=false;
  getfizdrive(combobox1);
  combobox1.ItemIndex:=0;
  getdir(0,mydir);  //получаем директорию
  memo1.Clear;
  memo2.Clear;
  Label5.Caption:='Данное двухпоточное приложение, выполняет следующие операции:'+chr(13)+
                  '1. Физическое копирование содержимого каталожной структуры с одного логического диска на другой. '+chr(13)+
                  '2. Анализ расположения по отрезкам группы файлов на логическом диске.';
  LDirectoryLabel.Caption:=combobox1.Text;
  s:=  lDirectoryLabel.Caption ;
  OutDiskInfo(s[1],lLvsego,LlZanyato,LlFree);
  getfizdrive(combobox3);
  combobox3.ItemIndex:=0;
  LDirectoryLabel2.Caption:=combobox3.Text;
  OutDiskInfo(LDirectoryLabel2.Caption[1],lvsego2,LZanyato2,LlFree2);
  getfizdrive(combobox2);
  combobox2.ItemIndex:=0;
  RDirectoryLabel.Caption:=combobox2.Text;
  s:=  RDirectoryLabel.Caption ;
  OutDiskInfo(s[1],rLvsego,rlZanyato,rlFree);
  panel2.Width:=pagecontrol1.Width-pagecontrol1.Width div 3;
  panel3.Width:=panel2.Width div 2;
  panel9.Width:=pagecontrol1.Width div 3;
  panel11.Width:=pagecontrol1.Width div 3;

   {Создаем списки маленьких и больших иконок}
  ListView1.LargeImages := TImageList.Create(self);
  ListView1.SmallImages := TImageList.Create(self);
  ListView2.LargeImages := TImageList.Create(self);
  ListView2.SmallImages := TImageList.Create(self);
  ListView3.LargeImages := TImageList.Create(self);
  ListView3.SmallImages := TImageList.Create(self);
  {Запрашиваем большие иконки}
  SysImageList := SHGetFileInfo('', 0, SFI, SizeOf(TSHFileInfo), SHGFI_SYSICONINDEX or SHGFI_LARGEICON);
  if SysImageList <> 0 then
   begin
    {Присваиваем системные иконки в ListView1}
    ListView1.LargeImages.Handle := SysImageList;
    ListView1.LargeImages.ShareImages := True;
    ListView2.LargeImages.Handle := SysImageList;
    ListView2.LargeImages.ShareImages := True;
    ListView3.LargeImages.Handle := SysImageList;
    ListView3.LargeImages.ShareImages := True;
   end;
  {Запрашиваем маленькие иконки}
  SysImageList:= SHGetFileInfo('', 0, SFI, SizeOf(TSHFileInfo), SHGFI_SYSICONINDEX or SHGFI_SMALLICON);
  if SysImageList <> 0 then
   begin
   {Присваиваем маленькие системные иконки в ListView1}
    ListView1.SmallImages.Handle:= SysImageList;
    ListView1.SmallImages.ShareImages:= True;
    ListView2.SmallImages.Handle:= SysImageList;
    ListView2.SmallImages.ShareImages:= True;
    ListView3.SmallImages.Handle:= SysImageList;
    ListView3.SmallImages.ShareImages:= True;
   end;
  AddFile(LDirectoryLabel.Caption+'*.*', faAnyFile,ListView1,lDirectoryLabel);
  AddFile(RDirectoryLabel.Caption+'*.*', faAnyFile,ListView2,rDirectoryLabel);
  AddFile(LDirectoryLabel2.Caption+'*.*', faAnyFile,ListView3,lDirectoryLabel2);
  flagcombo1:=true;
  radiogroup1.ItemIndex:=0;
  pagecontrol1.ActivePageIndex:=0;
end;

procedure TMainForm.ListView1Click(Sender: TObject);
begin

    if radiogroup1.ItemIndex=1 then exit;
    if (ListView1.Selected <> NIL) then
    if (ListView1.Selected.SubItems[5] = 'dir') then
    // Если это папка,
      // то прибавить имя выделенной папки к пути
      // и изменить текст текущей папки в DirectoryEdit
      statusbar1.Panels[0].Text:='Каталог: ' + LDirectoryLabel.Caption + ListView1.Selected.Caption + '\'
    else   // Иначе (если это не папка), это файл
       statusbar1.Panels[0].Text:='Файл: ' + LDirectoryLabel.Caption + ListView1.Selected.Caption ;

end;

procedure TMainForm.ListView1DblClick(Sender: TObject);
begin
    if radiogroup1.ItemIndex=1 then exit;
    if (ListView1.Selected <> NIL) then
    if (ListView1.Selected.SubItems[5] = 'dir') then                            // Если это папка,
     begin
      // то прибавить имя выделенной папки к пути (и войти в нее)
      // и изменить текст текущей папки в DirectoryEdit
      lastdir:= LDirectoryLabel.Caption;
      LDirectoryLabel.Caption := LDirectoryLabel.Caption + ListView1.Selected.Caption + '\';
      AddFile(LDirectoryLabel.Caption + '*.*', faAnyFile,ListView1,lDirectoryLabel);   // перечитать файлы из нее
      statusbar1.Panels[0].Text:='Каталог: ' + LDirectoryLabel.Caption ;
     end
    else                                                                        // Иначе (если это не папка), это файл и запустить его с помощью ShellExecute
      ShellExecute(Application.MainForm.Handle, nil,                            // Указываем главное окно прог-мы и запускаем файл
                   PChar(LDirectoryLabel.Caption + ListView1.Selected.Caption), '',  // Полный путь к файлу и строка параметров для команд. строке
                   PChar(LDirectoryLabel.Caption), SW_SHOW);                         // Папка по умолчанию и команда показа SW_SHOW для норм-го отображения окна
end;

function TMainForm.obrezka(dirpath: string): string;
var i,pozslesh,kol:byte;

begin
  kol:=0; pozslesh:=0;
  for i:= length(dirpath)  downto 1 do
      if  dirpath[i]='\' then
        begin
          inc(kol);
          if kol=2 then pozslesh:=i;
        end;

   if kol>1 then   obrezka:=copy(dirpath,1,pozslesh)
     else    obrezka:=dirpath;


end;

procedure TMainForm.Button1Click(Sender: TObject);
var s,s1:string;
begin
    s:= rDirectoryLabel.Caption ;
    s1:=obrezka(rDirectoryLabel.Caption);
    if s<>s1 then
      begin
          rDirectoryLabel.Caption:=s1;
          AddFile(rDirectoryLabel.Caption + '*.*', faAnyFile,ListView2,rDirectoryLabel);
          statusbar2.Panels[0].Text:='Каталог: ' + rDirectoryLabel.Caption  ;
      end;

end;

procedure TMainForm.getfizdrive(combobox:TCombobox);
var
 DiskList: DWORD;
 Letter:Char;
 Outstring:string;
begin
  DiskList:=GetLogicalDrives;  Letter:='A';
  while     (DiskList>0) do
   begin
      if Odd(DiskList) then
          if (GetDriveType(Pchar(Letter+':\')) = DRIVE_FIXED) then
            begin
              Outstring:=Letter;
              combobox.Items.Add(Pchar(Letter+':\')) ;
            end;
      DiskList:= DiskList shr 1;
      inc(Letter);
  end;
end;

procedure TMainForm.ComboBox1Change(Sender: TObject);
var  s:string;
begin
  if flagcombo1 then
    begin
      LDirectoryLabel.Caption:=combobox1.Text;
      LDirectoryLabel.Caption := LDirectoryLabel.Caption ;
      AddFile(LDirectoryLabel.Caption + '*.*', faAnyFile,ListView1,lDirectoryLabel);
      s:=copy(LDirectoryLabel.Caption,1,1);
      OutDiskInfo(s[1],lLvsego,LlZanyato,LlFree);
    end;
end;

function TMainForm.GetDiskSize(drive: Char; var free_size,  total_size: Int64): Boolean;
var
   RootPath: array[0..4] of Char;
   RootPtr: PChar;
   current_dir: string;
 begin
   RootPath[0] := Drive;
   RootPath[1] := ':';
   RootPath[2] := '\';
   RootPath[3] := #0;
   RootPtr := RootPath;
   current_dir := GetCurrentDir;
   if SetCurrentDir(drive + ':\') then
   begin
     GetDiskFreeSpaceEx(RootPtr, Free_size, Total_size, nil);
     //это, чтобы вернуться к первоначальному каталогу
    SetCurrentDir(current_dir);
     Result := True;
   end
   else
   begin
     Result := False;
     Free_size  := -1;
     Total_size := -1;
   end;
 end;

procedure TMainForm.OutDiskInfo(disk:char;Lvsego,LZanyato,LFree:tlabel);
var free_size, total_size: Int64;
begin
if    GetDiskSize(disk,free_size, total_size) then
   Begin
      Lvsego.Caption:='Всего: '  +Format('%5.1f',[total_size/1024/1024/1024])+ ' Гб';
      LZanyato.Caption:='Занято: '  +Format('%5.1f',[(total_size-free_size)/1024/1024/1024])+ ' Гб';
      LFree.Caption:='Свободно: '+Format('%5.1f',[(free_size)/1024/1024/1024])+ ' Гб';
   end;
end;

procedure TMainForm.ComboBox2Change(Sender: TObject);
var  s:string;
 begin
  if flagcombo1 then
   begin
    rDirectoryLabel.Caption:=combobox2.Text;
    rDirectoryLabel.Caption := rDirectoryLabel.Caption ;
    AddFile(rDirectoryLabel.Caption + '*.*', faAnyFile,ListView2,rDirectoryLabel);
    s:=copy(rDirectoryLabel.Caption,1,1);
    OutDiskInfo(s[1],rLvsego,rlZanyato,rlFree);
   end;
 end;
procedure TMainForm.ListView2DblClick(Sender: TObject);
begin
if radiogroup1.ItemIndex=1 then exit;
if (ListView2.Selected <> NIL) then
    if (ListView2.Selected.SubItems[5] = 'dir') then   // Если это папка,
    begin
      // то прибавить имя выделенной папки к пути (и войти в нее)
      // и изменить текст текущей папки в DirectoryEdit
     // lastdir:= LDirectoryLabel.Caption;
      rDirectoryLabel.Caption := rDirectoryLabel.Caption + ListView2.Selected.Caption + '\';
      AddFile(rDirectoryLabel.Caption + '*.*', faAnyFile,ListView2,rDirectoryLabel); // перечитать файлы из нее
      statusbar2.Panels[0].Text:='Каталог: ' + rDirectoryLabel.Caption ;
    end
    else                                                                        // Иначе (если это не папка), это файл и запустить его с помощью ShellExecute
      ShellExecute(Application.MainForm.Handle, nil,                            // Указываем главное окно прог-мы и запускаем файл
                   PChar(rDirectoryLabel.Caption + ListView2.Selected.Caption), '',  // Полный путь к файлу и строка параметров для команд. строке
                   PChar(rDirectoryLabel.Caption), SW_SHOW);
end;

procedure TMainForm.ListView2Click(Sender: TObject);
begin
if radiogroup1.ItemIndex=1 then exit;
if (ListView2.Selected <> NIL) then
    if (ListView2.Selected.SubItems[5] = 'dir') then  // Если это папка,
    begin
      // то прибавить имя выделенной папки к пути (и войти в нее)
      // и изменить текст текущей папки в DirectoryEdit
      statusbar2.Panels[0].Text:='Каталог: ' + rDirectoryLabel.Caption + ListView2.Selected.Caption + '\';
     // перечитать файлы из нее
    end
    else  // Иначе (если это не папка), это файл и запустить его с помощью ShellExecute
       statusbar2.Panels[0].Text:='Файл: ' + rDirectoryLabel.Caption + ListView2.Selected.Caption ;
end;

procedure TMainForm.Button2Click(Sender: TObject);
var
 s : string; i:integer;
  lfree_size, ltotal_size,rfree_size, rtotal_size:int64;
begin
  if LDirectoryLabel.Caption=RDirectoryLabel.Caption then
    begin
        showmessage('Нельзя скопировать файл сам в себя');
        exit;
    end;
  if radiogroup1.ItemIndex=1 then
     begin
        s:=(GetEnvironmentVariable('SystemDrive' ));
        if (AnsiUpperCase  (copy(s,1,1)) =   AnsiUpperCase  (copy(LDirectoryLabel.Caption ,1,1)))  or
            (AnsiUpperCase  (copy(s,1,1)) =   AnsiUpperCase  (copy(rDirectoryLabel.Caption ,1,1)) )
        then
          begin
              showmessage('Данная программа учебная. Копирование  системного диска запрещено или на системный диск запрещено');
              exit;
          end;
        if MessageDlg('Копировать диск  '+LDirectoryLabel.Caption+' на диск '+rDirectoryLabel.Caption+'?', mtConfirmation, [mbYes, mbNo], 0) = mrNo
        then  exit;

     s:=copy(rDirectoryLabel.Caption,1,1);
     GetDiskSize(s[1],rfree_size, rtotal_size) ;
     s:=copy(lDirectoryLabel.Caption,1,1);
     GetDiskSize(s[1],lfree_size, ltotal_size) ;
                   if  (rfree_size)<(ltotal_size-lfree_size) then
                   begin
                      Showmessage('На диске-адресате не хватает места') ;
                      exit;
                   end;

        setlength(masp,1);
        masp[0].SourceDir:= LDirectoryLabel.Caption;
        masp[0].TargetDir:= rDirectoryLabel.Caption;
        SourceDir:=LDirectoryLabel.Caption;
        targetdirchosen:=true;
        TargetDir:=RDirectoryLabel.Caption;
        sourcedirchosen:=true;
        ThreadCopy:=TMoveThread.Create(SourceDir,TargetDir,'L', false, true,priznakfile);
        exit;
     end;
     if radiogroup1.ItemIndex=0 then
     if (ListView1.Selected <> NIL) then
      begin
        targetdirchosen:=true;
        TargetDir:=RDirectoryLabel.Caption;
        sourcedirchosen:=true;
        setlength(masp,0);
           for i := 0 to ListView1.Items.Count - 1 do
            if ListView1.Items[i].Selected then
              begin
                setlength(masp,length(masp)+1);
                masp[length(masp)-1].SourceDir:= LDirectoryLabel.Caption + ListView1.Items[i].Caption;
                masp[length(masp)-1].SourceDir:= LDirectoryLabel.Caption + ListView1.Items[i].Caption;
                masp[length(masp)-1].TargetDir:= RDirectoryLabel.Caption + ListView1.Items[i].Caption;
                if (ListView1.Items[i].SubItems[5] = 'dir') then
                    masp[length(masp)-1].priznakefile:=false
                else masp[length(masp)-1].priznakefile:=true;
        end;

        if MessageDlg('Копировать выбранные файлы '+' в '+chr(13)+TargetDir+'?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
         then
            begin
                SourceDir:=LDirectoryLabel.Caption;
                ThreadCopy:=TMoveThread.Create(SourceDir,TargetDir,'L', false, true,priznakfile);
            end
         else             exit;
     end
    else    ShowMessage( 'Нет выбранных файлов')  ;
end  ;

procedure TMainForm.Button3Click(Sender: TObject);
var
 s : string;    i:integer;
   lfree_size, ltotal_size,rfree_size, rtotal_size:int64;
begin
 if LDirectoryLabel.Caption=RDirectoryLabel.Caption then
    begin
        showmessage('Нельзя скопировать файл сам в себя');
        exit;
    end;
 if radiogroup1.ItemIndex=1 then
     begin
        s:=(GetEnvironmentVariable('SystemDrive' ));
        if (AnsiUpperCase  (copy(s,1,1)) =   AnsiUpperCase  (copy(LDirectoryLabel.Caption ,1,1)))  or
            (AnsiUpperCase  (copy(s,1,1)) =   AnsiUpperCase  (copy(rDirectoryLabel.Caption ,1,1)) )
        then
          begin
              showmessage('Данная программа учебная. Копирование  системного диска запрещено или на системный диск запрещено');
              exit;
          end;
       if MessageDlg('Копировать диск  '+rDirectoryLabel.Caption+' на диск '+lDirectoryLabel.Caption+'?', mtConfirmation, [mbYes, mbNo], 0) = mrNo
       then  exit;
       s:=copy(rDirectoryLabel.Caption,1,1);
       GetDiskSize(s[1],rfree_size, rtotal_size) ;
       s:=copy(lDirectoryLabel.Caption,1,1);
       GetDiskSize(s[1],lfree_size, ltotal_size) ;
                   if  (rtotal_size-rfree_size)> (lfree_size) then
                   begin
                      Showmessage('На диске-адресате не хватает места') ;
                      exit;
                   end;

        setlength(masp,1);
        masp[0].SourceDir:= rDirectoryLabel.Caption;
        masp[0].TargetDir:= lDirectoryLabel.Caption;
        SourceDir:=rDirectoryLabel.Caption;
        targetdirchosen:=true;
        TargetDir:=lDirectoryLabel.Caption;
        sourcedirchosen:=true;
        ThreadCopy:=TMoveThread.Create(SourceDir,TargetDir,'R', false, true,priznakfile);
        exit;
     end;
     if radiogroup1.ItemIndex=0 then
     if (ListView2.Selected <> NIL) then
        begin
          targetdirchosen:=true;
          TargetDir:=lDirectoryLabel.Caption;
          sourcedirchosen:=true;
          setlength(masp,0);
          for i := 0 to ListView2.Items.Count - 1 do
          if ListView2.Items[i].Selected then
            begin
              setlength(masp,length(masp)+1);
              masp[length(masp)-1].SourceDir:= rDirectoryLabel.Caption + ListView2.Items[i].Caption;
              masp[length(masp)-1].SourceDir:= rDirectoryLabel.Caption + ListView2.Items[i].Caption;
              masp[length(masp)-1].TargetDir:= lDirectoryLabel.Caption + ListView2.Items[i].Caption;
              if (ListView2.Items[i].SubItems[5] = 'dir') then
              masp[length(masp)-1].priznakefile:=false else masp[length(masp)-1].priznakefile:=true;
            end;
           if MessageDlg('Копировать выбранные файлы '+' в '+chr(13)+TargetDir+'?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
           then
            begin
              SourceDir:=rDirectoryLabel.Caption;
              ThreadCopy:=TMoveThread.Create(SourceDir,TargetDir,'R', false, true,priznakfile);
            end
           else     exit;
      end
   else    ShowMessage( 'Нет выбранных файлов')  ;
end;

procedure TMainForm.Button4Click(Sender: TObject);
var i:integer; sysdisk,s:string;
begin
 if  ListView1.SelCount=0 then
  begin
    Showmessage('Ничего не выбрано');
    exit;
  end;
 s:='';
 for i := 0 to ListView1.Items.Count - 1 do
  if ListView1.Items[i].Selected then  s:=s+ ListView1.Items[i].Caption +chr(13);
    if MessageDlg('Удалить выбранные файлы ?' +chr(13)+ s+chr(13)+'Будьте осторожны, если не уверены - откажитесь', mtConfirmation, [mbYes, mbNo], 0) = mrYes
    then
      begin
        sysdisk:=(GetEnvironmentVariable('SystemDrive' ));
        if AnsiUpperCase  (copy(sysdisk,1,1)) =   AnsiUpperCase  (copy(LDirectoryLabel.Caption ,1,1)) then
          begin
              showmessage('Данная программа учебная. Удаление с системного диска запрещено');
              exit;
          end;
        memo1.Clear;
        memo1.Lines.Add('Лог удаления');
        for i := 0 to ListView1.Items.Count - 1 do
        if ListView1.Items[i].Selected then

            if  not DeleteFile(pchar(LDirectoryLabel.Caption + ListView1.Items[i].Caption))
            then Remove(pchar(LDirectoryLabel.Caption + ListView1.Items[i].Caption))
            else memo1.lines.add(LDirectoryLabel.Caption + ListView1.Items[i].Caption+': ok');
        AddFile(lDirectoryLabel.Caption + '*.*', faAnyFile,MainForm.ListView1,MainForm.lDirectoryLabel);
        if lDirectoryLabel.Caption =rDirectoryLabel.Caption then
              AddFile(rDirectoryLabel.Caption + '*.*', faAnyFile,MainForm.ListView2,MainForm.rDirectoryLabel);
        if lDirectoryLabel.Caption =lDirectoryLabel2.Caption then
              AddFile(lDirectoryLabel2.Caption + '*.*', faAnyFile,MainForm.ListView3,MainForm.lDirectoryLabel2);
    end;
 end;

procedure TMainForm.Remove(const Dir: string);
var
  Result: TSearchRec;
begin
  if FindFirst(Dir + '\*', faAnyFile, Result) = 0 then
  begin
    Try
      repeat
        if (Result.Attr and faDirectory) = faDirectory then
        begin
          if (Result.Name <> '.') and (Result.Name <> '..') then
            Remove(Dir + '\' + Result.Name)
        end
        else begin
        if not DeleteFile(Dir + '\' + Result.Name) then
          memo1.Lines.add(Dir + '\' + Result.Name+': ошибка')
          else  memo1.lines.add(Dir + '\' + Result.Name+': ok')//RaiseLastOSError;
          end
      until FindNext(Result) <> 0;
    Finally
      FindClose(Result);
    End;
  end;
  try
  if not RemoveDir(Dir) then
     memo1.lines.add(Dir +': ошибка')
     else  memo1.lines.add(Dir +': ok')
    except
    end;
end;

procedure TMainForm.Button5Click(Sender: TObject);
var i:integer; sysdisk,s:string;
begin

  if  ListView2.SelCount=0 then
    begin
      Showmessage('Ничего не выбрано');
      exit;
    end;
  s:='';
  for i := 0 to ListView2.Items.Count - 1 do
    if ListView2.Items[i].Selected then  s:=s+ ListView2.Items[i].Caption +chr(13);
      if MessageDlg('Удалить выбранные файлы ?' +chr(13)+ s+chr(13)+'Будьте осторожны, если не уверены - откажитесь', mtConfirmation, [mbYes, mbNo], 0) = mrYes
         then
            begin
              sysdisk:=(GetEnvironmentVariable('SystemDrive' ));
              if AnsiUpperCase  (copy(sysdisk,1,1)) =   AnsiUpperCase  (copy(rDirectoryLabel.Caption ,1,1)) then
                begin
                  showmessage('Данная программа учебная. Удаление с системного диска запрещено');
                  exit;
                end;
              memo1.Clear;
              memo1.Lines.Add('Лог удаления');
              for i := 0 to ListView2.Items.Count - 1 do
                if ListView2.Items[i].Selected then
                  begin
                    if  not DeleteFile(pchar(rDirectoryLabel.Caption + ListView2.Items[i].Caption)) then
                      Remove(pchar(rDirectoryLabel.Caption + ListView2.Items[i].Caption)) ;
                  end;
              AddFile(rDirectoryLabel.Caption + '*.*', faAnyFile,MainForm.ListView2,MainForm.rDirectoryLabel);
              if rDirectoryLabel.Caption =rDirectoryLabel.Caption then
              AddFile(lDirectoryLabel.Caption + '*.*', faAnyFile,MainForm.ListView1,MainForm.lDirectoryLabel);
              if rDirectoryLabel.Caption =lDirectoryLabel2.Caption then
              AddFile(lDirectoryLabel2.Caption + '*.*', faAnyFile,MainForm.ListView3,MainForm.lDirectoryLabel2);
       end;
end;

procedure TMainForm.Button6Click(Sender: TObject);
begin
  mainform.memo1.Clear;
end;

procedure TMainForm.N3Click(Sender: TObject);
begin
  radiogroup1.ItemIndex:=1;
end;

procedure TMainForm.RadioGroup1Click(Sender: TObject);
begin
  if radiogroup1.ItemIndex=0 then
    begin
         button4.Enabled:=true;
         button5.Enabled:=true;
         ListView1.Enabled:=true;
         ListView2.Enabled:=true;
    end;

 if radiogroup1.ItemIndex=1 then
    begin
       button4.Enabled:=false;
       button5.Enabled:=false;
       ListView1.Enabled:=false;
       ListView2.Enabled:=false;
       LDirectoryLabel.Caption:=combobox1.Text;
       OutDiskInfo(lDirectoryLabel.Caption[1],lLvsego,LlZanyato,LlFree);
       RDirectoryLabel.Caption:=combobox2.Text;
       OutDiskInfo(rDirectoryLabel.Caption[1],rLvsego,rlZanyato,rlFree);
       AddFile(LDirectoryLabel.Caption+'*.*', faAnyFile,ListView1,lDirectoryLabel);
       AddFile(RDirectoryLabel.Caption+'*.*', faAnyFile,ListView2,rDirectoryLabel);
    end;
end;

procedure TMainForm.ListView3Click(Sender: TObject);
begin

if (ListView3.Selected <> NIL) then
    if (ListView3.Selected.SubItems[5] = 'dir') then // Если это папка,

      // то прибавить имя выделенной папки к пути
      // и изменить текст текущей папки в DirectoryEdit
      statusbar3.Panels[0].Text:='Каталог: ' + LDirectoryLabel2.Caption + ListView3.Selected.Caption + '\'

    else   // Иначе (если это не папка), это файл
       statusbar3.Panels[0].Text:='Файл: ' + LDirectoryLabel2.Caption + ListView3.Selected.Caption ;
end;

procedure TMainForm.ListView3DblClick(Sender: TObject);
begin
if (ListView3.Selected <> NIL) then
    if (ListView3.Selected.SubItems[5] = 'dir') then                            // Если это папка,
     begin
      // то прибавить имя выделенной папки к пути (и войти в нее)
      // и изменить текст текущей папки в DirectoryEdit
      LDirectoryLabel2.Caption := LDirectoryLabel2.Caption + ListView3.Selected.Caption + '\';
      AddFile(LDirectoryLabel2.Caption + '*.*', faAnyFile,ListView3,lDirectoryLabel2);                           // перечитать файлы из нее
      statusbar3.Panels[0].Text:='Каталог: ' + LDirectoryLabel2.Caption ;
     end
    else                                                                        // Иначе (если это не папка), это файл и запустить его с помощью ShellExecute
      ShellExecute(Application.MainForm.Handle, nil,                            // Указываем главное окно прог-мы и запускаем файл
                   PChar(LDirectoryLabel2.Caption + ListView3.Selected.Caption), '',  // Полный путь к файлу и строка параметров для команд. строке
                   PChar(LDirectoryLabel2.Caption), SW_SHOW);                         // Папка по умолчанию и команда показа SW_SHOW для норм-го отображения окна
end;

procedure TMainForm.Button7Click(Sender: TObject);
var s,s1:string;
begin
  s:=   LDirectoryLabel2.Caption ;
  s1:=   obrezka(LDirectoryLabel2.Caption);
  if s<>s1 then
      begin
          LDirectoryLabel2.Caption:=s1;
          AddFile(LDirectoryLabel2.Caption + '*.*', faAnyFile,ListView3,lDirectoryLabel2);
          statusbar3.Panels[0].Text:='Каталог: ' + LDirectoryLabel2.Caption  ;
      end;
end;

procedure TMainForm.Button8Click(Sender: TObject);
var
  s : string; i:integer;
begin
  if flaganaliza    then
    begin
      Showmessage('Идет анализ файлов. Подождите конца операции');
      exit;
    end;
  flaginsertfiles :=true;
  s:=(GetEnvironmentVariable('SystemDrive' ));
  if (AnsiUpperCase  (copy(s,1,1)) =   AnsiUpperCase  (copy(LDirectoryLabel2.Caption ,1,1)))
    then
          begin
              showmessage('Данная программа учебная. Операции с файлами  системного диска запрещены');
              exit;
          end;
    if (ListView3.Selected <> NIL) then
      begin
        targetdirchosen:=true;
        sourcedirchosen:=true;
        SourceDir:=lDirectoryLabel2.Caption;
        TargetDir:=lDirectoryLabel2.Caption;
        setlength(masp2,0);
        for i := 0 to ListView3.Items.Count - 1 do
           if ListView3.Items[i].Selected then
              begin
                setlength(masp2,length(masp2)+1);
                masp2[length(masp2)-1].SourceDir:= LDirectoryLabel2.Caption + ListView3.Items[i].Caption;
                if (ListView3.Items[i].SubItems[5] = 'dir') then
                masp2[length(masp2)-1].priznakefile:=false else  masp2[length(masp2)-1].priznakefile:=true;
              end;

          if MessageDlg('Добавить выбранные файлы в список?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
            then ThreadAddFile :=TAddingfiles.Create(SourceDir)
            else  exit;
      end
  else    ShowMessage( 'Нет выбранных файлов')  ;
       
end  ;

procedure TMainForm.ComboBox3Change(Sender: TObject);
var  s:string;
begin
  if flagcombo1 then
    begin
      LDirectoryLabel2.Caption:=combobox3.Text;
      AddFile(LDirectoryLabel2.Caption + '*.*', faAnyFile,ListView3,lDirectoryLabel2);
      s:=copy(LDirectoryLabel2.Caption,1,1);
      OutDiskInfo(s[1],lvsego2,LZanyato2,LlFree2);
     end;
end;

procedure TMainForm.BitBtn1Click(Sender: TObject);

begin
 if length(_maspath)=0   then
    begin
      Showmessage('Отсутствуют файлы для анализа');
      exit;
    end;
  if flaganaliza    then
    begin
      Showmessage('Уже идет анализ файлов');
      exit;
    end;
  if  flaginsertfiles
    then
      begin
        Showmessage('Идут операции с файлами. Подождите окончания операции');
        exit;
      end;
   flaganaliza   :=true;
   ProgressBar4.Max:=length(_maspath);
   exempanalysisfiles :=Tanalysisfiles.Create();
end;

  //*********************
     function GetShortName(sLongName: string): string;
       begin
         Result := sLongName;
       end;

   function fexpand(filename: string): string;
       { возвращает полный путь к файлу }
       var
         test: string;
         test_len: integer;
       begin
         // нам нужна строка для ExpandFileName, если ее нет
         if filename = '' then filename := '*.*';
         test := GetShortName(ExpandFileName(Filename));
         { check for trailing . - we want the path as TP returns,
           not the base directory identifier as well

           проверить на след. - мы хотим путь как TP возвращается,
            а не базовый идентификатор каталога}
         test_len := length(test);
         if test[test_len] = '.' then
           begin
             test := copy(test, 1, test_len-1);
             dec(test_len, 1);
           end;
         // ExpandFileName returns *.* on the path.  The TP FExpand did not.
         //ExpandFileName возвращает *. * На пути. ТП FExpand не сделал.
         if pos('\*.*', test) > 0 then
           test := copy(test, 1, test_len-4);
         fexpand := test;
end;

function TMainForm.proverkaPath(mas: smaspath;path:string;var index:longint): Boolean;
var i:longint; flag:boolean;
begin
  flag:=true;

   for i:=0 to length(mas)-1 do
    if  mas[i]=path then
                  begin
                    flag:=false;
                    break;
                  end;
   proverkaPath:=flag;
end;

procedure TMainForm.Button11Click(Sender: TObject);
begin
if flaganaliza    then
begin
 Showmessage('Очистка не возможна - идет анализ файлов');
 exit;
end;
if  flaginsertfiles   then
begin
 Showmessage('Очистка не возможна - идет добавление файлов');
 exit;
end;
 if length(_maspath)=0   then
begin
 Showmessage('Отсутствуют файлы для очистки');
 exit;
end;
listbox1.Clear;
setlength(_maspath,0);
lcountfiles.caption:='0';
end;

procedure TMainForm.N4Click(Sender: TObject);
begin
radiogroup1.ItemIndex:=0;
end;

procedure TMainForm.N5Click(Sender: TObject);
begin
Close;
end;

procedure TMainForm.N8Click(Sender: TObject);
begin
 pagecontrol1.ActivePageIndex:=1;
end;

procedure TMainForm.N7Click(Sender: TObject);
begin
 pagecontrol1.ActivePageIndex:=0;
end;

procedure TMainForm.N11Click(Sender: TObject);
begin
FormAbout.Showmodal;
end;

procedure TMainForm.N10Click(Sender: TObject);
begin
if not fileexists(mydir+'\HelpCopyWinNtfs.pdf')
then
showmessage('Отсутствует файл справки: '+mydir+'\HelpCopyWinNtfs.pdf')
  else
  ShellExecute(Handle, '', 'HelpCopyWinNtfs.pdf', '', '', SW_SHOW);

end;
procedure TMainForm.Button12Click(Sender: TObject);
var i:longint ;
begin
if flaganaliza    then
begin
 Showmessage('Удаление не возможно - идет анализ файлов');
 exit;
end;
if  flaginsertfiles   then
begin
 Showmessage('Удаление не возможно - идет добавление файлов');
 exit;
end;
 if length(_maspath)=0   then
begin
 Showmessage('Отсутствуют файлы для удаления');
 exit;
end;

 if (ListBox1.ItemIndex>=0 ) then
    begin
    flaginsertfiles:=true;
      listbox1.DeleteSelected;

       setlength(_maspath,0);
            for i := 0 to ListBox1.Items.Count - 1 do
            begin
                setlength(_maspath,length(_maspath)+1);
                _maspath[length(_maspath)-1]:=ListBox1.Items.Strings[i];
            end;
          lcountfiles.caption:=inttostr(length(  _maspath));
          flaginsertfiles:=false;
     end

end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  AddFile(LDirectoryLabel2.Caption + '*.*', faAnyFile,ListView3,lDirectoryLabel2);
    AddFile(LDirectoryLabel.Caption + '*.*', faAnyFile,ListView1,lDirectoryLabel);
      AddFile(rDirectoryLabel.Caption + '*.*', faAnyFile,ListView2,rDirectoryLabel);
end;

procedure TMainForm.btn_refreshClick(Sender: TObject);
begin
AddFile(LDirectoryLabel.Caption + '*.*', faAnyFile,ListView1,lDirectoryLabel);
end;

procedure TMainForm.BitBtn2Click(Sender: TObject);
begin
  AddFile(rDirectoryLabel.Caption + '*.*', faAnyFile,ListView2,rDirectoryLabel);
end;

procedure TMainForm.BitBtn3Click(Sender: TObject);
begin
 AddFile(LDirectoryLabel2.Caption + '*.*', faAnyFile,ListView3,lDirectoryLabel2);
end;

procedure TMainForm.Button13Click(Sender: TObject);
begin
if flaganaliza    then
begin
 Showmessage('Идет анализ файлов');
 exit;
end;
memo2.Clear;
end;

procedure TMainForm.Button14Click(Sender: TObject);
begin
if exempanalysisfiles<>nil then

exempanalysisfiles.Suspend;
end;

procedure TMainForm.Button15Click(Sender: TObject);
begin
if exempanalysisfiles<>nil then
if exempanalysisfiles.Suspended then
exempanalysisfiles.Resume;
end;

procedure TMainForm.Button16Click(Sender: TObject);
begin
if exempanalysisfiles<>nil
then
begin

exempanalysisfiles.Terminate; // Советуем потоку завершиться
exempanalysisfiles.Free; // Убиваем объект потока.
progressbar4.Position:=0;
flaganaliza:=false;
end;
end;

end.

