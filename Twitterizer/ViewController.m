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

    NSArray *vowels = @[@"a", @"e", @"i", @"o", @"u"];
    
    
    for(int i=0; i < vowels.count; i++)
    {
        NSLog(@"%@", vowels[i]);
        if ([initialString containsString:vowels[i]])
        {
//            NSLog(@"%@", initialString);
            [twitterizedString setString: [initialString stringByReplacingOccurrencesOfString:vowels[i]  withString:@""]];
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
    
}

@end
