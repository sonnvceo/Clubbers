//
//  BookingView.h
//  HiTaxi
//
//  Created by Sonnv on 4/18/13.
//  Copyright (c) 2013 TOPPRO. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SlideShowViewDelegate;


@interface SlideShowView : UIView <UIScrollViewDelegate> {
    UIScrollView *_scrollview;
    UIPageControl *_pgcontrol;
    NSArray *_images;
    UIImageView *_backgroundimageview;
    UIButton *btnMenu;
    UIButton *btnBack;
}

@property (nonatomic, assign) id <SlideShowViewDelegate> delegate;
@property(assign, nonatomic) NSInteger typeOfViewController;
- (id)initWithXibFile:(id <SlideShowViewDelegate>)del ;
- (void) stateOfButonMenuAndButtonBack:(BOOL) isEnable ;
- (void) autoSlideShowAnimation:(NSArray*) arrayImage;
@end
@protocol SlideShowViewDelegate
@optional
- (void) showMenuLeft;
- (void) showMenuRight;
- (void) popToRootViewController;
@end
