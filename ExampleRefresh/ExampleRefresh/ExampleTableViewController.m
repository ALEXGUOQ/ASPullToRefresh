//
//  ExampleTableViewController.m
//  ExampleRefresh
//
//  Created by Arthur Ariel Sabintsev on 9/5/12.
//
//

#import "ExampleTableViewController.h"
#import "TimeTableViewManager.h"
#import "NumberTableViewManager.h"

@interface ExampleTableViewController ()

@property (assign, nonatomic) TableViewManagerType managerType;
@property (strong, nonatomic) TimeTableViewManager *timeTableViewManager;
@property (strong, nonatomic) NumberTableViewManager *numberTableViewManager;


@end

@implementation ExampleTableViewController
@synthesize managerType = _managerType;
@synthesize timeTableViewManager = _timeTableViewManager;
@synthesize numberTableViewManager = _numberTableViewManager;

- (id)initWithStyle:(UITableViewStyle)style andTableViewManagerType:(TableViewManagerType)type
{
    if ( self = [super initWithStyle:style] ) {
        
        
        // Reference type of tableViewManager to with which to initialize ExampleTableViewController
        self.managerType = type;
    
        switch (self.managerType) {
            case TableViewManagerType_None:
                // Do nothing
                break;
            case TableViewManagerType_TimeTable:
                self.timeTableViewManager = [[TimeTableViewManager alloc] initWithASPullToRefreshTableViewController:self];
                break;
            case TableViewManagerType_NumberTable:
                self.numberTableViewManager = [[NumberTableViewManager alloc] initWithASPullToRefreshTableViewController:self];
                break;
            default:
                break;
        }
        
        
    }
    
    return self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end