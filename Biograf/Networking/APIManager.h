//
//  APIManager.h
//  Biograf
//
//  Created by Muhammed Said Özcan on 30/01/16.
//  Copyright © 2016 TowerLabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFHTTPSessionManager.h>
#import "Feed.h"

@interface APIManager : NSObject

+ (instancetype) sharedInstance;

@end

@interface APIManager (Endpoints)
- (NSURLSessionTask *)discoverFeedWithCompletion:(void (^)(Feed *feed, NSError *error))completion;
@end