unit UTCalculationMethodsTest;

interface

uses
  DUnitX.TestFramework, UCalculationMethods;

type
  [TestFixture]
  TCalculationMethodsTest = class
  public

    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    [TestCase('Test two negatives lower than -1','-2,-2')]
    [TestCase('Test two negatives with one lower than -1','-1,-2')]
    [TestCase('Test two negatives lower equal to -1','-1,-1')]
    [TestCase('Test one null and one negative lower than -1','0,-2')]
    [TestCase('Test one null and one negative equals to -1','0,-1')]
    [TestCase('Test two null','0,0')]
    [TestCase('Test one null and one positive equals to 1','0,1')]
    [TestCase('Test one null and one positive upper than 1','0,2')]
    [TestCase('Test two positives equal to 1','1,1')]
    [TestCase('Test one positive equals to 1 and one positive upper than 1','1,2')]
    [TestCase('Test two positives upper than 1','2,2')]
    [TestCase('Test one negative equals to -1 and one positive equals to 1','-1,1')]
    [TestCase('Test one negative lower than -1 and one positive upper than 1','-2,2')]
    [TestCase('Test one positive equals to 1 and one negative lower than -1','1,-2')]
    [TestCase('Test one positive upper than 1 and one negative equals to -1','2,-1')]
    procedure TestTAddition(const AValue1, AValue2 : Integer);

    [Test]
    [TestCase('Test two negatives lower than -1','-2,-2')]
    [TestCase('Test two negatives with one lower than -1','-1,-2')]
    [TestCase('Test two negatives lower equal to -1','-1,-1')]
    [TestCase('Test one null and one negative lower than -1','0,-2')]
    [TestCase('Test one null and one negative equals to -1','0,-1')]
    [TestCase('Test two null','0,0')]
    [TestCase('Test one null and one positive equals to 1','0,1')]
    [TestCase('Test one null and one positive upper than 1','0,2')]
    [TestCase('Test two positives equal to 1','1,1')]
    [TestCase('Test one positive equals to 1 and one positive upper than 1','1,2')]
    [TestCase('Test two positives upper than 1','2,2')]
    [TestCase('Test one negative equals to -1 and one positive equals to 1','-1,1')]
    [TestCase('Test one negative lower than -1 and one positive upper than 1','-2,2')]
    [TestCase('Test one positive equals to 1 and one negative lower than -1','1,-2')]
    [TestCase('Test one positive upper than 1 and one negative equals to -1','2,-1')]
    procedure TestTMultiplication(const AValue1, AValue2 : Integer);

    [Test]
    [TestCase('Test two negatives lower than -1','-2,-2')]
    [TestCase('Test two negatives with one lower than -1','-1,-2')]
    [TestCase('Test two negatives lower equal to -1','-1,-1')]
    [TestCase('Test one null and one negative lower than -1','0,-2')]
    [TestCase('Test one null and one negative equals to -1','0,-1')]
    [TestCase('Test two null','0,0')]
    [TestCase('Test one null and one positive equals to 1','0,1')]
    [TestCase('Test one null and one positive upper than 1','0,2')]
    [TestCase('Test two positives equal to 1','1,1')]
    [TestCase('Test one positive equals to 1 and one positive upper than 1','1,2')]
    [TestCase('Test two positives upper than 1','2,2')]
    [TestCase('Test one negative equals to -1 and one positive equals to 1','-1,1')]
    [TestCase('Test one negative lower than -1 and one positive upper than 1','-2,2')]
    [TestCase('Test one positive equals to 1 and one negative lower than -1','1,-2')]
    [TestCase('Test one positive upper than 1 and one negative equals to -1','2,-1')]
    procedure TestTMultiplicationPerAddition(const AValue1, AValue2 : Integer);

  end;

implementation

  procedure TCalculationMethodsTest.Setup;
    begin
    end;

  procedure TCalculationMethodsTest.TearDown;
    begin
    end;

  procedure TCalculationMethodsTest.TestTAddition(const AValue1, AValue2 : Integer);
    var
      actual : TAddition;
      expected : Integer;
    begin
      actual := TAddition.Create;
      try
        expected := AValue1 + AValue2;
        Assert.AreEqual(expected, actual.Calculation(AValue1, AValue2));
      finally
        actual.Free;
      end;
    end;

  procedure TCalculationMethodsTest.TestTMultiplication(const AValue1, AValue2 : Integer);
    var
      actual : TMultiplication;
      expected : Integer;
    begin
      actual := TMultiplication.Create;
      try
        expected := AValue1 * AValue2;
        Assert.AreEqual(expected, actual.Calculation(AValue1, AValue2));
      finally
        actual.Free;
      end;
    end;

  procedure TCalculationMethodsTest.TestTMultiplicationPerAddition(const AValue1, AValue2 : Integer);
     var
      actual : TMultiplicationPerAddition;
      expected : Integer;
   begin
      actual := TMultiplicationPerAddition.Create;
      try
        expected := AValue1 * AValue2;
        Assert.AreEqual(expected, actual.Calculation(AValue1, AValue2));
      finally
        actual.Free;
      end;
   end;

  initialization
    TDUnitX.RegisterTestFixture(TCalculationMethodsTest);

end.
