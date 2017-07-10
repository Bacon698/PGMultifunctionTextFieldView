//
//  PGMainMultifunctionTextFieldViewController.m
//  PGMultifunctionTextFieldView
//
//  Created by 张培根 on 2017/7/10.
//
//

#import "PGMainMultifunctionTextFieldViewController.h"

@interface PGMainMultifunctionTextFieldViewController ()

@end

@implementation PGMainMultifunctionTextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)showAlertWithText:(NSString *)alertTitle{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:alertTitle message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:action];
    [self presentViewController:alertController animated:YES completion:^{
        
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
