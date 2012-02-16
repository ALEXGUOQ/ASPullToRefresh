//
//  ASPullToRefreshTableViewController.h
//  Made at Fueled (www.fueled.com)
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

#import <UIKit/UIKit.h>

@interface ASPullToRefreshTableViewController : UITableViewController

- (void)dataToRefresh;          // Data to refresh when pulling down on UITableView
- (void)didFinishRefreshing;    // Hides variables and resets refresh-UIView and assoicated variables


/// FOR SYNCHRONOUS CALLS ///

/* 
 In your subclassed FueledPullToRefreshTableViewController, call the following method:
 
 - (void)dataToRefresh
 {
    // Object to refresh goes here
 
    // For synchronous calls, call [super didFinishRefreshing] before exiting this method 
    [super didFinishRefreshing]; 
 }
 
*/

/// FOR ASYNCHRONOUS CALLS ///

/* 
 In your subclassed FueledPullToRefreshTableViewController, call the following method:
 
 - (void)dataToRefresh
 {
    // Object to refresh goes here
 }
 
 Then, Call [super didFinishRefreshing] in the success/failure delegate methods
 [super didFinishRefreshing]; 
 
*/

@end