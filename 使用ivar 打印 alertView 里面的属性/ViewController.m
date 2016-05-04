//
//  ViewController.m
//  使用ivar 打印 alertView 里面的属性
//
//  Created by 陈博文 on 16/5/4.
//  Copyright © 2016年 陈博文. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"标题" message:@"内容" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *yes = [UIAlertAction actionWithTitle:@"yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"----yes--");
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"----cancel--");
    }];
    
    [vc addAction:yes];
    [vc addAction:cancel];
    
    [self presentViewController:vc animated:yes completion:nil];

    
    unsigned int count;
    Ivar *ivars =  class_copyIvarList([UIAlertAction class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char * cName =  ivar_getName(ivar);
        NSString *ocName = [NSString stringWithUTF8String:cName];
        NSLog(@"%@",ocName);
    }
    free(ivars);
}

@end
