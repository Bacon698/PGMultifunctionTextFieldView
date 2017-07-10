//
//  PGMultipleInputTypeViewController.m
//  PGMultifunctionTextFieldView
//
//  Created by 张培根 on 2017/7/10.
//
//

#import "PGMultipleInputTypeViewController.h"

@interface PGMultipleInputTypeViewController ()

@property (weak, nonatomic) IBOutlet UIView *iconViewA;
@property (weak, nonatomic) IBOutlet UIButton *iconButtonA;
@property (weak, nonatomic) IBOutlet UIButton *iconButtonB;
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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(PGMultifunctionTextFieldViewEndEnding:) name:PGMultifunctionTextFieldViewTextChange object:nil];
    
    // Do any additional setup after loading the view from its nib.
}

-(void)PGMultifunctionTextFieldViewEndEnding:(NSNotification *)notification{
    
    if ([self.iconTextFieldA checkTextWithType:other]) {
        self.iconButtonA.enabled = YES;
    }else{
        self.iconButtonA.enabled = NO;
    }
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

- (IBAction)inputAnythingButtonAction:(id)sender {
    if (![self.iconTextFieldA checkTextWithType:cellphoneNum]) {
        [self showAlertWithText:@"手机号输入格式有误"];
    }
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
