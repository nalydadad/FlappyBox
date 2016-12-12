//
//  DDPlayViewController.m
//  DDFlappyBird
//
//  Created by Dada on 2016/12/12.
//  Copyright © 2016年 Dada. All rights reserved.
//

#import "DDPlayViewController.h"
#import "DDBirdLayer.h"
#import "DDObstacleMap.h"

static const float kBirdWidth = 40;
static const float kBirdHeight = 40;

@interface DDPlayViewController ()
@property(strong, nonatomic) DDWelcomeView *welcomeView;
@property(strong, nonatomic) CADisplayLink *displayLink;
@property(strong, nonatomic) DDBirdLayer *bird;
@property(strong, nonatomic) DDObstacleMap *map;
@end

@implementation DDPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bird = [[DDBirdLayer alloc] init];
    self.bird.frame = CGRectMake((self.view.frame.size.width - kBirdWidth) / 2 ,
                                 (self.view.frame.size.height - kBirdHeight) / 2,
                                 kBirdWidth, kBirdHeight);
    [self.view.layer addSublayer:self.bird];

    self.map = [[DDObstacleMap alloc] initWithFrame:self.view.frame];
    [self.view.layer addSublayer:self.map];
    
    self.welcomeView = [[DDWelcomeView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.welcomeView];
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapActoin)];
    [self.view addGestureRecognizer:tgr];
}

- (void)tapActoin {
    [self.bird fly];
}

- (void)startDisplayLink
{
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(handleDisplayLink:)];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)handleDisplayLink:(CADisplayLink *)displayLink
{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    [self.bird drop];
    [self.map scrollMove];
    [CATransaction commit];
}


#pragma mark- welcome button delegate
- (void)startButtonClick:(id)sender {
    self.welcomeView.hidden = YES;
    [self startDisplayLink];
}

@end
