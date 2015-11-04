//
//  ViewController.m
//  CustomProgress
//
//  Created by Nicolas Linard on 04/11/2015.
//  Copyright © 2015 MEDES. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet YLProgressBar *progressBar;
@property (nonatomic) CGFloat counter;
@property (weak, nonatomic) IBOutlet UILabel *counterLabel;
@property (weak, nonatomic) IBOutlet UIButton *decrementButton;
@property (weak, nonatomic) IBOutlet UIButton *incrementButton;

@end

@implementation ViewController

CGFloat const COUNTER_MAX = 15.0f;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.counter = 1.0f;
    // Do any additional setup after loading the view, typically from a nib.
    self.progressBar.type               = YLProgressBarTypeFlat;
    self.progressBar.progressTintColors  = [[NSArray alloc]initWithObjects:[UIColor blueColor],[UIColor blueColor], nil];
    self.progressBar.hideStripes        = YES;
    self.progressBar.trackTintColor = [UIColor whiteColor];
    
    [self updateCounterAndProgressBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)decrementCounter:(id)sender {
    if(self.counter >1) {
        self.counter--;
        [self updateCounterAndProgressBar];
    }
}
- (IBAction)incrementCounter:(id)sender {
    self.counter++;
    [self updateCounterAndProgressBar];
}

- (void) updateCounterAndProgressBar {
    if (self.counter == 1) {
        self.decrementButton.enabled = NO;
    } else {
        self.decrementButton.enabled = YES;
    }
    if (self.counter == COUNTER_MAX) {
        self.incrementButton.enabled = NO;
    } else {
        self.incrementButton.enabled = YES;
    }
    
    self.counterLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)self.counter];
    CGFloat progress = self.counter/COUNTER_MAX;
    [self.progressBar setProgress:progress animated:YES];
}

@end
