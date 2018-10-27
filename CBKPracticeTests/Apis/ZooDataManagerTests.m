//
//  ZooDataManagerTests.m
//  CBKPracticeTests
//
//  Created by Stan Liu on 2018/10/27.
//  Copyright © 2018 Stan Liu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Kiwi/Kiwi.h>
#import "ZooDataManager.h"

SPEC_BEGIN(ZooDataManagerTests)

describe(@"ZooDataManager fetch", ^{
  
  __block ZooDataManager *manager;

  beforeAll(^{
    
    // Given
    manager = [ZooDataManager shared];
  });

  it(@"Fetch Data count is not empty", ^{
    
    __block NSArray *animalList;
    
    // When
    [manager fetch:^(NSError * _Nonnull error, NSArray * _Nonnull animals) {
      [[expectFutureValue(error) shouldEventually] beNil];
      animalList = animals;
      [[animals.firstObject should] beKindOfClass: [Animal class]];
    }];
    
    // Then
    [[expectFutureValue(animalList) shouldEventually] beNonNil];
  });
});

SPEC_END
