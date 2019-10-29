program CopyWinNtfs;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  Movethds in 'Movethds.pas',
  Addingfiles in 'Addingfiles.pas',
  UnitAbout in 'UnitAbout.pas' {FormAbout},
  analysisfiles in 'analysisfiles.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.Run;
end.
