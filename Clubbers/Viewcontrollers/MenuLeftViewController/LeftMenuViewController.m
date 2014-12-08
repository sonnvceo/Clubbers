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
- (void)viewDidLayoutSubviews;
{
    [super viewDidLayoutSubviews];
//    self.scrollView.contentSize = CGRectInset(self.scrollView.bounds, 0, -1).size;
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
            break;
        case 1:
            viewController = [[TPMenuViewController alloc] init];
            viewController.delegate = (id)delegate;
            viewController.kindOfTableView = kClubViewController;
            [self.sideMenuController setContentController:viewController animated:YES];
            break;
        case 2:
            if (delegate) {
                [delegate presentToViewController:lbizaMapViewController];
            }
            break;
        case 3:

            break;
        case 4:
            if (delegate) {
                [delegate presentToViewController:newAndEventViewController];
            }
            break;
            
        default:
            break;
    }
    
}

@end