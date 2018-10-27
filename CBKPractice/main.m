//
//  main.m
//  CBKPractice
//
//  Created by Stan Liu on 2018/10/22.
//  Copyright © 2018 Stan Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <FBAllocationTracker/FBAllocationTracker.h>

int main(int argc, char * argv[]) {
  [[FBAllocationTrackerManager sharedManager] startTrackingAllocations];
  [[FBAllocationTrackerManager sharedManager] enableGenerations];
  
  @autoreleasepool {
      return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
  }
}
