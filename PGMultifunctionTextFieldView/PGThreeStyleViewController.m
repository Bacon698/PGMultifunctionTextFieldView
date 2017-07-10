//
//  PGThreeStyleViewController.m
//  PGMultifunctionTextFieldView
//
//  Created by 张培根 on 2017/7/10.
//
//

#import "PGThreeStyleViewController.h"

@interface PGThreeStyleViewController ()<PGMultifunctionTextFieldViewVerifyButtonDelegate>

@property (weak, nonatomic) IBOutlet UIView *iconViewA;
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
    
    [self setUpIconView];
    [self setUpTitleView];
    [self setUpNothingView];
    // Do any additional setup after loading the view from its nib.
}
//
//-(void)setupSubViews{
//
//    [self setUpIconView];
//    [self setUpTitleView];
//    [self setUpNothingView];
//  
//}

-(void)setUpIconView{
    self.iconTextFieldA = [PGMultifunctionTextFieldView iconView];
    [self.iconTextFieldA addSelfToView:self.iconViewA withImageNamed:@"user_icon" placeholder:@"请使用手机号登录"];
    [self.iconTextFieldA setTextFieldViewTextType:cellphoneNum];
    
    self.iconTextFieldB = [PGMultifunctionTextFieldView iconView];
    [self.iconTextFieldB addSelfToView:self.iconViewB withImageNamed:@"password_icon" placeholder:@"请输入登录密码"];
    [self.iconTextFieldB hiddenLine];
    self.iconTextFieldB.textFieldViewTextType = letterPassword;
}

-(void)setUpTitleView{
    self.titleTextFieldA = [PGMultifunctionTextFieldView titleView];
    [self.titleTextFieldA addSelfToView:self.titleViewA withTitle:@"手机号"  placeholder:@"请输入预留手机号"];
    [self.titleTextFieldA setTextFieldViewTextType:cellphoneNum];
    
    self.titleTextFieldB = [PGMultifunctionTextFieldView titleView];
    [self.titleTextFieldB addSelfToView:self.titleViewB withTitle:@"验证码"  placeholder:@"输入验证码"];
    self.titleTextFieldB.verifycodeDelegate = self;
    self.titleTextFieldB.textFieldViewTextType = verificationCode;
    [self.titleTextFieldB hiddenLine];
}

-(void)setUpNothingView{
    self.nothingTextFieldA = [PGMultifunctionTextFieldView nothingView];
    [self.nothingTextFieldA addSelfToView:self.nothingViewA withPlaceholder:@"请输入手机号"];
    [self.nothingTextFieldA setTextFieldViewTextType:cellphoneNum];
    
    self.nothingTextFieldB = [PGMultifunctionTextFieldView nothingView];
    [self.nothingTextFieldB addSelfToView:self.nothingViewB withPlaceholder:@"请输入银行卡号"];
    self.nothingTextFieldB.textFieldViewTextType = bankCard;
    [self.nothingTextFieldB hiddenLine];
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
