//
//  DDBirdLayer.m
//  DDFlappyBird
//
//  Created by Dada on 2016/12/12.
//  Copyright © 2016年 Dada. All rights reserved.
//

static const float kBirdFlyHeight = 100;
static const float kBirdDropHeight = 4;

#import "DDBirdLayer.h"
#import <UIKit/UIKit.h>

@implementation DDBirdLayer

- (instancetype)init {
    self = [super init];
    self.backgroundColor = [UIColor redColor].CGColor;
    return self;
}

- (void)fly {
    CGRect frame = self.frame;
    frame.origin.y -= kBirdFlyHeight;
    self.frame = frame;
}

- (void)drop {
    CGRect frame = self.frame;
    frame.origin.y += kBirdDropHeight;
    self.frame = frame;
}

@end
