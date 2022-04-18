program MIPS;

uses
  Vcl.Forms,
  UPrincP in 'UPrincP.pas' {FPrincP},
  Vcl.Themes,
  Vcl.Styles,
  USecondP in 'USecondP.pas' {FSecondP},
  UThirdP in 'UThirdP.pas' {FThirdP};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFThirdP, FThirdP);
  Application.CreateForm(TFPrincP, FPrincP);
  Application.CreateForm(TFSecondP, FSecondP);
  Application.Run;
end.
