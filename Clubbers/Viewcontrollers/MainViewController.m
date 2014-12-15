//
//  MainViewController.m
//  Clubbers
//
//  Created by SonNV on 12/3/14.
//  Copyright (c) 2014 Clubbers. All rights reserved.
//

#import "MainViewController.h"
#import "SideMenu.h"
#import "DefinitionAPI.h"
#import "NewAndEventViewController.h"
#import "LbizaMapViewController.h"
@interface MainViewController () {
    SlideShowView *slideShowView;
    SideMenu *sideMenu;
    
}
@end

@implementation MainViewController
@synthesize sideMenuSubView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //
//    UIBezierPath *maskPath;
//    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.view.bounds byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight) cornerRadii:CGSizeMake(10.0, 10.0)];
//    
//    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//    maskLayer.frame = self.view.bounds;
//    maskLayer.path = maskPath.CGPath;
//    self.view.layer.mask = maskLayer;
    
    UIImage*i1 = [UIImage imageNamed:@"1.jpg"];
    UIImage*i2 = [UIImage imageNamed:@"2.jpg"];
    UIImage*i3 = [UIImage imageNamed:@"3.jpg"];
    UIImage*i4 = [UIImage imageNamed:@"4.jpg"];
    UIImage*i5 = [UIImage imageNamed:@"5.jpg"];
    NSArray *images = @[i1,i2,i3,i4,i5];
    self.view.backgroundColor = [UIColor whiteColor];

//    slideShowView = [[SlideShowView alloc] initWithXibFile:(id)self];
//    slideShowView.typeOfViewController = kMasterViewController;
//    [slideShowView autoSlideShowAnimation:images];
//    [slideShowSubView addSubview:slideShowView];
    CGRect frameSlideShowView = CGRectMake(0, 0,self.view.bounds.size.width, 180);
    slideShowView = [[SlideShowView alloc] initWithFrame:frameSlideShowView];
    slideShowView.delegate = (id)self;
    [slideShowView autoSlideShowAnimation:images];
    
    slideShowView.autoresizingMask =    UIViewAutoresizingFlexibleLeftMargin|
                                        UIViewAutoresizingFlexibleWidth |
                                        UIViewAutoresizingFlexibleRightMargin |
                                        UIViewAutoresizingFlexibleTopMargin;

    [self.view addSubview:slideShowView];
    
    CGRect frameSideMenu = CGRectMake(0,
                               slideShowView.frame.size.height,
                               self.view.bounds.size.width,
                               self.view.bounds.size.height - slideShowView.frame.size.height);
    sideMenuSubView = [[UIView alloc] initWithFrame:frameSideMenu];
    sideMenuSubView.autoresizingMask =  UIViewAutoresizingFlexibleLeftMargin|
                                        UIViewAutoresizingFlexibleWidth |
                                        UIViewAutoresizingFlexibleRightMargin |
                                        UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:sideMenuSubView];
    
    LeftMenuViewController *menuController = [[LeftMenuViewController alloc] init];
    menuController.delegate = self;
    ContentViewController *contentController = [[ContentViewController alloc] init];
    [contentController setSizeFrameTableView:sideMenuSubView.frame];
    contentController.delegate = self;
    sideMenu = [[SideMenu alloc] initWithContentController:contentController
                                              menuController:menuController];
    [sideMenuSubView addSubview:sideMenu.view];
    
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.delegate = (id)self;
    HUD.labelText = @"Loading...";
    [self showMBProgressHUD];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self showMenuRight];
    [slideShowView stateOfButonMenuAndButtonBack:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
#pragma mark - SlideShowViewDelegate
- (void) showMenuLeft{
    [sideMenu showMenuAnimated:YES];
}
- (void)showMenuRight {
    [sideMenu hideMenuAnimated:YES];
}
- (void) presentToDetailViewController:(NSInteger) selectedRow {
    TownDetailViewController *townDetailViewController = [[TownDetailViewController alloc]
                                                          initWithNibName:@"TownDetailViewController"
                                                          bundle:nil];
    townDetailViewController.townID = selectedRow;
    [self.navigationController pushViewController:townDetailViewController animated:YES];
}
#pragma mark - JDMenuViewControllerDelegate
- (void) presentToViewController:(UIViewController*) viewController {
    if (viewController) {
        if ([viewController isKindOfClass:[LbizaMapViewController class]])
            [sideMenu setImgVForSelectedTabMenu:kLbizaMApViewController];
        else if ([viewController isKindOfClass:[NewAndEventViewController class]])
            [sideMenu setImgVForSelectedTabMenu:kNewsAndEventsViewController];
       [self.navigationController pushViewController:viewController animated:YES];
    }
}
- (void) setIndicatorForSelectedTabMenu:(NSInteger) kKindOfViewController {
  [sideMenu setImgVForSelectedTabMenu:kKindOfViewController];
}
#pragma mark - ContentViewControllerDelegate
- (void) disableBackMenuButton {
    [slideShowView stateOfButonMenuAndButtonBack:YES];
}
- (void)dismissMBProgressHUD {
    [HUD hide:TRUE];
}
- (void)showMBProgressHUD {
    [HUD show:TRUE];
}

@end
