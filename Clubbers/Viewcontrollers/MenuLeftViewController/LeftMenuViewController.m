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
#import "TPMenuViewController.h"
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
- (void)viewDidLayoutSubviews;
{
    [super viewDidLayoutSubviews];
//    self.scrollView.contentSize = CGRectInset(self.scrollView.bounds, 0, -1).size;
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
}

- (IBAction)switchController:(id)sender;
{
    TPMenuViewController *viewController;
    NewAndEventViewController *newAndEventViewController = [[NewAndEventViewController alloc] initWithNibName:@"NewAndEventViewController" bundle:nil];
    LbizaMapViewController *lbizaMapViewController = [[LbizaMapViewController alloc] initWithNibName:@"LbizaMapViewController" bundle:nil];
    switch ([sender tag]) {
        case 0:
            viewController = [[TPMenuViewController alloc] init];
            viewController.delegate = (id)delegate;
            viewController.kindOfTableView = kCityViewController;
            [self.sideMenuController setContentController:viewController animated:YES];
            [self stateOfButonCities:NO
                      andButtonClubs:YES
                    andButonIbizaMap:YES
                       andButonMyFav:YES
               andButonNewsAndEvents:YES];
            break;
        case 1:
            viewController = [[TPMenuViewController alloc] init];
            viewController.delegate = (id)delegate;
            viewController.kindOfTableView = kClubViewController;
            [self.sideMenuController setContentController:viewController animated:YES];
            [self stateOfButonCities:YES
                      andButtonClubs:NO
                    andButonIbizaMap:YES
                       andButonMyFav:YES
               andButonNewsAndEvents:YES];
            break;
        case 2:
            if (delegate) {
                [delegate presentToViewController:lbizaMapViewController];
            }
            [self stateOfButonCities:YES
                      andButtonClubs:YES
                    andButonIbizaMap:NO
                       andButonMyFav:YES
               andButonNewsAndEvents:YES];
            break;
        case 3:
            [self stateOfButonCities:YES
                      andButtonClubs:YES
                    andButonIbizaMap:YES
                       andButonMyFav:NO
               andButonNewsAndEvents:YES];
            break;
        case 4:
            if (delegate) {
                [delegate presentToViewController:newAndEventViewController];
            }
            [self stateOfButonCities:YES
                      andButtonClubs:YES
                    andButonIbizaMap:YES
                       andButonMyFav:YES
               andButonNewsAndEvents:NO];
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
        btnCities.enabled = YES;
    else
        btnCities.enabled = NO;
    if (isEnablebtnClubs)
        btnClubs.enabled = YES;
    else
        btnClubs.enabled = NO;
    if (isEnablebtnIbizaMap)
        btnIbizaMap.enabled = YES;
    else
        btnIbizaMap.enabled = NO;
    if (isEnablebtnMyFav)
        btnMyFav.enabled = YES;
    else
        btnMyFav.enabled = NO;
    if (isEnablebtnNewsAndEvents)
        btnNewsAndEvents.enabled = YES;
    else
        btnNewsAndEvents.enabled = NO;
}
@end
