//
//  HomeViewController.m
//  MVPDemo
//
//  Created by 李大宽 on 2018/4/26.
//  Copyright © 2018年 李大宽. All rights reserved.
//

#import "HomeViewController.h"
#import "HomePresenter.h"
#import "HomeView.h"
@interface HomeViewController ()
/** presenter */
@property(nonatomic, strong) HomePresenter *presenter;
/** 主视图 */
@property(nonatomic, strong) HomeView *listView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addMyViews];
    [self handlePresenter];
}

//1 . 贴子视图
- (void)addMyViews {
    self.listView = [[HomeView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_listView];
}

//2. 绑定view ------- 如果有多个子视图存在, 一般创建多个presenter,  让 subview和presenter一一对应起来
- (void)handlePresenter {
    self.presenter = [[HomePresenter alloc] initWithView:self.listView];
    [self.presenter requestData];
}

@end
