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

#define     kInterfaceOrientationDiDChange  @"InterfaceOrientationDidChange"
#define     kDidFinishRefreshing            @"DidFinishRefreshing"

@interface ASPullToRefreshTableViewController : UITableViewController

- (void)didFinishRefreshing;    // Hides variables and resets refresh-UIView and assoicated variables

/// GENERAL ///
/*
 
 Add the following message to your Table ViewController's 'shouldAutorotateToInterfaceOrientation' method.
 
 [[NSNotificationCenter defaultCenter] postNotificationName:kInterfaceOrientationDiDChange object:nil];
 
 */


/// FOR SYNCHRONOUS CALLS ///

/* 
 In your subclassed FueledPullToRefreshTableViewController, call the following method:
 
 - (void)dataToRefresh
 {
    // Object to refresh goes here
 
    // For synchronous calls, post the following notification before exiting this method:
    [[NSNotificationCenter defaultCenter] postNotificationName:kDidFinishRefreshing object:nil];
 }
 
*/

/// FOR ASYNCHRONOUS CALLS ///

/* 
 In your subclassed FueledPullToRefreshTableViewController, call the following method:
 
 - (void)dataToRefresh
 {
    // Object to refresh goes here
 }
 
 Then, call 
 
 [[NSNotificationCenter defaultCenter] postNotificationName:kDidFinishRefreshing object:nil]; 
 
 in the success/failure delegate methods
 
*/

@end