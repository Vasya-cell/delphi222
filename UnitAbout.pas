unit UnitAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TFormAbout = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAbout: TFormAbout;

implementation

{$R *.dfm}

procedure TFormAbout.FormCreate(Sender: TObject);
begin
 Label3.Caption:=chr(13)+'Многопоточное приложение для выполнения следующих операций: ';
 Label1.Caption:=chr(13)+chr(13)+
'1. Физическое копирование содержимого каталожной структуры'+chr(13)+' с одного логического диска на другой. '+chr(13)+
'2. Анализ расположения по отрезкам группы файлов'+chr(13)+' на логическом диске.'+chr(13)+chr(13)+chr(13);
 Label2.Caption:='Разработчик: ';
end;

procedure TFormAbout.Button1Click(Sender: TObject);
begin
Close;
end;

end.
