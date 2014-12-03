//
//  BookingView.m
//  HiTaxi
//
//  Created by Sonnv on 4/18/13.
//  Copyright (c) 2013 TOPPRO. All rights reserved.
//

#import "SlideShowView.h"

@interface SlideShowView ()
{
 }
@end

@implementation SlideShowView

static SlideShowView* _instance = nil;

+(SlideShowView*) sharedInstance
{
    @synchronized(self) {
        if (_instance == nil)
            _instance = [[SlideShowView alloc] init];
    }
    return _instance;
}
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    return self;
}
- (id)initWithXibFile:(id <SlideShowViewDelegate>)del {
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"SlideShowView" owner:self options:nil] objectAtIndex:0];
        [self setDelegate:del];
    }
    return self;
}

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

//- (IBAction)btnBackOldPosition:(id)sender
//{
//
//}
@end

