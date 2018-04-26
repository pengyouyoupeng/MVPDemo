//
//  BasePresenter.h
//  MVPDemo
//
//  Created by 李大宽 on 2018/4/26.
//  Copyright © 2018年 李大宽. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BasePresenter : NSObject

/** 初始化的时候绑定一个视图 */
- (instancetype)initWithView:(id)view;
/** 绑定视图 */
- (void)attachView:(id)view;
/** 解绑视图 */
- (void)detatchView:(id)view;

@end
