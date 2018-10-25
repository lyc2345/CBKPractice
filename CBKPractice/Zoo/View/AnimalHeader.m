//
//  AnimalHeader.m
//  CBKPractice
//
//  Created by Stan Liu on 2018/10/25.
//  Copyright © 2018 Stan Liu. All rights reserved.
//

#import "AnimalHeader.h"
#import <Masonry/Masonry.h>

@implementation AnimalHeader

- (instancetype)init
{
  self = [super init];
  if (self) {
    [self setupViews];
  }
  return self;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
  AnimalHeader *selfCell = [super initWithReuseIdentifier: reuseIdentifier];
  
  [self setupViews];
  return selfCell;
}

-(void)setupViews {
  
  self.titleLabel = [UILabel new];
  [self addSubview: self.titleLabel];
  [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.centerX.equalTo(self);
    make.centerY.equalTo(self);
  }];
  
  self.imageView = [UIImageView new];
  [self addSubview: self.imageView];
  [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.edges.equalTo(self);
  }];
}

@end
