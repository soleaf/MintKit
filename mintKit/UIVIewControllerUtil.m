//
//  UIVIewControllerUtil.m
//  travelogue
//
//  Created by soleaf on 13. 8. 1..
//  Copyright (c) 2013년 soleaf. All rights reserved.
//

#import "UIVIewControllerUtil.h"

#import <objc/runtime.h>
typedef void (^ActionBlock)();
static char UIButtonBlockKey;

@interface UIButton (UIBlockButton)

- (void)handleControlEvent:(UIControlEvents)event withBlock:(ActionBlock)block;
- (void)callActionBlock:(id)sender;

@end


@implementation UIButton (UIBlockButton)

- (void)handleControlEvent:(UIControlEvents)event withBlock:(ActionBlock)block {
    objc_setAssociatedObject(self, &UIButtonBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(callActionBlock:) forControlEvents:event];
}


- (void)callActionBlock:(id)sender {
    ActionBlock block = (ActionBlock)objc_getAssociatedObject(self, &UIButtonBlockKey);
    if (block) {
        block();
    }
}

@end


@implementation UIVIewControllerUtil



+ (UIViewController *)backViewController: (UIViewController *) view
{
    NSInteger numberOfViewControllers = view.navigationController.viewControllers.count;
    
    if (numberOfViewControllers < 2)
        return nil;
    else
        return [view.navigationController.viewControllers objectAtIndex:numberOfViewControllers - 2];
}



+ (void) alertView:(NSString*)text;
{
    UIAlertView *alert = [[UIAlertView alloc]init];
    alert.message = text;
    [alert addButtonWithTitle:@"확인"];
    [alert show];

}


+ (void) showBackButton:(UIViewController *)view title: (NSString *) titleText andImageNamed: (NSString *) imgName
{
    UIImage *buttonImage = [UIImage imageNamed:imgName];
    buttonImage = [buttonImage stretchableImageWithLeftCapWidth:15 topCapHeight:0];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    
    [button handleControlEvent:UIControlEventTouchUpInside withBlock:^{
        [view.navigationController popViewControllerAnimated:YES];
    }];
    [button setTitle:titleText forState:UIControlStateNormal];
    
    // button size
    CGSize maximumSize = CGSizeMake(300, 9999);
    UIFont *myFont = [UIFont systemFontOfSize:12];
    CGSize myStringSize = [titleText sizeWithFont:myFont
                                constrainedToSize:maximumSize
                                    lineBreakMode:button.titleLabel.lineBreakMode];
    
    
    button.frame=CGRectMake(0,0, (myStringSize.width + 11 + 5 + 20), 29);
    
    button.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 11.0, 0.0, 0.0)];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    //[btnDone setTarget:self];
    
    view.navigationItem.leftBarButtonItem = backButton;
}

@end
