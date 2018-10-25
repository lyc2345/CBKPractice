//
//  ZooDataManager.h
//  CBKPractice
//
//  Created by Stan Liu on 2018/10/23.
//  Copyright © 2018 Stan Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Animal.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZooDataManager : NSObject

@property (readonly, strong) NSArray *animals;

// Singleton
+(ZooDataManager *)shared;

-(void)fetch:(void(^)(NSError *error, NSArray *animals))completion;

@end

NS_ASSUME_NONNULL_END
