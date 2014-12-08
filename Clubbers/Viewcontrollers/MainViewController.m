//
//  MainViewController.m
//  Clubbers
//
//  Created by SonNV on 12/3/14.
//  Copyright (c) 2014 Clubbers. All rights reserved.
//

#import "MainViewController.h"
#import "JDSideMenu.h"

@interface MainViewController () {
    SlideShowView *slideShowView;
    JDSideMenu *sideMenu;
    
}
@end

@implementation MainViewController
@synthesize slideShowSubView;
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
    self.navigationController.navigationBarHidden = YES;
    
    slideShowView = [[SlideShowView alloc] initWithXibFile:(id)self];
    [slideShowSubView addSubview:slideShowView];
    
    JDMenuViewController *menuController = [[JDMenuViewController alloc] init];
    menuController.delegate = self;
    TPMenuViewController *contentController = [[TPMenuViewController alloc] init];
    contentController.delegate = self;
    sideMenu = [[JDSideMenu alloc] initWithContentController:contentController
                                              menuController:menuController];
    [sideMenuSubView addSubview:sideMenu.view];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
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
- (void) presentToViewController {
    TownDetailViewController *townDetailViewController = [[TownDetailViewController alloc]
                                                          initWithNibName:@"TownDetailViewController"
                                                          bundle:nil];
    [self.navigationController pushViewController:townDetailViewController animated:YES];
}
#pragma mark - JDMenuViewControllerDelegate
- (void) presentToViewController:(UIViewController*) viewController {
    if (viewController)
    [self.navigationController pushViewController:viewController animated:YES];
}
@end
