//
//  ViewController.m
//  CBKPractice
//
//  Created by Stan Liu on 2018/10/22.
//  Copyright © 2018 Stan Liu. All rights reserved.
//

#import "ViewController.h"
#import "ZooDataManager.h"
#import "AnimalHeader.h"
#import "AnimalCell.h"

static NSString *cellIdentifier = @"animal_cell";
static NSString *headerIdentifier = @"animal_header";

@interface ViewController () <UITableViewDelegate, UITableViewDataSource> {
  
  __weak IBOutlet UITableView *_tableView;
}

@property (nonatomic, strong) ZooDataManager *zooManager;
@property (nonatomic, strong) AnimalHeader *header;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self setup];
  [self setupTableView];
  
  [self fetchAnimals];
}


// MARK: Set up

-(void)setup {
  self.zooManager = [ZooDataManager shared];
}

-(void)setupTableView {
  
  _tableView.delegate = self;
  _tableView.dataSource = self;

  [_tableView registerNib: [UINib nibWithNibName: NSStringFromClass([AnimalCell class])
                                          bundle: nil]
   forCellReuseIdentifier: cellIdentifier];
  
  _tableView.estimatedRowHeight = 50;
  _tableView.rowHeight = UITableViewAutomaticDimension;

  _tableView.separatorColor = [UIColor clearColor];
  _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  _tableView.backgroundColor = [UIColor clearColor];
}

-(void)fetchAnimals {
  
  [self.zooManager fetch:^(NSError * _Nonnull error, NSArray * _Nonnull animals) {
    
    if (error) {
      // Error handling
      return;
    }
    // handle data response
    [self->_tableView reloadData];
  }];
}


// MARK: UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  NSLog(@"Did select index: %ld", (long)indexPath.row);
}


// MARK: UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView { return 1; }

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.zooManager.animals.count;
}

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//
//  AnimalCell * _Nonnull weakCell = (AnimalCell *)cell;
//
//  if (weakCell) {
//    Animal *animal = self.zooManager.animals[indexPath.row];
//    [weakCell bindAnimal: animal];
//  }
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  AnimalCell *cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier forIndexPath: indexPath];
  
  if (!cell) {
    cell = [[AnimalCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: cellIdentifier];
  }
  
  Animal *animal = self.zooManager.animals[indexPath.row];
  [cell bindAnimal: animal];
  
  return cell;
}


// MARK: UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
  [self.scrollViewBridge scrollViewDidScroll: scrollView];
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
  [self.scrollViewBridge scrollViewDidScrollToTop: scrollView];
}

@end
