//
//  CalcBrain.m
//  Lv-160_Calculator_by_Dumiak
//
//  Created by Admin on 27.08.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalcBrain.h"

@implementation CalcBrain
@synthesize operandOne = _operandOne,operandTwo = _operandTwo, resultOfOperation = _resultOfOperation;
@synthesize tmpDataStringForOp1 = _tmpDataStringForOp1, tmpDataStringForOp2 = _tmpDataStringForOp2;
@synthesize numberOfArythmeticalOperation = _numberOfArythmeticalOperation;
@synthesize flagDecimal1 = _flagDecimal1, flagDecimal2 = _flagDecimal2, flagOperandControl = _flagOperandControl;

+(CalcBrain*)singletonCalcBrain{
    static CalcBrain *singleObject;
    static dispatch_once_t predicat;
    dispatch_once(&predicat, ^{singleObject = [[CalcBrain alloc] init];});
    return singleObject;
}

-(NSString*)setTmpDataString: (NSInteger)symbolForConcatenation{
    NSString *tmp;
    if(symbolForConcatenation == 666)
    {
        if(self.flagDecimal1==0)
        {
            tmp=[NSString stringWithFormat:@"."];
            self.flagDecimal1=1;
        }
        else
        {
            tmp = @"";
        }
    }
    else
    {
        tmp=[NSString stringWithFormat:@"%ld",(long)symbolForConcatenation];
    }
    self.tmpDataStringForOp1 = [self.tmpDataStringForOp1 stringByAppendingString:tmp];
    return  self.tmpDataStringForOp1;
}

-(NSString*)setTmpDataString2:(NSInteger)symbolForConcatenation{
    NSString *tmp;
    if(symbolForConcatenation == 666)
    {
        if(self.flagDecimal2 == 0)
        {
            tmp=[NSString stringWithFormat:@"."];
            self.flagDecimal2=1;
        }
        else
        {
            tmp = @"";
        }
    }
    else
    {
        tmp=[NSString stringWithFormat:@"%ld",(long)symbolForConcatenation];
    }
    self.tmpDataStringForOp2 =  [self.tmpDataStringForOp2 stringByAppendingString:tmp];
    return  self.tmpDataStringForOp2;
}

-(void)setNumberOfArythmeticalOperation:(long)numOfOperation{
   
    _numberOfArythmeticalOperation = numOfOperation;
    if(self.flagOperandControl==0)
    {
        self.operandOne = [self.tmpDataStringForOp1 doubleValue];
        self.flagOperandControl=1;
    }
}

-(NSString*)getResultOfArythmeticalOperation{
    self.operandTwo= [self.tmpDataStringForOp2 doubleValue];
    NSString *tmpStr;
    switch (self.numberOfArythmeticalOperation)
    {
        case 10:
            self.resultOfOperation = self.operandOne+self.operandTwo;
            self.numberOfArythmeticalOperation=0;
            tmpStr = [NSString stringWithFormat:@"%f",self.resultOfOperation];
            self.operandOne = self.resultOfOperation;
            break;
            
        case 11:
            self.resultOfOperation = self.operandOne-self.operandTwo;
            self.numberOfArythmeticalOperation=0;
            tmpStr = [NSString stringWithFormat:@"%f",self.resultOfOperation];
            self.operandOne = self.resultOfOperation;
            break;
            
        case 12:
            self.resultOfOperation = self.operandOne*self.operandTwo;
            self.numberOfArythmeticalOperation=0;
            tmpStr = [NSString stringWithFormat:@"%f",self.resultOfOperation];
            self.operandOne = self.resultOfOperation;
            break;
            
        case 13:
            self.resultOfOperation = self.operandOne/self.operandTwo;
            self.numberOfArythmeticalOperation=0;
            tmpStr = [NSString stringWithFormat:@"%f",self.resultOfOperation];
            self.operandOne = self.resultOfOperation;
            break;
            
        case 14:
            self.resultOfOperation = [self getFactorial];
            self.numberOfArythmeticalOperation=0;
            tmpStr = [NSString stringWithFormat:@"%f",self.resultOfOperation];
            self.operandOne = self.resultOfOperation;
            break;
            
        case 15:
            self.resultOfOperation = pow(self.operandOne,2);
            self.numberOfArythmeticalOperation=0;
            tmpStr = [NSString stringWithFormat:@"%f",self.resultOfOperation];
            self.operandOne = self.resultOfOperation;
            break;
            
        case 16:
            self.resultOfOperation = sqrt(self.operandOne);
            self.numberOfArythmeticalOperation=0;
            tmpStr = [NSString stringWithFormat:@"%f",self.resultOfOperation];
            self.operandOne = self.resultOfOperation;
            break;
    }
    self.flagDecimal1 = 0;
    self.flagDecimal2 = 0;
    self.tmpDataStringForOp1 = @" ";
    self.tmpDataStringForOp2 = @" ";
    return tmpStr;
}

-(double)getFactorial{
    double tmpFactRes = 1;
    for(int i = 2;i <= self.operandOne;i++){
        tmpFactRes = tmpFactRes * i;
    }
    return tmpFactRes;
}

-(NSMutableString*)backspace{
    NSMutableString* tmp;
    NSInteger lengthTmp;
    
    if(self.flagOperandControl == 0)
    {
        tmp = [NSMutableString stringWithString:self.tmpDataStringForOp1];
        lengthTmp = [tmp length];
    }
    
    else
    {
        tmp = [NSMutableString stringWithString:self.tmpDataStringForOp2];
        lengthTmp = [tmp length];
    }
    
   
    if(lengthTmp > 2 && self.flagOperandControl == 0)
    {
        [tmp deleteCharactersInRange:NSMakeRange(lengthTmp-1,1)];
        self.tmpDataStringForOp1 = tmp;
    }
    
    if(lengthTmp == 2 && self.flagOperandControl == 0)
    {
        tmp = [NSMutableString stringWithString:@" 0"];
        self.tmpDataStringForOp1 = tmp;
    }
  
    if(lengthTmp > 2 && self.flagOperandControl == 1)
    {
        [tmp deleteCharactersInRange:NSMakeRange(lengthTmp-1,1)];
        self.tmpDataStringForOp2= tmp;
    }
    
    if(lengthTmp == 2 && self.flagOperandControl == 1)
    {
        tmp = [NSMutableString stringWithString:@" 0"];
        self.tmpDataStringForOp2 = tmp;
    }
    return tmp;
}

-(void)deleteAll{
    self.operandOne = 0;
    self.operandTwo = 0;
    self.tmpDataStringForOp1=@" ";
    self.tmpDataStringForOp2=@" ";
    self.resultOfOperation = 0;
    self.numberOfArythmeticalOperation = 0;
    self.flagOperandControl=0;
}

@end