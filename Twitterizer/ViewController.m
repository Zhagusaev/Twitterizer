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

-(NSMutableString*)addHashtags:(NSMutableString *) originalString
{
    NSArray* arrayofText = [originalString componentsSeparatedByString:@" "];
    NSMutableString* hashtaggedString = [NSMutableString new];
    NSMutableString* reverseString = [NSMutableString new];
    for(int i=0; i < arrayofText.count; i++)
    {
        if(i%2 != 0) // even
        {
            NSString* value = (NSString *) [arrayofText objectAtIndex:i];
            NSInteger length = value.length;
            while (arrayofText[i] && length > 0)
            {
                length--;
                NSRange subStrRange = NSMakeRange(length, 1);
                [reverseString appendString:[arrayofText[i] substringWithRange:subStrRange]];
            }
            
            //NSLog(@"Reverse string is: %@", reverseString);
            [hashtaggedString appendString:reverseString];
            [reverseString setString: @""];
        }
        else // odd
        {
            [hashtaggedString appendString:[@"#" stringByAppendingString:arrayofText[i]]];
        }
        [hashtaggedString appendString:@" "];
        //NSLog(@"%@", hashtaggedString);
    
        
    }

    return hashtaggedString;
}

- (IBAction)onTwitterizeButtonPressed:(UIButton *)sender
{
    NSString* initialString = self.textView.text;
    NSMutableString* twitterizedString = [NSMutableString new];

    NSString *vowels = @"AEIOUaeiou";
    
    for(int i = 0; i < initialString.length; i++)
    {
        NSString* converted = [NSString stringWithFormat:@"%c", [initialString characterAtIndex:i]];
        
        if(![vowels containsString: converted])
        {
            [twitterizedString appendString:converted];
        }
    }
    
    twitterizedString = [self addHashtags:twitterizedString];
    self.textView.text = twitterizedString;
}





-(void)textViewDidChange:(UITextView *)textView
{
    NSUInteger length;
    length = [textView.text length];
    
    self.counterLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)length];
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    return textView.text.length + (text.length - range.length) <= 140;
    
}

@end
