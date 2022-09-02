unit UTCalculationMethodsTest;

interface

uses
  DUnitX.TestFramework, System.SysUtils, UCalculationMethods;

type
  [TestFixture]
  TCalculationMethodsTest = class
  public

    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    {
      Cases to test:
      1) two positive integers
      2) two negative integers
      3) one positive integer and one negative integer (opposite)
      4) one positive integer and one negative integer (non opposite)
      5) 0 and one positive integer
      6) 0 and one negative integer
      7) 0 + 0
      8) High(Integer)
      9) Low(Integer)
    }

    [Category('Tests within Integer type boundaries')]
    [TestCase('Test 1) two positives','1,1,2')]
    [TestCase('Test 2) two negatives','-1,-1,-2')]
    [TestCase('Test 3) one negative and one positive (opposite)','-1,1,0')]
    [TestCase('Test 4) one positive and one positive (non opposite','1,-2,-1')]
    [TestCase('Test 5) one null and one positive','0,1,1')]
    [TestCase('Test 6) one null and one negative','0,-1,-1')]
    [TestCase('Test 7) two null','0,0,0')]

    [Category('Tests with limits of Integer type boundaries')]
    [TestCase('Test adding 2 positives equal to High(Integer) / MaxInt / 2147483647 value','2147483647,2147483647,4294967294')]
    [TestCase('Test adding 2 negatives equal to Low(Integer) / -2147483648 value','-2147483648,-2147483648,-4294967296')]
    [TestCase('Test adding opposite limits of Integer type values','-2147483648,2147483647,-1')]

    procedure TestTAddition(const AValue1, AValue2 : Integer; const AExpectedValue : Int64);

    [Test]
    {
      Cases to test:
      1) two positive integers
      2) two negative integers
      3) one positive integer and one negative integer
      4) 0 by one positive integer
      5) 0 by one negative integer
      6) 1 by one positive integer
      7) 1 by one negative integer
      8) -1 by one positive integer
      9) -1 by one negative integer
      10) 0 by 0
      11) High(Integer)
      12) Low(Integer)
    }

    [Category('Tests within Integer type boundaries')]
    [TestCase('Test 1) two positives','2,2,4')]
    [TestCase('Test 2) two negatives','-2,-2,4')]
    [TestCase('Test 3) one negative by one positive','-2,2,-4')]
    [TestCase('Test 4) 0 by one positive','0,2,0')]
    [TestCase('Test 5) 0 by one negative integer','0,-2,0')]
    [TestCase('Test 6) 1 by one positive','1,2,2')]
    [TestCase('Test 7) 1 by one negative','1,-2,-2')]
    [TestCase('Test 8) -1 by one positive','-1,2,-2')]
    [TestCase('Test 9) -1 by one negative','-1,-2,2')]
    [TestCase('Test 10) two null','0,0,0')]

    [Category('Tests outside Integer type boundaries')]
    [TestCase('Test multiplying 2 positives exceeding MaxInt (2147483647) value','2147483647,2,4294967294')]
    [TestCase('Test multiplying 2 negatives exceeding -2147483648 value','-2147483648,-2,4294967296')]

    [Category('Tests with limits of Integer type boundaries')]
    [TestCase('Test multiplying 2 positives equal to MaxInt (2147483647) value','2147483647,2147483647,4611686014132420609')]
    [TestCase('Test multiplying 2 negatives equal to -2147483648 value','-2147483648,-2147483648,4611686018427387904')]

    procedure TestTMultiplication(const AValue1, AValue2 : Integer; const AExpectedValue : Int64);

    [Test]
    {
      Cases to test:
      1) two positive integers
      2) two negative integers
      3) one positive integer and one negative integer
      4) 0 by one positive integer
      5) 0 by one negative integer
      6) 1 by one positive integer
      7) 1 by one negative integer
      8) -1 by one positive integer
      9) -1 by one negative integer
      10) 0 by 0
      11) High(Integer)
      12) Low(Integer)
    }

    [Category('Tests within Integer type boundaries')]
    [TestCase('Test 1) two positives','2,2,4')]
    [TestCase('Test 2) two negatives','-2,-2,4')]
    [TestCase('Test 3) one negative by one positive','-2,2,-4')]
    [TestCase('Test 4) 0 by one positive','0,2,0')]
    [TestCase('Test 5) 0 by one negative integer','0,-2,0')]
    [TestCase('Test 6) 1 by one positive','1,2,2')]
    [TestCase('Test 7) 1 by one negative','1,-2,-2')]
    [TestCase('Test 8) -1 by one positive','-1,2,-2')]
    [TestCase('Test 9) -1 by one negative','-1,-2,2')]
    [TestCase('Test 10) two null','0,0,0')]

    [Category('Tests outside Integer type boundaries')]
    [TestCase('Test multiplying 2 positives exceeding MaxInt (2147483647) value','2147483647,2,4294967294')]
    [TestCase('Test multiplying 2 negatives exceeding -2147483648 value','-2147483648,-2,4294967296')]

    [Category('Tests with limits of Integer type boundaries')]
    [TestCase('Test multiplying 2 positives equal to MaxInt (2147483647) value','2147483647,2147483647,4611686014132420609')]
    [TestCase('Test multiplying 2 negatives equal to -2147483648 value','-2147483648,-2147483648,4611686018427387904')]

    procedure TestTMultiplicationPerAddition(const AValue1, AValue2 : Integer; const AExpectedValue : Int64);

  private
    FActual : TCalculationMethod;
    FExpected : Int64;
  end;

implementation

  procedure TCalculationMethodsTest.Setup;
    begin
    end;

  procedure TCalculationMethodsTest.TearDown;
    begin
      if Assigned(FActual) then
        FreeAndNil(FActual);
    end;

  procedure TCalculationMethodsTest.TestTAddition(const AValue1, AValue2 : Integer; const AExpectedValue : Int64);
    begin
      FActual := TAddition.Create;
      FExpected := AExpectedValue;
      Assert.AreEqual(FActual.Calculation(AValue1, AValue2), FExpected);
    end;

procedure TCalculationMethodsTest.TestTMultiplication(const AValue1, AValue2 : Integer; const AExpectedValue : Int64);
    begin
      FActual := TMultiplication.Create;
      FExpected := AExpectedValue;
      Assert.AreEqual(FActual.Calculation(AValue1, AValue2), FExpected);
    end;

  procedure TCalculationMethodsTest.TestTMultiplicationPerAddition(const AValue1, AValue2 : Integer; const AExpectedValue : Int64);
   begin
      FActual := TMultiplicationPerAddition.Create;
      FExpected := AExpectedValue;
      Assert.AreEqual(FActual.Calculation(AValue1, AValue2), FExpected);
   end;

  initialization
    TDUnitX.RegisterTestFixture(TCalculationMethodsTest);

end.
