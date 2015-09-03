//
//  CalcBrain.h
//  Lv-160_Calculator_by_Dumiak
//
//  Created by Admin on 27.08.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#ifndef Lv_160_Calculator_by_Dumiak_CalcBrain_h
#define Lv_160_Calculator_by_Dumiak_CalcBrain_h

@interface CalcBrain : NSObject 
@property double operandOne, operandTwo, resultOfOperation;
@property  NSString* tmpDataStringForOp1, *tmpDataStringForOp2;
@property (nonatomic) long numberOfArythmeticalOperation;
@property  int flagDecimal1, flagDecimal2, flagOperandControl;
+(CalcBrain*)singletonCalcBrain;
-(NSString*)setTmpDataString:(NSInteger)symbolForConcatenation;
-(NSString*)setTmpDataString2:(NSInteger)symbolForConcatenation;
-(void)setNumberOfArythmeticalOperation:(long int)numOfOperation;
-(NSString*)getResultOfArythmeticalOperation;
-(void)deleteAll;
-(double)getFactorial;
-(NSString*)backspace;
@end
#endif
