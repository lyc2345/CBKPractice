//
//  ViewController.m
//  CBKPractice
//
//  Created by Stan Liu on 2018/10/22.
//  Copyright © 2018 Stan Liu. All rights reserved.
//

#import "ListAnimalsViewController.h"
#import "ZooDataManager.h"
#import "AnimalCell.h"
#import "UITableView+RefreshKit.h"

static NSString *cellIdentifier = @"animal_cell";

@interface ListAnimalsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) ZooDataManager *zooManager;
@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;

@end

@implementation ListAnimalsViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self setup];
  [self setupTableView];
  
  [self fetchAnimals: nil];
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
  
  self.indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleGray];
  [_tableView addSpinner: self.indicatorView];
}

-(void)fetchAnimals:(void(^)(void))completion {
  
  __weak typeof(self) weakSelf = self;
  [self.zooManager fetch:^(NSError * _Nonnull error, NSArray * _Nonnull animals) {
    
    if (completion) { completion(); }
    if (error) {
      // Error handling
      return;
    }
    // handle data response
    [weakSelf.tableView reloadData];
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

// this buggy solution if animals count less than generate cells
//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//
//  if (self.zooManager.animals.count - 1 == indexPath.row) {
//    [tableView startSpinning];
//    __weak typeof(self) weakSelf = self;
//    [self fetchAnimals:^{
//      [weakSelf.tableView endSpinning];
//    }];
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
  if ([self.scrollViewBridge respondsToSelector: @selector(scrollViewDidScroll:)]) {
    [self.scrollViewBridge scrollViewDidScroll: scrollView];
  }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
  if ([self.scrollViewBridge respondsToSelector: @selector(scrollViewDidEndDecelerating:)]) {
    [self.scrollViewBridge scrollViewDidEndDecelerating: scrollView];
  }
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
  if ([self.scrollViewBridge respondsToSelector: @selector(scrollViewDidEndDragging:willDecelerate:)]) {
    [self.scrollViewBridge scrollViewDidEndDragging: scrollView willDecelerate: decelerate];
  }

  // Do load more...
  // UITableView only moves in one direction, y axis
  CGFloat offset = scrollView.contentOffset.y;
  CGFloat absoluteBottom = scrollView.contentSize.height - scrollView.frame.size.height;
  
  if (absoluteBottom - offset <= 10) {
    
    // Change 10.0 to adjust the distance from bottom
    [self.tableView startSpinning];
    __weak typeof(self) weakSelf = self;
    [self fetchAnimals:^{
      [weakSelf.tableView endSpinning];
    }];
  }
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
  if ([self.scrollViewBridge respondsToSelector: @selector(scrollViewDidScrollToTop:)]) {
    [self.scrollViewBridge scrollViewDidScrollToTop: scrollView];
  }
}

@end
