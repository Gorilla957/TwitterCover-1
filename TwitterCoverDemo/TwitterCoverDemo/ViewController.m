//
//  ViewController.m
//  TwitterCoverDemo
//
//  Created by XuDong Jin on 14-6-26.
//  Copyright (c) 2014年 XuDong Jin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

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
    // Do any additional setup after loading the view from its nib.
    
    UIImageView *topImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 180)];
    topImage.contentMode = UIViewContentModeScaleAspectFill;
    topImage.layer.masksToBounds = YES;
    
    //网络图片
    NSString *str = @"http://img1.gtimg.com/9/975/97536/9753640_980x1200_292.jpg";
    [self.scrollView addTwitterCoverWithImage:str];
    
    //本地图片
//    topImage.image = [UIImage imageNamed:@"image.jpg"];
//    [self.scrollView addTwitterCoverWithImage:topImage];
    
    
    
    
    
    
    [self.scrollView setContentSize:CGSizeMake(320, 700)];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
