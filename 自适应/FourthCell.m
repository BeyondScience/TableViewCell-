//
//  FourthCell.m
//  自适应
//
//  Created by Li Peixin on 2018/9/27.
//  Copyright © 2018年 Li Peixin. All rights reserved.
//

#import "FourthCell.h"

@implementation FourthCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(SecondModel *)model{
    self.lblTitle.text = model.title;
    self.lblName.text = model.username;
    
    self.imgIcon.image = [UIImage imageNamed:model.imageName];    
}


@end
