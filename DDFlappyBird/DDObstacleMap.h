//
//  DDObstacleMap.h
//  DDFlappyBird
//
//  Created by Dada on 2016/12/12.
//  Copyright © 2016年 Dada. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface DDObstacleMap : CALayer

- (void) scrollMove;
- (instancetype) initWithFrame:(CGRect)frame;

@end
