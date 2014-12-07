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
    switch ([sender tag]) {
        case 0:
            viewController = [[TPMenuViewController alloc] init];
            viewController.kindOfTableView = kCityViewController;
            break;
        case 1:
            viewController = [[TPMenuViewController alloc] init];
            viewController.kindOfTableView = kClubViewController;
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        case 4:
            
            break;
            
        default:
            break;
    }
    [self.sideMenuController setContentController:viewController animated:YES];
}

@end
