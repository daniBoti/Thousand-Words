//
//  TWPhotosCollectionViewController.h
//  Thousand Words
//
//  Created by Dani on 27/08/14.
//  Copyright (c) 2014 Dani Boti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Album.h"

@interface TWPhotosCollectionViewController : UICollectionViewController

@property (strong, nonatomic) Album *album;

- (IBAction)cameraBarButtonItemPressed:(UIBarButtonItem *)sender;

@end
