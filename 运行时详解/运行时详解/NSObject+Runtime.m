
//
//  NSObject+Runtime.m
//  运行时详解
//
//  Created by 杨香港 on 2017/1/17.
//  Copyright © 2017年 杨香港. All rights reserved.
//

#import "NSObject+Runtime.h"
#import <objc/runtime.h>

@implementation NSObject (Runtime)

+ (instancetype)cz_objectWithDictionary:(NSDictionary *)dic
{
    id object = [[self alloc] init];
    NSArray * arr =  [self cz_objcPropertites];
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        if ([arr containsObject:key]) {
            [object setValue:obj forKey:key];
        }
    }];
    return object;
    
    
}


+ (NSArray *)cz_objcPropertites
{
    NSMutableArray *array = [NSMutableArray array];
   // return @[@"hello"];
    unsigned int count = 0;
    objc_property_t *proList =  class_copyPropertyList([self class], &count);
    for (unsigned int i = 0; i<count; i++) {
       objc_property_t pty =  proList[i];
        const char* cName = property_getName(pty);
        NSString * name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];    
        [array addObject:name];
    }
    free(proList);
    return array.copy;
}

@end
