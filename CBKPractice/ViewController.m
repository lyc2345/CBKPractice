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
  [_tableView registerNib: [UINib nibWithNibName: NSStringFromClass([AnimalHeader class])
                                          bundle: nil] forHeaderFooterViewReuseIdentifier: headerIdentifier];
  
  self.header = (AnimalHeader *)[[NSBundle mainBundle] loadNibNamed: NSStringFromClass([AnimalHeader class])
                                                              owner: self
                                                            options: nil].firstObject;
  _tableView.tableHeaderView = self.header;
  
  _tableView.estimatedRowHeight = 300;
  _tableView.rowHeight = UITableViewAutomaticDimension;
  _tableView.sectionHeaderHeight = 50;
  
  _tableView.separatorColor = [UIColor clearColor];
  _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
  return 200;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  NSLog(@"Did select index: %ld", (long)indexPath.row);
}

// MARK: UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView { return 1; }

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.zooManager.animals.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
  AnimalHeader *header = (AnimalHeader *)[tableView dequeueReusableHeaderFooterViewWithIdentifier: headerIdentifier];
  header.titleLabel.text = @"Sticky";
  
  return header;
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

@end
