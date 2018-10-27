//
//  StretchyHeaderViewControllerSpy.m
//  CBKPracticeTests
//
//  Created by Stan Liu on 2018/10/27.
//  Copyright © 2018 Stan Liu. All rights reserved.
//

#import "StretchyHeaderViewControllerSpy.h"

@interface StretchyHeaderViewControllerSpy ()

@end

@implementation StretchyHeaderViewControllerSpy

-(void)viewDidLoad {
  [super viewDidLoad];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
  self.scrollViewDidScrollCount += 1;
  NSLog(@"scrollViewDidScroll did Called!!!!!");
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
  self.scrollViewDidEndDeceleratingCount += 1;
  NSLog(@"scrollViewDidEndDecelerating did Called!!!!!");
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
  self.scrollViewDidEndDraggingCount += 1;
  NSLog(@"scrollViewDidEndDragging did Called!!!!!");
}

-(void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
  self.scrollViewDidScrollToTopCount += 1;
  NSLog(@"scrollViewDidScrollToTop did Called!!!!!");
}

@end
