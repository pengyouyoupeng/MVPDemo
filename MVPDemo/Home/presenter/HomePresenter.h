//
//  HomePresenter.h
//  MVPDemo
//
//  Created by 李大宽 on 2018/4/26.
//  Copyright © 2018年 李大宽. All rights reserved.
//

#import "BasePresenter.h"

@interface HomePresenter : BasePresenter

/** 外部接口, 供控制器调用 */
- (void)requestData;

@end
