//
//  ViewController.m
//  EnlargeDemo
//
//  Created by apple on 17/3/13.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "ViewController.h"
#import "FKEnlargeImgTool.h"

#define imageWidth  230  //原图宽
#define imageHeight 110  //原图高
#define imageTag    10
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 400, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:view];
    
    UITableView *tableview = [[UITableView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:tableview];
    tableview.delegate = self;
    tableview.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, imageWidth, imageHeight)];
    imageView.image = [UIImage imageNamed:@"timg.jpg"];
    imageView.tag = imageTag;
    [cell addSubview:imageView];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return imageHeight+10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell =[tableView cellForRowAtIndexPath:indexPath];
    UIImageView *imageView = [cell viewWithTag:imageTag];
    [FKEnlargeImgTool fk_enlargeImg:imageView enlargeTime:0.5]; //使用
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
