//
//  ViewController.m
//  Lv-160_Calculator_by_Dumiak
//
//  Created by Admin on 27.08.15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
@property UILabel *lable;
@property UIButton *One, *Two, *Three, *Four, *Five;
@property int flagHowToCalulate;
@end

@implementation ViewController
@synthesize flagHowToCalulate;
@synthesize mainDisplay;
- (void)viewDidLoad {
    [super viewDidLoad];
    CalcBrain *singleObCalcBrain = [CalcBrain singletonCalcBrain];
    singleObCalcBrain.tmpDataStringForOp1 = @" ";
    singleObCalcBrain.tmpDataStringForOp2=@" ";
    singleObCalcBrain.flagDecimal1=0;
    singleObCalcBrain.flagDecimal2=0;
    singleObCalcBrain.flagOperandControl = 0;
    flagHowToCalulate=0;
    // Do any additional setup after loading the view, typically from a nib.
}




- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    
    
 
    if( toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft){
        CGRect lableRect = CGRectMake(400, 170, 40, 90);
        _One = [UIButton buttonWithType:UIButtonTypeSystem];
        [_One setTitle:@"x^y" forState:UIControlStateNormal];
        [_One sizeToFit];
        
    _One.frame = CGRectMake(300.0, 195.0, 60, 40);
        _One.backgroundColor = [UIColor blueColor];
        
        [_One addTarget:self action:@selector(setArythmeticalOperation:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_One];
        
        
        _Two = [UIButton buttonWithType:UIButtonTypeSystem];
        [_Two setTitle:@"x^2" forState:UIControlStateNormal];
        [_Two sizeToFit];
        
        _Two.frame = CGRectMake(300.0, 148.0, 60, 40);
        _Two.backgroundColor = [UIColor blueColor];
        [_Two addTarget:self action:@selector(setArythmeticalOperation:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_Two];
        
        _Three = [UIButton buttonWithType:UIButtonTypeSystem];
        [_Three setTitle:@"COS" forState:UIControlStateNormal];
        [_Three sizeToFit];
        
        _Three.frame = CGRectMake(300.0, 100.0, 60, 40);
        _Three.backgroundColor = [UIColor blueColor];
        [_Three addTarget:self action:@selector(setArythmeticalOperation:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_Three];
        

        

        /*
        _lable = [[UILabel alloc]initWithFrame:lableRect];
        _lable.text = @"hello!";
        [self.view addSubview:_lable];
        */
        
        
    }
    if(toInterfaceOrientation == UIInterfaceOrientationPortrait){
       [self.lable removeFromSuperview];
        [self.One removeFromSuperview];
        [self.Two removeFromSuperview];
        [self.Three removeFromSuperview];
        
    }

    
}


- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    
    
}

- (IBAction)switchCalculatingSystem:(id)sender {
    static int count=0;
    count++;
    if(count==1){
        flagHowToCalulate=1;
        }
    if(count>1){
        flagHowToCalulate=0;
        count=0;
    }
}

/*
-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    UIButton *button;
    UILabel * lable;
    if( interfaceOrientation == UIInterfaceOrientationLandscapeLeft){
    
    CGRect lableRect = CGRectMake(150, 200, 40, 90);
    
    button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"PRESS" forState:UIControlStateNormal];
    [button sizeToFit];
    [self.view addSubview:button];
    
    
  lable = [[UILabel alloc]initWithFrame:lableRect];
    lable.text = @"hello!";
    [self.view addSubview:lable];
    }
    if(interfaceOrientation == UIInterfaceOrientationPortrait){
        [lable removeFromSuperview];
        [button removeFromSuperview];
        
    }
    
}
*/


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setDigit:(id)sender {
    if(flagHowToCalulate==0)
    {
    CalcBrain *singleObCalcBrain = [CalcBrain singletonCalcBrain];
    if(singleObCalcBrain.numberOfArythmeticalOperation<9)
    {
        if(!([sender tag]==10||[sender tag]==11||[sender tag]==12||[sender tag]==13||[sender tag]==100||[sender tag]==89||[sender tag]==90)){
            mainDisplay.text = [singleObCalcBrain setTmpDataString:[sender tag]];}
    }
    else
    { if(!([sender tag]==10||[sender tag]==11||[sender tag]==12||[sender tag]==13||[sender tag]==100||[sender tag]==89||[sender tag]==90)){
         mainDisplay.text = [singleObCalcBrain setTmpDataString2:[sender tag]];
    }
    }
        
    }
    else
    {
         static NSString *formula =@" ";
       
        
            
        SuperCalc *ob;
        NSScanner *new;
        double res1, res2;
        NSString *tmp;
        
        switch([sender tag]){
            case 10:
                tmp=@"+";
                break;
                
            case 11:
                 tmp=@"-";
                break;
            case 12:
                 tmp=@"*";
                break;
            case 13:
                 tmp=@"/";
                break;
            case 89:
                tmp=@"(";
                break;
            case 90:
                tmp=@")";
                break;
                
                
            case 100:
                ob = [[SuperCalc alloc]init];
                new = [NSScanner scannerWithString:formula];
               //res1=[ob calculateRecursiveFunction:new];
                res2=[ob calculateSubResult:formula];
                formula = @" ";
                if(res1!=res2){
                    tmp = [NSString stringWithFormat:@"%f",res2];
                    mainDisplay.text = tmp;
                }
                else{
                   tmp = [NSString stringWithFormat:@"%f",res1];
                   mainDisplay.text = tmp;
                }
                
                break;
               
              
        }
        
        if(tmp==nil){
             tmp = [NSString stringWithFormat:@"%li",(long)[sender tag]];
        }
        
        formula = [formula stringByAppendingString:tmp];
        
        mainDisplay.text = formula;
  
        NSLog(@"%@",formula);
        
        
    }
}

- (IBAction)setArythmeticalOperation:(id)sender {
    CalcBrain* singleObCalcBrain = [CalcBrain singletonCalcBrain];
    [singleObCalcBrain setNumberOfArythmeticalOperation:[sender tag]];
    
}
- (IBAction)backspace:(id)sender {
    CalcBrain* singleObCalcBrain = [CalcBrain singletonCalcBrain];
    mainDisplay.text=[singleObCalcBrain backspace];
}

- (IBAction)clearAll:(id)sender {
    CalcBrain* singleObCalcBrain = [CalcBrain singletonCalcBrain];
    [singleObCalcBrain deleteAll];
    mainDisplay.text = @"0";
    
}

- (IBAction)getResult:(id)sender {
    CalcBrain *singleObCalcBrain = [CalcBrain singletonCalcBrain];
    mainDisplay.text =[singleObCalcBrain getResultOfArythmeticalOperation];
}
@end
