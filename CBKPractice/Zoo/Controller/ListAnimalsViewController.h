//
//  ViewController.h
//  CBKPractice
//
//  Created by Stan Liu on 2018/10/22.
//  Copyright © 2018 Stan Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIScrollViewBridge.h"

@interface ListAnimalsViewController : UIViewController

@property (weak, nonatomic) id<UIScrollViewBridge> scrollViewBridge;

@end

