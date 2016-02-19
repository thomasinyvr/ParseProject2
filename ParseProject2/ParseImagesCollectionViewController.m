//
//  ParseImagesCollectionViewController.m
//  ParseProject2
//
//  Created by Thomas Friesman on 2016-02-18.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import "ParseImagesCollectionViewController.h"
#import <Parse/Parse.h>
#import "ImageExampleCell.h"
@interface ParseImagesCollectionViewController ()


@end

@implementation ParseImagesCollectionViewController

static NSString * const reuseIdentifier = @"imageCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self queryParseMethod];
    
}


- (void)queryParseMethod {
    PFQuery *query = [PFQuery queryWithClassName:@"collectionViewData"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError * error) {
            imagesFileArray = objects;
            [_imagesCollection reloadData];
        
    }];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [imagesFileArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageExampleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imageCell" forIndexPath:indexPath];
    
    PFObject *imageObject = [imagesFileArray objectAtIndex:indexPath.row];
    PFFile *imageFile = [imageObject objectForKey:@"imageFile"];
    [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        cell.parseImage.image = [UIImage imageWithData:data];
    }
    ];
    
    
    return cell;
}


@end
