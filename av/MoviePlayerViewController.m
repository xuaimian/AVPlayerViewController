//
//  MoviePlayerViewController.m
//  av
//
//  Created by spring on 2017/9/29.
//  Copyright © 2017年 spring. All rights reserved.
//

#import "MoviePlayerViewController.h"

@interface MoviePlayerViewController ()

@end

@implementation MoviePlayerViewController
-(void)setName:(NSString *)name
{
    _name = name;
    NSString *playString = [[NSBundle mainBundle] pathForResource:name ofType:nil];
    //视频播放的url
    NSURL *playerURL = [NSURL fileURLWithPath:playString];
    self.player = [[AVPlayer alloc] initWithURL:playerURL];
    
    self.videoGravity = AVLayerVideoGravityResizeAspect;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(dismiss) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    // Do any additional setup after loading the view.
}
-(void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear: animated];
    [self.player play];
 
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
