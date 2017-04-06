//
//  ThirdViewController.m
//  navDemo
//
//  Created by 易博 on 2017/4/5.
//  Copyright © 2017年 易博. All rights reserved.
//

#import "ThirdViewController.h"
#import "UIViewController+SMA.h"

#define sWidth [UIScreen mainScreen].bounds.size.width
#define sHeight [UIScreen mainScreen].bounds.size.height

@interface ThirdViewController ()<UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate>

@property(nonatomic,strong) UITableView *tableView;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:self.tableView];
    
//    self.navigationController.navigationBar.subviews.firstObject.alpha = 0;
//    self.navigationController.delegate = self;
    
}

#pragma mark - UINavigationController Delegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    id<UIViewControllerTransitionCoordinator> coor = self.transitionCoordinator;
    if (coor != nil) {
        [coor notifyWhenInteractionChangesUsingBlock:^(id<UIViewControllerTransitionCoordinatorContext> context){
            NSLog(@"+++++++++++++++++:%f",context.percentComplete);
            self.navigationController.navigationBar.subviews.firstObject.alpha = context.percentComplete;
        }];
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: YES];
    self.navBarBgAlpha = @"0.0";
}

#pragma mark UITableViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat minAlphaOffset = -64;
    CGFloat maxAlphaOffset = 200;
    CGFloat offset = scrollView.contentOffset.y;
    CGFloat alpha = (offset - minAlphaOffset) / (maxAlphaOffset - minAlphaOffset);
    self.navBarBgAlpha = [NSString stringWithFormat:@"%f",alpha];
//    self.navigationController.navigationBar.subviews.firstObject.alpha = alpha;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseIdentifier"];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CGFloat viewHeght = 150 * (sWidth / 320);
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, sWidth, viewHeght)];
    topView.backgroundColor = [UIColor colorWithRed:6/255.0 green:193/255.0 blue:174/255.0 alpha:1.0];
    
    return topView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 150 * (sWidth / 320);
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -64, sWidth, sHeight + 64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
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
