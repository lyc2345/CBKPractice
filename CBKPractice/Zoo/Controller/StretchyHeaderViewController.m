//
//  MainVC.m
//  CBKPractice
//
//  Created by Stan Liu on 2018/10/25.
//  Copyright © 2018 Stan Liu. All rights reserved.
//

#import "StretchyHeaderViewController.h"
#import "ListAnimalsViewController.h"
#import "UIView+Round.h"

static CGFloat maxHeaderHeight = 220;
static CGFloat minHeaderHeight = 0;

@interface StretchyHeaderViewController () <UIScrollViewBridge>

@property (weak, nonatomic) IBOutlet UILabel *coverLabel;
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *stretchyHeaderHeightConstraint;

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) ListAnimalsViewController *listAnimalsViewController;

@property (nonatomic, assign) CGPoint lastScrollOffset;

@end

@implementation StretchyHeaderViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self setup];
}

-(void)setup {
  self.coverLabel.text = @"Taipei Zoo";
  self.coverLabel.textColor = [UIColor blackColor];
  self.headerLabel.text = @"I am a header";
  self.headerLabel.textColor = [UIColor whiteColor];
  
  self.headerLabel.alpha = 0.0; // initial hide header label
  
  [self.coverLabel shadow: [UIColor whiteColor]
                   offset: CGSizeMake(1.0, 1.0)
                   radius: 0.0
                  opacity: 1.0];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  
  if ([segue.identifier isEqualToString: NSStringFromClass([ListAnimalsViewController class])]) {
    self.listAnimalsViewController = (ListAnimalsViewController *)[segue destinationViewController];
    self.listAnimalsViewController.scrollViewBridge = self;
  }
}

-(void)animateStretchyHeaderHeight:(CGFloat)height {
  self.stretchyHeaderHeightConstraint.constant = height;
  [self animateLabelWithHeaderHeight: height];
  [UIView animateWithDuration: 0.4
                        delay: 0.0
       usingSpringWithDamping: 1.0
        initialSpringVelocity: 0.6
                      options: UIViewAnimationOptionCurveEaseIn
                   animations:^{
                     [self.view layoutIfNeeded];
                   } completion: nil];
}

-(void)animateLabelWithHeaderHeight:(CGFloat)height {
  
  CGFloat ratio = height / maxHeaderHeight;
  self.coverLabel.alpha = ratio > 0.2 ? ratio : 0.0;
  self.headerLabel.alpha = 1 - ratio < 0.2 ? 0.0 : (1 - ratio);
}

-(void)automaticallyCollapseOrNot {
  if (self.stretchyHeaderHeightConstraint.constant > maxHeaderHeight / 2) {
    [self animateStretchyHeaderHeight: maxHeaderHeight];
  } else {
    [self animateStretchyHeaderHeight: minHeaderHeight];
  }
}

// MARK: UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

  if (scrollView.contentSize.height > maxHeaderHeight) {
    
    CGFloat absoluteTop = 0;
    CGFloat absoluteBottom = scrollView.contentSize.height - scrollView.frame.size.height;
    CGFloat scrollDiff = scrollView.contentOffset.y - self.lastScrollOffset.y;
    BOOL isScrollingUp = scrollDiff > 0 && scrollView.contentOffset.y > absoluteTop;
    BOOL isScrollingDown = scrollDiff < 0 && scrollView.contentOffset.y < absoluteBottom;
    
    CGFloat newHeight = self.stretchyHeaderHeightConstraint.constant;
    if (isScrollingUp) {
      newHeight = MAX(minHeaderHeight, self.stretchyHeaderHeightConstraint.constant - fabs(scrollDiff));
      
    } else if (isScrollingDown
               && scrollView.contentOffset.y < maxHeaderHeight
               && self.stretchyHeaderHeightConstraint.constant < maxHeaderHeight + 1) {
      newHeight = MIN(maxHeaderHeight + 1, self.stretchyHeaderHeightConstraint.constant + fabs(scrollDiff));
    }
    
    if (newHeight != self.stretchyHeaderHeightConstraint.constant) {
      self.stretchyHeaderHeightConstraint.constant = newHeight;
      [self animateLabelWithHeaderHeight: newHeight];
    }
    
    self.lastScrollOffset = scrollView.contentOffset;
  }
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
  if (decelerate) return;
  [self automaticallyCollapseOrNot];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
  [self automaticallyCollapseOrNot];
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
  [self animateStretchyHeaderHeight: maxHeaderHeight];
}

@end
