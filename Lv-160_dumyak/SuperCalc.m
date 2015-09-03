//
//  SuperCalc.m
//  Lv-160_dumyak
//
//  Created by Admin on 04.09.15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import "SuperCalc.h"

@implementation SuperCalc
-(double)calculateRecursiveFunction: (NSScanner*)textSanner {
    static int flagRecursion = 0;
    double operand1;
    double result=0;
    NSMutableCharacterSet *operationCombination = [NSMutableCharacterSet characterSetWithCharactersInString:@"+()-*"];
    NSString *next;
    static NSString* opPrevRec;
    

    while([textSanner isAtEnd]==NO){
    
        if(flagRecursion==0)
        {
            [textSanner scanDouble:&result];
            flagRecursion++;
        }
        
        else
        {
            if(([opPrevRec isEqualToString:@")+"]||[opPrevRec isEqualToString:@")-"])==NO)
            {
                [textSanner scanCharactersFromSet:operationCombination intoString:&next];
            }
            
            
            if([opPrevRec isEqualToString:@")+"])
            {
                next=@"+";
                opPrevRec=nil;
            }
            
            
            if([opPrevRec isEqualToString:@")-"])
            {
                next=@"-";
                opPrevRec=nil;
            }
            
            
            if(([next isEqualToString:@"+("]||
                [next isEqualToString:@"-("]||
                [next  isEqualToString:@"*("])==NO)
            {
                if(([next isEqualToString:@")+("]||
                    [next  isEqualToString:@")-("]||
                    [next  isEqualToString:@")*("]||
                    [next isEqualToString:@")+"]||
                    [next isEqualToString:@")-"])==NO)
                {
                    [textSanner scanDouble:&operand1];
                }
            }
            
        }
        
        
        if(([opPrevRec isEqualToString:@"+("]&&[next isEqualToString:@")+"])||
           ([opPrevRec isEqualToString:@"-("]&&[next isEqualToString:@")-"])||
           ([opPrevRec isEqualToString:@"+("]&&[next isEqualToString:@")-"])||
           ([opPrevRec isEqualToString:@"-("]&&[next isEqualToString:@")+"])||
           ([opPrevRec isEqualToString:@"*("]&&[next isEqualToString:@")+"])||
           ([opPrevRec isEqualToString:@"*("]&&[next isEqualToString:@")-"])||
           ([opPrevRec isEqualToString:@"*("]&&[next isEqualToString:@")*"])||
           ([opPrevRec isEqualToString:@"(+"]&&[next isEqualToString:@")*"])||
           ([opPrevRec isEqualToString:@"-("]&&[next isEqualToString:@")*"]))
        {
            opPrevRec=next;
            break;
        }
        
        //*************************REGULAR***********
        
        if([next isEqualToString:@"+"]||
           [next isEqualToString:@")+"])
        {
            result = result+operand1;
          
        }
        
        if([next isEqualToString:@"-"]||
           [next isEqualToString:@")-"])
        {
            result = result-operand1;
        }
        
        if([next isEqualToString:@"*"]||
           [next isEqualToString:@")*"])
        {
            result = result*operand1;
        }
        
        
        
        //**************************RECURSION***************
        if([next isEqualToString:@"+("]||
           [next isEqualToString:@")+("]||
           [next isEqualToString:@"-("]||
           [next isEqualToString:@")-("]||
           [next isEqualToString:@"*("]||
           [next isEqualToString:@")*("])
        {
            flagRecursion--;
            opPrevRec=next;
            NSInteger range;
            range = [textSanner scanLocation];
            
            
            if([next isEqualToString:@"+("]||
               [next isEqualToString:@")+("])
            {
                result+=[self calculateRecursiveFunction:textSanner];
            }
            
            if([next isEqualToString:@"-("]||
               [next isEqualToString:@")-("])
            {
                result-=[self calculateRecursiveFunction:textSanner];
            }
            
            if([next isEqualToString:@"*("]||
               [next isEqualToString:@")*("])
            {
                result*=[self calculateRecursiveFunction:textSanner];
            }
        }
    }
    return result;
}


-(double)calculateSubResult:(NSString *)currentFormula{
    double result;
    NSExpression *myNewFormulaForCalculating = [NSExpression expressionWithFormat:currentFormula];
    result = [[myNewFormulaForCalculating expressionValueWithObject:nil context:nil] doubleValue];
    return result;
}
@end
