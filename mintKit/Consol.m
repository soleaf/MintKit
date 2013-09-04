//
//  Consol.m
//  mintKit
//
//  Created by soleaf on 13. 9. 4..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import "Consol.h"

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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void) logTest:(NSNotification*) notification {
    
    NSLog(@"asdfasdf1231231");
    textView.text = @"asdfasdfasdfsdf11111_dddf";
}


@end
