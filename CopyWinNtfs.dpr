program CopyWinNtfs;

uses
  Forms,
  UZastavka in 'UZastavka.pas' {Fzastavka},
  MainUnit in 'MainUnit.pas' {MainForm},
  Movethds in 'Movethds.pas',
  Addingfiles in 'Addingfiles.pas',
  UnitAbout in 'UnitAbout.pas' {FormAbout},
  analysisfiles in 'analysisfiles.pas',
  Analysisthds in 'Analysisthds.pas',
  UnitFormQuestion in 'UnitFormQuestion.pas' {FormQuestion};

{$R *.res}

begin
if TFzastavka.Execute then
 begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFzastavka, Fzastavka);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.CreateForm(TFormQuestion, FormQuestion);
  Application.Run;
  end;


  end.
