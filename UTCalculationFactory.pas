unit UTCalculationFactory;

interface

  uses
    UICalculation, UTCalculationType;

  type

    TCalculationFactoryAbstract = class abstract
      class function CalculationMethod(const CalculationType: TCalculationType): ICalculation; virtual; abstract;
    end;

    TCalculationFactory = class (TCalculationFactoryAbstract)
      class function CalculationMethod(const CalculationType: TCalculationType): ICalculation; override;
    end;

implementation

  uses
    UCalculationMethods, System.SysUtils;

  class function TCalculationFactory.CalculationMethod(const CalculationType: TCalculationType): ICalculation;
    begin
      case CalculationType of
        cAdd : Result := TAddition.Create;
        cMulti : Result := TMultiplication.Create;
        CMultiPerAdd : Result := TMultiplicationPerAddition.Create;
        else raise Exception.Create('Unkonwn value of calculation type');
      end;
    end;

end.
