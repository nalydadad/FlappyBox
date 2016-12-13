//
//  DDObstacleMapLayer.h
//  DDFlappyBird
//
//  Created by Dada on 2016/12/12.
//  Copyright © 2016年 Dada. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface NSValue(CGRect)
+ (instancetype) initWithCGRect:(CGRect)rect;
- (CGRect) CGRectValue;
@end

@implementation NSValue(CGRect)

+(instancetype) initWithCGRect:(CGRect)rect {
    NSValue *value = [NSValue valueWithBytes:&rect objCType:@encode(CGRect)];
    return value;
}

- (CGRect)CGRectValue {
    CGRect rect;
    [self getValue:&rect];
    return rect;
}

@end

@interface DDObstacleMapLayer : CALayer
@property(strong, nonatomic) NSMutableArray<NSValue*> *intervalRects;
- (void)shiftMap;
- (void) initMap;

@end
