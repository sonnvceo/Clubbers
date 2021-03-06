//
//  MainViewController.m
//  Clubbers
//
//  Created by SonNV on 12/3/14.
//  Copyright (c) 2014 Clubbers. All rights reserved.
//

#import "TownDetailViewController.h"
#import "SideMenu.h"
#import "LeftMenuViewController.h"
#import "ContentViewController.h"
#import "DefinitionAPI.h"
#import "AFNetworking.h"
#import "TownDetailModel.h"

@interface TownDetailViewController () {
    SlideShowView *slideShowView;
    SideMenu *sideMenu;
    TownDetailModel *townDetailModel;
    float expandHeightOfCell;
}
@property (nonatomic) NSMutableArray * readMoreCells;
@end

@implementation TownDetailViewController
@synthesize townID, delegate, tableview;

- (NSMutableArray *) readMoreCells {
    if (!_readMoreCells) {
        _readMoreCells = [@[] mutableCopy];
    }
    
    return _readMoreCells;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //
    UIImage*i1 = [UIImage imageNamed:@"1.jpg"];
    UIImage*i2 = [UIImage imageNamed:@"2.jpg"];
    UIImage*i3 = [UIImage imageNamed:@"3.jpg"];
    UIImage*i4 = [UIImage imageNamed:@"4.jpg"];
    UIImage*i5 = [UIImage imageNamed:@"5.jpg"];
    NSArray *images = @[i1,i2,i3,i4,i5];
    
    self.view.layer.cornerRadius = 5;
    self.view.layer.masksToBounds = YES;
    CGRect frameSlideShowView = CGRectMake(0, 0,self.view.bounds.size.width, 180);
    slideShowView = [[SlideShowView alloc] initWithFrame:frameSlideShowView];
    slideShowView.delegate = (id)self;
    slideShowView.typeOfViewController = kDetailViewController;
    [slideShowView autoSlideShowAnimation:images];
    [slideShowView stateOfButonMenuAndButtonBack:NO];
    [self.view addSubview:slideShowView];
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.delegate = (id)self;
    HUD.labelText = @"Loading...";
    [self showMBProgressHUDAtDetailView:YES];
    [self loadDetailTown];
}
-(void)loadDetailTown {
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:OFFICIAL_SERVER]];
    NSURLRequest *request = [client requestWithMethod:@"GET" path:[NSString stringWithFormat:@"%@%ld", SA_TOWN_DETAILS, townID+1
                                                                   ] parameters:nil];
    NSLog(@" %@", [request description]);
    AFHTTPRequestOperation *operation = [client HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *requestOperation, id responseObject) {
         NSDictionary* dictResponse = [NSJSONSerialization JSONObjectWithData:requestOperation.responseData options:NSJSONReadingAllowFragments error:nil];
        townDetailModel = [[TownDetailModel shareInstance] parseJson:dictResponse];
        [tableview reloadData];
        [self showMBProgressHUDAtDetailView:NO];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error:%@", error);
    }];
    
    [client enqueueHTTPRequestOperation:operation];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnDismiss:(id)sender {
   [self.navigationController popToRootViewControllerAnimated:YES];
}
#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGRect textViewFrame = CGRectMake(11.0f, 220.0f, 21.0f, 34.0f);
    UITextView *txtView = [[UITextView alloc] initWithFrame:textViewFrame];
    txtView.text = townDetailModel.townDeaderDetail;
    float heightOfCell;
    switch (indexPath.row) {
        case 0:
            heightOfCell = 100;//[self textViewHeightForAttributedText:txtView.attributedText andWidth:txtView.frame.size.width];
            break;
        case 1:
            heightOfCell = 300;
            break;
        default:
            break;
    }
    if ([self.readMoreCells containsObject:indexPath]) {
        heightOfCell += expandHeightCell - 65.0f + expandHeightOfCell ;
    }
    return heightOfCell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"TownDetailCell";
    TownDetailCell *cell = (TownDetailCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"TownDetailCell" owner:self options:nil];
        for (id currentObject in topLevelObjects) {
            if ([currentObject isKindOfClass:[TownDetailCell class]]) {
                cell = (TownDetailCell *) currentObject;
                break;
            }
        }
        cell.indexPath = indexPath;
        cell.delegate = self;
//        if (indexPath.row ==1) {
//            if (isBtnReadmoreDelegate)
//                cell.isBtnReadmore = YES;
//            [cell creatSubviews];
//        }
    }
    if (isBtnReadmoreDelegate)
    cell.isBtnReadmore = YES;
    [cell configueCellAtIndexPath:indexPath withTownDetai:townDetailModel];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([tableview respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableview setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([tableview respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableview setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               if ( !error )
                               {
                                   UIImage *image = [[UIImage alloc] initWithData:data];
                                   completionBlock(YES,image);
                               } else{
                                   completionBlock(NO,nil);
                               }
                           }];
}
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}
- (void) showMBProgressHUDAtDetailView:(BOOL) isShowHUB {
    if (isShowHUB)
        [HUD show:TRUE];
    else
        [HUD hide:TRUE];
}
#pragma mark - TownDetailCell Delegate

- (void) didActivateReadMoreForCell:(TownDetailCell*)cell withHeightOfRow:(float) height{
    expandHeightOfCell = height;
    isBtnReadmoreDelegate = YES;
    [_readMoreCells addObject:cell.indexPath];
    expandHeightCell = cell.realHeightOfTextView;
    [self.tableview reloadRowsAtIndexPaths:_readMoreCells withRowAnimation:UITableViewRowAnimationAutomatic];
}
#pragma mark - SlideShowViewDelegate
- (void) showMenuLeft{
    [sideMenu showMenuAnimated:YES];
}
- (void)showMenuRight {
    [sideMenu hideMenuAnimated:YES];
}
- (void)popToRootViewController {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (CGFloat)textViewHeightForAttributedText: (NSAttributedString*)text andWidth: (CGFloat)width {
    UITextView *calculationView = [[UITextView alloc] init];
    [calculationView setAttributedText:text];
    CGSize size = [calculationView sizeThatFits:CGSizeMake(width, FLT_MAX)];
    return size.height;
}
@end
