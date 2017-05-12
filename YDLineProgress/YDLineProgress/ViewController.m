//
//  ViewController.m
//  YDLineProgress
//
//  Created by 司亚冰 on 2017/5/12.
//  Copyright © 2017年 SP. All rights reserved.
//

#import "ViewController.h"
#import "YDLineProgress.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    YDLineProgress *progress = [[YDLineProgress alloc]initWithFrame:CGRectMake(50, 200, 200, 200)];
    progress.backgroundColor = [UIColor whiteColor];
    progress.progress = 88;
    [self.view addSubview:progress];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
