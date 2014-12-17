//
//  MainViewController.m
//  Clubbers
//
//  Created by SonNV on 12/3/14.
//  Copyright (c) 2014 Clubbers. All rights reserved.
//

#import "NewAndEventViewController.h"
#import "CustomTableCell.h"
#import "AFNetworking.h"
#import "MWFeedParser.h"
#import "DefinitionAPI.h"
@interface NewAndEventViewController () {
    UIButton *btnBack;
}
@end

@implementation NewAndEventViewController
@synthesize buttonNews;
@synthesize buttonEvents;
@synthesize buttonOffers;
@synthesize tableview;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //
    self.view.layer.cornerRadius = 5;
    self.view.layer.masksToBounds = YES;
    // add buttons
    btnBack = [UIButton buttonWithType: UIButtonTypeCustom];
    [btnBack setFrame: CGRectMake(10.0f, 20.0f, 30.0f, 30.0f)];
    [btnBack setBackgroundImage:[UIImage imageNamed:@"ic_back_disable.png"] forState:UIControlStateNormal];
    //[btnBack setBackgroundImage:[UIImage imageNamed:@"ic_back_disable.png"] forState:UIControlStateDisabled];
    [btnBack addTarget:self action:@selector(btnBackMenu:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: btnBack];

    [buttonNews setBackgroundImage:[UIImage imageNamed:@"ic_ne_news_normal.png"] forState:UIControlStateNormal];
    [buttonNews setBackgroundImage:[UIImage imageNamed:@"ic_ne_news_selected.png"] forState:UIControlStateDisabled];
    
    [buttonEvents setBackgroundImage:[UIImage imageNamed:@"ic_ne_events_normal.png"] forState:UIControlStateNormal];
    [buttonEvents setBackgroundImage:[UIImage imageNamed:@"ic_ne_events_selected.png"] forState:UIControlStateDisabled];
    
    [buttonOffers setBackgroundImage:[UIImage imageNamed:@"ic_ne_offers_normal.png"] forState:UIControlStateNormal];
    [buttonOffers setBackgroundImage:[UIImage imageNamed:@"ic_ne_offers_selected"] forState:UIControlStateDisabled];
    
    [self stateOfButonNews:NO andButtonEvents:YES andButonOffers:YES];
    tableview.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    tableview.hidden = YES;
    //
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.delegate = (id)self;
    HUD.labelText = @"Loading...";
    // Setup
    parsedItems = [[NSMutableArray alloc] init];
    itemsToDisplay = [NSArray array];
    //
    [self loadNewsAndEventsFeed: (int)buttonNews.tag];
}
- (void) loadNewsAndEventsFeed:(int) buttonTag {
    [self showMBProgressHUDNewsAndFeeds:YES];
    NSURL *feedURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%d",PARAM_FEED, buttonTag+1]];
    feedParser = [[MWFeedParser alloc] initWithFeedURL:feedURL];
    feedParser.delegate = self;
    feedParser.feedParseType = ParseTypeFull; // Parse feed info and all items
    feedParser.connectionType = ConnectionTypeAsynchronously;
    [feedParser parse];
}
- (void)updateTableWithParsedItems {
    [self showMBProgressHUDNewsAndFeeds:NO];
    itemsToDisplay = parsedItems;
    [tableview reloadData];
    tableview.hidden = NO;
}
- (IBAction)switchSelectedButton:(id)sender {
    switch ([sender tag]) {
        case 0:
            [self loadNewsAndEventsFeed: (int)buttonNews.tag];
            break;
        case 1:
            [self loadNewsAndEventsFeed: (int)buttonEvents.tag];
            break;
        case 2:
            [self loadNewsAndEventsFeed: (int)buttonOffers.tag];
            break;
        default:
            break;
    }
}
#pragma mark -
#pragma mark MWFeedParserDelegate

- (void)feedParserDidStart:(MWFeedParser *)parser {
    NSLog(@"Started Parsing: %@", parser.url);
}

- (void)feedParser:(MWFeedParser *)parser didParseFeedInfo:(MWFeedInfo *)info {
    NSLog(@"Parsed Feed Info: “%@”", info.title);
    self.title = info.title;
}

- (void)feedParser:(MWFeedParser *)parser didParseFeedItem:(MWFeedItem *)item {
    NSLog(@"Parsed Feed Item: “%@”", item.title);
    if (item) [parsedItems addObject:item];
}

- (void)feedParserDidFinish:(MWFeedParser *)parser {
    NSLog(@"Finished Parsing%@", (parser.stopped ? @" (Stopped)" : @"not"));
    [self updateTableWithParsedItems];
}

- (void)feedParser:(MWFeedParser *)parser didFailWithError:(NSError *)error {
    NSLog(@"Finished Parsing With Error: %@", error);
    if (parsedItems.count == 0) {
        self.title = @"Failed"; // Show failed message in title
    } else {
        // Failed but some items parsed, so show and inform of error
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Parsing Incomplete"
                                                        message:@"There was an error during the parsing of this feed. Not all of the feed items could parsed."
                                                       delegate:nil
                                              cancelButtonTitle:@"Dismiss"
                                              otherButtonTitles:nil];
        [alert show];
    }
    [self updateTableWithParsedItems];
}

- (IBAction)btnBackMenu:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void) stateOfButonNews:(BOOL) isEnablebtnNews andButtonEvents:(BOOL) isEnablebtnEvents andButonOffers:(BOOL) isEnablebtnOffers {
    if (isEnablebtnNews) {
        buttonNews.enabled = YES;
    }
    else
        buttonNews.enabled = NO;
    if (isEnablebtnEvents) {
        buttonEvents.enabled = YES;
    }
    else
        buttonEvents.enabled = NO;
    if (isEnablebtnOffers) {
        buttonOffers.enabled = YES;
    }
    else
        buttonOffers.enabled = NO;
}
#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 400;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return itemsToDisplay.count;;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomTableCell";
    CustomTableCell *cell = (CustomTableCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CustomTableCell" owner:self options:nil];
        for (id currentObject in topLevelObjects) {
            if ([currentObject isKindOfClass:[CustomTableCell class]]) {
                cell = (CustomTableCell *) currentObject;
                break;
            }
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    // Configure the cell...
    MWFeedItem *item = [itemsToDisplay objectAtIndex:indexPath.row];
    if (item)
        [cell configueCellWithTownDetai:item];
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
- (void) showMBProgressHUDNewsAndFeeds:(BOOL) isShowHUB {
    if (isShowHUB)
        [HUD show:TRUE];
    else
        [HUD hide:TRUE];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
