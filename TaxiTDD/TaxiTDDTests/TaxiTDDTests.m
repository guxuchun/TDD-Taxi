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

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}


// 小于2公里
- (void)testLessThanTwoKilometres {
    NSString *price = [Taxi calculatePrice:@"1公里，等待0分钟"];
    XCTAssertEqualObjects(price, @"6");
}

// 大于2公里小于8公里
- (void)testMoreThanTwoKilometresAndLessThanEightKilometres {
    NSString *price = [Taxi calculatePrice:@"3公里，等待0分钟"];
    XCTAssertEqualObjects(price, @"7");
}

- (void)testMoreThanEightKilometres {
    NSString *price = [Taxi calculatePrice:@"10公里，等待0分钟"];
    XCTAssertEqualObjects(price, @"13");
}

- (void)testDistanceWithWaitMintus {
    NSString *price = [Taxi calculatePrice:@"2公里，等待3分钟"];
    XCTAssertEqualObjects(price, @"7");
}



@end
