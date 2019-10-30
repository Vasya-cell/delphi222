unit UZastavka;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFzastavka = class(TForm)
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      class function Execute : boolean;
  end;

var
  Fzastavka: TFzastavka;

implementation

uses MainUnit;

{$R *.dfm}
class function TFzastavka.Execute: boolean;
begin
   //CoInitialize(nil);
  with TFzastavka.Create(nil) do
  try
   Result := ShowModal = mrOk;
  finally
    Free;
   // CoUninitialize;
  end;
end;

procedure TFzastavka.BitBtn1Click(Sender: TObject);
begin

//close;

end;

end.
