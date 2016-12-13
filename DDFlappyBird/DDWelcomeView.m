//
//  DDWelcomeView.m
//  DDFlappyBird
//
//  Created by Dada on 2016/12/12.
//  Copyright © 2016年 Dada. All rights reserved.
//

#import "DDWelcomeView.h"

static const float kButtonWidth = 100;
static const float kButtonHeight = 40;

@interface DDWelcomeView ()
@property(strong, nonatomic) UIButton *startButton;
@property(strong, nonatomic) UIButton *resumeButton;
@end

@implementation DDWelcomeView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];

    self.startButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width / 2 - kButtonWidth / 2,
            self.frame.size.height / 2 - kButtonHeight / 2,
            kButtonWidth,
            kButtonHeight)];

    self.startButton.layer.contentsScale = [[UIScreen mainScreen] scale];
    self.startButton.layer.cornerRadius = kButtonHeight / 3;
    self.startButton.backgroundColor = [UIColor lightGrayColor];
    [self.startButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.startButton setTitle:@"start game" forState:UIControlStateNormal];
    [self.startButton addTarget:self.delegate
                         action:@selector(startButtonClick:)
               forControlEvents:UIControlEventTouchUpInside];

    [self addSubview:self.startButton];


    self.resumeButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width / 2 - kButtonWidth / 2,
            self.frame.size.height / 2 - kButtonHeight / 2 + kButtonHeight + 10,
            kButtonWidth,
            kButtonHeight)];

    self.resumeButton.layer.contentsScale = [[UIScreen mainScreen] scale];
    self.resumeButton.layer.cornerRadius = kButtonHeight / 3;
    self.resumeButton.backgroundColor = [UIColor lightGrayColor];
    [self.resumeButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.resumeButton setTitle:@"resume" forState:UIControlStateNormal];
    [self.resumeButton addTarget:self
                          action:@selector(resumeButtonClicked:)
                forControlEvents:UIControlEventTouchUpInside];
    self.resumeButton.hidden = YES;
    [self addSubview:self.resumeButton];
    return self;
}

- (void)resumeButtonClicked:(id)sender {
    self.resumeButton.hidden = YES;
    [self.delegate resumeButtonClick:sender];
}

- (void)showResumeButton:(BOOL)show {
    if (show) {
        self.resumeButton.hidden = NO;
        self.startButton.frame = CGRectMake(self.frame.size.width / 2 - kButtonWidth / 2,
                self.frame.size.height / 2 - kButtonHeight / 2 - kButtonHeight - 5,
                kButtonWidth,
                kButtonHeight);

        self.resumeButton.frame = CGRectMake(self.frame.size.width / 2 - kButtonWidth / 2,
                self.frame.size.height / 2 + 5,
                kButtonWidth,
                kButtonHeight);
    } else {
        self.resumeButton.hidden = YES;
        self.startButton.frame = CGRectMake(self.frame.size.width / 2 - kButtonWidth / 2,
                self.frame.size.height / 2 - kButtonHeight / 2,
                kButtonWidth,
                kButtonHeight);
    }
}

@end
