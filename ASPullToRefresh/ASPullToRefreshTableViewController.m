//
//  FueledPullToRefreshTableViewController.m
//  Fueled (www.fueled.com)
//
//  Created by Arthur Sabintsev on 02/14/12.
//  Copyright © 2012 Arthur Sabintsev
//  
//  Originall created by Leah Culver on 7/2/10.
//  Copyright (c) 2010 Leah Culver
//
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//

#import "ASPullToRefreshTableViewController.h"
#import <QuartzCore/QuartzCore.h>

#pragma mark - Macros

#define     kREFRESH_HEADER_HEIGHT      70.0f
#define     kTEXT_PULL                  @"Pull down to refresh..."
#define     kTEXT_RELEASE               @"Release to refresh..."
#define     kTEXT_LOADING               @"Loading..."

#pragma mark - Private Declarations

@interface ASPullToRefreshTableViewController ()

@property (assign, nonatomic) BOOL isLoading;
@property (assign, nonatomic) BOOL isDragging;
@property (strong, nonatomic) UILabel *refreshTimestampLabel;
@property (strong, nonatomic) UILabel *refreshLabel;
@property (strong, nonatomic) UIImageView *refreshArrow;
@property (strong, nonatomic) UIActivityIndicatorView *refreshSpinner;
@property (strong, nonatomic) UIView *refreshHeaderView;

- (void)createPullToRefreshHeader;
- (void)startLoading;
- (void)stopLoading;
- (void)stopLoadingComplete;
- (NSString*)refreshTimestamp;

@end

@implementation ASPullToRefreshTableViewController
@synthesize refreshTimestampLabel = _refreshTimestampLabel;
@synthesize refreshLabel = _refreshLabel; 
@synthesize refreshArrow = _refreshArrow; 
@synthesize refreshSpinner = _refreshSpinner; 
@synthesize refreshHeaderView = _refreshHeaderView; 
@synthesize isLoading = _isLoading; 
@synthesize isDragging = _isDragging;

#pragma mark - View Lifecycle Methods

- (void)viewDidLoad 
{
    [super viewDidLoad];
    
    [self createPullToRefreshHeader];
}

#pragma mark - Create Pull-To-Refresh Header Method

- (void)createPullToRefreshHeader 
{
    
    // Create UIView to mimic UITableView's tableHeaderView
    self.refreshHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, -kREFRESH_HEADER_HEIGHT, 320.0f, kREFRESH_HEADER_HEIGHT)];
    self.refreshHeaderView.backgroundColor = [UIColor clearColor];
    
    // Create refreshLabel that textually delineates the 'refresh-state' using strings (e.g., kTEXT_PULL, kTEXT_RELEASE, kTEXT_LOADING)
    self.refreshLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, kREFRESH_HEADER_HEIGHT)];
    self.refreshLabel.backgroundColor = [UIColor clearColor];
    self.refreshLabel.font = [UIFont boldSystemFontOfSize:11.0f];
    self.refreshLabel.textAlignment = UITextAlignmentCenter;
    [self.refreshHeaderView addSubview:self.refreshLabel];

    self.refreshTimestampLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 10.0f, 320.0f, kREFRESH_HEADER_HEIGHT)];
    self.refreshTimestampLabel.backgroundColor = [UIColor clearColor];
    self.refreshTimestampLabel.font = [UIFont boldSystemFontOfSize:9.0f];
    self.refreshTimestampLabel.textColor = [UIColor grayColor];
    self.refreshTimestampLabel.textAlignment = UITextAlignmentCenter;
    [self.refreshHeaderView addSubview:self.refreshTimestampLabel];
    
    self.refreshArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fueledPullToRefreshArrow.png"]];
    self.refreshArrow.frame = CGRectMake(floorf((kREFRESH_HEADER_HEIGHT - 27.0f) / 2.0f), (floorf(kREFRESH_HEADER_HEIGHT - 44.0f) / 2.0f), 27.0f, 44.0f);
    [self.refreshHeaderView addSubview:self.refreshArrow];
    
    self.refreshSpinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.refreshSpinner.frame = CGRectMake(floorf(floorf(kREFRESH_HEADER_HEIGHT - 20.0f) / 2.0f), floorf((kREFRESH_HEADER_HEIGHT - 20.0f) / 2.0f), 20.0f, 20.0f);
    self.refreshSpinner.hidesWhenStopped = YES;

    [self.refreshHeaderView addSubview:self.refreshSpinner];
    [self.tableView addSubview:self.refreshHeaderView];

}

#pragma mark - Loading Methods

- (void)startLoading 
{
    self.isLoading = YES;

    // Show the header
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    self.tableView.contentInset = UIEdgeInsetsMake(kREFRESH_HEADER_HEIGHT, 0.0f, 0.0f, 0.0f);
    self.refreshLabel.text = kTEXT_LOADING;
    self.refreshArrow.hidden = YES;
    [self.refreshSpinner startAnimating];
    [UIView commitAnimations];

    // Refresh action!
    [self didPullToRefresh];
}

- (void)stopLoading 
{
    self.isLoading = NO;
    
    // Get refresh timestamp
    NSString *timeStamp = [self refreshTimestamp];
    
    // Set refreshTimestampLabel's text property with timestamp
    self.refreshTimestampLabel.text = [NSString stringWithFormat:@"Last refreshed on %@", timeStamp];
    
    // Move refreshLabel's frame up by 10 pixels to make room for refreshTimestampLabel's text output
    self.refreshLabel.frame = CGRectMake(0.0f, -10.0f, 320.0f, kREFRESH_HEADER_HEIGHT);
    
    // Hide the header (via animation)
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDidStopSelector:@selector(stopLoadingComplete)];
    self.tableView.contentInset = UIEdgeInsetsZero;
    UIEdgeInsets tableContentInset = self.tableView.contentInset;
    tableContentInset.top = 0.0f;
    self.tableView.contentInset = tableContentInset;
    self.refreshArrow.layer.transform = CATransform3DMakeRotation(M_PI * 2.0f, 0.0f, 0.0f, 1.0f);
    [UIView commitAnimations];
}

- (void)stopLoadingComplete 
{
    // Reset the header
    self.refreshLabel.text = kTEXT_PULL;
    self.refreshArrow.hidden = NO;
    [self.refreshSpinner stopAnimating];
}

#pragma mark - Refresh Timestamp Method

- (NSString*)refreshTimestamp
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    [dateFormatter setDateFormat:@"MMM. d, YYY 'at' h:mm a"];
    return [dateFormatter stringFromDate:[NSDate date]];
}

#pragma mark - Refresh Method

- (void)didPullToRefresh 
{    
    [self stopLoading];
}

#pragma mark - UIScrollViewDelegate Methods

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView 
{
    self.isDragging = YES;
    
    if (self.isLoading) return;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView 
{

    if (self.isDragging && scrollView.contentOffset.y < 0) { /// Update the arrow direction and label
    
        [UIView beginAnimations:nil context:NULL];
        
        if (scrollView.contentOffset.y < -kREFRESH_HEADER_HEIGHT) {  /// User is scrolling above the header
           
            self.refreshLabel.text = kTEXT_RELEASE;
            self.refreshArrow.layer.transform = CATransform3DMakeRotation(M_PI, 0.0f, 0.0f, 1.0f);
            
        } else { /// User is scrolling somewhere within the header
            
            self.refreshLabel.text = kTEXT_PULL;
            self.refreshArrow.layer.transform = CATransform3DMakeRotation(M_PI * 2.0f, 0.0f, 0.0f, 1.0f);
      
        }
        
        [UIView commitAnimations];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate 
{
    self.isDragging = NO;
    
    if (self.isLoading) return;
    
    // Released above the header
    if (scrollView.contentOffset.y < -kREFRESH_HEADER_HEIGHT) [self startLoading];

}

@end