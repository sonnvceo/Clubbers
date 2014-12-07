//
//  MainViewController.h
//  Clubbers
//
//  Created by SonNV on 12/3/14.
//  Copyright (c) 2014 Clubbers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideShowView.h"

@interface LbizaMapViewController : UIViewController<SlideShowViewDelegate,
                                                        UITableViewDelegate,
                                                        UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UIButton *btnBack;
@property (strong, nonatomic) IBOutlet UIButton *button1;
@property (strong, nonatomic) IBOutlet UIButton *buttonClub;
@property (strong, nonatomic) IBOutlet UIButton *buttonShopping;
@property (strong, nonatomic) IBOutlet UIButton *buttonRestaurant;
@property (strong, nonatomic) IBOutlet UIButton *buttonFavourite;
@property (strong, nonatomic) IBOutlet UITableView *tableview;

@end
