program Project1;

uses
  Forms,
  Ureportmain in 'Ureportmain.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
