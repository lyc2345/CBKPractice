//
//  ShadowImageView.h
//  CBKPractice
//
//  Created by Stan Liu on 2018/10/25.
//  Copyright © 2018 Stan Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShadowImageView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *shadowView;

@end

NS_ASSUME_NONNULL_END
