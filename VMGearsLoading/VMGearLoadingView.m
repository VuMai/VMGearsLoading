//
//  VMGearLoadingView.m
//  VMGearsLoading
//
//  Created by Vu Mai on 5/14/15.
//  Copyright (c) 2015 VuMai. All rights reserved.
//

#import "VMGearLoadingView.h"
@interface VMGearLoadingView()

@property (nonatomic, strong)UIImageView *imgGear1;
@property (nonatomic, strong)UIImageView *imgGear2;
@property (nonatomic, strong)UIImageView *imgGear3;
@property (nonatomic) BOOL removeFromSuperViewOnHide;

@end

@implementation VMGearLoadingView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initItem];
    }
    return self;
}

-(void)initItem
{
    self.imgGear1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gears 1.png"]];
    [self.imgGear1 setContentMode:UIViewContentModeCenter];
    [self.imgGear1 setCenter:CGPointMake(CGRectGetWidth(self.frame)/2 - 60, CGRectGetHeight(self.frame)/2+20)];
    [self addSubview:self.imgGear1];
    
    self.imgGear2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gears 2.png"]];
    [self.imgGear2 setCenter:CGPointMake(CGRectGetWidth(self.frame)/2 - 19, CGRectGetHeight(self.frame)/2-45)];
    [self.imgGear2 setContentMode:UIViewContentModeCenter];
    [self addSubview:self.imgGear2];
    
    self.imgGear3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gears 3.png"]];
    [self.imgGear3 setCenter:CGPointMake(CGRectGetWidth(self.frame)/2 + 38, CGRectGetHeight(self.frame)/2-20)];
    [self.imgGear3 setContentMode:UIViewContentModeCenter];
    [self addSubview:self.imgGear3];
    
    UIImageView *imgBgView = [[UIImageView alloc] initWithFrame:self.frame];
    [imgBgView setImage:[UIImage imageNamed:@"background.png"]];
    [self addSubview:imgBgView];
    imgBgView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    
    [self runSpinAnimationWithDuration:8 withView:self.imgGear1 withValue:10];
    [self runSpinAnimationWithDuration:8 withView:self.imgGear2 withValue:-18];
    [self runSpinAnimationWithDuration:8 withView:self.imgGear3 withValue:15];
}

- (void) runSpinAnimationWithDuration:(CGFloat) duration withView:(UIView *)view withValue:(float)value;
{
    [CATransaction begin];
    CABasicAnimation *rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.byValue = [NSNumber numberWithFloat:value];
    rotationAnimation.duration = duration;
    rotationAnimation.fromValue = 0;
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI*2];
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    rotationAnimation.removedOnCompletion = NO;
    rotationAnimation.fillMode = kCAFillModeForwards;
    rotationAnimation.autoreverses = YES;
    rotationAnimation.repeatCount = HUGE_VALF;
    
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    [CATransaction commit];
}

- (id)initWithView:(UIView *)view {
    return [self initWithFrame:view.bounds];
}

+ (instancetype)showGearLoadingForView:(UIView *)view {
    VMGearLoadingView *gear = [[self alloc] initWithView:view];
    [gear setAlpha:0];
    [view addSubview:gear];
    [gear showViewWithAnimate:YES];
    return nil;
}

+ (BOOL)hideGearLoadingForView:(UIView *)view {
    VMGearLoadingView *gearLoading = [self gearLoadingForView:view];
    if (gearLoading != nil) {
        [gearLoading hideViewWithAnimate:YES];
        return YES;
    }
    return NO;
}

+ (instancetype)gearLoadingForView:(UIView *)view {
    NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:self]) {
            return (VMGearLoadingView *)subview;
        }
    }
    return nil;
}

-(void)showViewWithAnimate:(BOOL)animate
{
    [UIView animateWithDuration:0.3 animations:^{
        [self setAlpha:1];
    } completion:^(BOOL finished) {
        
    }];
}

-(void)hideViewWithAnimate:(BOOL)animate
{
    [UIView animateWithDuration:0.3 animations:^{
        [self setAlpha:0];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
