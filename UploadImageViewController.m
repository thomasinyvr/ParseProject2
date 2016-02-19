//
//  UploadImageViewController.m
//  ParseProject2
//
//  Created by Thomas Friesman on 2016-02-18.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import "UploadImageViewController.h"
#import  <Parse/Parse.h>



@interface UploadImageViewController  () <UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imgToUpload;
@property (weak, nonatomic) IBOutlet UITextField *commentTextField;

@end

@implementation UploadImageViewController



- (IBAction)selectPhoto:(UIButton *)sender {
    UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
    imgPicker.delegate = self;
    imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:imgPicker animated:YES completion:nil];
    
}
- (IBAction)uploadPhoto:(UIButton *)sender {
    [self.commentTextField resignFirstResponder];
    
    NSData *pictureData = UIImageJPEGRepresentation(self.imgToUpload.image, 0.7);
    
    PFFile *image = [PFFile fileWithData:pictureData];
    
    [image saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            PFObject *parseImageObject = [PFObject objectWithClassName:@"collectionViewData"];
            parseImageObject[@"imageFile"] = image;
            parseImageObject[@"comment"] = self.commentTextField.text;
            
            [parseImageObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (succeeded)
                    NSLog(@"successfully saved");
            }];
        }
        
    }];
    
}
     
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *myImage = info[UIImagePickerControllerOriginalImage];
    self.imgToUpload.image = myImage;
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end