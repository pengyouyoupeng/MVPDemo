//
//  HomeView.m
//  MVPDemo
//
//  Created by 李大宽 on 2018/4/26.
//  Copyright © 2018年 李大宽. All rights reserved.
//

#import "HomeView.h"

@interface HomeView()<UITableViewDelegate>

/** table view */
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, weak) id<UITableViewDataSource> temp_delegate;

@end

@implementation HomeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tableView];
    }
    return self;
}

//让presenter 做tableview数据代理对象
- (void)shouldUpdateMyDataWithProtocolObjc:(id)objc{
    _temp_delegate = objc;
    self.tableView.dataSource = _temp_delegate;
    self.tableView.delegate = self;
    [self.tableView reloadData];
}

- (void)layoutSubviews {
    self.tableView.frame = self.bounds;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"home_cell"];
    }
    return _tableView;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    // cell上添加动画
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.duration = 0.3;
    animation.keyPath = @"transform";
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1)];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    animation.autoreverses = NO;
    [cell.layer addAnimation:animation forKey:@"homeCell"];
    
}

@end
