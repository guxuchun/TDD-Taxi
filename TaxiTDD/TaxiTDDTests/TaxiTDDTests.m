//
//  TaxiTDDTests.m
//  TaxiTDDTests
//
//  Created by Junial on 2020/4/28.
//  Copyright © 2020 Junial. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Taxi.h"

@interface TaxiTDDTests : XCTestCase

@end

@implementation TaxiTDDTests

// 小于2公里
- (void)testLessThanTwoKilometres {
    NSString *price = [Taxi calculatePrice:@"1公里，等待0分钟"];
    XCTAssertEqualObjects(price, @"收费6元");
}

// 大于2公里小于8公里
- (void)testMoreThanTwoKilometresAndLessThanEightKilometres {
    NSString *price = [Taxi calculatePrice:@"3公里，等待0分钟"];
    XCTAssertEqualObjects(price, @"收费7元");
}

// 超过8公里
- (void)testMoreThanEightKilometres {
    NSString *price = [Taxi calculatePrice:@"10公里，等待0分钟"];
    XCTAssertEqualObjects(price, @"收费13元");
}

// 带等待时间
- (void)testDistanceWithWaitMintus {
    NSString *price = [Taxi calculatePrice:@"2公里，等待3分钟"];
    XCTAssertEqualObjects(price, @"收费7元");
}

// 最终测试
- (void)testFinally {
    NSString *price = [Taxi calculatePrice:@"1公里，等待0分钟\n3公里，等待0分钟\n10公里，等待0分钟\n2公里，等待3分钟"];
    XCTAssertEqualObjects(price, @"收费6元\n收费7元\n收费13元\n收费7元");
}

@end
