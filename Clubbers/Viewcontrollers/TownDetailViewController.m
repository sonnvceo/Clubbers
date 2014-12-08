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
#import "TPMenuViewController.h"


@interface TownDetailViewController () {
    SlideShowView *slideShowView;
    SideMenu *sideMenu;
    
}
@end

@implementation TownDetailViewController
@synthesize slideShowSubView;
@synthesize sideMenuSubView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //
    self.view.layer.cornerRadius = 5;
    self.view.layer.masksToBounds = YES;
    
    self.navigationController.navigationBarHidden = YES;
    slideShowView = [[SlideShowView alloc] initWithXibFile:(id)self];
    [slideShowSubView addSubview:slideShowView];
    
    UIViewController *menuController = [[LeftMenuViewController alloc] init];
    TPMenuViewController *contentController = [[TPMenuViewController alloc] init];
    sideMenu = [[SideMenu alloc] initWithContentController:contentController
                                              menuController:menuController];
//    [sideMenuSubView addSubview:sideMenu.view];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnDismiss:(id)sender {
   [self.navigationController popToRootViewControllerAnimated:YES];
}
#pragma mark - SlideShowViewDelegate
- (void) showMenuLeft{
    [sideMenu showMenuAnimated:YES];
}
- (void)showMenuRight {
    [sideMenu hideMenuAnimated:YES];
}
@end
