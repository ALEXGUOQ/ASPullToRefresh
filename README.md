# ASPullToRefresh

## A reusable UITableViewController for adding "Pull-to-Refresh" functionality.

### Features:

1. Works with Synchronous and Asyncrhonous calls
1. Works with custom UITableViewDataSources and custom UITableViewDelegates
1. Compatible with iOS 4, iOS 5, and iOS 6
1. Compatible with iPhone and iPad
1. Compatible with all device/interface orientations

### Why should I use ASPullToRefresh?
While this code is compatible with every type of project, it may be look unnecessarily complicated for most users. This class was made for users who like to create a single custom TableViewController classes, but reuse it multiple times with multiple UITableViewDataSources and UITableViewDelegates, which I, and other developers have come to call ***TableViewManagers***. Read the ***Example use case*** to get an understanding of how you could use this class in a real world scenario.

#### Example use sase
Let's say you're building a Twitter client. You'll notice that the public stream and all twitter lists have the same basic format, e.g., a bunch of tweets shown vertically, with the newest ones at the top.  The optimal way to build the stream and lists on an iOS would be through UITableViewController with pull-to-refresh functionality, so that a user can manually refresh the stream at their own convenience. Since the UITableViewController doesn't have pull-to-refresh functionality by default, I opted to create a UITableViewController that does have it: ***ASPullToRefreshTableViewController***.

At the architectural level, it would be wise to build one UITableViewController with all the basic aspects that these two types of UITableViewControllers share, but if you build one UITableViewController, you will have only one UITableViewDataSource and UITableViewDelegate for multiple types of data that you'd like to refresh (e.g., stream data, list #1's data, list #2's data, etc…). You could add conditions to discriminate between the stream and the different lists inside your UITableViewController, but this would lead to massive (and unmanageable) UITableViewDataSource methods. 

To avoid these massive methods, you should create ***TableViewManagers*** (e.g., classes that contain the UITableViewDataSource and UITableViewDelegate methods). To create these TableViewManagers, you create an instance of your reusable, custom subclass of ASPullToRefreshTableViewController. In the TableViewControllers ***init*** method, you initialize the TableViewManager of your choise. In the TableViewManager, you have all the UITableViewDataSource and UITableViewDelegate methods, and pass their reference to the UITableViewController which initiated them. 

That's it. You now have a single, reusable UITableViewController with pull-to-refresh functionality that can be re-used with multiple UITableViewDataSources and UITableViewDelegates.

### Installation Instruction:

1. Copy the 'ASPullToRefresh' folder into your Xcode project. The following files will be added:
	1. ASPullToRefreshTableViewController.h
	1. ASPullToRefreshTableViewController.m
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

###  Release Notes (v2.0.0):
- Complete revamp of code
- Now works with custom tableView Delegates and DatasSources that use the same parent TableViewController 

###  Previous Release Notes:

####  v1.3.1:
- Removed observer for Interface Orientation Change
- Removed unnecessary tableView reload

#### v1.3.0:
- More abstraction to code to 
	- supprt iPad displays
	- support retina displays
	- device orientaiton changes
- Improved Documentation

####  v1.2.2:
- Re-added support for iOS 4.3
- Modified orientation detection methods
- Retained text from refreshTimeStampLabel's text property


####  v1.2.1:
- Removed public access to dataToRefresh method
- Minor code tweaks

####  v1.2.0:
- Added support for 'LandscapeLeft', 'LandscapeRight', and 'PortraitUpsideDown' orientations
- Add observers for call to didFinishRefreshing
- Changed name of arrow to pullToRefreshArrow
- Added more documentation


####  v1.1.0:
- Renamed all methods for clarity
- Added support for asynchronous calls
	- Exposed two methods to achieve this; dataToRefresh &amp; didFinishRefreshing.
- Added more documentation

#### v1.0.1
- Added more comments
- Removal of a couple lines of unnecessary code

#### v1.0.0 
- Forked from [Leah Culver's PullToRefresh](https://github.com/leah/PullToRefresh/) 
- Added Auto Reference Counting 
- Removed setupStrings method in favor of macros
- Encapsulated existing PullRefreshTableViewController, and renamed it to ASPullToRefreshTableViewController
- Added Refresh Timestamp
- Removed unncessary UITableView-related code
- Improved readability


###  Other Notes:
- If loading local or static data, the PullToRefresh view will fly up in an instance
- If loading remote data (i.e., from an API), the PullToRefresh view will be visible until all data has been retrieved from your remote data source.

Best,

[Arthur Ariel Sabintsev](http://www.sabintsev.com)  