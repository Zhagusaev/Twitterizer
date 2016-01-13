//
//  ViewController.m
//  Twitterizer
//
//  Created by Kanybek Zhagusaev on 1/13/16.
//  Copyright © 2016 MobileMakers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *counterLabel;

@end

@implementation ViewController

int counter =0;

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

//    NSArray *vowels = @[@"a", @"e", @"i", @"o", @"u"];
    NSString *vowels = @"aeiou";
    
    for(int i=0; i < initialString.length; i++)
    {
        for (int j=0; j < vowels.length; j++) {
            
            if ([initialString characterAtIndex:i] != [vowels characterAtIndex:j])
            {
//                NSLog(@"%c", [initialString characterAtIndex:i]);
                NSString *converted = [NSString stringWithFormat:@"%c",[initialString characterAtIndex:i]];
                
                [twitterizedString appendString:converted];
            

            }
        }
    }
    self.textView.text = twitterizedString;
}

-(void)textViewDidChange:(UITextView *)textView
{
    NSUInteger length;
    length = [textView.text length];
    
    self.counterLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)length];
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    return textView.text.length + (text.length - range.length) <= 140;
    
}

@end
