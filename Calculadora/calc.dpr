program calc;

uses
  Forms,
  calculadora in 'calculadora.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
