//
//  ListAnimalsViewController.m
//  CBKPracticeTests
//
//  Created by Stan Liu on 2018/10/27.
//  Copyright © 2018 Stan Liu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Kiwi/Kiwi.h>
#import "ListAnimalsViewController.h"
#import "UITableViewSpy.h"
#import "ZooDataManager.h"

@interface ListAnimalsViewController (Testing)
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) ZooDataManager *zooManager;
-(void)fetchAnimals:(void(^)(void))completion;
@end


SPEC_BEGIN(ListAnimalsViewControllerTests)

describe(@"ViewDidLoad", ^{
  
  __block ListAnimalsViewController *listAnimalsVC;
  __block UITableViewSpy *tableViewSpy;

  beforeAll(^{
    
    // Given
    listAnimalsVC = [ListAnimalsViewController new];

    tableViewSpy = [UITableViewSpy new];
    listAnimalsVC.tableView = tableViewSpy;
    NSLog(@"%@", listAnimalsVC.tableView);
    
    [[listAnimalsVC.tableView should] equal: tableViewSpy]; // check is mocked
  });
  
  // declares a local helper variable that is re-initialized before every example.
  let(zooManager, ^id{
    return [[ZooDataManager alloc] init];
  });
  
  it(@"should fetch data and reload tableView", ^{
    
    // When
    [listAnimalsVC view]; // this will trigger viewDidLoad

    // Then
    [[expectFutureValue(theValue(listAnimalsVC.zooManager.animals.count)) shouldEventually] equal: (theValue(30))];
    [[expectFutureValue(theValue(tableViewSpy.reloadCount)) shouldEventually] equal: (theValue(1))];
  });
  
  
});

SPEC_END
