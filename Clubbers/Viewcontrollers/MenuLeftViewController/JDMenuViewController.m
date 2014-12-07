//
//  JDMenuViewController.m
//  JDSideMenu
//
//  Created by Markus Emrich on 11.11.13.
//  Copyright (c) 2013 Markus Emrich. All rights reserved.
//

#import "UIViewController+JDSideMenu.h"
#import "DefinitionAPI.h"
#import "JDMenuViewController.h"
#import "TPMenuViewController.h"
#import "NewAndEventViewController.h"
#import "LbizaMapViewController.h"
@interface JDMenuViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)switchController:(id)sender;
@end

@implementation JDMenuViewController

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
            viewController.kindOfTableView = kCityViewController;
            [self.sideMenuController setContentController:viewController animated:YES];
            break;
        case 1:
            viewController = [[TPMenuViewController alloc] init];
            viewController.kindOfTableView = kClubViewController;
            [self.sideMenuController setContentController:viewController animated:YES];
            break;
        case 2:
            
            break;
        case 3:
            [self presentViewController:lbizaMapViewController animated:NO completion:nil];
            break;
        case 4:
            [self presentViewController:newAndEventViewController animated:NO completion:nil];
            break;
            
        default:
            break;
    }
    
}

@end
