//
//  APIManager.m
//  Biograf
//
//  Created by Muhammed Said Özcan on 30/01/16.
//  Copyright © 2016 TowerLabs. All rights reserved.
//

#import "APIManager.h"
#import "APIConstants.h"
#import "NSString+Dates.h"

@interface APIManager()

@property (nonatomic) AFHTTPSessionManager *sessionManager;

@end

@implementation APIManager

#pragma mark - Singleton

+(instancetype)sharedInstance{
    static APIManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [APIManager new];
    });
    return sharedInstance;

}

- (AFHTTPSessionManager *)sessionManager {
    if (!_sessionManager) {
        _sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:kAPIBaseURL];

    }
    return _sessionManager;
}

@end

@implementation APIManager (Endpoints)

- (NSURLSessionTask *)discoverFeedWithCompletion:(void (^)(Feed *feed, NSError *error))completion {
    
    NSDictionary *params = @{
                             @"primary_release_date.gte":[NSString oneWeekAgoFromDate:[NSDate date]],
                             @"primary_release_date.lte":[NSString stringFromDate:[NSDate date]],
                             @"sort_by":@"vote_average.desc"
                             };
    
    return [self.sessionManager GET:kAPIEndpointDiscover
                         parameters:params
                            success:^(NSURLSessionDataTask *task, id responseObject) {
                                Feed *feed = [FEMDeserializer objectFromRepresentation:responseObject mapping:[Feed defaultMapping]];
                                if (completion) {
                                    completion(feed, nil);
                                }
    }
                            failure:^(NSURLSessionDataTask *task, NSError *error) {
                                if (completion) {
                                    completion(nil, error);
                                }
    }];

}

@end