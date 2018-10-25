//
//  UIView+Round.m
//  CBKPractice
//
//  Created by Stan Liu on 2018/10/25.
//  Copyright © 2018 Stan Liu. All rights reserved.
//

#import "UIView+Round.h"

@implementation UIView (Round)

-(void)roundCorner:(CGFloat)radius {
  self.layer.cornerRadius = radius;
  self.layer.masksToBounds = YES;
}

-(void)shadow:(UIColor *)color offset:(CGSize)offset radius:(CGFloat)radius opacity:(CGFloat)opacity {
  self.layer.masksToBounds = NO;
  self.layer.shadowColor = color.CGColor;
  self.layer.shadowOffset = offset;
  self.layer.shadowOpacity = opacity;
  self.layer.shadowRadius = radius;
}



@end
