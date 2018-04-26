//
//  HomeView.h
//  MVPDemo
//
//  Created by 李大宽 on 2018/4/26.
//  Copyright © 2018年 李大宽. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeView : UIView

/** 更新数据 */
- (void)shouldUpdateMyDataWithProtocolObjc:(id)objc;

/** 如果除了tableview, 里面还有更多控件需要更新数据, 可以再写几个接口, 例如: -(void)updateDataWith******** */


@end
