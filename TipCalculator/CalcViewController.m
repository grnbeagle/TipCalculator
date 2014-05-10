//
//  CalcViewController.m
//  TipCalculator
//
//  Created by Amie Kweon on 5/4/14.
//  Copyright (c) 2014 Amie Kweon. All rights reserved.
//
//  Calculator View: display a text field for bill, a slider for selecting tip percent,
//  and labels for the total.
//  http://cl.ly/image/2j3N2v1A3y2e

#import "CalcViewController.h"
#import "SettingsViewController.h"

@implementation CalcViewController

NSString *currencySymbol;

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
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithTitle:@"Settings"
                                              style:UIBarButtonItemStylePlain
                                              target:self
                                              action:@selector(onSettingsButton)];
    [self loadData];
    [self updateValues];
}

- (void)viewWillAppear:(BOOL)animated {
    [self loadData];
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
    self.lblTipAmount.text = [NSString stringWithFormat:@"%@%0.2f", currencySymbol, tipAmount];
    self.lblTotalAmount.text = [NSString stringWithFormat:@"%@%0.2f", currencySymbol, totalAmount];
}

- (void)loadData {
    NSUserDefaults *store = [NSUserDefaults standardUserDefaults];
    currencySymbol = [store objectForKey:@"currencySymbol"];
    if (currencySymbol == nil) {
        currencySymbol = @"$";
    }
    int minPercent = [store integerForKey:@"minPercent"];
    int maxPercent = [store integerForKey:@"maxPercent"];
    // Use default values if not in data store
    if (minPercent == 0) {
        minPercent = 10;
    }
    if (maxPercent == 0) {
        maxPercent = 20;
    }
    self.sliderTipPercent.minimumValue = minPercent;
    self.sliderTipPercent.maximumValue = maxPercent;
    self.lblCurrencySymbol.text = currencySymbol;
    self.lblMinimumPercent.text = [NSString stringWithFormat:@"%d%%", minPercent];
    self.lblMaximumPercent.text = [NSString stringWithFormat:@"%d%%", maxPercent];
}

- (void)onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}
@end
