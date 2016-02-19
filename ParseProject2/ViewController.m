//
//  ViewController.m
//  ParseProject2
//
//  Created by Thomas Friesman on 2016-02-18.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import "ViewController.h"
#import "UploadImageViewController.h"
#import "ParseImagesCollectionViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *cityName;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)searchImage:(UIButton *)sender {

        NSLog(@"search button pressed");

}

- (IBAction)uploadImage:(UIButton *)sender {
    
    
    NSLog(@"upload button pressed");
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"MySegue"]) {
        UploadImageViewController *vc = [segue destinationViewController];
        vc.searchTerm = self.cityName.text;
    }
}

@end
