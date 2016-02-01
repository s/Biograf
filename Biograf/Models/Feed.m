//
//  Feed.m
//  Biograf
//
//  Created by Muhammed Said Özcan on 29/01/16.
//  Copyright © 2016 TowerLabs. All rights reserved.
//

#import "Feed.h"

@implementation Feed
+(FEMMapping *)defaultMapping{
    FEMMapping *mapping = [[FEMMapping alloc] initWithObjectClass:[self class]];
    
    [mapping addAttributesFromDictionary:@{NSStringFromSelector(@selector(page)): @"page",
                                           NSStringFromSelector(@selector(totalResults)): @"totalResults",
                                           NSStringFromSelector(@selector(totalPages)): @"totalPages"}];
    
    [mapping addToManyRelationshipMapping:[FeedItem defaultMapping]
                              forProperty:NSStringFromSelector(@selector(results))
                                  keyPath:@"results"];
    
    return mapping;
}
@end
