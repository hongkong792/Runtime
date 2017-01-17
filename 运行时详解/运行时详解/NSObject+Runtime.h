//
//  NSObject+Runtime.h
//  运行时详解
//
//  Created by 杨香港 on 2017/1/17.
//  Copyright © 2017年 杨香港. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Runtime)
+ (id)cz_objectWithDictionary:(NSDictionary *)dic;
+ (NSArray *)cz_objcPropertites;
@end
