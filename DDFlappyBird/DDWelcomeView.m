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

@interface DDWelcomeView()
@property(strong, nonatomic) UIButton *startButton;
@end

@implementation DDWelcomeView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    self.startButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width / 2 - kButtonWidth / 2,
                                                                  self.frame.size.height / 2 - kButtonHeight / 2,
                                                                  kButtonWidth,
                                                                  kButtonHeight)];
    
    self.startButton.layer.cornerRadius = kButtonHeight / 3;
    self.startButton.backgroundColor = [UIColor lightGrayColor];
    [self.startButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.startButton setTitle:@"start game" forState:UIControlStateNormal];
    
    [self.startButton addTarget:self.delegate
                        action:@selector(startButtonClick:)
                        forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:self.startButton];
    return self;
}


@end
