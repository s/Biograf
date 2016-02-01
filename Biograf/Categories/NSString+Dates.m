//
//  NSString+Dates.m
//  Biograf
//
//  Created by Muhammed Said Özcan on 30/01/16.
//  Copyright © 2016 TowerLabs. All rights reserved.
//

#import "NSString+Dates.h"
#import "DateFormatFactory.h"

@implementation NSString (Dates)
+ (NSString *)oneWeekAgoFromDate: (NSDate *)fromDate{
    NSDate *sevenDaysAgo = [fromDate dateByAddingTimeInterval:-7*24*60*60];
    return [[DateFormatFactory sharedInstance].defaultFormatter stringFromDate:sevenDaysAgo];
}

+ (NSString *)stringFromDate: (NSDate *)date{
    return [[DateFormatFactory sharedInstance].defaultFormatter stringFromDate:date];
}
@end
