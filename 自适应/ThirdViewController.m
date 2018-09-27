//
//  ThirdViewController.m
//  自适应
//
//  Created by Li Peixin on 2018/9/26.
//  Copyright © 2018年 Li Peixin. All rights reserved.
//

#import "ThirdViewController.h"
#import "ThirdCell.h"
#import "SecondModel.h"
#import "FourthViewController.h"

NSString * const thirdCellID = @"ThirdcellID";

@interface ThirdViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tabView;
@property (nonatomic, copy) NSArray *arrData;
@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"Third--Title";
    
    [self loadTableView];
    [self loadData];
}

-(void)loadData{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"data.json" withExtension:nil];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSArray *feedArray = rootDic[@"feed"];
    NSMutableArray *arrTemp = @[].mutableCopy;
    [feedArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [arrTemp addObject:[[SecondModel alloc] initWithDict:obj]];
    }];
    self.arrData = arrTemp.copy;
    [self.tabView reloadData];
}

-(void)loadTableView{
    self.tabView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tabView registerNib:[UINib nibWithNibName:@"ThirdCell" bundle:nil] forCellReuseIdentifier:thirdCellID];
    self.tabView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    [self.view addSubview:self.tabView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ThirdCell *cell = [tableView dequeueReusableCellWithIdentifier:thirdCellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = self.arrData[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController pushViewController:[FourthViewController new] animated:YES];
}

@end
