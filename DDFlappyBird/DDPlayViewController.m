//
//  DDPlayViewController.m
//  DDFlappyBird
//
//  Created by Dada on 2016/12/12.
//  Copyright © 2016年 Dada. All rights reserved.
//

#import "DDPlayViewController.h"
#import "DDBirdLayer.h"
#import "DDObstacleMapLayer.h"

static const float kBirdWidth = 40;
static const float kBirdHeight = 40;

@interface DDPlayViewController ()
@property(strong, nonatomic) DDWelcomeView *welcomeView;
@property(strong, nonatomic) UIView *playView;
@property(strong, nonatomic) CADisplayLink *displayLink;
@property(strong, nonatomic) DDBirdLayer *bird;
@property(strong, nonatomic) DDObstacleMapLayer *map;
@property(strong, nonatomic) UIButton *backButton;
@end

@implementation DDPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addPlayView];
    [self addWelcomeView];
}

- (void)addWelcomeView {
    self.welcomeView = [[DDWelcomeView alloc] initWithFrame:self.view.frame];
    self.welcomeView.delegate = self;
    [self.view addSubview:self.welcomeView];
}

- (void)addPlayView {
    self.playView = [[UIView alloc] initWithFrame:self.view.frame];
    self.bird = [[DDBirdLayer alloc] init];
    self.bird.frame = CGRectMake((self.view.frame.size.width - kBirdWidth) / 2,
            (self.view.frame.size.height - kBirdHeight) / 2,
            kBirdWidth, kBirdHeight);
    [self.playView.layer addSublayer:self.bird];

    self.map = [[DDObstacleMapLayer alloc] init];
    [self.playView.layer addSublayer:self.map];

    self.backButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 60, 40)];

    [self.backButton setTitle:@"<" forState:UIControlStateNormal];
    [self.backButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.playView addSubview:self.backButton];

    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapActoin)];
    [self.playView addGestureRecognizer:tgr];
    [self.view addSubview:self.playView];
}

- (void)backButtonClicked:(id)sender {
    if (self.displayLink.isPaused) {
        self.welcomeView.hidden = NO;
        self.playView.hidden = !self.welcomeView.hidden;
        [self.welcomeView showResumeButton:NO];
    } else {
        [self.displayLink setPaused:YES];
        self.welcomeView.hidden = NO;
        self.playView.hidden = !self.welcomeView.hidden;
        [self.welcomeView showResumeButton:YES];
    }
}

- (void)tapActoin {
    if (!self.displayLink.isPaused) {
        [self.bird fly];
    }
}

- (void)startDisplayLink {
    [self.map initMap];
    self.bird.frame = CGRectMake((self.view.frame.size.width - kBirdWidth) / 2,
            (self.view.frame.size.height - kBirdHeight) / 2,
            kBirdWidth, kBirdHeight);
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(handleDisplayLink:)];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)handleDisplayLink:(CADisplayLink *)displayLink {
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    [self.bird drop];
    [self.map shiftLeft];
    if ([self isBirdHitObstacle]) {
        self.displayLink.paused = YES;
    }
    [CATransaction commit];
}

- (BOOL)isBirdHitObstacle {
    for (CALayer *layer in self.map.sublayers) {
        CGRect currentRect = layer.frame;
        currentRect.origin.x += self.map.frame.origin.x;
        if (!CGRectIsNull(CGRectIntersection(currentRect, self.bird.frame))) {
            return YES;
        }
    }
    return NO;
}

#pragma mark- welcome button delegate

- (void)startButtonClick:(id)sender {
    if (self.displayLink != nil) {
        [self.displayLink removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        self.displayLink = nil;
    }
    [self startDisplayLink];
    self.welcomeView.hidden = YES;
    self.playView.hidden = !self.welcomeView.hidden;
}

- (void)resumeButtonClick:(id)sender {
    self.displayLink.paused = NO;
    self.welcomeView.hidden = YES;
    self.playView.hidden = !self.welcomeView.hidden;
}

@end
