//
//  Person.m
//  运行时详解
//
//  Created by 杨香港 on 2017/1/17.
//  Copyright © 2017年 杨香港. All rights reserved.
//

#import "Person.h"

@implementation Person

- (NSString *)description
{
   NSArray * array = @[@"name",@"age"];
   return  [self dictionaryWithValuesForKeys:array].description;
}

@end
