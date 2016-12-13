//
//  DDObstacleMapLayer.h
//  DDFlappyBird
//
//  Created by Dada on 2016/12/12.
//  Copyright © 2016年 Dada. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>


@interface DDObstacleMapLayer : CALayer
@property(strong, nonatomic) NSMutableArray<NSValue *> *intervalRects;

- (void)shiftLeft;

- (void)initMap;

@end
