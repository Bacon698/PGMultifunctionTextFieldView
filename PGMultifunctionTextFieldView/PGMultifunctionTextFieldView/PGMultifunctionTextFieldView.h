//
//  PGMultifunctionTextFieldView.h
//  QeelinGold-iOS
//
//  Created by 张培根 on 2017/5/11.
//

//// 弱引用
//#define PGWeakSelf __weak typeof(self) weakSelf = self

static NSString *iconTextFieldTextChange = @"iconTextFieldTextChange";

typedef NS_ENUM(NSUInteger,textFieldViewTextType) {
    other = 0,//只检测是否输入
    cellphoneNum,//输入类型为手机号
    letterPassword,//输入类型为带有字母的密码
    numPassword,//输入类型为数字密码
    verificationCode,//输入类型为验证码，会自动增加发送验证码按钮，及网络请求
    userName,//输入类型为姓名
    idCard,//输入类型为身份证号
    bankInfo,//输入类型为银行名称
    bankCard,//输入类型为银行卡号
    moneyAmount,//输入类型为资金数量
};

typedef NS_ENUM(NSUInteger, textFieldViewType) {
    iconView = 0,//前边显示图片
    titleView,//前边显示标题
    nothingView,//什么也没有
};

typedef void (^bankArrowsActionBlock)();

#import <UIKit/UIKit.h>

//发送验证码的代理
@protocol PGMultifunctionTextFieldViewVerifyButtonDelegate <NSObject>

/**
 请求验证码
 */
-(void)requestVerificationCode;

/**
 验证手机号是否正确，可以不写
 */
@optional
-(BOOL)verifyCallphoneNum;

@end

@interface PGMultifunctionTextFieldView : UIView

#pragma mark  ——————带有icon的textfield———————
//初始化 带有icon的textfield
+(PGMultifunctionTextFieldView *)iconView;
-(void)setIcon:(UIImage *)icon placeholder:(NSString *)placeholder;

/**
 添加到某个View上，用于xib
 
 @param view 要添加到的View
 
 @param textType 适用类型
 */
-(void)addSelfToView:(UIView *)view withImageNamed:(NSString *)imageName placeholder:(NSString *)placeholder andType:(textFieldViewTextType)textType;
-(void)addSelfToView:(UIView *)view withImageNamed:(NSString *)imageName placeholder:(NSString *)placeholder;

#pragma mark  ——————带有title的textfield———————
//初始化 带有title的textfield
+(PGMultifunctionTextFieldView *)titleView;
-(void)setTitle:(NSString *)title placeholder:(NSString *)placeholder;

/**
 添加到某个View上，用于xib
 
 @param view 要添加到的View
 
 @param textType 适用类型
 */
-(void)addSelfToView:(UIView *)view withTitle:(NSString *)title placeholder:(NSString *)placeholder andType:(textFieldViewTextType)textType;
-(void)addSelfToView:(UIView *)view withTitle:(NSString *)title placeholder:(NSString *)placeholder;


#pragma mark  ——————啥也没有的textfield———————
//初始化 啥也没有的textfield
+(PGMultifunctionTextFieldView *)nothingView;
-(void)setPlaceholder:(NSString *)placeholder;

/**
 添加到某个View上，用于xib
 
 @param view 要添加到的View
 
 @param textType 适用类型
 */
-(void)addSelfToView:(UIView *)view withPlaceholder:(NSString *)placeholder andType:(textFieldViewTextType)textType;
-(void)addSelfToView:(UIView *)view withPlaceholder:(NSString *)placeholder;


#pragma mark  ——————通用方法———————

/**
 view的类型
 */
@property (assign,nonatomic) textFieldViewType textFieldViewType;

/**
 隐藏下方分割线
 */
-(void)hiddenLine;


/**
 用户输入的类型
 */
@property (assign,nonatomic) textFieldViewTextType textFieldViewTextType;


/**
 用户输入的文字
 */
@property (copy,nonatomic) NSString * inputString;


/**
 设置默认显示的文字，不可编辑
 */
-(void)setText:(NSString *)text;

-(void)setCellphoneNum:(NSString *)num;

/**
 设置键盘类型
 */
-(void)setKeyboardType:(UIKeyboardType)keyboardType;

/**
 检查用户输入的内容是否和指定类型相符
 */
-(BOOL)checkTextWithType:(textFieldViewTextType)textType;

@property (assign,nonatomic) id<PGMultifunctionTextFieldViewVerifyButtonDelegate> verifycodeDelegate;

-(void)addBankArrowsAction:(bankArrowsActionBlock)action;

-(void)addToView:(UIView *)view;

@end
