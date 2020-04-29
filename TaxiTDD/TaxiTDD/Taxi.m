//
//  Taxi.m
//  TaxiTDD
//
//  Created by Junial on 2020/4/28.
//  Copyright © 2020 Junial. All rights reserved.
//

#import "Taxi.h"

@implementation Taxi

+ (NSString *)calculatePrice:(NSString *)data {
    NSArray<NSString *> * result = [self getDistanceAndMinutes:data];
    int distance = result.firstObject.intValue;
    int minutes = result.lastObject.intValue;
    
    return [self calculatePriceWithDistance:distance waitFor:minutes];
}

+ (NSArray *)getDistanceAndMinutes:(NSString *)txt {
    
    NSMutableArray *msgArr = [NSMutableArray array];
    
    NSString *pattern = @"[0-9]+";
    //1.1将正则表达式设置为OC规则
    NSRegularExpression *regular = [[NSRegularExpression alloc] initWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
    //2.利用规则测试字符串获取匹配结果
    NSArray *results = [regular matchesInString:txt options:0 range:NSMakeRange(0, txt.length)];
    //遍历结果
    for (NSTextCheckingResult *result in results) {
        [msgArr addObject:[txt substringWithRange:result.range]];
    }
    return [msgArr copy];
}

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
    return [NSString stringWithFormat:@"%d", price];
}

@end
