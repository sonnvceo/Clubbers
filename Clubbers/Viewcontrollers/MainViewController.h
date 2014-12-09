//
//  MainViewController.h
//  Clubbers
//
//  Created by SonNV on 12/3/14.
//  Copyright (c) 2014 Clubbers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideShowView.h"
#import "TPMenuViewController.h"
#import "TownDetailViewController.h" 
#import "LeftMenuViewController.h"
#import "MBProgressHUD.h"

@interface MainViewController : UIViewController<SlideShowViewDelegate,
                                                 TPMenuViewControllerDelegate,
                                                 LeftMenuViewControllerDelegate> {
    MBProgressHUD *HUD;
  }
@property (strong, nonatomic) IBOutlet UIView *slideShowSubView;
@property (strong, nonatomic) IBOutlet UIView *sideMenuSubView;

@end
