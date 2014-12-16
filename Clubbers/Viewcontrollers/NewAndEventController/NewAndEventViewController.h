//
//  MainViewController.h
//  Clubbers
//
//  Created by SonNV on 12/3/14.
//  Copyright (c) 2014 Clubbers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWFeedParser.h"
#import "MBProgressHUD.h"

@interface NewAndEventViewController : UIViewController<MWFeedParserDelegate,
                                                        UITableViewDelegate,
                                                        UITableViewDataSource,
                                                        MBProgressHUDDelegate> {
    // Parsing
    MWFeedParser *feedParser;
    NSMutableArray *parsedItems;
    // Displaying
    NSArray *itemsToDisplay;
    MBProgressHUD *HUD;
}
@property (strong, nonatomic) IBOutlet UIButton *buttonNews;
@property (strong, nonatomic) IBOutlet UIButton *buttonEvents;
@property (strong, nonatomic) IBOutlet UIButton *buttonOffers;
@property (strong, nonatomic) IBOutlet UITableView *tableview;

@end
