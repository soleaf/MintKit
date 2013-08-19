//
//  MainViewController.m
//  mintKitSample
//
//  Created by soleaf on 13. 8. 19..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import "MainViewController.h"

/*
    
    Import MintKit Library by '<MintKit/[file name]>'
    Bellow.
 
    Check Avaliable functions and FileName, Description : headers/MintKit/~.h
    Or Summary is ready on README.md or gitHub https://github.com/soleaf/MintKit/
 
 */
#import <MintKit/mintKit.h>

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    // MintKit Use like this
    // It appear some text on Console.
    [mintKit hello];
    [mintKit version];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
