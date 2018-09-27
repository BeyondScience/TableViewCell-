//
//  ThirdCell.m
//  自适应
//
//  Created by Li Peixin on 2018/9/26.
//  Copyright © 2018年 Li Peixin. All rights reserved.
//

#import "ThirdCell.h"

@interface ThirdCell()

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblContent;
@property (weak, nonatomic) IBOutlet UIImageView *imgIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblTime;

/**
     imgIcon的高度约束，便于当图片没有的时候设置这个约束为0
 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgHeight;

@end

@implementation ThirdCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

-(void)setModel:(SecondModel *)model{
    self.lblTitle.text = model.title;
    self.lblContent.text = model.content;
    self.lblTime.text = model.time;
    self.lblName.text = model.username;
    
    if ([self isBlankString:model.imageName]) {
        self.imgIcon.hidden = YES;
        self.imgHeight.constant = 0;
    }else{
        self.imgIcon.hidden = NO;
        self.imgHeight.constant = 60;
        self.imgIcon.image = [UIImage imageNamed:model.imageName];
    }
}

- (BOOL)isBlankString:(NSString *)aStr {
    //声明了一个字符串变量, 未设置初始值
    if (!aStr) {
        return YES;
    }
    //这种情形多见于从后台请求回来数据进行JSON解析的时候, 如果解析出的NSDictionary中某个key对应的value为空, 则系统会把它处理为NSNull类的单例对象(因为NSArray和NSDictionary中都不能存储nil). 此时, 如果不加判断就贸然使用这个”字符串”, 那么APP就很有可能会崩溃.
    if ([aStr isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if (!aStr.length) {
        return YES;
    }
    //字符串中除了空格和换行以外没有任何字符
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedStr = [aStr stringByTrimmingCharactersInSet:set];
    if (!trimmedStr.length) {
        return YES;
    }
    return NO;
}
@end
