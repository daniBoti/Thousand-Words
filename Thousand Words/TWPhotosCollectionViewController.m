//
//  TWPhotosCollectionViewController.m
//  Thousand Words
//
//  Created by Dani on 27/08/14.
//  Copyright (c) 2014 Dani Boti. All rights reserved.
//

#import "TWPhotosCollectionViewController.h"
#import "TWPhotoCollectionViewCell.h"
#import "Photo.h"
#import "TWPictureDataTransformer.h"
#import "TWCoreDataHelper.h"

@interface TWPhotosCollectionViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) NSMutableArray *photos; // Of UIImages

@end

@implementation TWPhotosCollectionViewController

- (NSMutableArray *)photos
{
    if (!_photos){
        _photos = [[NSMutableArray alloc] init];
    }
    return _photos;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)cameraBarButtonItemPressed:(UIBarButtonItem *)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
        picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    }
    [self presentViewController:picker animated:YES completion:nil];
}

#pragma mark - Helper Methods

- (Photo *)photoFromImage:(UIImage *)image
{
    Photo *photo = [NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:[TWCoreDataHelper managedObjectContext]];
    photo.image = image;
    photo.date = [NSDate date];
    photo.albumBook = self.album;
    
    NSError *error = nil;
    if (![[photo managedObjectContext] save:&error]) {
        //Error saving
        NSLog(@"%@", error);
    }
    
    return photo;
}


#pragma mark - UICollectionViewDataSource

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Photo Cell";
    
    TWPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Photo *photo = self.photos[indexPath.row];    
    cell.backgroundColor = [UIColor whiteColor];
    cell.imageView.image = photo.image;
    
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.photos count];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UIImagePickerControllerDelegate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[UIImagePickerControllerEditedImage];
    if (!image) image = info[UIImagePickerControllerOriginalImage];
    
    [self.photos addObject:[self photoFromImage:image]];
    
    [self.collectionView reloadData];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"Cancel!");
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
