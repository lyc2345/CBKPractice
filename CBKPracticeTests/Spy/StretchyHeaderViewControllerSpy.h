//
//  StretchyHeaderViewControllerSpy.h
//  CBKPracticeTests
//
//  Created by Stan Liu on 2018/10/27.
//  Copyright © 2018 Stan Liu. All rights reserved.
//

#import "StretchyHeaderViewController.h"
#import "UIScrollViewBridge.h"

NS_ASSUME_NONNULL_BEGIN

@interface StretchyHeaderViewControllerSpy : StretchyHeaderViewController <UIScrollViewBridge>

@property (assign, nonatomic) NSInteger scrollViewDidScrollCount;
@property (assign, nonatomic) NSInteger scrollViewDidEndDeceleratingCount;
@property (assign, nonatomic) NSInteger scrollViewDidEndDraggingCount;
@property (assign, nonatomic) NSInteger scrollViewDidScrollToTopCount;

@end

NS_ASSUME_NONNULL_END
