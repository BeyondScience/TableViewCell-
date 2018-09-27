//
//  FourthCell.h
//  自适应
//
//  Created by Li Peixin on 2018/9/27.
//  Copyright © 2018年 Li Peixin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FourthCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

/**
     imgIcon的约束，没有设置高度和宽度约束，设置的是top，leading，bottom，traing>=16，设置training的时候需要<xib中imageview的intrinsic size属性默认是default（system defined） 改成placeholder就可以了>,此时imageview就会根据图片的大小自动设置自己大小
 */
@property (weak, nonatomic) IBOutlet UIImageView *imgIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblName;

@property (nonatomic, strong) SecondModel *model;

@end

NS_ASSUME_NONNULL_END
