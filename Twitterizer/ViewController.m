//
//  ViewController.m
//  Twitterizer
//
//  Created by Kanybek Zhagusaev on 1/13/16.
//  Copyright © 2016 MobileMakers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onTwitterizeButtonPressed:(UIButton *)sender
{
    NSString* initialString = self.textView.text;
    NSMutableString* twitterizedString = [NSMutableString new];
    //for(int i=0; )
    
}

@end
