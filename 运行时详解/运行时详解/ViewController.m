//
//  ViewController.m
//  运行时详解
//
//  Created by 杨香港 on 2017/1/17.
//  Copyright © 2017年 杨香港. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NSObject+Runtime.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray * per = [Person cz_objcPropertites];
    NSLog(@"per:%@",per);
    
    Person *person = [Person cz_objectWithDictionary:@{@"name":@"hongkong792",@"age":@100}];    
    NSLog(@"dic-per:%@",person);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
