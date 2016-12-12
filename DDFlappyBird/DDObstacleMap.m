//
//  DDObstacleMap.m
//  DDFlappyBird
//
//  Created by Dada on 2016/12/12.
//  Copyright © 2016年 Dada. All rights reserved.
//

#import "DDObstacleMap.h"
#import <UIKit/UIKit.h>
@implementation DDObstacleMap

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super init];
    frame.origin.x = frame.size.width;
    self.frame = frame;
    [self generateObstacle];
    return self;
}

- (void)scrollMove {
    CGRect frame = self.frame;
    frame.origin.x -= 1;
    self.frame = frame;
}

- (void) generateObstacle {
    CGRect gapRect = CGRectMake(0, 0, 60, 130);
    for(int i=0; i< 60; i++) {
        NSInteger x = self.frame.size.height - 320;
        int randomY = (arc4random() % x) + 130;
        gapRect.origin.y = randomY;
        [self addCylinderPair:gapRect];
        gapRect.origin.x += 140;
    }
}

- (void) addCylinderPair:(CGRect) gapRect{
    CGRect upRect = CGRectMake(gapRect.origin.x,
                                   0,
                                   gapRect.size.width,
                                   gapRect.origin.y);
    
    CGRect downRect = CGRectMake(gapRect.origin.x,
                                     gapRect.origin.y + gapRect.size.height,
                                     gapRect.size.width,
                                     self.frame.size.height - (gapRect.origin.y + gapRect.size.height));
    
    CALayer *upLayer = [[CALayer alloc] init];
    CALayer *downLayer = [[CALayer alloc] init];
    upLayer.frame = upRect;
    downLayer.frame = downRect;
    upLayer.backgroundColor = [UIColor greenColor].CGColor;
    downLayer.backgroundColor = [UIColor greenColor].CGColor;
    [self addSublayer:upLayer];
    [self addSublayer:downLayer];
}

@end
