//
//  AnimalCell.h
//  CBKPractice
//
//  Created by Stan Liu on 2018/10/24.
//  Copyright © 2018 Stan Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShadowImageView.h"
#import "Animal.h"

NS_ASSUME_NONNULL_BEGIN

@interface AnimalCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet ShadowImageView *pictureView;

-(void)bindAnimal:(Animal *)animal;

@end

NS_ASSUME_NONNULL_END
