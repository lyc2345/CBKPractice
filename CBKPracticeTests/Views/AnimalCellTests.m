//
//  AnimalCellTests.m
//  CBKPracticeTests
//
//  Created by Stan Liu on 2018/10/27.
//  Copyright © 2018 Stan Liu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Kiwi/Kiwi.h>
#import "AnimalCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

SPEC_BEGIN(AnimalCellTests)

describe(@"bind animal data", ^{
  
  __block AnimalCell *cell;
  __block Animal * animal;
  
  beforeAll(^{
    
    // Given
    cell = (AnimalCell *)[[NSBundle mainBundle] loadNibNamed: NSStringFromClass([AnimalCell class])
                                         owner: self
                                       options: nil].firstObject;
    animal = [Animal modelWithJSON: @{
                                      @"A_Name_Ch": @"pikachu",
                                      @"A_Location": @"jp",
                                      @"A_Behavior": @"electronic attack",
                                      @"A_Interpretation": @"one of pokemon monster",
                                      @"A_Pic01_URL": @"https://www.pokemon.com/#pickchu"
                                      }];
  });
  
  it(@"Fetch Data count is not empty", ^{
    
    // When
    [cell bindAnimal: animal];
    
    // Then
    XCTAssertTrue([cell.nameLabel.text isEqualToString: animal.name]);
    XCTAssertTrue([cell.locationLabel.text isEqualToString: animal.location]);
    NSString *description = [NSString stringWithFormat: @"%@\n%@", animal.behavior, animal.interpretation];
    XCTAssertTrue([cell.descriptionLabel.text isEqualToString: description]);
  });
});

SPEC_END
