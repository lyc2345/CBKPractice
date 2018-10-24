//
//  AnimalCell.m
//  CBKPractice
//
//  Created by Stan Liu on 2018/10/24.
//  Copyright © 2018 Stan Liu. All rights reserved.
//

#import "AnimalCell.h"
//#import <YYKit/UIImageView+YYWebImage.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIView+Round.h"

@implementation AnimalCell

- (void)awakeFromNib {
  [super awakeFromNib];
  
  [self setup];
}

- (void)layoutSubviews {
  [super layoutSubviews];

  [self.pictureView.imageView roundCorner: 10];
  [self.pictureView.shadowView roundCorner: 10];
  [self.pictureView.shadowView shadow: [UIColor blackColor]
                               offset: CGSizeMake(0, 0)
                               radius: 10
                              opacity: 0.3];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  [super setSelected:selected animated:animated];
}

- (void)prepareForReuse {
  
  self.nameLabel.text = @"";
  self.locationLabel.text = @"";
  self.descriptionLabel.text = @"";
  self.imageView.image = nil;
  
  [super prepareForReuse];
}

-(void)setup {
  // Style
  self.selectionStyle = UITableViewCellSelectionStyleNone;
  self.imageView.contentMode = UIViewContentModeScaleAspectFit;
  
  // Font
  self.nameLabel.font = [UIFont boldSystemFontOfSize: 15];
  self.locationLabel.font = [UIFont systemFontOfSize: 14];
  self.descriptionLabel.font = [UIFont systemFontOfSize: 13];
  
  // Theme
  self.descriptionLabel.textColor = [UIColor grayColor];
}

-(void)bindAnimal:(Animal *)animal {
  
  // Text
  self.nameLabel.text = animal.name;
  self.locationLabel.text = animal.location;
  self.descriptionLabel.text = [animal.behavior length] > 0 && [animal.interpretation length] > 0
  ? [NSString stringWithFormat: @"%@\n%@", animal.behavior, animal.interpretation]
  : [animal.behavior length] > 0
  ? animal.behavior
  : animal.interpretation;
  
  // Image
  NSURL *imageURL = [NSURL URLWithString: animal.pictureURLString];
  [self.pictureView.imageView sd_setImageWithURL: imageURL
                                placeholderImage: nil
                                         options: SDWebImageRefreshCached | SDWebImageRetryFailed];
}

@end
