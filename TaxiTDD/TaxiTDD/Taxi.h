//
//  Taxi.h
//  TaxiTDD
//
//  Created by Junial on 2020/4/28.
//  Copyright © 2020 Junial. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Taxi : NSObject


/// 计算路费
/// @param data 测试数据
+ (NSString *)calculatePrice:(NSString *)data;


/// 计算路费
/// @param distance 距离
/// @param minutes 等待时间
+ (NSString *)calculatePriceWithDistance:(int)distance waitFor:(int)minutes;

@end

