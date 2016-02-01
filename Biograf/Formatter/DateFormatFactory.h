//
//  FormatFactory.h
//  Biograf
//
//  Created by Muhammed Said Özcan on 30/01/16.
//  Copyright © 2016 TowerLabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateFormatFactory : NSObject
@property (nonatomic) NSDateFormatter *defaultFormatter;
+(instancetype) sharedInstance;
@end
