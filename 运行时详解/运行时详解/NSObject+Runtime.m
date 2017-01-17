
//
//  NSObject+Runtime.m
//  运行时详解
//
//  Created by 杨香港 on 2017/1/17.
//  Copyright © 2017年 杨香港. All rights reserved.
//

#import "NSObject+Runtime.h"
#import <objc/runtime.h>
const char * kPropertyListKey = "kPropertyListKey";

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
   NSArray * ptyList = objc_getAssociatedObject(self, kPropertyListKey);
    if (ptyList != nil) {
        return ptyList;
    }
    
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
    objc_setAssociatedObject(self, kPropertyListKey, array.copy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return array.copy;
}

@end
