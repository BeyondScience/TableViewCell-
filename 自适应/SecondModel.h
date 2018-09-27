//
//  SecondModel.h
//  自适应
//
//  Created by Li Peixin on 2018/9/26.
//  Copyright © 2018年 Li Peixin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SecondModel : NSObject

/*
"title": "Hello world",
"content": "This is forkingdog team. Here's our logo?\nGithub: \"forkingdog\"",
"username": "forkingdog",
"time": "2015.04.10",
"imageName": "forkingdog"
 */

@property (nonatomic, copy, readonly) NSString *identifier;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *imageName;

-(instancetype)initWithDict:(NSDictionary *)dict;

@end
