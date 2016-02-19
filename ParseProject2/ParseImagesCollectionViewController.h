//
//  ParseImagesCollectionViewController.h
//  ParseProject2
//
//  Created by Thomas Friesman on 2016-02-18.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageExampleCell.h"

@interface ParseImagesCollectionViewController : UICollectionViewController {
    
        
        NSArray *imagesFileArray;
        NSMutableArray *imagesArray;
}
@property (weak, nonatomic) IBOutlet UICollectionView *imagesCollection;





@end
