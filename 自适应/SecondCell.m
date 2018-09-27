//
//  SecondCell.m
//  自适应
//
//  Created by Li Peixin on 2018/9/25.
//  Copyright © 2018年 Li Peixin. All rights reserved.
//

#import "SecondCell.h"

#define KscreenH [UIScreen mainScreen].bounds.size.height
#define KscreenW [UIScreen mainScreen].bounds.size.width

@interface SecondCell()
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblContent;
@property (weak, nonatomic) IBOutlet UITextField *txfText;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblTime;


@end

@implementation SecondCell

-(void)setModel:(SecondModel *)model{
    _model = model;
    self.lblTitle.text = model.title;
    self.lblContent.text = model.content;
    self.lblTime.text = model.time;
    self.lblName.text = model.username;
}

@end
