//
//  SettingsViewController.h
//  TipCalculator
//
//  Created by Amie Kweon on 5/8/14.
//  Copyright (c) 2014 Amie Kweon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIPickerView *currencyPicker;
@property (strong, nonatomic) NSArray *currencyArray;
@property (strong, nonatomic) NSArray *currencySymbolArray;
@property (strong, nonatomic) IBOutlet UITextField *txtMinimum;
@property (strong, nonatomic) IBOutlet UITextField *txtMaximum;

- (IBAction)onTap:(id)sender;
@end
