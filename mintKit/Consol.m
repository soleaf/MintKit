//
//  Consol.m
//  mintKit
//
//  Created by soleaf on 13. 9. 4..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import "Consol.h"
#import "StringUtil.h"


@interface Consol()
{
    UITextView *textView;

}

@end

@implementation Consol

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void) ready
{
    self.backgroundColor = [UIColor blackColor];
    
    NSNotificationCenter*defaultCenter = [NSNotificationCenter defaultCenter];
    [defaultCenter addObserver:self
                      selector:@selector(logTest:)
                          name:@"MINTKIT_CONSOL_LOG_TEST"
                        object:nil];
    
    CGRect frame = self.frame;
    textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    textView.backgroundColor = [UIColor blackColor];
    textView.textColor = [UIColor whiteColor];
    textView.editable = NO;
    [self addSubview:textView];

}

-(void) logTest:(NSNotification*) notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // TODO: filter text (ex: remove:'[MINTKIT]')
    
    if (![StringUtil hasLength:textView.text]){
        textView.text = [userInfo objectForKey:@"log"];
    }
    else{
        textView.text = [NSString stringWithFormat:@"%@\n%@", textView.text, [userInfo objectForKey:@"log"]];
    }
    
    // Scroll bottom
    CGPoint bottomOffset = CGPointMake(0, textView.contentSize.height - textView.bounds.size.height);
    [textView setContentOffset:bottomOffset animated:YES];
    
    [self dim:0];
}


- (void) dim:(MINT_CONSOL_LOG_TYPES) logType
{
    // dim animation
    [UIView animateWithDuration:1
                          delay:0
                        options:UIViewAnimationOptionAutoreverse
                     animations:^
    {
        self.backgroundColor = [UIColor redColor];
    }
                     completion:nil 
     ];

}


#pragma mark - Call Loging

+ (void)log:(NSString *)text
{
    NSDictionary *userInfo =[NSDictionary dictionaryWithObject:text forKey:@"log"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"MINTKIT_CONSOL_LOG_TEST" object:nil userInfo:userInfo];
}


@end
