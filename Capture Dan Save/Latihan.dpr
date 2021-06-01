program Latihan;

uses
  Forms,
  Latihan1 in 'Latihan1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
