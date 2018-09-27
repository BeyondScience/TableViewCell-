//
//  DemoCell.m
//  自适应
//
//  Created by Li Peixin on 2018/9/25.
//  Copyright © 2018年 Li Peixin. All rights reserved.
//

#import "DemoCell.h"
#import "Masonry.h"

@implementation DemoCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

//初始化的时候，不要设置frame，在layoutSubviews方法里面
-(void)setupUI{
    self.lblTitle = [[UILabel alloc] init];
    self.lblTitle.textColor = [UIColor grayColor];
    self.lblTitle.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:self.lblTitle];
    
    self.lblText = [[UILabel alloc] init];
    self.lblText.textColor = [UIColor lightGrayColor];
    self.lblText.font = [UIFont systemFontOfSize:14];
    self.lblText.numberOfLines = 0;
    [self.contentView addSubview:self.lblText];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat margin = 10;
    //修改约束要在 layoutSubviews方法里面设置
    [self.lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).mas_offset(margin);
        make.leading.mas_equalTo(margin);
    }];
    [self.lblText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView).mas_offset(margin);
        make.trailing.equalTo(self.contentView).mas_offset(-margin);
        make.top.equalTo(self.lblTitle.mas_bottom).mas_offset(margin);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-margin);
    }];
}

@end
