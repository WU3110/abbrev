//
//  CAAbbrev.m
//  TesTee
//
//  Created by Kazuki Saima on 2014/02/27.
//  Copyright (c) 2014年 Kazuki Saima. All rights reserved.
//

#import "CAAbbrev.h"

@implementation CABasicAnimation (Abbrev)

+ (CABasicAnimation *)animationFadeinWithDuration:(CGFloat)duration
{
    CABasicAnimation *fadein = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadein.fromValue = @0;
    fadein.toValue = @1;
    
    return fadein;
}

+ (CABasicAnimation *)animationFadeoutWithDuration:(CGFloat)duration
{
    CABasicAnimation *fadeout = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeout.fromValue = @1;
    fadeout.toValue = @0;
    
    return fadeout;
}

+ (CABasicAnimation *)animationScaleTo:(CGFloat)scaleTo duration:(CGFloat)duration
{
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.fromValue = @1;
    scale.toValue = @(scaleTo);
    
    return scale;
}

+ (CABasicAnimation *)actionShake
{
    CABasicAnimation *shakeAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    shakeAnimation.duration = 0.1f;
    shakeAnimation.autoreverses = YES;
    shakeAnimation.fromValue = @(-M_PI_4/4);
    shakeAnimation.toValue = @(M_PI_4/4);
    return shakeAnimation;
}

- (void)setAttributeForNotRemovedOnCompletion
{
    self.removedOnCompletion = NO;
    self.fillMode = kCAFillModeForwards;
}

@end

@implementation CAAnimationGroup (Abbrev)

+ (CAAnimationGroup *)animationGroupWithAnimations:(NSArray *)animations
                                          duration:(CGFloat)duration
                               removedOnCompletion:(BOOL)removedOnCompletion
{
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = animations;
    group.duration = duration;
    if (!removedOnCompletion)
    {
        group.removedOnCompletion = NO;
        group.fillMode = kCAFillModeForwards;
    }
    group.repeatCount = 1;
    
    return group;
}

+ (CAAnimationGroup *)sequentialAnimationGroup:(NSArray *)animations
{
    CAAnimationGroup *g = [CAAnimationGroup animation];
    
    NSTimeInterval totalTime = 0.f;
    for (CABasicAnimation *animation in animations)
    {
        animation.beginTime = totalTime;
        totalTime += animation.duration;
    }
    
    g.animations = animations;
    g.duration = totalTime;
    g.removedOnCompletion = NO;
    g.fillMode = kCAFillModeForwards;
    
    return g;
}


@end
