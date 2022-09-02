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

  private
    FActual, FExpected: ICalculation;
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


  procedure TCalculationFactoryTest.CalculationMethodAdditionIntergrationTest(const AValue1 : TCalculationType);
    begin
      FActual := TCalculationFactory.CalculationMethod(AValue1);
      FExpected := TAddition.Create;
      Assert.AreEqual(FActual.Calculation(10,10), FExpected.Calculation(10,10));
    end;

  procedure TCalculationFactoryTest.CalculationMethodMultiplicationIntegrationTest(
    const AValue1: TCalculationType);
    begin
      FActual := TCalculationFactory.CalculationMethod(AValue1);
      FExpected := TMultiplication.Create;
      Assert.AreEqual(FActual.Calculation(10,10), FExpected.Calculation(10,10));
    end;

  procedure TCalculationFactoryTest.CalculationMethodMultiplicationPerAdditionIntegrationTest(
  const AValue1: TCalculationType);
    begin
      FActual := TCalculationFactory.CalculationMethod(AValue1);
      FExpected := TMultiplicationPerAddition.Create;
      Assert.AreEqual(FActual.Calculation(10,10), FExpected.Calculation(10,10));
    end;

  initialization
    TDUnitX.RegisterTestFixture(TCalculationFactoryTest);

end.
