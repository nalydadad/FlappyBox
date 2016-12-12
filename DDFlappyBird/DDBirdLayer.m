//
//  DDBirdLayer.m
//  DDFlappyBird
//
//  Created by Dada on 2016/12/12.
//  Copyright © 2016年 Dada. All rights reserved.
//

#import "DDBirdLayer.h"
#import <UIKit/UIKit.h>

@implementation DDBirdLayer

- (instancetype)init {
    self = [super init];
    self.backgroundColor = [UIColor redColor].CGColor;
    self.borderColor = [UIColor blackColor].CGColor;
    self.borderWidth = 1;
    return self;
}

- (void)fly {
    CGRect frame = self.frame;
    frame.origin.y -= 100;
    self.frame = frame;
}

- (void)drop {
    CGRect frame = self.frame;
    frame.origin.y += 4;
    self.frame = frame;
}

@end
