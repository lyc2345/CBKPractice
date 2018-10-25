//
//  UITableView+RefreshKit.h
//  CBKPractice
//
//  Created by Stan Liu on 2018/10/26.
//  Copyright © 2018 Stan Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (RefreshKit)

-(void)addSpinner:(UIActivityIndicatorView *)indicator;

-(void)startSpinning;

-(void)endSpinning;
  
@end
