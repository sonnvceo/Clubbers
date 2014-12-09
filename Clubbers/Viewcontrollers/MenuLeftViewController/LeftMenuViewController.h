//
//  JDMenuViewController.h
//  JDSideMenu
//
//  Created by Markus Emrich on 11.11.13.
//  Copyright (c) 2013 Markus Emrich. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LeftMenuViewControllerDelegate;

@interface LeftMenuViewController : UIViewController

@property (nonatomic, assign) id <LeftMenuViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIButton *btnCities;
@property (strong, nonatomic) IBOutlet UIButton *btnClubs;
@property (strong, nonatomic) IBOutlet UIButton *btnIbizaMap;
@property (strong, nonatomic) IBOutlet UIButton *btnMyFav;
@property (strong, nonatomic) IBOutlet UIButton *btnNewsAndEvents;
- (void) stateOfButonCities:(BOOL) isEnablebtnCities
             andButtonClubs:(BOOL) isEnablebtnClubs
           andButonIbizaMap:(BOOL) isEnablebtnIbizaMap
              andButonMyFav:(BOOL) isEnablebtnMyFav
      andButonNewsAndEvents:(BOOL) isEnablebtnNewsAndEvents;
@end

@protocol LeftMenuViewControllerDelegate
@optional
- (void) presentToViewController:(UIViewController*) viewController;
@end
