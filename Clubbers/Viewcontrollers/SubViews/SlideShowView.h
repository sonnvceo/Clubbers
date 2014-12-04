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
}

@property (nonatomic, assign) id <SlideShowViewDelegate> delegate;
- (id)initWithXibFile:(id <SlideShowViewDelegate>)del ;
//- (IBAction)btnInfo:(id)sender;
@end
@protocol SlideShowViewDelegate

@optional

@end
