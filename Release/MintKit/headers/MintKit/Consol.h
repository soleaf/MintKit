//
//  Consol.h
//  mintKit
//
//  Created by soleaf on 13. 9. 4..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 
 TestKit's visuallization. and more developer debuging options on device screen.
 
 */

// Consol log type for coloring dim
enum MINT_CONSOL_LOG_TYPES {
    MINT_CONSOL_LOG_TYPE_NORMAL = 0,
    MINT_CONSOL_LOG_TYPE_DEBUG,
    MINT_CONSOL_LOG_TYPE_WARNING,
    MINT_CONSOL_LOG_TYPE_CRITICAL, 
    MINT_CONSOL_LOG_TYPE_CHECK
    };

typedef NSInteger MINT_CONSOL_LOG_TYPES;

@interface Consol : UIControl

- (void)ready;

/*
 loging
 */
+ (void)log:(NSString*)text;

@end
