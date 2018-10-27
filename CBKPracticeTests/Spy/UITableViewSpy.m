//
//  UITableViewSpy.m
//  CBKPracticeTests
//
//  Created by Stan Liu on 2018/10/27.
//  Copyright © 2018 Stan Liu. All rights reserved.
//

#import "UITableViewSpy.h"

@implementation UITableViewSpy

-(void)reloadData {
  [super reloadData];
  self.reloadCount += 1;
}

@end
