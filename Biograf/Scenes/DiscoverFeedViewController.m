//
//  DiscoverFeedViewController.m
//  Biograf
//
//  Created by Muhammed Said Özcan on 30/01/16.
//  Copyright © 2016 TowerLabs. All rights reserved.
//

#import "DiscoverFeedViewController.h"
#import "APIManager.h"
#import "Feed.h"
#import "FeedCollectionViewCell.h"

@interface DiscoverFeedViewController ()

@property (nonatomic) UIRefreshControl *refreshControl;
@property (nonatomic) Feed *feed;
@end

@implementation DiscoverFeedViewController

static NSString * const reuseIdentifier = @"FeedCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Discover", nil);

    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    _refreshControl.tintColor = [UIColor grayColor];
    [_refreshControl addTarget:self action:@selector(refreshFeed:) forControlEvents:UIControlEventValueChanged];
    [self.collectionView addSubview:_refreshControl];
    self.collectionView.alwaysBounceVertical = YES;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (!self.feed) {
        [self.refreshControl beginRefreshing];
        self.collectionView.contentOffset = CGPointMake(0.0, -CGRectGetHeight(self.refreshControl.frame));
        [self refreshFeed:self.refreshControl];
    }
}

- (IBAction)refreshFeed:(id)sender {
    
    [[APIManager sharedInstance] discoverFeedWithCompletion:^(Feed *feed, NSError *error) {
        if (!error) {
            self.feed = feed;
            [self.collectionView reloadData];
        }else{
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Network error", @"")
                                                                           message:error.localizedDescription ?: NSLocalizedString(@"Failed to fetch feeds", @"")
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *dismissAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Dismiss", @"") style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:dismissAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
        [self.refreshControl endRefreshing];
    }];
}

#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.feed.results.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    FeedCollectionViewCell *feedCell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];

    FeedItem *anItem = [self.feed.results objectAtIndex:indexPath.row];
    [feedCell configureWithFeedItem:anItem];
    
    
    
    return feedCell;
}


@end
