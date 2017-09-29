//
//  ViewController.m
//  av
//
//  Created by spring on 2017/9/29.
//  Copyright © 2017年 spring. All rights reserved.
//

#import "ViewController.h"
#import "MoviePlayerViewController.h"

@interface ViewController ()

@property (nonatomic, strong)  AVPlayerViewController *controller;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton * playVideoButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 500,300, 100)];

    playVideoButton.backgroundColor = [UIColor grayColor];
    [playVideoButton setTitle:@"PresentAVPlayerController" forState:UIControlStateNormal];
    [playVideoButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [playVideoButton addTarget:self action:@selector(playeVideo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playVideoButton];
    
    UIButton * playVideoButton2 = [[UIButton alloc] initWithFrame:CGRectMake(100,200,300,100)];
  
    playVideoButton2.backgroundColor = [UIColor grayColor];
    [playVideoButton2 setTitle:@"addPlayerView" forState:UIControlStateNormal];
    [playVideoButton2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [playVideoButton2 addTarget:self action:@selector(playeVideo2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playVideoButton2];
}
-(void)playeVideo2
{
    _controller= [[AVPlayerViewController alloc]init];

   AVPlayerItem *model =[[AVPlayerItem alloc]initWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"bhl912.mov" ofType:nil]]];

    AVPlayer *player = [AVPlayer playerWithPlayerItem:model];
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(playFinished:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    [_controller setPlayer:player];
    _controller.view.frame = self.view.bounds;
    _controller.videoGravity = AVLayerVideoGravityResizeAspect;
    _controller.showsPlaybackControls = YES;

    [self.view addSubview:_controller.view];
    [_controller.player play];
  


    
    
}
-(void)playFinished:(NSNotification *)notification
{
    NSLog(@"playFinished");
    [_controller.view removeFromSuperview];
     _controller  = nil;
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
- (void)playeVideo
{

    MoviePlayerViewController* avPlayer = [[MoviePlayerViewController alloc] init];
   
    [avPlayer setName:@"bhl912.mov"];
    [self presentViewController:avPlayer animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
