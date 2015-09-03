//
//  SuperCalc.h
//  Lv-160_dumyak
//
//  Created by Admin on 04.09.15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SuperCalc : NSObject
-(double)calculateRecursiveFunction:(NSScanner*)textScanner;
-(double)calculateSubResult:(NSString*)currentFormula;
@end
