//
//  ZQViewController.m
//  imageLoader
//
//  Created by 黄 嘉恒 on 9/13/13.
//  Copyright (c) 2013 黄 嘉恒. All rights reserved.
//

#import "ZQViewController.h"
#import "AFNetworking.h"

@interface ZQViewController ()<NSURLConnectionDelegate,NSURLConnectionDataDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
//@property (strong, nonatomic) NSMutableData *imageData;

@end

@implementation ZQViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loadImage:(id)sender
{
    NSURL *url = [NSURL URLWithString:@"http://203.208.46.145/images/srpr/logo4w.png"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [NSURLConnection connectionWithRequest:request delegate:self];
    
    AFImageRequestOperation *connection = [AFImageRequestOperation imageRequestOperationWithRequest:request success:^(UIImage *image) {
        self.imageView.image = image;
        [UIView animateWithDuration:3.0 animations:^{
            CGRect rect = self.imageView.frame;
            rect.size.height -= 30;
            self.imageView.frame = rect;
        }];
    }];
    [connection start];
    
}
//
//- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
//{
//    [self.imageData appendData:data];
//}
//
//- (void)connectionDidFinishLoading:(NSURLConnection *)connection
//{
//    UIImage *image = [UIImage imageWithData:self.imageData];
//    self.imageData = nil;
//    self.imageView.image = image;
//}
//
//- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
//{
//    NSLog(@"%@",error);
//}
//
//- (NSMutableData *)imageData
//{
//    if (!_imageData) {
//        _imageData = [NSMutableData new];
//    }
//    return _imageData;
//}

@end
