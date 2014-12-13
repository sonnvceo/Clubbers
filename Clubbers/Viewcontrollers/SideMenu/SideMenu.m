//
//  JDSideMenu.m
//  StatusBarTest
//
//  Created by Markus Emrich on 11/11/13.
//  Copyright (c) 2013 Markus Emrich. All rights reserved.
//

#import "SideMenu.h"

// constants
const CGFloat JDSideMenuMinimumRelativePanDistanceToOpen = 0.33;
const CGFloat JDSideMenuDefaultMenuWidth = 60.0;
const CGFloat JDSideMenuDefaultDamping = 0.5;

// animation times
const CGFloat JDSideMenuDefaultOpenAnimationTime = 1.0;
const CGFloat JDSideMenuDefaultCloseAnimationTime = 0.3;

@interface SideMenu ()
@property (nonatomic, strong) UIImageView *backgroundView;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UITapGestureRecognizer *tapRecognizer;
@property (nonatomic, strong) UIPanGestureRecognizer *panRecognizer;
@end

@implementation SideMenu

- (id)initWithContentController:(UIViewController*)contentController
                 menuController:(UIViewController*)menuController;
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _contentController = contentController;
        _menuController = menuController;
        
        _menuWidth = JDSideMenuDefaultMenuWidth;
        _tapGestureEnabled = YES;
        _panGestureEnabled = YES;
    }
    return self;
}

#pragma mark UIViewController

- (void)viewDidLoad;
{
    [super viewDidLoad];
    
    // add childcontroller
    [self addChildViewController:self.menuController];
    [self.menuController didMoveToParentViewController:self];
    [self addChildViewController:self.contentController];
    [self.contentController didMoveToParentViewController:self];
    
    // add subviews
    _containerView = [[UIView alloc] initWithFrame:CGRectMake(3,
                                                              self.view.bounds.origin.y+1,
                                                              self.view.bounds.size.width,
                                                              self.view.bounds.size.height)];

    UIView *imgBackground = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1)];
    imgBackground.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:imgBackground];
    UIImageView *imgVCitiesIndicator = [[UIImageView alloc] initWithFrame:CGRectMake(0, 1, 12, 60)];
    [imgVCitiesIndicator setImage:[UIImage imageNamed:@"menu_shape_1.png"]];
    [self.view addSubview:imgVCitiesIndicator];
    //
    UIImageView *imgVClubIndicator = [[UIImageView alloc] initWithFrame:CGRectMake(0, 61, 12, 60)];
    [imgVClubIndicator setImage:[UIImage imageNamed:@"menu_shape_2.png"]];
    [self.view addSubview:imgVClubIndicator];
    //
    UIImageView *imgVLbizaMapIndicator = [[UIImageView alloc] initWithFrame:CGRectMake(0, 121, 12, 60)];
    [imgVLbizaMapIndicator setImage:[UIImage imageNamed:@"menu_shape_3.png"]];
    [self.view addSubview:imgVLbizaMapIndicator];
    //
    UIImageView *imgVMyFavIndicator = [[UIImageView alloc] initWithFrame:CGRectMake(0, 181, 12, 58)];
    [imgVMyFavIndicator setImage:[UIImage imageNamed:@"menu_shape_4.png"]];
    [self.view addSubview:imgVMyFavIndicator];
    //
    UIImageView *imgVNewsAndEventsIndicator = [[UIImageView alloc] initWithFrame:CGRectMake(0, 241, 12, 60)];
    [imgVNewsAndEventsIndicator setImage:[UIImage imageNamed:@"menu_shape_5.png"]];
    [self.view addSubview:imgVNewsAndEventsIndicator];
    
    _containerView.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;
    [self.containerView addSubview:self.contentController.view];
    self.contentController.view.frame = self.containerView.bounds;
    self.contentController.view.frame = CGRectMake(3,
                                                   self.containerView.bounds.origin.y +1,
                                                   self.containerView.bounds.size.width,
                                                   self.containerView.bounds.size.height);
    self.contentController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_containerView];
}

- (void)setBackgroundImage:(UIImage*)image;
{
    if (!self.backgroundView && image) {
        self.backgroundView = [[UIImageView alloc] initWithImage:image];
        self.backgroundView.frame = self.view.bounds;
        self.backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.view insertSubview:self.backgroundView atIndex:0];
    } else if (image == nil) {
        [self.backgroundView removeFromSuperview];
        self.backgroundView = nil;
    } else {
        self.backgroundView.image = image;
    }
}

#pragma mark controller replacement

- (void)setContentController:(UIViewController*)contentController
                    animated:(BOOL)animated;
{
    if (contentController == nil) return;
    UIViewController *previousController = self.contentController;
    _contentController = contentController;
    
    // add childcontroller
    [self addChildViewController:self.contentController];
    
    // add subview
    self.contentController.view.frame = CGRectMake(3,
                                                   self.containerView.bounds.origin.y +1,
                                                   self.containerView.bounds.size.width,
                                                   self.containerView.bounds.size.height);
    self.contentController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    // animate in
    __weak typeof(self) blockSelf = self;
    CGFloat offset = JDSideMenuDefaultMenuWidth + (self.view.frame.size.width-JDSideMenuDefaultMenuWidth)/2.0;
    [UIView animateWithDuration:JDSideMenuDefaultCloseAnimationTime/2.0 animations:^{
        blockSelf.containerView.transform = CGAffineTransformMakeTranslation(offset, 0);
       
    } completion:^(BOOL finished) {
        // move to container view
        [blockSelf.containerView addSubview:self.contentController.view];
        [blockSelf.contentController didMoveToParentViewController:blockSelf];
        
        // remove old controller
        [previousController willMoveToParentViewController:nil];
        [previousController removeFromParentViewController];
        [previousController.view removeFromSuperview];
        
        [blockSelf hideMenuAnimated:YES];
    }];
}
- (void)addMenuControllerView;
{
    if (self.menuController.view.superview == nil) {
        CGRect menuFrame, restFrame;
        CGRectDivide(self.view.bounds, &menuFrame, &restFrame, self.menuWidth, CGRectMinXEdge);
        self.menuController.view.frame = menuFrame;
        self.menuController.view.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;
        self.view.backgroundColor = self.menuController.view.backgroundColor;
        if (self.backgroundView)
            [self.view insertSubview:self.menuController.view aboveSubview:self.backgroundView];
        else [self.view insertSubview:self.menuController.view atIndex:0];
    }
}

- (void)showMenuAnimated:(BOOL)animated;
{
    [self showMenuAnimated:animated duration:JDSideMenuDefaultOpenAnimationTime
           initialVelocity:1.0];
}

- (void)showMenuAnimated:(BOOL)animated duration:(CGFloat)duration
         initialVelocity:(CGFloat)velocity;
{
    // add menu view
    [self addMenuControllerView];
    
    // animate
    __weak typeof(self) blockSelf = self;
    [UIView animateWithDuration:animated ? duration : 0.0 delay:0
         usingSpringWithDamping:JDSideMenuDefaultDamping initialSpringVelocity:velocity options:UIViewAnimationOptionAllowUserInteraction animations:^{
             blockSelf.containerView.transform = CGAffineTransformMakeTranslation(self.menuWidth, 0);
             self.contentController.view.frame = CGRectMake(self.view.bounds.origin.x-2,
                                                            self.view.bounds.origin.y +1,
                                                            self.view.bounds.size.width,
                                                            self.view.bounds.size.height);
         } completion: ^(BOOL finished){
             
         }];
}

- (void)hideMenuAnimated:(BOOL)animated;
{
    __weak typeof(self) blockSelf = self;
    [UIView animateWithDuration:JDSideMenuDefaultCloseAnimationTime animations:^{
        blockSelf.containerView.transform = CGAffineTransformIdentity;
        self.contentController.view.frame = CGRectMake(self.view.bounds.origin.x+2,
                                                       self.view.bounds.origin.y +1,
                                                       self.view.bounds.size.width,
                                                       self.view.bounds.size.height);
    } completion:^(BOOL finished) {
        [blockSelf.menuController.view removeFromSuperview];
    }];
}

#pragma mark State

- (BOOL)isMenuVisible;
{
    return !CGAffineTransformEqualToTransform(self.containerView.transform,
                                              CGAffineTransformIdentity);
}

@end
