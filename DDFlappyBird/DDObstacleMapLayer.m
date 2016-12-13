//
//  DDObstacleMapLayer.m
//  DDFlappyBird
//
//  Created by Dada on 2016/12/12.
//  Copyright © 2016年 Dada. All rights reserved.
//

#import "DDObstacleMapLayer.h"
#import <UIKit/UIKit.h>


@interface NSValue(CGRect)
+ (instancetype) initWithCGRect:(CGRect)rect;
@end

@implementation NSValue(CGRect)
+(instancetype) initWithCGRect:(CGRect)rect {
    NSValue *value = [NSValue valueWithBytes:&rect objCType:@encode(CGRect)];
    return value;
}
@end


@implementation DDObstacleMapLayer

- (instancetype)init {
    self = [super init];
    self.intervalRects = [[NSMutableArray alloc] init];
    return self;
}

- (void)initMap {
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    self.sublayers = nil;
    [self.intervalRects removeAllObjects];
    CGRect frame = [UIScreen mainScreen].bounds;
    frame.origin.x = frame.size.width;
    self.frame = frame;
    [self generateObstacle];
    
    [CATransaction commit];
}

- (void)shiftMap {
    CGRect frame = self.frame;
    frame.origin.x -= 1;
    self.frame = frame;
}


- (void) generateObstacle {
    CGRect intervalRect = CGRectMake(0, 0, 60, 130);
    for(int i=0; i< 60; i++) {
        NSInteger randomRange = self.frame.size.height - 320;
        int randomY = (arc4random() % randomRange) + 130;
        intervalRect.origin.y = randomY;
        [self addRectPair:intervalRect];
        intervalRect.origin.x += 200;
    }
}

- (void)addRectPair:(CGRect)intervalRect {
    [self.intervalRects addObject:[NSValue initWithCGRect:intervalRect]];
    CGRect upRect = CGRectMake(intervalRect.origin.x,
                                   0,
                                   intervalRect.size.width,
                                   intervalRect.origin.y);
    
    CGRect downRect = CGRectMake(intervalRect.origin.x,
                                     intervalRect.origin.y + intervalRect.size.height,
                                     intervalRect.size.width,
                                     self.frame.size.height - (intervalRect.origin.y + intervalRect.size.height));
    
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
