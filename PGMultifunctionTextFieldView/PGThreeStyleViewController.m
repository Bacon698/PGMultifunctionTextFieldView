//
//  PGThreeStyleViewController.m
//  PGMultifunctionTextFieldView
//
//  Created by 张培根 on 2017/7/10.
//
//

#import "PGThreeStyleViewController.h"

@interface PGThreeStyleViewController ()<PGMultifunctionTextFieldViewVerifyButtonDelegate>

@property (weak, nonatomic) IBOutlet UIView *iconViewA;//用于定位布局的View
@property (weak, nonatomic) IBOutlet UIView *iconViewB;

@property (weak, nonatomic) IBOutlet UIView *titleViewA;
@property (weak, nonatomic) IBOutlet UIView *titleViewB;

@property (weak, nonatomic) IBOutlet UIView *nothingViewA;
@property (weak, nonatomic) IBOutlet UIView *nothingViewB;

@property (strong, nonatomic) PGMultifunctionTextFieldView *iconTextFieldA;
@property (strong, nonatomic) PGMultifunctionTextFieldView *iconTextFieldB;

@property (strong, nonatomic) PGMultifunctionTextFieldView *titleTextFieldA;
@property (strong, nonatomic) PGMultifunctionTextFieldView *titleTextFieldB;

@property (strong, nonatomic) PGMultifunctionTextFieldView *nothingTextFieldA;
@property (strong, nonatomic) PGMultifunctionTextFieldView *nothingTextFieldB;

@end

@implementation PGThreeStyleViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //用于生成控件，可以根据不同的类方法生成不同的样式，共有三种样式
    [self setUpIconView];
    [self setUpTitleView];
    [self setUpNothingView];
    // Do any additional setup after loading the view from its nib.
}


/**
 生成前边是图标的textFieldView
 */
-(void)setUpIconView{
    //初始化
    self.iconTextFieldA = [PGMultifunctionTextFieldView iconView];
    //使用Xib进行布局可以先在xib中布局好一个View，如iconViewA，然后调用此方法将textFieldView添加到此View上
    //并指定要显示的图片和placeholder
    [self.iconTextFieldA addSelfToView:self.iconViewA withImageNamed:@"user_icon" placeholder:@"请使用手机号登录"];
    //指定当前的textField的输入内容的类型
    [self.iconTextFieldA setTextFieldViewTextType:cellphoneNum];
    
    self.iconTextFieldB = [PGMultifunctionTextFieldView iconView];
    [self.iconTextFieldB addSelfToView:self.iconViewB withImageNamed:@"password_icon" placeholder:@"请输入登录密码"];
    //默认下方是有分割线的，如不需要则调用此方法隐藏
    [self.iconTextFieldB hiddenLine];
    self.iconTextFieldB.textFieldViewTextType = letterPassword;
}

/**
 生成前边是标题文字的textFieldView
 */
-(void)setUpTitleView{
    self.titleTextFieldA = [PGMultifunctionTextFieldView titleView];
    //指定标题
    [self.titleTextFieldA addSelfToView:self.titleViewA withTitle:@"手机号"  placeholder:@"请输入预留手机号"];
    [self.titleTextFieldA setTextFieldViewTextType:cellphoneNum];
    
    self.titleTextFieldB = [PGMultifunctionTextFieldView titleView];
    [self.titleTextFieldB addSelfToView:self.titleViewB withTitle:@"验证码"  placeholder:@"输入验证码"];
    self.titleTextFieldB.verifycodeDelegate = self;
    self.titleTextFieldB.textFieldViewTextType = verificationCode;
    [self.titleTextFieldB hiddenLine];
}

/**
 生成前边什么也没有的textFieldView
 */
-(void)setUpNothingView{
    //用户输入内容为手机号和银行卡号是，会自动为输入内容添加空格
    self.nothingTextFieldA = [PGMultifunctionTextFieldView nothingView];
    [self.nothingTextFieldA addSelfToView:self.nothingViewA withPlaceholder:@"请输入手机号"];
    [self.nothingTextFieldA setTextFieldViewTextType:cellphoneNum];
    
    self.nothingTextFieldB = [PGMultifunctionTextFieldView nothingView];
    [self.nothingTextFieldB addSelfToView:self.nothingViewB withPlaceholder:@"请输入银行卡号"];
    self.nothingTextFieldB.textFieldViewTextType = bankCard;
    [self.nothingTextFieldB hiddenLine];
}

//实现验证码相关功能
#pragma mark  ---------PGMultifunctionTextFieldViewVerifyButtonDelegate-------


/**
 点击发送验证码时调用

 @return 用户输入的手机号码格式是否正确
 */
-(BOOL)verifyCallphoneNum{
    //使用此方法验证用户输入手机号格式正确与否，在PGMultipleInputTypeViewController中有详细介绍
    return [self.titleTextFieldA checkTextWithType:cellphoneNum];
}


/**
 验证手机号码格式错误时执行此方法
 */
-(void)verifyCallphoneNumErrorAction{
    [self showAlertWithText:@"手机号格式有误"];
}


/**
 手机号验证通过后执行次方法
 */
-(void)requestVerificationCode{
    //可通过inputString属性获取用户输入内容
    [self showAlertWithText:[NSString stringWithFormat:@"验证码已发送至%@",self.titleTextFieldA.inputString]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
