//
//  FeedItem.h
//  Biograf
//
//  Created by Muhammed Said Özcan on 29/01/16.
//  Copyright © 2016 TowerLabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeedItem : NSObject

@property (nonatomic) NSString *posterPath;
@property (nonatomic) NSString *overview;
@property (nonatomic) NSString *originalTitle;
@property (nonatomic) NSString *originalLanguage;
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *backdropPath;

@property (nonatomic) NSNumber *identifier;
@property (nonatomic) NSNumber *popularity;
@property (nonatomic) NSNumber *voteCount;
@property (nonatomic) NSNumber *voteAverage;

@property (nonatomic) BOOL isVideo;
@property (nonatomic) BOOL isAdult;

@property (nonatomic) NSDate *releaseDate;
@property (nonatomic) NSArray *genreIds;

+ (FEMMapping *) defaultMapping;

@end
