//
//  Album.h
//  Thousand Words
//
//  Created by Dani on 07/05/14.
//  Copyright (c) 2014 Dani Boti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Album : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDate * date;

@end
