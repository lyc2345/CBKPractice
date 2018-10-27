//
//  UITableViewSpy.h
//  CBKPracticeTests
//
//  Created by Stan Liu on 2018/10/27.
//  Copyright © 2018 Stan Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewSpy: UITableView

@property (assign, nonatomic) NSInteger reloadCount;

@end

NS_ASSUME_NONNULL_END
