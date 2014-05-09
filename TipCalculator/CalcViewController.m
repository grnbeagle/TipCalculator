//
//  CalcViewController.m
//  TipCalculator
//
//  Created by Amie Kweon on 5/4/14.
//  Copyright (c) 2014 Amie Kweon. All rights reserved.
//

#import "CalcViewController.h"
#import "SettingsViewController.h"

@interface CalcViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtBillAmount;
@property (weak, nonatomic) IBOutlet UISlider *sliderTipPercent;
@property (weak, nonatomic) IBOutlet UILabel *lblMinimumPercent;
@property (weak, nonatomic) IBOutlet UILabel *lblMaximumPercent;

@property (weak, nonatomic) IBOutlet UILabel *lblTipPercent;
@property (weak, nonatomic) IBOutlet UILabel *lblTipAmount;
@property (weak, nonatomic) IBOutlet UILabel *lblTotalAmount;

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *onTap;

- (IBAction)onTap:(id)sender;
- (IBAction)onTipPercentChanged:(id)sender;
- (void)updateValues;
- (void)onSettingsButton;
@end

@implementation CalcViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];

    // TODO: Make these configurable
    self.sliderTipPercent.minimumValue = 10;
    self.sliderTipPercent.maximumValue = 20;
    
    [self updateValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (IBAction)onTipPercentChanged:(id)sender {
    int sliderValue;
    sliderValue = lroundf(self.sliderTipPercent.value);
    [self.sliderTipPercent setValue:sliderValue animated:YES];

    [self updateValues];
}

- (void)updateValues {
    float billAmount = [self.txtBillAmount.text floatValue];
    float tipAmount = billAmount * (self.sliderTipPercent.value/100);
    float totalAmount = billAmount + tipAmount;
    
    self.lblTipPercent.text = [NSString stringWithFormat:@"%d%%", ((int)self.sliderTipPercent.value)];
    self.lblTipAmount.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.lblTotalAmount.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

- (void)onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}
@end
