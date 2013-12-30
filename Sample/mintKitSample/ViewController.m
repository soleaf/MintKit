//
//  ViewController.m
//  mintKitSample
//
//  Created by soleaf on 13. 9. 9..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import "ViewController.h"

/*
 
 Import MintKit Library by '<MintKit/[file name]>'
 Bellow.
 
 Check Avaliable functions and FileName, Description : headers/MintKit/~.h
 Or Summary is ready on README.md or gitHub https://github.com/soleaf/MintKit/
 
 */
#import <MintKit/mintKit.h>
#import <MintKit/ArrayUtil.h>
#import <MintKit/TestKit.h>
#import <MintKit/StringUtil.h>
#import <MintKit/AnimationUtil.h>
#import <MintKit/EncryptUtil.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // MintKit Use like this
    // It appear some text on Console.
    [mintKit hello];
    [mintKit version];
    
    // mutilItems in 1Row test
    NSArray *ttt = [[NSArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7", nil];
    [TestKit debugKey:@"mutli items in 1row" andVal:[ArrayUtil ArrayWith:ttt itemsPer1Row:3]];
    
    // Frist String Uppercase test
    [TestKit debugKey:@"First String Uppercase" andVal:[StringUtil uppercaseFirst:@"the magic of leaf"]];
    
    // UIView Animation  test
    [AnimationUtil fadeOut:self.ui_button interval:3 callBack:^{
        
        [AnimationUtil fadeInMove:self.ui_button morePoint:CGPointMake(0, 100) interval:3 callBack:nil];
        
    }];

    
    // Description
    NSString *target = @"Dowyg0SsdjLp2eRCsSLMHYsbcocYEIbJa0V8M2lf/0jb0VOh1foUIyQnomfFlZRZvUl4DWKFG6Vcigy0mwyITgN/C73GsPQct3SYy48XpBkxzyj36IUFdhxZkv0trXB7JZmk2jedImU8ZIV9LkHwkPd7cSPqEs72qnFa+A8X4oJXPPf7U0TWBqmvlcJ5tNxU3Ove7cGXSVtQPJD37RAARiLhUrADaoBKIcHYh1K+V1ib4sTn1XRqQx1mc6v7JF5g3ag+MaNEvSLVzcYlC1qcBZfK39s04cDC8ozf1S5yluPxzMv4KzwvU7nA/AFYdRNTVbAt+CATZO3QosTysRhp4f8l43szuUNO1oeO8K3hy8REawETyLkVbI9vSS6L98dXCoHUe5yJwDy/bxpd61hmo1PJVvdsz4p8dfViup7RgjexEPP5mu+J8K98LeoAw==";
    NSString *key = @"HOWTOMAKE2014010";
    
    NSString *dec = [EncryptUtil AESDecryptString:target withKey:key];
    
    NSLog(@"encStr:%@",dec);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
