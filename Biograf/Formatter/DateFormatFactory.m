//
//  FormatFactory.m
//  Biograf
//
//  Created by Muhammed Said Özcan on 30/01/16.
//  Copyright © 2016 TowerLabs. All rights reserved.
//

#import "DateFormatFactory.h"

@interface DateFormatFactory()

@end

@implementation DateFormatFactory

@synthesize defaultFormatter = _defaultFormatter;

#pragma mark - Singleton

+(instancetype)sharedInstance{
    static DateFormatFactory *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [DateFormatFactory new];
    });
    return sharedInstance;
}


#pragma mark - Getters
- (NSDateFormatter *)defaultFormatter{
    if (!_defaultFormatter) {
        _defaultFormatter = [[NSDateFormatter alloc] init];
        [_defaultFormatter setLocale:[NSLocale currentLocale]];
        [_defaultFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
        [_defaultFormatter setDateStyle:NSDateFormatterShortStyle];
        [_defaultFormatter setDateFormat:@"yyyy-MM-dd"];
    }
    return _defaultFormatter;
}

@end
