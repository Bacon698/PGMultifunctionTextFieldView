//
//  PGTwoModeOfLayoutViewController.m
//  PGMultifunctionTextFieldView
//
//  Created by 张培根 on 2017/7/10.
//
//

#import "PGTwoModeOfLayoutViewController.h"

@interface PGTwoModeOfLayoutViewController ()

@property (weak, nonatomic) IBOutlet UIView *IBIconView;
@property (weak, nonatomic) IBOutlet UIView *IBTitleView;
@property (weak, nonatomic) IBOutlet UIView *IBNothingView;

@property (strong, nonatomic) PGMultifunctionTextFieldView *IBIconTextFieldView;
@property (strong, nonatomic) PGMultifunctionTextFieldView *IBTitleTextFieldView;
@property (strong, nonatomic) PGMultifunctionTextFieldView *IBNothingTextFieldView;

@property (strong, nonatomic) PGMultifunctionTextFieldView *codeIconTextFieldView;
@property (strong, nonatomic) PGMultifunctionTextFieldView *codeTitleTextFieldView;
@property (strong, nonatomic) PGMultifunctionTextFieldView *codeNothingTextFieldView;

@end

@implementation PGTwoModeOfLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpIconView];
    [self setUpTitleView];
    [self setUpNothingView];
    // Do any additional setup after loading the view from its nib.
}

/**
 生成前边是图标的textFieldView
 */
-(void)setUpIconView{
    //每种样式都提供两种方法进行布局
    
    //可以使用xib进行布局，先定位好一个View，然后将TextFiledView添加到次view上
    self.IBIconTextFieldView = [PGMultifunctionTextFieldView iconView];
    [self.IBIconTextFieldView addSelfToView:self.IBIconView withImageNamed:@"user_icon" placeholder:@"我是用Xib布局的"];
    [self.IBIconTextFieldView setTextFieldViewTextType:cellphoneNum];
    [self.IBIconTextFieldView hiddenLine];
    
    //也可以使用代码进行布局，frame和AutoLayout，皆可
    self.codeIconTextFieldView = [PGMultifunctionTextFieldView iconView];
    [self.codeIconTextFieldView setImageNamed:@"user_icon" placeholder:@"我是用代码布局的"];
    self.codeIconTextFieldView.textFieldViewTextType = cellphoneNum;
    [self.codeIconTextFieldView hiddenLine];
    
    [self.view addSubview:self.codeIconTextFieldView];
    [self.codeIconTextFieldView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.IBIconView.mas_bottom).offset(5);
        make.height.mas_equalTo(45);
        make.right.left.mas_equalTo(self.view);
    }];
}

/**
 生成前边是标题文字的textFieldView
 */
-(void)setUpTitleView{
    self.IBTitleTextFieldView = [PGMultifunctionTextFieldView titleView];
    [self.IBTitleTextFieldView addSelfToView:self.IBTitleView withTitle:@"手机号"  placeholder:@"我是用Xib布局的"];
    [self.IBTitleTextFieldView setTextFieldViewTextType:cellphoneNum];
    [self.IBTitleTextFieldView hiddenLine];
    
    self.codeTitleTextFieldView = [PGMultifunctionTextFieldView titleView];
    [self.codeTitleTextFieldView setTitle:@"手机号"  placeholder:@"我是用代码布局的"];
    self.codeTitleTextFieldView.textFieldViewTextType = cellphoneNum;
    [self.codeTitleTextFieldView hiddenLine];
    
    [self.view addSubview:self.codeTitleTextFieldView];
    [self.codeTitleTextFieldView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.IBTitleView.mas_bottom).offset(5);
        make.height.mas_equalTo(45);
        make.right.left.mas_equalTo(self.view);
    }];
}

/**
 生成前边什么也没有的textFieldView
 */
-(void)setUpNothingView{
    self.IBNothingTextFieldView = [PGMultifunctionTextFieldView nothingView];
    [self.IBNothingTextFieldView addSelfToView:self.IBNothingView withPlaceholder:@"我是用Xib布局的"];
    [self.IBNothingTextFieldView setTextFieldViewTextType:cellphoneNum];
    [self.IBNothingTextFieldView hiddenLine];
    
    self.codeNothingTextFieldView = [PGMultifunctionTextFieldView nothingView];
    [self.codeNothingTextFieldView setPlaceholder:@"我是用代码布局的"];
    self.codeNothingTextFieldView.textFieldViewTextType = cellphoneNum;
    [self.codeNothingTextFieldView hiddenLine];
    
    [self.view addSubview:self.codeNothingTextFieldView];
    [self.codeNothingTextFieldView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.IBNothingView.mas_bottom).offset(5);
        make.height.mas_equalTo(45);
        make.right.left.mas_equalTo(self.view);
    }];
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
