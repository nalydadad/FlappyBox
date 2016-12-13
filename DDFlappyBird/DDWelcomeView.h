//
//  DDWelcomeView.h
//  DDFlappyBird
//
//  Created by Dada on 2016/12/12.
//  Copyright © 2016年 Dada. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WelcomeButtonDelegate
- (void)startButtonClick:(id)sender;

- (void)resumeButtonClick:(id)sender;
@end


@interface DDWelcomeView : UIView
@property(weak, nonatomic) id <WelcomeButtonDelegate> delegate;

- (void)showResumeButton:(BOOL)show;
@end
