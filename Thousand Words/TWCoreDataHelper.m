//
//  TWCoreDataHelper.m
//  Thousand Words
//
//  Created by Dani on 26/08/14.
//  Copyright (c) 2014 Dani Boti. All rights reserved.
//

#import "TWCoreDataHelper.h"

@implementation TWCoreDataHelper

+(NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    
    return context;
}

@end
