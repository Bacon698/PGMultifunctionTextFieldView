//
//  ViewController.m
//  PGMultifunctionTextFieldView
//
//  Created by 张培根 on 2017/7/9.
//
//

#import "ViewController.h"

static NSString *mainCellID = @"mainCellID";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (strong, nonatomic) NSMutableArray *dataArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"PGMultifunctionTextFieldView";
    
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self.mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:mainCellID];
    self.mainTableView.tableFooterView = [UITableView new];
    
    NSArray *array = @[@{@"id":@"PGThreeStyleViewController",@"text":@"三种显示样式"},
                       @{@"id":@"PGTwoModeOfLayoutViewController",@"text":@"两种布局方式"},
                       @{@"id":@"PGMultipleInputTypeViewController",@"text":@"多种输入类型"}];
    self.dataArray = [NSMutableArray arrayWithArray:array];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    id VC = [[NSClassFromString(self.dataArray[indexPath.row][@"id"]) alloc] init];
    @try {
        ((UIViewController *)VC).title = self.dataArray[indexPath.row][@"text"];
        [self.navigationController pushViewController:VC animated:YES];
    } @catch (NSException *exception) {
        
    } @finally {
        NSLog(@"%s-类名出错",__func__);
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mainCellID];
    cell.textLabel.text = self.dataArray[indexPath.row][@"text"];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
