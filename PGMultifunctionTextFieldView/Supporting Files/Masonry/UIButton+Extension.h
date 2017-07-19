//
//  UIButton+Extension.h
//  QeelinGold-iOS
//
//  Created by MacBook on 2017/5/10.
//  Copyright © 2017年 ChenWei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,UIButtonPosition) {
    UIButtonPositionLeft = 0,
    UIButtonPositionCenter,
    UIButtonPositionRight,
};


typedef void (^ActionBlock)(UIButton *button);
typedef void (^ImmediateActionBlock)(UIButton *button);
@interface UIButton (Extension)


/**
 创建button封装的bolck事件
 */
+ (UIButton *)btnWithActionBlock:(ActionBlock)actionBlock;


/**
 创建一个立即响应的button
 */
+ (UIButton *)immediateBtnWithActionBlock:(ImmediateActionBlock)ImmediateActionBlock;

/**
 创建只有图片的button
 */
+ (UIButton *)btnWithNormalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage highLightedImage:(UIImage *)highLightedImage actionBlock:(ActionBlock)actionBlock;

/**
 立即响应
 */
+ (UIButton *)immediatBtnWithNormalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage highLightedImage:(UIImage *)highLightedImage actionBlock:(ImmediateActionBlock)immediateActionBlock;
/**
 统一创建一个圆角的button，通过block返回做点击事件的处理

 @return 返回button本身
 */
+ (UIButton *)createFilletBtnwithText:(NSString *)text WithTextColor:(UIColor *)textColor withBackgroudColor:(UIColor *)backgroudColor withDisabledColor:(UIColor *)disabledColor WithactionBlock:(ActionBlock)actionBlock;

/**
 统一创建一个带边框和圆角的button，通过block返回做点击事件的处理

 @return 返回button本身
 */
+ (UIButton *)createRimBtnwithText:(NSString *)text WithTextColor:(UIColor *)textColor withBackgroudColor:(UIColor *)backgroudColor WithBorderColor:(UIColor *)borderColor withDisabledColor:(UIColor *)disabledColor WithactionBlock:(ActionBlock)actionBlock;


/**
 创建一个普通的button，只有文字，无其它的任何样式

 @param titleStr 文字
 @param TextFont 文字大小
 */
+ (UIButton *)createNormalBtnWithTitle:(NSString *)titleStr withFont:(UIFont *)TextFont withColor:(UIColor *)textColot actionBlock:(ActionBlock)actionBlock;

@end
