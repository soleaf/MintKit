//
//  BuildSupport.h
//  mintKit
//
//  Created by soleaf on 13. 10. 7..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BuildSupport : NSObject

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    #define Xcode5Code(code, alt) code
#else
    #define Xcode5Code(code, alt) alt
#endif

@end
