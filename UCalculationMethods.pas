unit UCalculationMethods;

interface

uses
  UICalculation;

type

  TCalculationMethod = class abstract (TInterfacedObject, ICalculation)
    function Calculation(const a, b: Integer): Int64; virtual; abstract;
  end;

  TAddition = class sealed (TCalculationMethod)
    function Calculation(const a1, a2: Integer): Int64; override; final;
  end;

  type
  TMultiplication = class sealed (TCalculationMethod)
    function Calculation(const m1, m2: Integer): Int64; override; final;
  end;

  type
  TMultiplicationPerAddition = class sealed (TCalculationMethod)
    function Calculation(const i1, i2: Integer): Int64; override; final;
  end;

implementation

  uses
    System.SysUtils;

function TAddition.Calculation(const a1, a2: Integer): Int64;
  begin
    Result := Int64(a1) + Int64(a2);
  end;

  function TMultiplication.Calculation(const m1, m2: Integer): Int64;
  begin
    Result := Int64(m1) * Int64(m2);
  end;

  function TMultiplicationPerAddition.Calculation(const i1, i2: Integer): Int64;
    var
      Counter : Integer;
  begin
    if (i1 <> 0) and (i2 <> 0) then
      begin
        Counter := Abs(i2) - 1;
        Result := 0;
        for var i := 0 to Counter do
          Result := Result + Int64(i1);
        if i2 < 0 then
          Result := Result * -1;
      end
    else
      Result := 0;
  end;

end.
