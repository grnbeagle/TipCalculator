//
//  CalcViewController.h
//  TipCalculator
//
//  Created by Amie Kweon on 5/4/14.
//  Copyright (c) 2014 Amie Kweon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalcViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtBillAmount;
@property (weak, nonatomic) IBOutlet UISlider *sliderTipPercent;
@property (weak, nonatomic) IBOutlet UILabel *lblMinimumPercent;
@property (weak, nonatomic) IBOutlet UILabel *lblMaximumPercent;
@property (weak, nonatomic) IBOutlet UILabel *lblCurrencySymbol;

@property (weak, nonatomic) IBOutlet UILabel *lblTipPercent;
@property (weak, nonatomic) IBOutlet UILabel *lblTipAmount;
@property (weak, nonatomic) IBOutlet UILabel *lblTotalAmount;

- (IBAction)onTap:(id)sender;
- (IBAction)onTipPercentChanged:(id)sender;
- (void)onSettingsButton;
- (void)updateValues;
- (void)loadData;

@end
