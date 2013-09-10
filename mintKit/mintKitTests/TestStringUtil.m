//
//  TestStringUtil.m
//  mintKit
//
//  Created by soleaf on 13. 9. 10..
//  Copyright (c) 2013년 mintcode.org. All rights reserved.
//

#import "TestStringUtil.h"
#import "StringUtil.h"

@implementation TestStringUtil

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testNvl
{
    // str
    STAssertTrue([[StringUtil nvl:@"str"] isEqualToString:@"str"], @"str is strl");
    // nil
    STAssertTrue([[StringUtil nvl:nil] isEqualToString:@""], @"nvl:nil -> '' ");
    // blank
    STAssertTrue([[StringUtil nvl:@""] isEqualToString:@""], @"nvl:'' -> '' ");
}

- (void)testNvlNilStr
{
    // str
    STAssertTrue([[StringUtil nvl:@"str" nilStr:@"nilStr"] isEqualToString:@"str"], @"str is strl");
    // nil
    STAssertTrue([[StringUtil nvl:nil  nilStr:@"nilStr"] isEqualToString:@"nilStr"], @"nvl:nil -> 'nilStr' ");
    // blank
    STAssertTrue([[StringUtil nvl:@""  nilStr:@"nilStr"] isEqualToString:@"nilStr"], @"nvl:'' -> 'nilStr' ");
}

- (void)testIsNilOrLength0
{
    // str
    STAssertTrue(![StringUtil isNilOrLength0:@"test"], @"'tset' has a length");
    // nil
    STAssertTrue([StringUtil isNilOrLength0:nil], @"nil has no length");
    // blank
    STAssertTrue([StringUtil isNilOrLength0:@"  "], @"blank has no length");
}

- (void)testHasLength
{
    // str
    STAssertTrue([StringUtil hasLength:@"test"], @"'tset' has a length");
    // nil
    STAssertTrue(![StringUtil hasLength:nil], @"nil has no length");
    // blank
    STAssertTrue(![StringUtil hasLength:@"  "], @"blank has no length");
}

- (void)testGetNotNilOnFirstSecond
{
    // getNotNilOn: first second
    STAssertTrue([[StringUtil getNotNilOn:@"first" and:@"second"] isEqualToString:@"first"], @"first is not nill");
    STAssertTrue([[StringUtil getNotNilOn:nil and:@"second"] isEqualToString:@"second"], @"first is nill");
    STAssertTrue([[StringUtil getNotNilOn:@" " and:@"second"] isEqualToString:@"second"], @"' ' has no length");
    STAssertTrue([StringUtil getNotNilOn:@" " and:@" "] == nil, @"all has no length, return nil");
    
}

- (void)testGetNotNilOnFirstSecondThird
{
    // getNotNiOn: first scond third
    STAssertTrue([[StringUtil getNotNilOn:@"first" and:@"second" and:@"third"] isEqualToString:@"first"], @"first is not nill");
    STAssertTrue([[StringUtil getNotNilOn:nil and:@"second" and:@"third"] isEqualToString:@"second"], @"first is nill");
    STAssertTrue([[StringUtil getNotNilOn:@" " and:@"second" and:@"third"] isEqualToString:@"second"], @"' ' has no length");
    
    STAssertTrue([[StringUtil getNotNilOn:@"" and:@"" and:@"third"] isEqualToString:@"third"], @"third is not nill");
    STAssertTrue([StringUtil getNotNilOn:nil and:nil and:nil] == nil, @"all nil");
    STAssertTrue([StringUtil getNotNilOn:@" " and:@" " and:@" "] == nil, @"all has no length, return nil");
}

- (void)tetGotNotNilWithNVLon
{
    STAssertTrue([[StringUtil getNotNilWithNVLOn:@"first" and:@"second" and:@"third"] isEqualToString:@"first"], @"first is not nill");
    STAssertTrue([[StringUtil getNotNilWithNVLOn:nil and:@"second" and:@"third"] isEqualToString:@"second"], @"first is nill");
    STAssertTrue([[StringUtil getNotNilWithNVLOn:@" " and:@"second" and:@"third"] isEqualToString:@"second"], @"' ' has no length");
    
    STAssertTrue([[StringUtil getNotNilWithNVLOn:@"" and:@"" and:@"third"] isEqualToString:@"third"], @"third is not nill");
    STAssertTrue([[StringUtil getNotNilWithNVLOn:nil and:nil and:nil] isEqualToString:@""], @"all nil -> '' ");
    STAssertTrue([[StringUtil getNotNilWithNVLOn:@" " and:@" " and:@" "] isEqualToString:@""], @"all has no length, return '' ");
}

- (void)testStrinbByStrppingHTML
{
    NSString *html = @"<i>text</i><wow wow a='dfdf'>1</wow>";
    STAssertTrue([[StringUtil stringByStrippingHTML:html]isEqualToString:@"text1"], @"should remove all tags");
}

- (void)testTrimed
{
    STAssertTrue([[StringUtil trimed:@" hi"] isEqualToString:@"hi"], @"remove prfix blank");
//    STAssertTrue([[StringUtil trimed:@"h i"] isEqualToString:@"hi"], @"remove middle blank");
    STAssertTrue([[StringUtil trimed:@"hi "] isEqualToString:@"hi"], @"remove suffix blank");
}

- (void)testuppercaseFirst
{
    STAssertTrue([[StringUtil uppercaseFirst:@"hello"] isEqualToString:@"Hello"], @"hello -> Hello");
}

- (void)testLinearHangel
{
    NSArray *linear = [StringUtil LinearHangul:@"한글"];
    
    NSArray *first = [linear objectAtIndex:0];
    NSArray *second = [linear objectAtIndex:1];
    
    STAssertTrue([[first objectAtIndex:0] isEqualToString:@"ㅎ"], @" (0,0) is ㅎ");
    STAssertTrue([[first objectAtIndex:1] isEqualToString:@"ㅏ"], @" (0,1) is ㅏ");
    STAssertTrue([[first objectAtIndex:2] isEqualToString:@"ㄴ"], @" (0,0) is ㄴ");
    
    STAssertTrue([[second objectAtIndex:0] isEqualToString:@"ㄱ"], @" (0,0) is ㄱ");
    STAssertTrue([[second objectAtIndex:1] isEqualToString:@"ㅡ"], @" (0,1) is ㅡ");
    STAssertTrue([[second objectAtIndex:2] isEqualToString:@"ㄹ"], @" (0,0) is ㄹ");
}

@end
