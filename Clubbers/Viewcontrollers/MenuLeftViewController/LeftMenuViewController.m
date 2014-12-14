//
//  JDMenuViewController.m
//  JDSideMenu
//
//  Created by Markus Emrich on 11.11.13.
//  Copyright (c) 2013 Markus Emrich. All rights reserved.
//

#import "UIViewController+SideMenu.h"
#import "DefinitionAPI.h"
#import "LeftMenuViewController.h"
#import "ContentViewController.h"
#import "NewAndEventViewController.h"
#import "LbizaMapViewController.h"
@interface LeftMenuViewController ()
- (IBAction)switchController:(id)sender;
@end

@implementation LeftMenuViewController
@synthesize delegate;
@synthesize btnCities;
@synthesize btnClubs;
@synthesize btnIbizaMap;
@synthesize btnMyFav;
@synthesize btnNewsAndEvents;

@synthesize imgVCities;
@synthesize imgVClubs;
@synthesize imgVIbizaMap;
@synthesize imgVMyFav;
@synthesize imgVNewsAndEvents;
- (void)viewDidLayoutSubviews;
{
    [super viewDidLayoutSubviews];
//    self.scrollView.contentSize = CGRectInset(self.scrollView.bounds, 0, -1).size;
    /*
    btnCities = [UIButton buttonWithType: UIButtonTypeCustom];
    btnCities.tag = 0;
    [btnCities setFrame: CGRectMake(0.0f, 0.0f, 60.0f, 60.0f)];
    [btnCities setBackgroundImage:[UIImage imageNamed:@"menu_item_1_normal.png"] forState:UIControlStateDisabled];
    [btnCities setBackgroundImage:[UIImage imageNamed:@"menu_item_1_selected.png"] forState:UIControlStateNormal];
    [btnCities addTarget:self action:@selector(switchController:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: btnCities];
    [btnClubs setBackgroundImage:[UIImage imageNamed:@"menu_item_2_normal.png"] forState:UIControlStateDisabled];
    [btnClubs setBackgroundImage:[UIImage imageNamed:@"menu_item_2_selected.png"] forState:UIControlStateNormal];
    
    [btnIbizaMap setBackgroundImage:[UIImage imageNamed:@"menu_item_3_normal.png"] forState:UIControlStateDisabled];
    [btnIbizaMap setBackgroundImage:[UIImage imageNamed:@"menu_item_3_selected.png"] forState:UIControlStateNormal];
    
    [btnMyFav setBackgroundImage:[UIImage imageNamed:@"menu_item_4_normal.png"] forState:UIControlStateDisabled];
    [btnMyFav setBackgroundImage:[UIImage imageNamed:@"menu_item_4_selected.png"] forState:UIControlStateNormal];
    
    [btnNewsAndEvents setBackgroundImage:[UIImage imageNamed:@"menu_item_5_normal.png"] forState:UIControlStateDisabled];
    [btnNewsAndEvents setBackgroundImage:[UIImage imageNamed:@"menu_item_5_selected"] forState:UIControlStateNormal];
     */
    imgVCities = [[UIImageView alloc] init];
    [imgVCities setFrame: CGRectMake(0.0f, 0.0f, self.view.frame.size.width, 60.0f)];
    imgVCities.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|
                                  UIViewAutoresizingFlexibleWidth |
                                  UIViewAutoresizingFlexibleRightMargin;
    [self.view addSubview:imgVCities];
    [self stateOfButonCities:YES
              andButtonClubs:NO
            andButonIbizaMap:NO
               andButonMyFav:NO
       andButonNewsAndEvents:NO];
}

- (IBAction)switchController:(id)sender;
{
    ContentViewController *viewController;
    NewAndEventViewController *newAndEventViewController = [[NewAndEventViewController alloc] initWithNibName:@"NewAndEventViewController" bundle:nil];
    LbizaMapViewController *lbizaMapViewController = [[LbizaMapViewController alloc] initWithNibName:@"LbizaMapViewController" bundle:nil];
    switch ([sender tag]) {
        case 0:
            viewController = [[ContentViewController alloc] init];
            viewController.delegate = (id)delegate;
            viewController.kindOfTableView = kCityViewController;
            if (delegate)
                [delegate setIndicatorForSelectedTabMenu:kCityViewController];
            [self.sideMenuController setContentController:viewController animated:YES];
            [self stateOfButonCities:YES
                      andButtonClubs:NO
                    andButonIbizaMap:NO
                       andButonMyFav:NO
               andButonNewsAndEvents:NO];
            break;
        case 1:
            viewController = [[ContentViewController alloc] init];
            viewController.delegate = (id)delegate;
            viewController.kindOfTableView = kClubViewController;
            if (delegate)
                [delegate setIndicatorForSelectedTabMenu:kClubViewController];
            [self.sideMenuController setContentController:viewController animated:YES];
            [self stateOfButonCities:NO
                      andButtonClubs:YES
                    andButonIbizaMap:NO
                       andButonMyFav:NO
               andButonNewsAndEvents:NO];
            break;
        case 2:
            if (delegate) {
                [delegate presentToViewController:lbizaMapViewController];
            }
            [self stateOfButonCities:NO
                      andButtonClubs:NO
                    andButonIbizaMap:YES
                       andButonMyFav:NO
               andButonNewsAndEvents:NO];
            break;
        case 3:
            viewController = [[ContentViewController alloc] init];
            viewController.delegate = (id)delegate;
            viewController.kindOfTableView = kMyFavViewController;
            if (delegate)
                [delegate setIndicatorForSelectedTabMenu:kMyFavViewController];
            [self.sideMenuController setContentController:viewController animated:YES];

            [self stateOfButonCities:NO
                      andButtonClubs:NO
                    andButonIbizaMap:NO
                       andButonMyFav:YES
               andButonNewsAndEvents:NO];
            break;
        case 4:
            if (delegate) {
                [delegate presentToViewController:newAndEventViewController];
            }
            [self stateOfButonCities:NO
                      andButtonClubs:NO
                    andButonIbizaMap:NO
                       andButonMyFav:NO
               andButonNewsAndEvents:YES];
            break;
            
        default:
            break;
    }
    
}
- (void) stateOfButonCities:(BOOL) isEnablebtnCities
         andButtonClubs:(BOOL) isEnablebtnClubs
      andButonIbizaMap:(BOOL) isEnablebtnIbizaMap
    andButonMyFav:(BOOL) isEnablebtnMyFav
     andButonNewsAndEvents:(BOOL) isEnablebtnNewsAndEvents{
    if (isEnablebtnCities)
        [imgVCities setImage:[UIImage imageNamed:@"menu_item_1_normal.png"]];
    else
        [imgVCities setImage:[UIImage imageNamed:@"menu_item_1_selected.png"]];
    if (isEnablebtnClubs)
        [imgVClubs setImage:[UIImage imageNamed:@"menu_item_2_normal.png"]];
    else
        [imgVClubs setImage:[UIImage imageNamed:@"menu_item_2_selected.png"]];
    if (isEnablebtnIbizaMap)
        [imgVIbizaMap setImage:[UIImage imageNamed:@"menu_item_3_normal.png"]];
    else
        [imgVIbizaMap setImage:[UIImage imageNamed:@"menu_item_3_selected.png"]];
    if (isEnablebtnMyFav)
        [imgVMyFav setImage:[UIImage imageNamed:@"menu_item_4_normal.png"]];
    else
        [imgVMyFav setImage:[UIImage imageNamed:@"menu_item_4_selected.png"]];
    if (isEnablebtnNewsAndEvents)
        [imgVNewsAndEvents setImage:[UIImage imageNamed:@"menu_item_5_normal.png"]];
    else
        [imgVNewsAndEvents setImage:[UIImage imageNamed:@"menu_item_5_selected.png"]];
}
@end
