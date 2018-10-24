//
//  ShadowImageView.m
//  CBKPractice
//
//  Created by Stan Liu on 2018/10/25.
//  Copyright © 2018 Stan Liu. All rights reserved.
//

#import "ShadowImageView.h"

@interface ShadowImageView ()

@property (strong, nonatomic) IBOutlet UIView *containerView;

@end

@implementation ShadowImageView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder: aDecoder];
  if (self) {
    [self xibInit];
    [self setup];
  }
  return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame: frame];
  if (self) {
    [self xibInit];
    [self setup];
  }
  return self;
}

- (void)prepareForInterfaceBuilder {
  [super prepareForInterfaceBuilder];
  [self xibInit];
}

-(void)xibInit {
  typeof(self) shadowImageView = [[NSBundle mainBundle] loadNibNamed: NSStringFromClass([self class])
                                owner: self
                              options: nil].firstObject;
  [self addSubview: self.containerView];
  self.containerView.frame = self.bounds;
  self.containerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

-(void)setup {
  
}

@end
