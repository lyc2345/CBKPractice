//
//  Animal.m
//  CBKPractice
//
//  Created by Stan Liu on 2018/10/23.
//  Copyright © 2018 Stan Liu. All rights reserved.
//

#import "Animal.h"

@implementation Animal

+(NSDictionary *)modelCustomPropertyMapper {
  return @{
           @"name"             : @"A_Name_Ch",
           @"location"         : @"A_Location",
           @"behavior"         : @"A_Behavior",
           @"interpretation"   : @"A_Interpretation",
           @"pictureURLString" : @"A_Pic01_URL"
           };
}


@end
