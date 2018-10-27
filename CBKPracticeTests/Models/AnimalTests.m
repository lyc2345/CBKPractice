//
//  AnimalTests.m
//  CBKPracticeTests
//
//  Created by Stan Liu on 2018/10/27.
//  Copyright © 2018 Stan Liu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Kiwi/Kiwi.h>
#import "Animal.h"

SPEC_BEGIN(AnimalTests)

describe(@"Animal init with json", ^{
  
  __block NSDictionary *fakeJson;

  beforeAll(^{
    
    // Given
    fakeJson = @{
                 @"A_Name_Ch": @"pikachu",
                 @"A_Location": @"jp",
                 @"A_Behavior": @"electronic attack",
                 @"A_Interpretation": @"one of pokemon monster",
                 @"A_Pic01_URL": @"https://www.pokemon.com/#pickchu"
                 };
    
  });
  
  it(@"Object's properties should match fake json", ^{
    
    // When
    Animal *animal = [Animal modelWithJSON: fakeJson];
    
    // Then
    [[theValue(animal.name) should] equal: theValue(fakeJson[@"A_Name_Ch"])];
    [[theValue(animal.location) should] equal: theValue(fakeJson[@"A_Location"])];
    [[theValue(animal.behavior) should] equal: theValue(fakeJson[@"A_Behavior"])];
    [[theValue(animal.interpretation) should] equal: theValue(fakeJson[@"A_Interpretation"])];
    [[theValue(animal.pictureURLString) should] equal: theValue(fakeJson[@"A_Pic01_URL"])];
  });
});

SPEC_END
