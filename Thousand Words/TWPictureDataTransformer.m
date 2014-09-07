//
//  TWPictureDataTransformer.m
//  Thousand Words
//
//  Created by Dani on 02/09/14.
//  Copyright (c) 2014 Dani Boti. All rights reserved.
//

#import "TWPictureDataTransformer.h"

@implementation TWPictureDataTransformer

+ (Class)transformedValueClass
{
    return [NSData class];
}

+ (BOOL)allowsReverseTransformation
{
    return YES;
}

- (id)transformedValue:(id)value
{
    return UIImagePNGRepresentation(value);
}

-(id)reverseTransformedValue:(id)value
{
    UIImage *image = [UIImage imageNamed:value];
    return image;
}

@end
