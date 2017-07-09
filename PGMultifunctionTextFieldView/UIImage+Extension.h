//
//  UIImage+Extension.h
//  QeelinGold-iOS
//
//  Created by MacBook on 2017/4/11.
//  Copyright © 2017年 chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
+ (UIImage *)imageWithName:(NSString *)name;
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  根据图片名返回一张能够自由拉伸的图片
 */
+ (UIImage *)resizedImage:(NSString *)name;
/**
 *  根据图片名返回一张剪切（园）的图片
 */
+ (UIImage *)clipImageWithIcon:(NSString *)icon;
/**
 *  根据颜色返回一张剪切（园）的图片
 */
+ (UIImage *)clipImageWithColor:(UIColor *)color;
/**
 *  根据图片返回一张剪切（园）的图片
 */
+ (UIImage *)clipImageWithImage:(UIImage *)image;
/**
 *  根据图片和size返回一张剪切（园）的图片
 */

+ (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize;
/**
 *  对图片做模糊效果
 *
 *  @param blurLevel 模糊值
 *
 *  @return tupian
 */
+ (UIImage*)imageWithName:(NSString *)name withBlur:(CGFloat)blurLevel;

- (UIImage*)resize:(CGSize)size;

@end
