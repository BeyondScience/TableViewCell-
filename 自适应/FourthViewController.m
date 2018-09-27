//
//  FourthViewController.m
//  自适应
//
//  Created by Li Peixin on 2018/9/27.
//  Copyright © 2018年 Li Peixin. All rights reserved.
//

#import "FourthViewController.h"
#import "SecondModel.h"
#import "FourthCell.h"

@interface FourthViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tabView;
@property (nonatomic, copy) NSArray *arrData;
@end

static NSString *fourthCellID = @"fourthCellID";

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"fourth-Title";
    
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
    [self.tabView registerNib:[UINib nibWithNibName:@"FourthCell" bundle:nil] forCellReuseIdentifier:fourthCellID];
    self.tabView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    self.tabView.dataSource = self;
    self.tabView.delegate = self;
    [self.view addSubview:self.tabView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FourthCell *cell = [tableView dequeueReusableCellWithIdentifier:fourthCellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = self.arrData[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    FourthCell *forthCell = (FourthCell *)cell;
    SecondModel *model = self.arrData[indexPath.row];
    if ([model.imageName isEqualToString:@"D96F3354-1A58-4193-B4B4-9950DCEED70F"]||[model.imageName isEqualToString:@"A39E1C57-AD52-4E21-B8EA-AAD699190FF2"]) {
        NSLog(@"imgView.frame == %f,%f",forthCell.imgIcon.frame.size.width, forthCell.imgIcon.frame.size.height);
    }
}

@end
