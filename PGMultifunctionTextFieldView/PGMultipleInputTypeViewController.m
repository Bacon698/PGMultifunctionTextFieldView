//
//  PGMultipleInputTypeViewController.m
//  PGMultifunctionTextFieldView
//
//  Created by 张培根 on 2017/7/10.
//
//

#import "PGMultipleInputTypeViewController.h"

@interface PGMultipleInputTypeViewController ()

@property (weak, nonatomic) IBOutlet UIView *iconViewA;//顶部的输入框
@property (weak, nonatomic) IBOutlet UIButton *iconButtonA;//输入内容后启用
@property (weak, nonatomic) IBOutlet UIButton *iconButtonB;//输入手机号后启用
@property (strong, nonatomic) PGMultifunctionTextFieldView *iconTextFieldA;

@property (weak, nonatomic) IBOutlet UIView *viewA;
@property (weak, nonatomic) IBOutlet UIView *viewB;
@property (weak, nonatomic) IBOutlet UIView *viewC;
@property (weak, nonatomic) IBOutlet UIView *viewD;
@property (weak, nonatomic) IBOutlet UIView *viewE;
@property (weak, nonatomic) IBOutlet UIView *viewF;

@property (strong, nonatomic) PGMultifunctionTextFieldView *textFieldA;
@property (strong, nonatomic) PGMultifunctionTextFieldView *textFieldB;
@property (strong, nonatomic) PGMultifunctionTextFieldView *textFieldC;
@property (strong, nonatomic) PGMultifunctionTextFieldView *textFieldD;
@property (strong, nonatomic) PGMultifunctionTextFieldView *textFieldE;
@property (strong, nonatomic) PGMultifunctionTextFieldView *textFieldF;

@property (weak, nonatomic) IBOutlet UIButton *bottomButton;

@end

@implementation PGMultipleInputTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubViews];
    
    //添加监听，来监听输入内容的变化
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(PGMultifunctionTextFieldViewEndEnding:) name:PGMultifunctionTextFieldViewTextChange object:nil];
    
    // Do any additional setup after loading the view from its nib.
}


/**
 用户输入内容时会调用此方法
 */
-(void)PGMultifunctionTextFieldViewEndEnding:(NSNotification *)notification{
    
    //验证用户输入的内容是否为指定类型，如果设为other则只要输入的有内容则通过验证
    if ([self.iconTextFieldA checkTextWithType:other]) {
        self.iconButtonA.enabled = YES;
    }else{
        self.iconButtonA.enabled = NO;
    }
    //验证用户输入的类型是否为手机号码
    if ([self.iconTextFieldA checkTextWithType:cellphoneNum]) {
        self.iconButtonB.enabled = YES;
    }else{
        self.iconButtonB.enabled = NO;
    }
    
    if ([self.textFieldA checkTextWithType:other]&&[self.textFieldB checkTextWithType:other]&&[self.textFieldC checkTextWithType:other]&&[self.textFieldD checkTextWithType:other]&&[self.textFieldE checkTextWithType:other]&&[self.textFieldF checkTextWithType:other]) {
        self.bottomButton.enabled = YES;
    }else{
        self.bottomButton.enabled = NO;
    }
}

-(void)setupSubViews{

    self.iconTextFieldA = [PGMultifunctionTextFieldView iconView];
    [self.iconTextFieldA addSelfToView:self.iconViewA withImageNamed:@"user_icon" placeholder:@"请使用手机号登录"];
    [self.iconTextFieldA setTextFieldViewTextType:cellphoneNum];
    [self.iconTextFieldA setKeyboardType:UIKeyboardTypeNumberPad];
    
    //两行代码就可以完成显示内容的设置，样式设置，并指定输入类型
    self.textFieldA = [PGMultifunctionTextFieldView titleView];
    [self.textFieldA addSelfToView:self.viewA withTitle:@"textFieldA" placeholder:@"请输入6位纯数字密码" andType:numPassword];
    
    self.textFieldB = [PGMultifunctionTextFieldView titleView];
    [self.textFieldB addSelfToView:self.viewB withTitle:@"textFieldB" placeholder:@"请输入6-16位带有字母的密码" andType:letterPassword];
    
    self.textFieldC = [PGMultifunctionTextFieldView titleView];
    [self.textFieldC addSelfToView:self.viewC withTitle:@"textFieldC" placeholder:@"请输入姓名" andType:userName];
    
    self.textFieldD = [PGMultifunctionTextFieldView titleView];
    [self.textFieldD addSelfToView:self.viewD withTitle:@"textFieldD" placeholder:@"请输入身份证号" andType:idCard];
    
    self.textFieldE = [PGMultifunctionTextFieldView titleView];
    [self.textFieldE addSelfToView:self.viewE withTitle:@"textFieldE" placeholder:@"请输入银行卡号" andType:bankCard];
    
    self.textFieldF = [PGMultifunctionTextFieldView titleView];
    [self.textFieldF addSelfToView:self.viewF withTitle:@"textFieldF" placeholder:@"请输入验证码" andType:verificationCode];

}


/**
 底部按钮点击事件

 验证各个输入框的输入格式是否正确
 */
- (IBAction)bottomButtonTapAction:(id)sender {
    if (![self.textFieldA checkTextWithCurrentType]) {
        [self showAlertWithText:@"数字密码格式有误"];
    }else if(![self.textFieldB checkTextWithCurrentType]){
        [self showAlertWithText:@"字母密码格式有误"];
    }else if(![self.textFieldC checkTextWithType:userName]){
        [self showAlertWithText:@"姓名格式有误"];
    }else if(![self.textFieldD checkTextWithType:idCard]){
        [self showAlertWithText:@"身份证号格式有误"];
    }else if(![self.textFieldE checkTextWithType:bankCard]){
        [self showAlertWithText:@"银行卡号格式有误"];
    }else if(![self.textFieldF checkTextWithType:verificationCode]){
        [self showAlertWithText:@"验证码格式有误"];
    }
}


/**
 输入内容后启用，按钮的点击事件
 */
- (IBAction)inputAnythingButtonAction:(id)sender {
    if (![self.iconTextFieldA checkTextWithType:cellphoneNum]) {
        [self showAlertWithText:@"手机号输入格式有误"];
    }
}

/**
 输入手机号后启用，按钮的点击事件
 */
- (IBAction)inputCellphoneNumButtonTapAction:(id)sender {
    [self showAlertWithText:[NSString stringWithFormat:@"输入手机号为%@",self.iconTextFieldA.inputString]];
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
