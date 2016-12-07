//
//  ViewController.m
//  BaiDuMapTest
//
//  Created by mac pro on 2016/12/6.
//  Copyright © 2016年 mac pro. All rights reserved.
//

#import "ViewController.h"

#import "BaiduTrace_iOSSDK_v2.2.3/BaiduTraceSDK.framework/Headers/BaiduTraceSDK-Swift.h"

// MARK: - 设置轨迹服务所需的全局信息
//全局变量
int const serviceId = 130726;//轨迹管理台上的鹰眼服务的service_id
NSString * const ak = @"c31toEWdin0GPQCzwgFnEgEkox6CvxgC";  //API控制台申请的ak
NSString * const mCode = @"com.wanglei.wanglei.MyFengXianSheng"; //申请ak时对应的mCode(最好设置为Bundel Id)
NSString * entityName = @"wanglei";//实体名字

@interface ViewController ()<ApplicationServiceDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    //使用鹰眼SDK第一步必须先实例化BTRACE对象
    
    
    BTRACE * traceInstance =[[BTRACE alloc] initWithAk: ak mcode:mCode serviceId: serviceId entityName: entityName operationMode: 2];
    
    //开始追踪，异步执行
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[BTRACEAction shared] startTrace:self trace:traceInstance];
        NSLog(@"开始追踪");
    });
    //结束轨迹追踪
    [[BTRACEAction shared] stopTrace:self trace:traceInstance];
    
}























- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
