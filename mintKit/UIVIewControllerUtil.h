//
//  UIVIewControllerUtil.h
//  travelogue
//
//  Created by soleaf on 13. 8. 1..
//  Copyright (c) 2013년 soleaf. All rights reserved.
//

// 설 명 : UIViewController나 UIView관련 유틸리티
// 주 의 : <# 주의사항설명 #>
// 사 용 : <# 어디에 사용되는지 사용장소 #>


#import <UIKit/UIKit.h>

@interface UIVIewControllerUtil : NSObject


/**
 Description: 네비게이션 컨트롤러 내에서 해당 뷰의 이전 뷰컨트롤러를 가져옴
 Factors    : UIViewController
 Return     : UIViewController
 **/
+ (UIViewController *)backViewController: (UIViewController *) view;

/**
 Description: 알림창
 Factors    : <# 인자 #>
 Return     : <# 반환 #>
 **/

+ (void) alertView:(NSString*)text;

/**
 Description: 뒤로가기 버튼 만들기
 Factors    : <# 인자 #>
 Return     : <# 반환 #>
 **/

+ (void) showBackButton:(UIViewController *)view title: (NSString *) titleText andImageNamed: (NSString *) imgName;

@end
