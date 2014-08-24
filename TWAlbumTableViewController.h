//
//  TWAlbumTableViewController.h
//  Thousand Words
//
//  Created by Dani on 07/05/14.
//  Copyright (c) 2014 Dani Boti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TWAlbumTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *albums;
- (IBAction)addAlbumBarButtonItemPressed:(UIBarButtonItem *)sender;

@end
