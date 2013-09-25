//
//  mintKit.h
//  mintKit
//
//  Created by soleaf on 13. 9. 9..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 MINTCODE.ORG
 http://www.mintcode.org
 
 MintKit assist developing iOS App.
 
 This Project's reposigoty is https://github.com/soleaf/MintKit
 Welcome togther coding Anyone!
 
 How To Use and Other Detail Information is on README.md
 And More References on GitHub repository above.
 
 If You any question or Contact me?, Send mail to milk@mintcode.org.
 
 */

@interface mintKit : NSObject

+ (void) hello;
+ (void) version;
+ (void) buildNumberCheck:(NSInteger) requestingBuildNumber;

@end