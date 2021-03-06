//
//  FeedCollectionViewCell.m
//  Biograf
//
//  Created by Muhammed Said Özcan on 30/01/16.
//  Copyright © 2016 TowerLabs. All rights reserved.
//

#import "FeedCollectionViewCell.h"
#include "APIConstants.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface FeedCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *moviePoster;
@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;

@end

@implementation FeedCollectionViewCell
- (void)configureWithFeedItem:(FeedItem *)feedItem{
    self.movieTitleLabel.text = feedItem.originalTitle;

    if (feedItem.posterPath) {
        [self.moviePoster sd_setImageWithURL:[kAPIImageBaseURL URLByAppendingPathComponent:feedItem.posterPath]];
    }else{
        [self.moviePoster setImage:[UIImage imageNamed:@"DefaultPoster"]];
    }
}
@end
