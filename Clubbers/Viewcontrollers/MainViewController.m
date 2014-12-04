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
#import "TPMenuViewController.h"
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
    self.navigationController.navigationBarHidden = YES;
    slideShowView = [[SlideShowView alloc] initWithXibFile:(id)self];
    [slideShowSubView addSubview:slideShowView];
    
    UIViewController *menuController = [[JDMenuViewController alloc] init];
    TPMenuViewController *contentController = [[TPMenuViewController alloc] init];
    sideMenu = [[JDSideMenu alloc] initWithContentController:contentController
                                              menuController:menuController];
    UIButton *btnMenu = [UIButton buttonWithType: UIButtonTypeCustom];
    [btnMenu setFrame: CGRectMake(280.0f, 10.0f, 30.0f, 20.0f)];
    [[btnMenu layer] setBackgroundColor: [[UIColor redColor] CGColor]];
    [btnMenu addTarget:self action:@selector(btnMenu:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: btnMenu];
    
    UIButton *btnBack = [UIButton buttonWithType: UIButtonTypeCustom];
    [btnBack setFrame: CGRectMake(10.0f, 10.0f, 30.0f, 20.0f)];
    [[btnBack layer] setBackgroundColor: [[UIColor blueColor] CGColor]];
    [btnBack addTarget:self action:@selector(btnBackMenu:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: btnBack];
    [sideMenuSubView addSubview:sideMenu.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
- (IBAction)btnMenu:(id)sender
{
    [sideMenu showMenuAnimated:YES];
}
- (IBAction)btnBackMenu:(id)sender
{
    [sideMenu hideMenuAnimated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
