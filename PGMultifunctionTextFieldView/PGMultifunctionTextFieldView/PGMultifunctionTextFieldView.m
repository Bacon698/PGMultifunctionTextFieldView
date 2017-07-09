//
//  PGMultifunctionTextFieldView.m
//  QeelinGold-iOS
//
//  Created by 张培根 on 2017/5/11.
//  Copyright © 2017年 ChenWei. All rights reserved.
//

#import "PGMultifunctionTextFieldView.h"
#import "UIButton+Extension.h"
#import "QLHJMatchTool.h"

//static int arrayIndex;

@interface PGMultifunctionTextFieldView ()<UITextFieldDelegate>{
    NSUInteger _lastSecond;
    UIButton *_cleanButton;
    UIView *_bankArrowsView;
    int arrayIndex;
}

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *lineLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) UIButton *sVerifyBtn;
@property (nonatomic, weak) NSTimer *timer;

@end

@implementation PGMultifunctionTextFieldView

-(void)awakeFromNib{
    [super awakeFromNib];
    [self.textField addTarget:self action:@selector(textFieldTextChange:) forControlEvents:UIControlEventEditingChanged];
}

-(void)setTextFieldViewTextType:(textFieldViewTextType)type{
    _textFieldViewTextType = type;
    switch (type) {
        case letterPassword:
            [self switchPasswodType];
            break;
        case numPassword:
            [self setKeyboardType:UIKeyboardTypeNumberPad];
            [self switchPasswodType];
            break;
        case verificationCode:
            [self setKeyboardType:UIKeyboardTypeNumberPad];
            [self switchVerificationCodeType];
            break;
        case cellphoneNum:
            self.textField.delegate = self;
            [self setKeyboardType:UIKeyboardTypeNumberPad];
            break;
        case bankInfo:
            [self switchBankInfo];
            break;
        case bankCard:
            self.textField.delegate = self;
            [self setKeyboardType:UIKeyboardTypeNumberPad];
            break;
        case moneyAmount:
            [self setKeyboardType:UIKeyboardTypeDecimalPad];
            break;
            
        default:
            break;
    }
}

-(void)hiddenLine;{
    self.lineLabel.hidden = YES;
}

-(void)switchVerificationCodeType{
    
    PGWeakSelf;
    UIButton *verifyBtn = [UIButton createFilletBtnwithText:@"获取验证码" WithTextColor:[UIColor whiteColor] withBackgroudColor:[UIColor orangeColor] withDisabledColor:[UIColor lightGrayColor] WithactionBlock:^(UIButton *button) {
        [weakSelf changeVerifyBtnState];
    }];
    verifyBtn.titleLabel.font = [UIFont systemFontOfSize:10];

    
    [self addSubview:verifyBtn];
    
    [verifyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).offset(-15);
        make.centerY.mas_equalTo(self);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(30);
    }];
    self.sVerifyBtn = verifyBtn;
    
}

-(void)switchPasswodType{
    
    self.textField.secureTextEntry = YES;
    
    PGWeakSelf;
    UIButton *pwdButton = [UIButton immediatBtnWithNormalImage:[UIImage imageNamed:@"showpwd_icon"] selectedImage:[UIImage imageNamed:@"hiddenpwd_icon"] highLightedImage:nil actionBlock:^(UIButton *button) {
        button.selected = !button.selected;
        weakSelf.textField.secureTextEntry = !weakSelf.textField.secureTextEntry;
    }];
    
    [self addSubview:pwdButton];
    [pwdButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).offset(-15.5);
        make.centerY.mas_equalTo(self);
    }];
    
}

-(void)switchBankInfo{
////    + (UIView *)createCanClickInImageView:(UIImage *)image withSize:(CGSize )viewSize withPosition:(UIViewImagePosition)position WithActionBlock:(viewActionBlock)actionBlock;
//    _bankArrowsView = [UIView createCanClickInImageView:[UIImage imageNamed:@"arrows_down"] withSize:CGSizeMake(30, 30) withPosition:UIViewImagePositionCenter WithActionBlock:^(UIView *clickView) {
//        
//    }];
//    [self addSubview:_bankArrowsView];
//    
//    [_bankArrowsView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.mas_equalTo(self).offset(-9);
//        make.centerY.mas_equalTo(self);
//        make.width.height.mas_equalTo(30);
//    }];
}

-(void)addBankArrowsAction:(bankArrowsActionBlock)action{
//    if (_bankArrowsView) {
//        [_bankArrowsView removeFromSuperview];
//    }
//    _bankArrowsView = [UIView createCanClickInImageView:[UIImage imageNamed:@"arrows_down"] withSize:CGSizeMake(30, 30) withPosition:UIViewImagePositionCenter WithActionBlock:^(UIView *clickView) {
//        action();
//    }];
//    [self addSubview:_bankArrowsView];
//    
//    [_bankArrowsView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.mas_equalTo(self).offset(-9);
//        make.centerY.mas_equalTo(self);
//        make.width.height.mas_equalTo(30);
//    }];
}

-(void)changeVerifyBtnState{

    if ([self.verifycodeDelegate respondsToSelector:@selector(verifyCallphoneNum)]) {
        if (![self.verifycodeDelegate verifyCallphoneNum]) {
            return;
        }
    }
    if ([self.verifycodeDelegate respondsToSelector:@selector(requestVerificationCode)]) {
        [self.verifycodeDelegate requestVerificationCode];
    }
    self.sVerifyBtn.enabled = NO;
    _lastSecond = 60;
    [self timerAction];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer;
    
}

-(void)timerAction{
    _lastSecond --;
    NSString *str = [NSString stringWithFormat:@"%@", @(_lastSecond)];
    [self.sVerifyBtn setTitle:str forState:UIControlStateNormal];
    if (_lastSecond==0) {
        [self.timer invalidate];
        self.sVerifyBtn.enabled = YES;
        [self.sVerifyBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    }
}

-(void)setCellphoneNum:(NSString *)num{
    NSMutableString *mString = [[NSMutableString alloc]initWithString:num];
    [mString insertString:@" " atIndex:7];
    [mString insertString:@" " atIndex:3];
    self.textField.text = mString;
//    self.textField.userInteractionEnabled = NO;
}

-(void)setText:(NSString *)text{
    self.textField.text = text;
    self.textField.userInteractionEnabled = NO;
}

-(void)setKeyboardType:(UIKeyboardType)keyboardType{
    self.textField.keyboardType = keyboardType;
}

-(NSString *)inputString{
    NSString *str = [self.textField.text stringByReplacingOccurrencesOfString:@" " withString:@""];//去除用户输入内容中的空格
    return str?str:@"";
}

-(BOOL)checkTextWithType:(textFieldViewTextType)type{
    
    switch (type) {
        case cellphoneNum:
            return [QLHJMatchTool checkMobile:[self inputString]];
            break;
        case verificationCode:
            return [QLHJMatchTool checkVerificationCode:[self inputString]];
            break;
        case letterPassword:
            return [QLHJMatchTool checkLetterPassword:[self inputString]];
            break;
        case numPassword:
            return [QLHJMatchTool checkVerificationCode:[self inputString]];
            break;
        case userName:
            return [QLHJMatchTool checkUserName:[self inputString]];
            break;
        case idCard:
            return [QLHJMatchTool checkUserIdCard:[self inputString]];
            break;
        case other:
            return self.textField.text.length>0?YES:NO;
            
        default:
            return self.textField.text.length>0?YES:NO;
            break;
    }
    
}

-(void)showCleanTextButton{
    PGWeakSelf;
    if (self.textFieldViewTextType == verificationCode||self.textFieldViewTextType == bankInfo) {//验证码不显示清除按钮
        return;
    }
    if (!_cleanButton) {
        _cleanButton = [UIButton immediatBtnWithNormalImage:[UIImage imageNamed:@"text_clean_icon"] selectedImage:nil highLightedImage:nil actionBlock:^(UIButton *button) {
            [_cleanButton removeFromSuperview];
            _cleanButton = nil;
            weakSelf.textField.text = nil;
        }];
        [self addSubview:_cleanButton];
        float w = [UIImage imageNamed:@"showpwd_icon"].size.width;
        if (self.textFieldViewTextType == numPassword||self.textFieldViewTextType == letterPassword) {
            [_cleanButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(self).offset(-15.5 - w -10);
                make.centerY.mas_equalTo(self);
            }];
        }else{
            [_cleanButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(self).offset(-15.5);
                make.centerY.mas_equalTo(self);
            }];
        }
    }
}

-(void)textFieldTextChange:(UITextField *)textField{
    if (self.textField.text.length > 0) {
        [self showCleanTextButton];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:iconTextFieldTextChange object:nil];
}

// textFiled的代理方法 用来把银行卡号按照每4位分隔
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{

    if (self.textFieldViewTextType == bankCard) {
        if (textField == _textField) {
            
            NSString *text = [_textField text];
            
            NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789\b"];
            string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
            if ([string rangeOfCharacterFromSet:[characterSet invertedSet]].location != NSNotFound) {
                return NO;
            }
            
            text = [text stringByReplacingCharactersInRange:range withString:string];
            text = [text stringByReplacingOccurrencesOfString:@" " withString:@""];
            
            NSString *newString = @"";
            while (text.length > 0) {
                NSString *subString = [text substringToIndex:MIN(text.length, 4)];
                newString = [newString stringByAppendingString:subString];
                if (subString.length == 4) {
                    newString = [newString stringByAppendingString:@" "];
                }
                text = [text substringFromIndex:MIN(text.length, 4)];
            }
            
            newString = [newString stringByTrimmingCharactersInSet:[characterSet invertedSet]];
            
            if (newString.length >= 24) {
                return NO;
            }
            
            [_textField setText:newString];
            [self textFieldTextChange:nil];
            
            return NO;
            
            
        }
        
    }
    
    if (self.textFieldViewTextType == cellphoneNum) {
        if(textField == _textField){
            NSArray *arrayN = @[@3,@4,@4];
            arrayIndex = 0;
            NSString *text = [_textField text];
            
            NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789\b"];
            string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
            if ([string rangeOfCharacterFromSet:[characterSet invertedSet]].location != NSNotFound) {
                return NO;
            }
            
            text = [text stringByReplacingCharactersInRange:range withString:string];
            text = [text stringByReplacingOccurrencesOfString:@" " withString:@""];
            
            NSString *newString = @"";
                while (text.length > 0) {
                    NSNumber *len;
                    int intlen;
                    if (arrayIndex >= arrayN.count) {
                        intlen = 100000000;
                    }else{
                        len = arrayN[arrayIndex];
                        intlen = len.intValue;
                    }
                    NSString *subString = [text substringToIndex:MIN(text.length, intlen)];
                    newString = [newString stringByAppendingString:subString];
                    if (subString.length == intlen) {
                        newString = [newString stringByAppendingString:@" "];
                        arrayIndex++;
                    }
                    text = [text substringFromIndex:MIN(text.length, intlen)];
                    
                }
            
            newString = [newString stringByTrimmingCharactersInSet:[characterSet invertedSet]];
            
            if (newString.length >= 14) {
                return NO;
            }
            
            [_textField setText:newString];
            [self textFieldTextChange:nil];
            
            return NO;
            
        }
    }
    return YES;
    
}

#pragma mark  ——————带有icon的textfield———————
//初始化 带有icon的textfield
+(PGMultifunctionTextFieldView *)iconView{
    return [[NSBundle mainBundle]loadNibNamed:@"PGMultifunctionTextFieldView" owner:self options:nil].firstObject;
}
-(void)setIcon:(UIImage *)icon placeholder:(NSString *)placeholder{
    self.iconImage.image = icon;
    self.textField.placeholder = placeholder;
}

/**
 添加到某个View上，用于xib
 
 @param view 要添加到的View
 
 @param textFieldViewTextType 适用类型
 */
-(void)addSelfToView:(UIView *)view withImageNamed:(NSString *)imageName placeholder:(NSString *)placeholder andType:(textFieldViewTextType)textFieldViewTextType{
    
    [self setIcon:[UIImage imageNamed:imageName] placeholder:placeholder];
    [self addToView:view];
     self.textFieldViewTextType = textFieldViewTextType;
    
}
-(void)addSelfToView:(UIView *)view withImageNamed:(NSString *)imageName placeholder:(NSString *)placeholder{
    [self addSelfToView:view withImageNamed:imageName placeholder:placeholder andType:other];
}

#pragma mark  ——————带有title的textfield———————
//初始化 带有title的textfield
+(PGMultifunctionTextFieldView *)titleView{
    return [[NSBundle mainBundle]loadNibNamed:@"PGMultifunctionTextFieldView" owner:self options:nil][1];
}
-(void)setTitle:(NSString *)title placeholder:(NSString *)placeholder{
    self.titleLabel.text = title;
    self.textField.placeholder = placeholder;
}

/**
 添加到某个View上，用于xib
 
 @param view 要添加到的View
 
 @param textFieldViewTextType 适用类型
 */
-(void)addSelfToView:(UIView *)view withTitle:(NSString *)title placeholder:(NSString *)placeholder andType:(textFieldViewTextType)textFieldViewTextType{
    
    [self setTitle:title placeholder:placeholder];
    [self addToView:view];
     self.textFieldViewTextType = textFieldViewTextType;
    
}

-(void)addSelfToView:(UIView *)view withTitle:(NSString *)title placeholder:(NSString *)placeholder{
    [self addSelfToView:view withTitle:title placeholder:placeholder andType:other];
}

#pragma mark  ——————啥也没有的textfield———————
//初始化 啥也没有的textfield
+(PGMultifunctionTextFieldView *)nothingView{
    return [[NSBundle mainBundle]loadNibNamed:@"PGMultifunctionTextFieldView" owner:self options:nil].lastObject;
}
-(void)setPlaceholder:(NSString *)placeholder{
    self.textField.placeholder = placeholder;
}

/**
 添加到某个View上，用于xib
 
 @param view 要添加到的View
 
 @param textFieldViewTextType 适用类型
 */
-(void)addSelfToView:(UIView *)view withPlaceholder:(NSString *)placeholder andType:(textFieldViewTextType)textFieldViewTextType{
    [self setPlaceholder:placeholder];
    [self addToView:view];
    self.textFieldViewTextType = textFieldViewTextType;
}
-(void)addSelfToView:(UIView *)view withPlaceholder:(NSString *)placeholder{
    [self addSelfToView:view withPlaceholder:placeholder andType:other];
}

-(void)addToView:(UIView *)view{
    [view addSubview:self];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(view);
    }];
}
@end
