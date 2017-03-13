//
//  FKEnlargeImgTool.m
//  EnlargeDemo
//
//  Created by apple on 17/3/13.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "FKEnlargeImgTool.h"
#define Rect    [UIScreen mainScreen].bounds
#define windows [UIApplication sharedApplication].keyWindow
#define backColor   [UIColor blackColor]
@implementation FKEnlargeImgTool
static CGRect oldRect;
static id tempImageView;
static CGFloat enlargedTime;

+ (void)fk_enlargeImg:(UIImageView *)oldImageView enlargeTime:(CGFloat)useTime{
    oldImageView.alpha = 0;
    enlargedTime = useTime;
    tempImageView = oldImageView;
    
    UIImage * image = oldImageView.image;
    oldRect = [oldImageView convertRect:oldImageView.bounds toView:windows];
    
    UIView * backView = [[UIView alloc]initWithFrame:windows.bounds];
    backView.backgroundColor = [backColor colorWithAlphaComponent:0.5];
    backView.alpha = 1;
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:oldRect];
    imageView.image = image;
    imageView.tag = 1;
    imageView.contentMode = UIViewContentModeScaleToFill;
    imageView.clipsToBounds = YES;
    [backView addSubview:imageView];
    [windows addSubview:backView];
    
    float scaleHeight = Rect.size.width/oldImageView.image.size.width * oldImageView.image.size.height;
    
    [UIView animateWithDuration:enlargedTime animations:^{
        imageView.frame = CGRectMake(0, (Rect.size.height - scaleHeight)/2, Rect.size.width, scaleHeight);
        backView.alpha = 1;

    } completion:^(BOOL finished) {
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideImage:)];
        [backView addGestureRecognizer:tap];
    }];
    
    
}

+ (void)hideImage:(UITapGestureRecognizer *)sender{
    UIView * backgroundView = sender.view;
    backgroundView.userInteractionEnabled = NO;
    UIImageView * imageView = (UIImageView *)[backgroundView viewWithTag:1];
    UIImageView * oldImage = tempImageView;
    
    [UIView animateWithDuration:enlargedTime animations:^{
        imageView.frame = oldRect;
    } completion:^(BOOL finished) {
        [backgroundView removeGestureRecognizer:backgroundView.gestureRecognizers[0]];
        oldImage.alpha = 1;
        [backgroundView removeFromSuperview];
    }];
}

@end
