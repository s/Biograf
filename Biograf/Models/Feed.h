//
//  Feed.h
//  Biograf
//
//  Created by Muhammed Said Özcan on 29/01/16.
//  Copyright © 2016 TowerLabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "FeedItem.h"


@interface Feed : NSObject

@property (nonatomic) NSNumber *page;
@property (nonatomic) NSNumber *totalResults;
@property (nonatomic) NSNumber *totalPages;
@property (nonatomic) NSArray<FeedItem*> *results;

+ (FEMMapping *)defaultMapping;
@end
