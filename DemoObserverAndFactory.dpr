program DemoObserverAndFactory;

uses
  {$IFDEF DEBUG}
  FastMM5 in 'FastMM5.pas',
  {$ENDIF}
  System.StartUpCopy,
  FMX.Forms,
  UICalculation in 'UICalculation.pas',
  UMain in 'UMain.pas' {frmMain},
  UTCalculationFactory in 'UTCalculationFactory.pas',
  UCalculationMethods in 'UCalculationMethods.pas',
  UICalculationResultPublisher in 'UICalculationResultPublisher.pas',
  UICalculationResultSubscriber in 'UICalculationResultSubscriber.pas',
  UTCalculationResultPublisher in 'UTCalculationResultPublisher.pas',
  UTCalculationType in 'UTCalculationType.pas';

{$R *.res}

begin

  {$IFDEF DEBUG}
  System.ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}

  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
