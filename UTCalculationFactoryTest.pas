unit UTCalculationFactoryTest;

interface

uses
  DUnitX.TestFramework, UTCalculationFactory, UTCalculationType, UICalculation;

type
  [TestFixture]
  TCalculationFactoryTest = class
  public

    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    [TestCase('Test Addition - using TCalculationType value','cAdd')]
    procedure CalculationMethodAdditionIntergrationTest(const AValue1 : TCalculationType);

    [Test]
    [TestCase('Test Multiplication - using TCalculationType value','cMulti')]
    procedure CalculationMethodMultiplicationIntegrationTest(const AValue1 : TCalculationType);

    [Test]
    [TestCase('Test Multiplication per addition - using TCalculationType value','CMultiPerAdd')]
    procedure CalculationMethodMultiplicationPerAdditionIntegrationTest(const AValue1 : TCalculationType);
  end;

implementation

  uses
    UCalculationMethods;

  procedure TCalculationFactoryTest.Setup;
    begin
    end;

  procedure TCalculationFactoryTest.TearDown;
    begin
    end;

  procedure TCalculationFactoryTest.CalculationMethodMultiplicationPerAdditionIntegrationTest(
  const AValue1: TCalculationType);
    var
      actual, expected: ICalculation;
    begin
      actual := TCalculationFactory.CalculationMethod(AValue1);
      expected := TMultiplicationPerAddition.Create;
      // As actual and expected are Interfaces, integration test only is possible here
      Assert.AreEqual(actual.Calculation(10,10), expected.Calculation(10,10));
    end;

  procedure TCalculationFactoryTest.CalculationMethodMultiplicationIntegrationTest(
    const AValue1: TCalculationType);
    var
      actual, expected: ICalculation;
    begin
      actual := TCalculationFactory.CalculationMethod(AValue1);
      expected := TMultiplication.Create;
      // As actual and expected are Interfaces, integration test only is possible here
      Assert.AreEqual(actual.Calculation(10,10), expected.Calculation(10,10));
    end;

  procedure TCalculationFactoryTest.CalculationMethodAdditionIntergrationTest(const AValue1 : TCalculationType);
    var
      actual, expected: ICalculation;
    begin
      actual := TCalculationFactory.CalculationMethod(AValue1);
      expected := TAddition.Create;
      // As actual and expected are Interfaces, integration test only is possible here
      Assert.AreEqual(actual.Calculation(10,10), expected.Calculation(10,10));
    end;

  initialization
    TDUnitX.RegisterTestFixture(TCalculationFactoryTest);

end.
