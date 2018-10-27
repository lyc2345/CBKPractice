//
//  UIScrollViewBridgeTests.m
//  CBKPracticeTests
//
//  Created by Stan Liu on 2018/10/27.
//  Copyright © 2018 Stan Liu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Kiwi/Kiwi.h>
#import "ListAnimalsViewControllerSpy.h"
#import "StretchyHeaderViewControllerSpy.h"
#import "UITableViewSpy.h"

SPEC_BEGIN(UIScorllViewBridgeTests)

__block ListAnimalsViewControllerSpy *listAnimalsVCSpy;
__block StretchyHeaderViewControllerSpy *stretchyHeaderVCSpy;
__block UITableViewSpy *tableViewSpy;

describe(@"Recieve UIScrollView delegate", ^{

  beforeAll(^{
    
    // Given
    stretchyHeaderVCSpy = [StretchyHeaderViewControllerSpy new];
    
    listAnimalsVCSpy = [ListAnimalsViewControllerSpy new];
    tableViewSpy = [UITableViewSpy new];
    listAnimalsVCSpy.tableView = tableViewSpy;
    
    listAnimalsVCSpy.scrollViewBridge = stretchyHeaderVCSpy;
  });
  
  it(@"every count should be one", ^{
    
    // When
    [stretchyHeaderVCSpy view];
    [listAnimalsVCSpy view];

    UIScrollView *scv = (UIScrollView *)listAnimalsVCSpy.tableView;
    [listAnimalsVCSpy scrollViewDidScroll: scv];
    [listAnimalsVCSpy scrollViewDidEndDragging: scv willDecelerate: YES];
    [listAnimalsVCSpy scrollViewDidEndDecelerating: scv];
    [listAnimalsVCSpy scrollViewDidScrollToTop: scv];

    // Then
    [[theValue(stretchyHeaderVCSpy.scrollViewDidScrollCount) should] equal: theValue(1)];
    [[theValue(stretchyHeaderVCSpy.scrollViewDidEndDraggingCount) shouldEventually] equal: theValue(1)];
    [[theValue(stretchyHeaderVCSpy.scrollViewDidEndDraggingCount) shouldEventually] equal: theValue(1)];
    [[theValue(stretchyHeaderVCSpy.scrollViewDidScrollToTopCount) shouldEventually] equal: theValue(1)];
  });
});

SPEC_END
