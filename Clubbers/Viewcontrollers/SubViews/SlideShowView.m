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
        [self createSubviews];
        [[NSTimer scheduledTimerWithTimeInterval:3
                                          target:self
                                        selector:@selector(ButtonPushed)
                                        userInfo:Nil
                                         repeats:YES] fire];
    }
    return self;
}
- (void) createSubviews {
    //check views length
    UIImage*i1 = [UIImage imageNamed:@"1.jpg"];
    UIImage*i2 = [UIImage imageNamed:@"2.jpg"];
    UIImage*i3 = [UIImage imageNamed:@"3.jpg"];
    UIImage*i4 = [UIImage imageNamed:@"4.jpg"];
    UIImage*i5 = [UIImage imageNamed:@"5.jpg"];
    NSArray *images = @[i1,i2,i3,i4,i5];
    NSAssert(images.count!=0, @".views's length is zero.");
    
    /**
     *  setup viewcontroller
     */
    self.backgroundColor = [UIColor whiteColor];
//    self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    _images = images;
    
    /**
     *  positions
     */
    CGRect svrect_ = CGRectZero;
    svrect_.size.height = self.bounds.size.height;// /3*2;
    svrect_.size.width = self.bounds.size.width; // /3*2;
    CGPoint svcenter_ = CGPointZero;
    svcenter_.x = self.center.x;
    svcenter_.y = self.center.y-50;
    CGSize svconsize = CGSizeZero;
    svconsize.height = svrect_.size.height;
    svconsize.width = svrect_.size.width * images.count;
    
    CGPoint pgconcenter_ = CGPointZero;
    pgconcenter_.x = self.center.x + 110;
    pgconcenter_.y = svcenter_.y + 65;
    
    CGRect btnrect_ = CGRectZero;
    btnrect_.size.width = 250;
    btnrect_.size.height = 50;
    CGPoint btncenter_ = CGPointZero;
    btncenter_.x = self.center.x;
    btncenter_.y = self.bounds.size.height-65;
    
    /*
     Views
     */
    _backgroundimageview = [[UIImageView alloc] initWithFrame:self.bounds];
    [self addSubview:_backgroundimageview];
    
    _scrollview = [[UIScrollView alloc] initWithFrame:svrect_];
    _scrollview.center = svcenter_;
    _scrollview.backgroundColor = [UIColor redColor];
    _scrollview.contentSize = svconsize;
    _scrollview.pagingEnabled = true;
    _scrollview.bounces = false;
    _scrollview.delegate = self;
    _scrollview.layer.borderWidth = 0.5f;
    _scrollview.layer.borderColor = [UIColor colorWithWhite:0.8 alpha:1].CGColor;
    _scrollview.showsHorizontalScrollIndicator = false;
    _scrollview.layer.cornerRadius = 2;
    [self addSubview:_scrollview];
    
    _pgcontrol = [[UIPageControl alloc] initWithFrame:CGRectZero];
    _pgcontrol.pageIndicatorTintColor = [UIColor colorWithWhite:0.8 alpha:1];
    _pgcontrol.currentPageIndicatorTintColor = [UIColor colorWithWhite:0.6 alpha:1];
    _pgcontrol.numberOfPages = _images.count;
    _pgcontrol.currentPage = 0;
    [_pgcontrol sizeToFit];
    _pgcontrol.center = pgconcenter_;
    [self addSubview:_pgcontrol];
    
    int index_ = 0;
    for (UIImage*image_ in images) {
        NSAssert([image_ isKindOfClass:[UIImage class]],@".views are not only UIImage.");
        CGRect ivrect_ = CGRectMake(_scrollview.bounds.size.width * index_,
                                    0,
                                    _scrollview.bounds.size.width,
                                    _scrollview.bounds.size.height);
        UIImageView*iv_ = [[UIImageView alloc] initWithFrame:ivrect_];
        iv_.contentMode = UIViewContentModeScaleAspectFill;
        iv_.clipsToBounds = true;
        iv_.image = image_;
        [_scrollview addSubview:iv_];
        index_++;
    }

}
-(void)ButtonPushed{
    int page_ = (int)round(_scrollview.contentOffset.x / _scrollview.frame.size.width);
    /**
     *  scroll or finish
     */
    if (page_!=(_images.count-1)) {
        CGRect rect = _scrollview.frame;
        rect.origin.x = rect.size.width * (page_+1);
        [_scrollview scrollRectToVisible:rect animated:true];
        _pgcontrol.currentPage = page_ +1;
    }
    else {
        [_scrollview setContentOffset:CGPointMake(0,0) animated:YES];
        _pgcontrol.currentPage = 0;
    }
}
UIImage *(^createImageFromUIColor)(UIColor *) = ^(UIColor *color)
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(contextRef, [color CGColor]);
    CGContextFillRect(contextRef, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
};
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

