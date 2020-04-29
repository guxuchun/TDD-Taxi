//
//  Taxi.m
//  TaxiTDD
//
//  Created by Junial on 2020/4/28.
//  Copyright © 2020 Junial. All rights reserved.
//

#import "Taxi.h"

@implementation Taxi

// 计算费用结果
+ (NSString *)calculatePrice:(NSString *)data {
    NSArray *records = [data componentsSeparatedByString:@"\n"];
    NSMutableArray *results = [NSMutableArray array];
    NSLog(@"%@", records);
    
    for (NSString *record in records) {
        NSArray<NSString *> * data = [self getDistanceAndMinutes:record];
        int distance = data.firstObject.intValue;
        int minutes = data.lastObject.intValue;
        NSString *price = [self calculatePriceWithDistance:distance waitFor:minutes];
        [results addObject:price];
    }
    
    return [results componentsJoinedByString:@"\n"];
}

// 获取里程和时间
+ (NSArray<NSString *> *)getDistanceAndMinutes:(NSString *)txt {
    NSMutableArray *dataArr = [NSMutableArray array];
    NSString *pattern = @"[0-9]+";
    NSRegularExpression *regular = [[NSRegularExpression alloc] initWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray *results = [regular matchesInString:txt options:0 range:NSMakeRange(0, txt.length)];
    for (NSTextCheckingResult *result in results) {
        [dataArr addObject:[txt substringWithRange:result.range]];
    }
    return [dataArr copy];
}

// 计算单条记录的价格
+ (NSString *)calculatePriceWithDistance:(int)distance waitFor:(int)minutes {
    CGFloat distancePrice = 0;
    CGFloat timePrice = minutes * 0.25;

    if (distance <= 2) {
        distancePrice = 6;
    } else if (distance <= 8) {
        distancePrice = 6 + (distance - 2)*0.8;
    } else {
        distancePrice = 6 + 6*0.8 + (distance -8)*0.8*1.5;
    }
    
    int price = (int)roundf(distancePrice + timePrice);
    return [NSString stringWithFormat:@"收费%d元", price];
}

@end
