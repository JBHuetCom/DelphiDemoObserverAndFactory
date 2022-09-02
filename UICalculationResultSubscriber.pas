unit UICalculationResultSubscriber;

interface

  type
    ICalculationResultSubscriber = interface
    ['{BC2D58A7-6316-45ED-99C3-F3E7A420EB58}']
      procedure Update(aCalculationResult: Int64);
    end;

implementation

end.
