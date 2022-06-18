unit UCalculationMethods;

interface

uses
  UICalculation;

type

  TCalculationMethod = class abstract (TInterfacedObject, ICalculation)
    function Calculation(a, b: Integer): Integer; virtual; abstract;
  end;

  TAddition = class sealed (TCalculationMethod)
    function Calculation(a1, a2: Integer): Integer; override; final;
  end;

  type
  TMultiplication = class sealed (TCalculationMethod)
    function Calculation(m1, m2: Integer): Integer; override; final;
  end;

  type
  TMultiplicationPerAddition = class sealed (TCalculationMethod)
    function Calculation(i1, i2: Integer): Integer; override; final;
  end;

implementation

function TAddition.Calculation(a1, a2: Integer): Integer;
  begin
    Result := a1 + a2;
  end;

  function TMultiplication.Calculation(m1, m2: Integer): Integer;
  begin
    Result := m1 * m2;
  end;

  function TMultiplicationPerAddition.Calculation(i1, i2: Integer): Integer;
  begin
    Result := 0;
    for var i: Integer := 1 to i1 do
      begin
        Result := Result + i2;
      end;
  end;

end.
