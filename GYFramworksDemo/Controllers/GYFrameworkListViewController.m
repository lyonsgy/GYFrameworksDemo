//
//  GYFrameworkListViewController.m
//  GYFramworksDemo
//
//  Created by lyons on 2019/5/7.
//  Copyright © 2019 lyons. All rights reserved.
//

#import "GYFrameworkListViewController.h"

#define CellReuseIdentifier @"CellReuseIdentifier"

@interface GYFrameworkListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation GYFrameworkListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    [self setTableView];
}
- (void)setTableView{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor=[UIColor whiteColor];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellReuseIdentifier];
}
#pragma mark - UITableViewDelegate,UITableViewDataSource
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellReuseIdentifier];
    cell.textLabel.text = self.array[indexPath.row][@"title"];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(NSMutableArray *)array{
    if (!_array) {
        _array = [NSMutableArray arrayWithArray:@[@{@"title":@"圆形加载",@"type":@""}]];
    }
    return _array;
}
@end
