//
//  ViewController.m
//  iPhoneImages
//
//  Created by Endeavour2 on 7/17/17.
//  Copyright © 2017 SamOg. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  // Do any additional setup after loading the view, typically from a nib.
  
  NSURL *url = [NSURL URLWithString:@"http://i.imgur.com/y9MIaCS.png"];
  
  NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
  
  NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
  
  NSURLSessionDownloadTask *downLoadTask = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    
    if (error) {
      //handle error
      NSLog(@"error: %@", error.localizedDescription);
      return ;
    }
    NSData *data = [NSData dataWithContentsOfURL:location];
    
    UIImage *image = [UIImage imageWithData:data];
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
      //this will run on the main queue
      
      self.imageView.image = image;
    }];
    
  }];
  
  
  [downLoadTask resume];
}



- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
