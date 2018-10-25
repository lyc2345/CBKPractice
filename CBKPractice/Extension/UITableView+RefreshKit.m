//
//  UITableView+RefreshKit.m
//  CBKPractice
//
//  Created by Stan Liu on 2018/10/26.
//  Copyright © 2018 Stan Liu. All rights reserved.
//

#import "UITableView+RefreshKit.h"

@implementation UITableView (RefreshKit)

-(void)addSpinner:(UIActivityIndicatorView *)indicator {
  self.tableFooterView = indicator;
}

-(void)startSpinning {
  
  if ([self.tableFooterView isKindOfClass: [UIActivityIndicatorView class]]) {
    
    __weak UIActivityIndicatorView *indicator = (UIActivityIndicatorView *)self.tableFooterView;
    [indicator startAnimating];
    [indicator setHidden: NO];
  }
}

-(void)endSpinning {
  
  if ([self.tableFooterView isKindOfClass: [UIActivityIndicatorView class]]) {
    
    __weak UIActivityIndicatorView *indicator = (UIActivityIndicatorView *)self.tableFooterView;
    [indicator stopAnimating];
    [indicator setHidden: YES];
  }
}

@end
