//
//  ViewController.m
//  NSthread
//
//  Created by apple on 2017/11/16.
//  Copyright © 2017年 yucheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"viewDidLoad 下载---%@",[NSThread currentThread]);
}
- (void)download
{
    
    NSLog(@"download 下载---%@",[NSThread currentThread]);
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self creadTheard3];
}

//创建方法2  隐式创建新线程,并启动
- (void)creadTheard3
{
    // 等于[self download]; 在当前线程中运行
//    [self performSelector:@selector(download) withObject:nil];
    
    //创建一个新的线程
    [self performSelectorInBackground:@selector(download) withObject:nil];
}

//创建方法2  创建新线程,并启动
- (void)creadTheard2
{
    [NSThread detachNewThreadSelector:@selector(download) toTarget:self withObject:nil];
    
}
//创建方法1
- (void)creadTheard1
{
    //创建线程
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(download) object:nil];
    thread.name = @"下载线程";
    //线程运行
    [thread start];
    
}

@end
