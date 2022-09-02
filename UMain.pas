unit UMain;

interface

  uses
    System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
    FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
    FMX.Edit, FMX.Controls.Presentation,
    UICalculationResultSubscriber, UTCalculationResultPublisher;

  type
    TfrmMain = class(TForm, ICalculationResultSubscriber)
      lbl1: TLabel;
      lbl2: TLabel;
      lbl3: TLabel;
      lbl4: TLabel;
      lbl5: TLabel;
      lbl6: TLabel;
      lblResult: TLabel;
      edtVal1: TEdit;
      edtVal2: TEdit;
      swtchMultiplicationType: TSwitch;
      btnAddition: TButton;
      btnMultiplication: TButton;
      swtchSubscription: TSwitch;
      procedure FormDestroy(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure ExecuteAddition(aCaller: TObject);
      procedure ExecuteMultiplication(aCaller: TObject);
      procedure swtchSubscriptionSwitch(Sender: TObject);
    private
      FResultPublisher : TCalculationPublisherManager;
      procedure Update(aResult : Int64);
    end;

  var
    frmMain: TfrmMain;

implementation

  uses
    UTCalculationType;

{$R *.fmx}

  procedure TfrmMain.FormCreate(Sender: TObject);
    begin
      FResultPublisher := TCalculationPublisherManager.Create;
    end;

  procedure TfrmMain.FormDestroy(Sender: TObject);
    begin
      FResultPublisher.RemoveSubscriber(Self);
      FResultPublisher.Free;
    end;

  procedure TfrmMain.ExecuteAddition(aCaller: TObject);
    begin
      FResultPublisher.NotifySubscribers(cAdd, edtVal1.Text.ToInteger, edtVal2.Text.ToInteger);
    end;

  procedure TfrmMain.ExecuteMultiplication(aCaller: TObject);
    var
      CalcType: TCalculationType;
    begin
      CalcType := cMulti;
      if swtchMultiplicationType.IsChecked then
        CalcType := cMultiPerAdd;
      FResultPublisher.NotifySubscribers(CalcType, edtVal1.Text.ToInteger, edtVal2.Text.ToInteger);
    end;

  procedure TfrmMain.swtchSubscriptionSwitch(Sender: TObject);
    begin
      if swtchSubscription.IsChecked then
        FResultPublisher.RegisterSubscriber(Self)
      else
        FResultPublisher.RemoveSubscriber(Self);
    end;

procedure TfrmMain.Update(aResult: Int64);
    begin
      lblResult.Text := aResult.ToString;
    end;

end.
