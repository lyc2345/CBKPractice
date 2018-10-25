//
//  Animal.h
//  CBKPractice
//
//  Created by Stan Liu on 2018/10/23.
//  Copyright © 2018 Stan Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYKit/NSObject+YYModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface Animal : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *behavior;
@property (nonatomic, strong) NSString *interpretation;
@property (nonatomic, strong) NSString *pictureURLString;

@end

NS_ASSUME_NONNULL_END
