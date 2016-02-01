//
//  FeedItem.m
//  Biograf
//
//  Created by Muhammed Said Özcan on 29/01/16.
//  Copyright © 2016 TowerLabs. All rights reserved.
//

#import "FeedItem.h"
#import "DateFormatFactory.h"

@implementation FeedItem
+(FEMMapping *)defaultMapping{
    FEMMapping *mapping = [[FEMMapping alloc] initWithObjectClass:[self class]];
    
    [mapping addAttributesFromDictionary:@{NSStringFromSelector(@selector(posterPath)): @"poster_path",
                                           NSStringFromSelector(@selector(overview)): @"overview",
                                           NSStringFromSelector(@selector(originalTitle)): @"original_title",
                                           NSStringFromSelector(@selector(originalLanguage)): @"original_language",
                                           NSStringFromSelector(@selector(title)): @"title",
                                           NSStringFromSelector(@selector(backdropPath)): @"backdrop_path",
                                           NSStringFromSelector(@selector(identifier)): @"identifier",
                                           NSStringFromSelector(@selector(popularity)): @"popularity",
                                           NSStringFromSelector(@selector(voteCount)): @"vote_count",
                                           NSStringFromSelector(@selector(voteAverage)): @"vote_average",
                                           NSStringFromSelector(@selector(isVideo)): @"video",
                                           NSStringFromSelector(@selector(isAdult)): @"adult",
                                           NSStringFromSelector(@selector(genreIds)): @"genre_ids"
                                           }];
    
        
    FEMAttribute *releaseDateAttr = [[FEMAttribute alloc] initWithProperty:NSStringFromSelector(@selector(releaseDate))
                                                                   keyPath:@"release_date"
                                                                       map:^id(id  value) {
                                                                           if ([value isKindOfClass:[NSString class]]) {
                                                                               [[DateFormatFactory sharedInstance].defaultFormatter dateFromString:value];
                                                                           }
                                                                           return nil;
    }
                                                                reverseMap:^id(id value) {
                                                                    return [[DateFormatFactory sharedInstance].defaultFormatter stringFromDate:value];
    }];
    
    [mapping addAttribute:releaseDateAttr];
    
    return mapping;
}
@end
