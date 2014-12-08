//
//  JDMenuViewController.h
//  JDSideMenu
//
//  Created by Markus Emrich on 11.11.13.
//  Copyright (c) 2013 Markus Emrich. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol JDMenuViewControllerDelegate;

@interface JDMenuViewController : UIViewController

@property (nonatomic, assign) id <JDMenuViewControllerDelegate> delegate;
@end

@protocol JDMenuViewControllerDelegate
@optional
- (void) presentToViewController:(UIViewController*) viewController;
@end
