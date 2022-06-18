unit UTCalculationResultPublisher;

interface

  uses
    UICalculationResultPublisher,
    UICalculationResultSubscriber,
    UTCalculationType,
    System.Generics.Collections;

  type
    TCalculationPublisherManager = class(TInterfacedObject, ICalculationResultPublisher)
    private
      FSubscribersList : TList<ICalculationResultSubscriber>;
    public
      constructor Create;
      destructor Destroy; override;
      procedure RegisterSubscriber(aSubscriber: ICalculationResultSubscriber);
      procedure RemoveSubscriber(aSubscriber: ICalculationResultSubscriber);
      procedure NotifySubscribers(aCalculation : TCalculationType; a, b : Integer);
    end;

implementation

  uses
    UTCalculationFactory;

  constructor TCalculationPublisherManager.Create;
    begin
      inherited;
      FSubscribersList := TList<ICalculationResultSubscriber>.Create;
    end;

  destructor TCalculationPublisherManager.Destroy;
    begin
      FSubscribersList.Free;
      inherited;
    end;

  procedure TCalculationPublisherManager.NotifySubscribers(aCalculation : TCalculationType; a, b : Integer);
    var
      Subscriber : ICalculationResultSubscriber;
      CalculationResult : Integer;
    begin
      if FSubscribersList.Count > 0 then
        begin
          CalculationResult := TCalculationFactory.CalculationMethod(aCalculation).Calculation(a, b);
          for Subscriber in FSubscribersList do
            Subscriber.Update(CalculationResult);
        end;
    end;

  procedure TCalculationPublisherManager.RegisterSubscriber(
    aSubscriber: ICalculationResultSubscriber);
    begin
      if Assigned(aSubscriber) then
        begin
          if not FSubscribersList.Contains(aSubscriber) then
            FSubscribersList.Add(aSubscriber);
        end;
    end;

  procedure TCalculationPublisherManager.RemoveSubscriber(
    aSubscriber: ICalculationResultSubscriber);
    begin
      if Assigned(aSubscriber) then
        begin
          FSubscribersList.Remove(aSubscriber);
        end;
    end;

end.
