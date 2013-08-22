# ASPullToRefresh

### A Class for adding "Pull-to-Refresh" functionality acorss multiple, similarly constructed UITableViewControllers

### Important Note
I am no longer supporting this repository, as iOS 5 has < 7% of the iOS market share. Also, Apple's iOS 6 native pull-to-refresh implementation nicely solves the problem that this repository solved.

The codebase will remain online and available for now. The old readme can be found in the **README_OLD.md** file.

### Features:

1. Works with Synchronous and Asyncrhonous calls
1. Works with custom UITableViewDataSources and custom UITableViewDelegates
1. Compatible with iOS 4, iOS 5, and iOS 6
1. Compatible with iPhone and iPad
1. Compatible with all device/interface orientations

### Why should I use ASPullToRefresh?
While this code is compatible with every type of project, it may look unnecessarily complicated for most users. This class was made for users who like to create a single custom TableViewController class, but reuse it multiple times with multiple UITableViewDataSources and UITableViewDelegates, which I, and other developers have come to call ***TableViewManagers***. Read the ***Example use case*** to get an understanding of how you could use this class in a real world scenario.

#### Example use case
Let's say you're building a Twitter client. You'll notice that the public stream and all twitter lists have the same basic format, e.g., a bunch of tweets shown vertically, with the newest ones at the top.  The optimal way to build the stream and lists on an iOS would be through UITableViewController with pull-to-refresh functionality, so that a user can manually refresh the stream at their own convenience. Since the UITableViewController doesn't have pull-to-refresh functionality by default, I opted to create a UITableViewController that does have it: ***ASPullToRefreshTableViewController***.

At the architectural level, it would be wise to build one UITableViewController with all the basic aspects that these two types of UITableViewControllers share, but if you build one UITableViewController, you will have only one UITableViewDataSource and UITableViewDelegate for multiple types of data that you'd like to refresh (e.g., stream data, list #1's data, list #2's data, etc…). You could add conditions to discriminate between the stream and the different lists inside your UITableViewController, but this would lead to massive (and unmanageable) UITableViewDataSource and UITableViewDelegate methods. 

To avoid these massive methods, you should create ***TableViewManagers*** (e.g., classes that contain the UITableViewDataSource and UITableViewDelegate methods). To create these TableViewManagers, you create an instance of your reusable, custom subclass of ASPullToRefreshTableViewController. In the UITableViewController's ***init*** method, you initialize the TableViewManager of your choice. In the TableViewManager, you have the UITableViewDataSource and UITableViewDelegate methods, and pass their reference to the UITableViewController that initiated them. 

That's it. You now have a single, reusable UITableViewController with pull-to-refresh functionality that can be re-used with multiple UITableViewDataSources and UITableViewDelegates.

### Installation Instruction:

1. Copy the 'ASPullToRefresh' folder into your Xcode project. The following files will be added:
	1. ASPullToRefreshTableViewController.h
	1. ASPullToRefreshTableViewController.m
	1. pullToRefreshArrow.png
	1. pullToRefreshArrow@2x.png 
1. Link against the QuartzCore framework (used for rotating the arrow image).
1. Create a UITableViewController that is a subclass of ASPullToRefreshTableViewController.
1. Follow the logic in the ExamplePullToRefresh project - it's straightforward.

### Inspired by:
- [Tweetie 2](http://www.atebits.com/tweetie-iphone/)
- [Oliver Drobnik's blog post](http://www.drobnik.com/touch/2009/12/how-to-make-a-pull-to-reload-tableview-just-like-tweetie-2/)
- [EGOTableViewPullRefresh](http://github.com/enormego/EGOTableViewPullRefresh).  

### Forked from:
- [Leah Culver's PullToRefresh](https://github.com/leah/PullToRefresh/) 
- Note: Codebase has changed drastically. 

###  Release Notes (v2.0.1):
- Added code to determine if UITextAlignmentCenter or NSTextAlignmentCenter should be used for UILabels.

###  Other Notes:
- If loading local or static data, the PullToRefresh view will fly up in an instance
- If loading remote data (i.e., from an API), the PullToRefresh view will be visible until all data has been retrieved from your remote data source.

### Recognition
Created by [Arthur Ariel Sabintsev](http://www.sabintsev.com)  

### License
The MIT License (MIT)
Copyright (c) 2012 Arthur Ariel Sabintsev

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.