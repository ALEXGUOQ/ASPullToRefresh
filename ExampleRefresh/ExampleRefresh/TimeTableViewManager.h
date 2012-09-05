//
//  TimeTableViewManager.h
//  ExampleRefresh
//
//  Created by Arthur Ariel Sabintsev on 9/5/12.
//
//

#import <Foundation/Foundation.h>
#import "ExampleTableViewController.h"

@interface TimeTableViewManager : NSObject
<
UITableViewDataSource,
UITableViewDelegate,
ASPullToRefreshDelegate
>

- (id)initWithASPullToRefreshTableViewController:(ASPullToRefreshTableViewController *)refreshController;

@end
