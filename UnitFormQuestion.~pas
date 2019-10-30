unit UnitFormQuestion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFormQuestion = class(TForm)
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormQuestion: TFormQuestion;

implementation

uses MainUnit;

{$R *.dfm}

procedure TFormQuestion.FormCreate(Sender: TObject);
begin

radiogroup1.ItemIndex:=mainform.modecopy;
end;

procedure TFormQuestion.Button1Click(Sender: TObject);
begin
mainform.modecopy:=radiogroup1.ItemIndex;
close;
end;

procedure TFormQuestion.Button2Click(Sender: TObject);
begin
close;
end;

end.
