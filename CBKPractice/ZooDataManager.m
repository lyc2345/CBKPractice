//
//  ZooDataManager.m
//  CBKPractice
//
//  Created by Stan Liu on 2018/10/23.
//  Copyright © 2018 Stan Liu. All rights reserved.
//

#import "ZooDataManager.h"
#import <AFNetworking/AFNetworking.h>

static NSString *url_taipei_zoo = @"https://data.taipei/opendata/datalist/apiAccess?";

@interface ZooDataManager ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;
@property (nonatomic, strong) NSArray *_animals;

@end

@implementation ZooDataManager

+(ZooDataManager *)shared {

  static ZooDataManager *instance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[ZooDataManager alloc] init];
  });
  return instance;
}

- (instancetype)init {
  self = [super init];
  if (self) {
    self._animals = [NSArray array];
  }
  return self;
}

- (NSArray *)animals {
  return self._animals;
}

-(void)fetch:(void(^)(NSError *error, NSArray *animals))completion {

  NSDictionary *parameters = @{
                               @"scope": @"resourceAquire",
                               @"rid": @"a3e2b221-75e0-45c1-8f97-75acbd43d613"
                               };
  if (self.manager == nil) {
    self.manager = [AFHTTPSessionManager manager];
  }

  [self.manager GET: url_taipei_zoo
         parameters: parameters
           progress: nil
            success:^(NSURLSessionTask *task, id responseObject) {
              
              NSDictionary *result = responseObject[@"result"];
              NSArray *results = result[@"results"];
              NSMutableArray<Animal *> *animals = [NSMutableArray array];
              for (NSDictionary *animalJSON in results) {
                Animal *animal = [Animal modelWithJSON: animalJSON];
                [animals addObject: animal];
              }
              self._animals = [NSArray arrayWithArray: (NSArray *)animals];
              completion(nil, animals);
              
            } failure:^(NSURLSessionTask *operation, NSError *error) {
              self._animals = @[];
              completion(error, @[]);
            }];
}

@end
