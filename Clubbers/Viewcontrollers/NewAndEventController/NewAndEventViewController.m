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
#import "NSString+HTML.h"
#import "MWFeedParser.h"

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
    [btnBack setBackgroundImage:[UIImage imageNamed:@"ic_back.png"] forState:UIControlStateNormal];
    //[btnBack setBackgroundImage:[UIImage imageNamed:@"ic_back_disable.png"] forState:UIControlStateDisabled];
    [btnBack addTarget:self action:@selector(btnBackMenu:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: btnBack];

    
    [buttonNews setBackgroundImage:[UIImage imageNamed:@"ic_ne_news_normal.png"] forState:UIControlStateDisabled];
    [buttonNews setBackgroundImage:[UIImage imageNamed:@"ic_ne_news_selected.png"] forState:UIControlStateNormal];
    
    [buttonEvents setBackgroundImage:[UIImage imageNamed:@"ic_ne_events_normal.png"] forState:UIControlStateDisabled];
    [buttonEvents setBackgroundImage:[UIImage imageNamed:@"ic_ne_events_selected.png"] forState:UIControlStateNormal];
    
    [buttonOffers setBackgroundImage:[UIImage imageNamed:@"ic_ne_offers_normal.png"] forState:UIControlStateDisabled];
    [buttonOffers setBackgroundImage:[UIImage imageNamed:@"ic_ne_offers_selected"] forState:UIControlStateNormal];
    
    tableview.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    //
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.delegate = (id)self;
    HUD.labelText = @"Loading...";
    [self showMBProgressHUDNewsAndFeeds:YES];
    // Setup
    self.title = @"Loading...";
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    parsedItems = [[NSMutableArray alloc] init];
    self.itemsToDisplay = [NSArray array];
    //
    NSURL *feedURL = [NSURL URLWithString:@"http://www.clubbersapptoibiza.com/app/?feed=rss2&cat=1"];
    feedParser = [[MWFeedParser alloc] initWithFeedURL:feedURL];
    feedParser.delegate = self;
    feedParser.feedParseType = ParseTypeFull; // Parse feed info and all items
    feedParser.connectionType = ConnectionTypeAsynchronously;
    [feedParser parse];
}
- (void)updateTableWithParsedItems {
    [self showMBProgressHUDNewsAndFeeds:NO];
    self.itemsToDisplay = parsedItems;
    [tableview reloadData];
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
- (IBAction)btnNews:(id)sender {
    [self stateOfButonNews:NO andButtonEvents:YES andButonOffers:YES];
}
- (IBAction)btnEvents:(id)sender {
    [self stateOfButonNews:YES andButtonEvents:NO andButonOffers:YES];
}
- (IBAction)btnOffers:(id)sender {
    [self stateOfButonNews:NO andButtonEvents:YES andButonOffers:NO];
}
//-(void)loadFeed {
//    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:OFFICIAL_SERVER]];
//    NSURLRequest *request = [client requestWithMethod:@"GET" path:SA_TOWNS_LIST parameters:nil];
//    NSLog(@" %@", [request description]);
//    AFHTTPRequestOperation *operation = [client HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *requestOperation, id responseObject) {
//        NSArray *jsonDataArray = [NSJSONSerialization JSONObjectWithData:requestOperation.responseData options:NSJSONReadingAllowFragments error:nil];
//        tableDatasource = [[TownModel shareInstance] parseJson:jsonDataArray];
//        [self.tableView setHidden:NO];
//        if (delegate) {
//            [delegate dismissMBProgressHUD];
//        }
//        [self.tableView reloadData];
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Error:%@", error);
//    }];
//    
//    [client enqueueHTTPRequestOperation:operation];
//}
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
    return self.itemsToDisplay.count;;
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

    MWFeedItem *item = [self.itemsToDisplay objectAtIndex:indexPath.row];
    if (item) {
//        NSString *itemTitle = item.content ? [item.title stringByConvertingHTMLToPlainText] : @"[No Title]";
     NSString* str_imageUrl = [self getFirstImage:item.content];
    }
    return cell;
}
- (NSString *)getFirstImage:(NSString *)htmlString{
    
    NSScanner *theScanner;
    NSString *text = nil;
    
    theScanner = [NSScanner scannerWithString: htmlString];
    
    // find start of tag
    [theScanner scanUpToString: @"<a href=\"" intoString: NULL];
    if ([theScanner isAtEnd] == NO) {
        NSInteger newLoc = [theScanner scanLocation] + 10;
        [theScanner setScanLocation: newLoc];
        
        // find end of tag
        [theScanner scanUpToString: @"\"" intoString: &text];
    }
    
    return [@"h" stringByAppendingString:text];
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
