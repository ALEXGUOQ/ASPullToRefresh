# ASPullToRefresh

## A simple iPhone UITableViewController for adding "Pull-to-Refresh" functionality.

### Inspired by:
- [Tweetie 2](http://www.atebits.com/tweetie-iphone/)
- [Oliver Drobnik's blog post](http://www.drobnik.com/touch/2009/12/how-to-make-a-pull-to-reload-tableview-just-like-tweetie-2/)
- [EGOTableViewPullRefresh](http://github.com/enormego/EGOTableViewPullRefresh).  

### Forked from:
- [Leah Culver's PullToRefresh](https://github.com/leah/PullToRefresh/)  

###  Release Notes (v1.0):
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

### Installation Instruction:

1. Copy the 'ASPullToRefresh' folder into your Xcode project. The following files will be added:
	1. ASPullToRefreshTableViewController.h
	1. ASPullToRefreshTableViewController.m
	1. fueledPullToRefreshArrow.png 
1. Link against the QuartzCore framework (used for rotating the arrow image).
1. Create a UITableViewController that is a subclass of ASPullToRefreshTableViewController.
1. Customize your subclassed UITableViewController by adding the following method:

<pre><code> - (void)didPullToRefresh 
    { 
        // Objects/Methods to call for refresh go here 
        [super didPullToRefresh] 
	} 
</pre></code>

Best,

[Arthur Ariel Sabintsev](http://www.sabintsev.com)  