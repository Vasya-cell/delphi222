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
    procedure FormCreate(Sender: TObject);
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
 Label3.Caption:=chr(13)+'������������ ���������� ��� ���������� ��������� ��������: ';
 Label1.Caption:=chr(13)+chr(13)+
'1. ���������� ����������� ����������� ���������� ���������'+chr(13)+' � ������ ����������� ����� �� ������. '+chr(13)+
'2. ������ ������������ �� �������� ������ ������'+chr(13)+' �� ���������� �����.'+chr(13)+chr(13)+chr(13);
 Label2.Caption:='�����������: ';
end;

end.
