//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Amie Kweon on 5/8/14.
//  Copyright (c) 2014 Amie Kweon. All rights reserved.
//

#import "SettingsViewController.h"

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    [self.currencyPicker selectRow:0 inComponent:0 animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return sizeof (self.currencyArray);
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.currencyArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"---> %@", [self.currencySymbolArray objectAtIndex:row]);
}
@end
