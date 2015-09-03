//
//  ViewController.h
//  Lv-160_Calculator_by_Dumiak
//
//  Created by Admin on 27.08.15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalcBrain.h"
#import "SuperCalc.h"
@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *mainDisplay;
- (IBAction)setDigit:(id)sender;
- (IBAction)setArythmeticalOperation:(id)sender;
- (IBAction)getResult:(id)sender;


@end

