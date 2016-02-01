//
//  FeedCollectionViewCell.h
//  Biograf
//
//  Created by Muhammed Said Özcan on 30/01/16.
//  Copyright © 2016 TowerLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FeedItem;

@interface FeedCollectionViewCell : UICollectionViewCell
- (void)configureWithFeedItem:(FeedItem *)feedItem;
@end
