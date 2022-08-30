unit UCalculationMethods;

interface

uses
  UICalculation;

type

  TCalculationMethod = class abstract (TInterfacedObject, ICalculation)
    function Calculation(const a, b: Integer): Integer; virtual; abstract;
  end;

  TAddition = class sealed (TCalculationMethod)
    function Calculation(const a1, a2: Integer): Integer; override; final;
  end;

  type
  TMultiplication = class sealed (TCalculationMethod)
    function Calculation(const m1, m2: Integer): Integer; override; final;
  end;

  type
  TMultiplicationPerAddition = class sealed (TCalculationMethod)
    function Calculation(const i1, i2: Integer): Integer; override; final;
  end;

implementation

function TAddition.Calculation(const a1, a2: Integer): Integer;
  begin
    Result := a1 + a2;
  end;

  function TMultiplication.Calculation(const m1, m2: Integer): Integer;
  begin
    Result := m1 * m2;
  end;

  function TMultiplicationPerAddition.Calculation(const i1, i2: Integer): Integer;
  begin
    // ToDo: manage negative values
    Result := 0;
    for var i: Integer := 1 to i1 do
      begin
        Result := Result + i2;
      end;
  end;

end.
