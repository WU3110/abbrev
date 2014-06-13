//
//  CAAbbrev.h
//  TesTee
//
//  Created by Kazuki Saima on 2014/02/27.
//  Copyright (c) 2014年 Kazuki Saima. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <QuartzCore/QuartzCore.h>

@interface CABasicAnimation (Abbrev)

+ (CABasicAnimation *)animationFadeinWithDuration:(CGFloat)duration;
+ (CABasicAnimation *)animationFadeoutWithDuration:(CGFloat)duration;
+ (CABasicAnimation *)animationScaleTo:(CGFloat)scale duration:(CGFloat)duration;
+ (CABasicAnimation *)actionShake;
- (void)setAttributeForNotRemovedOnCompletion;

@end

@interface CAAnimationGroup (Abbrev)

+ (CAAnimationGroup *)animationGroupWithAnimations:(NSArray *)animations
                                          duration:(CGFloat)duration
                               removedOnCompletion:(BOOL)removedOnCompletion;

@end