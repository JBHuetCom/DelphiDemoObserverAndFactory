unit UICalculationResultPublisher;

interface

  uses
    UICalculationResultSubscriber,
    UTCalculationType;
  type
    ICalculationResultPublisher = interface
    ['{A9F54D63-50C8-41AC-9F9E-1389EC32EC7E}']
      procedure RegisterSubscriber(aSubscriber: ICalculationResultSubscriber);
      procedure RemoveSubscriber(aSubscriber: ICalculationResultSubscriber);
      procedure NotifySubscribers(aCalculation : TCalculationType; a, b : Integer);
    end;

implementation

end.
