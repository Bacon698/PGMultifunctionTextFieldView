//
//  UIButton+Extension.m
//  QeelinGold-iOS
//
//  Created by MacBook on 2017/5/10.
//  Copyright © 2017年 ChenWei. All rights reserved.
//

#import "UIButton+Extension.h"
#import "UIImage+Extension.h"
#import <objc/runtime.h>

static NSString *keyOfBlock;

@implementation UIButton (Extension)

+ (UIButton *)btnWithActionBlock:(ActionBlock)actionBlock{
    UIButton *button = [[UIButton alloc]init];
    [button addTarget:button action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    objc_setAssociatedObject (button , &keyOfBlock, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    return button;
}

+ (UIButton *)immediateBtnWithActionBlock:(ImmediateActionBlock)ImmediateActionBlock{
    UIButton *button = [[UIButton alloc]init];
    [button addTarget:button action:@selector(immediateButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    objc_setAssociatedObject (button , &keyOfBlock, ImmediateActionBlock,OBJC_ASSOCIATION_COPY_NONATOMIC);
    return button;
}

+ (UIButton *)btnWithNormalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage highLightedImage:(UIImage *)highLightedImage actionBlock:(ActionBlock)actionBlock{
    UIButton *button = [UIButton btnWithActionBlock:actionBlock];
    if (normalImage) {
        [button setImage:normalImage forState:UIControlStateNormal];
    }
    if (selectedImage) {
        [button setImage:selectedImage forState:UIControlStateSelected];
    }
    if (highLightedImage) {
        [button setImage:highLightedImage forState:UIControlStateHighlighted];
    }
    return button;
}

+ (UIButton *)immediatBtnWithNormalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage highLightedImage:(UIImage *)highLightedImage actionBlock:(ImmediateActionBlock)immediateActionBlock{
    UIButton *button = [UIButton immediateBtnWithActionBlock:immediateActionBlock];
    if (normalImage) {
        [button setImage:normalImage forState:UIControlStateNormal];
    }
    if (selectedImage) {
        [button setImage:selectedImage forState:UIControlStateSelected];
    }
    if (highLightedImage) {
        [button setImage:highLightedImage forState:UIControlStateHighlighted];
    }
    return button;
}

+ (UIButton *)createFilletBtnwithText:(NSString *)text WithTextColor:(UIColor *)textColor withBackgroudColor:(UIColor *)backgroudColor withDisabledColor:(UIColor *)disabledColor WithactionBlock:(ActionBlock)actionBlock{
    UIButton *button = [UIButton btnWithActionBlock:actionBlock];
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitle:text forState:UIControlStateSelected];
    [button setTitle:text forState:UIControlStateHighlighted];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateHighlighted];
    [button setTitleColor:textColor forState:UIControlStateSelected];
    [button setBackgroundImage:[UIImage imageWithColor:disabledColor] forState:UIControlStateDisabled];
    [button setBackgroundImage:[UIImage imageWithColor:backgroudColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageWithColor:backgroudColor] forState:UIControlStateSelected];
    [button setBackgroundImage:[UIImage imageWithColor:backgroudColor] forState:UIControlStateHighlighted];
    button.clipsToBounds=YES;
    button.layer.cornerRadius=3;
    return button;
}

+ (UIButton *)createRimBtnwithText:(NSString *)text WithTextColor:(UIColor *)textColor withBackgroudColor:(UIColor *)backgroudColor WithBorderColor:(UIColor *)borderColor withDisabledColor:(UIColor *)disabledColor WithactionBlock:(ActionBlock)actionBlock{
    UIButton *button = [UIButton btnWithActionBlock:actionBlock];
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitle:text forState:UIControlStateSelected];
    [button setTitle:text forState:UIControlStateHighlighted];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateHighlighted];
    [button setTitleColor:textColor forState:UIControlStateSelected];
    [button setBackgroundImage:[UIImage imageWithColor:disabledColor] forState:UIControlStateDisabled];
    [button setBackgroundImage:[UIImage imageWithColor:backgroudColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageWithColor:backgroudColor] forState:UIControlStateSelected];
    [button setBackgroundImage:[UIImage imageWithColor:backgroudColor] forState:UIControlStateHighlighted];
    button.clipsToBounds=YES;
    button.layer.cornerRadius=3;
    [button.layer setBorderColor:borderColor.CGColor];
    [button.layer setBorderWidth:0.5];
    [button.layer setMasksToBounds:YES];
    return button;
}

//+ (UIButton *)createImportantBigBtnWithTitle:(NSString *)titleStr actionBlock:(ActionBlock)actionBlock{
//    UIButton *button =  [UIButton btnWithActionBlock:actionBlock];
//    [button setBackgroundImage:[UIImage imageWithColor:[AppSkin colorOrangeOfFirst]] forState:UIControlStateNormal];
//    [button setBackgroundImage:[UIImage imageWithColor:[AppSkin colorBigButtonOfDisabled]] forState:UIControlStateDisabled];
//    [button setTitle:titleStr forState:UIControlStateNormal];
//    [button setTitleColor:[AppSkin colorWhiteOfFirst] forState:UIControlStateNormal];
//    [button setTitleColor:[AppSkin colorWhiteOfFirst] forState:UIControlStateDisabled];
//    button.titleLabel.font = [AppSkin fontOfSize16Bold];
//    button.clipsToBounds=YES;
//    button.layer.cornerRadius=6;
//    return button;
//}


+ (UIButton *)createNormalBtnWithTitle:(NSString *)titleStr withFont:(UIFont *)TextFont withColor:(UIColor *)textColot actionBlock:(ActionBlock)actionBlock{
    UIButton *button = [UIButton btnWithActionBlock:actionBlock];
    button.adjustsImageWhenHighlighted = NO;
    button.titleLabel.font = TextFont;
    [button setTitle:titleStr forState:UIControlStateNormal];
    [button setTitle:titleStr forState:UIControlStateHighlighted];
    [button setTitle:titleStr forState:UIControlStateSelected];
    [button setTitleColor:textColot forState:UIControlStateNormal];
    [button setTitleColor:textColot forState:UIControlStateHighlighted];
    [button setTitleColor:textColot forState:UIControlStateSelected];
    return button;
}


- (void)buttonClick:(UIButton *)button{
    ActionBlock block = (ActionBlock)objc_getAssociatedObject(button, &keyOfBlock);
    if(block){
        button.userInteractionEnabled = NO;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            button.userInteractionEnabled = YES;
        });
        block(button);
    }
}

-(void)immediateButtonClick:(UIButton *)button{
    ImmediateActionBlock block = (ImmediateActionBlock)objc_getAssociatedObject(button, &keyOfBlock);
    if(block){
        block(button);
    }
}
@end
