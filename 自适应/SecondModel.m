//
//  SecondModel.m
//  自适应
//
//  Created by Li Peixin on 2018/9/26.
//  Copyright © 2018年 Li Peixin. All rights reserved.
//

#import "SecondModel.h"

@implementation SecondModel

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        _identifier = [self uniqueIdentifier];
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (NSString *)uniqueIdentifier{
    static int count = 0;
    return [NSString stringWithFormat:@"unique-id-%d",(count ++)];
}

@end
