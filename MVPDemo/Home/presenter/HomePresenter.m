//
//  HomePresenter.m
//  MVPDemo
//
//  Created by 李大宽 on 2018/4/26.
//  Copyright © 2018年 李大宽. All rights reserved.
//

#import "HomePresenter.h"
#import "HomeView.h"
#import "HomeModel.h"

@interface HomePresenter()<UITableViewDataSource>

/** 弱引用home view */
@property(nonatomic, weak) HomeView *home_view;
/** 数据模型数组 */
@property(nonatomic, strong) NSMutableArray *datas;

@end

@implementation HomePresenter

- (instancetype)initWithView:(id)view {
    if ([super init]) {
        self.datas = [NSMutableArray array].mutableCopy;
        self.home_view = view;
    }
    return self;
}

// 请求数据
- (void)requestData {
    // 这里我用一下假数据, 你就假装我真的请求了数据就行.
    for (int i = 0; i< 50; i++) {
        // 生成50个model. 放在数组里
        HomeModel *model = [HomeModel new];
        model.title = [[NSString alloc] initWithFormat:@"这是第%d个数据的标题", i];
        [self.datas addObject:model];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 请求完毕, 更新数据
        [self.home_view shouldUpdateMyDataWithProtocolObjc:self];
    });
    
}

// Data source 的代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeModel *model = _datas[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"home_cell" forIndexPath:indexPath];
    cell.textLabel.text = model.title;
    return cell;
}

@end
