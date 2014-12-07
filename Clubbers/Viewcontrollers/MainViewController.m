//
//  MainViewController.m
//  Clubbers
//
//  Created by SonNV on 12/3/14.
//  Copyright (c) 2014 Clubbers. All rights reserved.
//

#import "MainViewController.h"
#import "JDSideMenu.h"
#import "JDMenuViewController.h"

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
    self.view.layer.cornerRadius = 5;
    self.view.layer.masksToBounds = YES;
    
    slideShowView = [[SlideShowView alloc] initWithXibFile:(id)self];
    [slideShowSubView addSubview:slideShowView];
    
    UIViewController *menuController = [[JDMenuViewController alloc] init];
    TPMenuViewController *contentController = [[TPMenuViewController alloc] init];
    contentController.delegate = self;
    sideMenu = [[JDSideMenu alloc] initWithContentController:contentController
                                              menuController:menuController];
    [sideMenuSubView addSubview:sideMenu.view];
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
    [self presentViewController:townDetailViewController animated:NO completion:nil];
}
@end
