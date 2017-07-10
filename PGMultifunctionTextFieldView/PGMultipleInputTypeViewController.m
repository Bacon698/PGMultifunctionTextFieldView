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
}

-(void)setupSubViews{

    self.iconTextFieldA = [PGMultifunctionTextFieldView iconView];
    [self.iconTextFieldA addSelfToView:self.iconViewA withImageNamed:@"user_icon" placeholder:@"请使用手机号登录"];
    [self.iconTextFieldA setTextFieldViewTextType:cellphoneNum];
    [self.iconTextFieldA setKeyboardType:UIKeyboardTypeNumberPad];
    
    

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
