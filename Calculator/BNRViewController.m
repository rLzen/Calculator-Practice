//
//  BNRViewController.m
//  Calculator
//
//  Created by Richard on 6/22/14.
//  Copyright (c) 2014 Team_7. All rights reserved.
//

#import "BNRViewController.h"

@interface BNRViewController ()

@property (nonatomic) int firstNumber;
@property (nonatomic) int secondNumber;
@property (nonatomic) BOOL typingNumber;
@property (nonatomic, copy) NSString *operation;
@property (weak, nonatomic) IBOutlet UILabel *calculatorDisplay;


@end

@implementation BNRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressedNumbers:(UIButton *)sender 
{
    NSString *number = sender.currentTitle;
    if (self.typingNumber)
        {
            self.calculatorDisplay.text = [self.calculatorDisplay.text stringByAppendingString:number ];
        }  
    else 
        {
            self.calculatorDisplay.text = number;
            
            self.typingNumber = YES;
        }
    
    
}

- (IBAction)calculationPressed:(id)sender 
{ 
    self.typingNumber = NO; 
    self.firstNumber = [self.calculatorDisplay.text intValue];
    self.operation = [sender currentTitle];
}

- (IBAction)equalsPressed 
{ 
    self.typingNumber = NO; 
    self.secondNumber = [self.calculatorDisplay.text intValue];
    
    int result = 0;
    
    if ([self.operation isEqualToString:@"+"]) 
        { 
            result = self.firstNumber + self.secondNumber; 
        } 
    else if ([self.operation isEqualToString:@"-"]) 
        { 
            result = self.firstNumber - self.secondNumber; 
        }
    else if ([self.operation isEqualToString:@"*"])
        {
            result = self.firstNumber * self.secondNumber;
        }
    else if ([self.operation isEqualToString:@"/"])
        {
            result = self.firstNumber / self.secondNumber;
        }
    
    self.calculatorDisplay.text = [NSString stringWithFormat:@"%d", result]; 
}

@end
