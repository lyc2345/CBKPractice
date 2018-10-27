//
//  ListAnimalsViewControllerSpy.m
//  CBKPracticeTests
//
//  Created by Stan Liu on 2018/10/27.
//  Copyright © 2018 Stan Liu. All rights reserved.
//

#import "ListAnimalsViewControllerSpy.h"

@interface ListAnimalsViewControllerSpy ()

@end

@implementation ListAnimalsViewControllerSpy

-(void)viewDidLoad {
  [super viewDidLoad];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
  if ([self.scrollViewBridge respondsToSelector: @selector(scrollViewDidScroll:)]) {
    [self.scrollViewBridge scrollViewDidScroll: scrollView];
  }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
  if ([self.scrollViewBridge respondsToSelector: @selector(scrollViewDidEndDecelerating:)]) {
    [self.scrollViewBridge scrollViewDidEndDecelerating: scrollView];
  }
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
  if ([self.scrollViewBridge respondsToSelector: @selector(scrollViewDidEndDragging:willDecelerate:)]) {
    [self.scrollViewBridge scrollViewDidEndDragging: scrollView willDecelerate: decelerate];
  }
}

-(void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
  if ([self.scrollViewBridge respondsToSelector: @selector(scrollViewDidScrollToTop:)]) {
    [self.scrollViewBridge scrollViewDidScrollToTop: scrollView];
  }
}

@end
