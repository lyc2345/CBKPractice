//
//  ListAnimalsViewControllerSpy.h
//  CBKPracticeTests
//
//  Created by Stan Liu on 2018/10/27.
//  Copyright © 2018 Stan Liu. All rights reserved.
//

#import "ListAnimalsViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListAnimalsViewControllerSpy : ListAnimalsViewController <UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
