//
//  NSString+Dates.h
//  Biograf
//
//  Created by Muhammed Said Özcan on 30/01/16.
//  Copyright © 2016 TowerLabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Dates)
+ (NSString *)oneWeekAgoFromDate: (NSDate *)fromDate;
+ (NSString *)stringFromDate: (NSDate *)date;
@end
