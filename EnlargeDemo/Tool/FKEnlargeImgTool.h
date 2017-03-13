//
//  FKEnlargeImgTool.h
//  EnlargeDemo
//
//  Created by apple on 17/3/13.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface FKEnlargeImgTool : NSObject
/**
 @param oldImageView 原图片
 @param useTime 放大缩小时间
 */
+ (void)fk_enlargeImg:(UIImageView *)oldImageView enlargeTime:(CGFloat)useTime;
@end
