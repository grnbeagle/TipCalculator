//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Amie Kweon on 5/8/14.
//  Copyright (c) 2014 Amie Kweon. All rights reserved.
//
//  Settings page: display text fields for min and max percent values and
//  a picker view with a list of major currencies.
//  http://cl.ly/image/2b403p1C3t3j

#import "SettingsViewController.h"

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Settings";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.currencyArray = [[NSArray alloc] initWithObjects:
                          @"U.S. Dollar (USD)",
                          @"European Euro (EUR)",
                          @"Japanese Yen (JPY)",
                          @"British Pound (GBP)",
                          @"Swiss Frac (CHF)",
                          @"Korean Won (KRW)",
                          @"Mexican Peso (MXN)",
                          nil];
    self.currencySymbolArray = [[NSArray alloc] initWithObjects: @"$", @"€", @"¥", @"£", @"₣", @"₩", @"₱", nil];

    self.currencyPicker.delegate = self;
    self.currencyPicker.dataSource = self;
    
    // Populate values from data store
    NSUserDefaults *store = [NSUserDefaults standardUserDefaults];
    NSString *currencySymbol = [store objectForKey:@"currencySymbol"];
    int minPercent = [store integerForKey:@"minPercent"];
    int maxPercent = [store integerForKey:@"maxPercent"];
    
    NSInteger currencySymbolIndex = [self.currencySymbolArray indexOfObject:currencySymbol];
    if (currencySymbolIndex == NSNotFound) {
        currencySymbolIndex = 0;
    }
    [self.currencyPicker selectRow:currencySymbolIndex inComponent:0 animated:NO];
    self.txtMinimum.text = [NSString stringWithFormat:@"%d", minPercent];
    self.txtMaximum.text = [NSString stringWithFormat:@"%d", maxPercent];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.currencyArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.currencyArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSUserDefaults *store = [NSUserDefaults standardUserDefaults];
    [store setObject:[self.currencySymbolArray objectAtIndex:row] forKey:@"currencySymbol"];
    [store synchronize];
}

- (void)viewWillDisappear:(BOOL)animated {
    NSUserDefaults *store = [NSUserDefaults standardUserDefaults];
    int minPercent = [self.txtMinimum.text integerValue];
    int maxPercent = [self.txtMaximum.text integerValue];
    // Make sure max is always greater than min
    if (minPercent > maxPercent) {
        maxPercent = minPercent + 10;
    }
    [store setInteger:minPercent forKey:@"minPercent"];
    [store setInteger:maxPercent forKey:@"maxPercent"];
    [store synchronize];
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

@end
