//
//  TownDetailCell.m
//  ReadMoreCell
//
//  Created by Camilo Castro on 04-06-14.
//  Copyright (c) 2014 Cervezapps. All rights reserved.
//

#import "TownDetailCell.h"

#define kWidth      106
#define kHeight     106
#define kInterval   1
#define kNumRow     2
#define kNumColumn  3


@implementation TownDetailCell
@synthesize btnReadMore;
@synthesize textView;
@synthesize contentView;
@synthesize isBtnReadmore;
- (void)layoutSubviews {

}
- (void) creatSubviews {
    // add buttons
    UIButton* btnreadMore = [UIButton buttonWithType: UIButtonTypeCustom];
    [btnreadMore setFrame: CGRectMake(10.0f, 20.0f, 30.0f, 30.0f)];
    [btnreadMore setBackgroundImage:[UIImage imageNamed:@"ic_back_disable.png"] forState:UIControlStateNormal];
    [btnreadMore addTarget:self action:@selector(readMore:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview: btnreadMore];
    //
    CGRect textViewFrame = CGRectMake(20.0f, 20.0f, 280.0f, 124.0f);
    textView = [[UITextView alloc] initWithFrame:textViewFrame];
    textView.returnKeyType = UIReturnKeyDone;
    textView.text = @"Resigning the keyboard when the background is tapped can be accomplished in different ways. The code below is an example of one such technique. Click on the file and add the following method implementation:";
    [self addSubview:textView];
    
    CGRect frame = CGRectMake(0, 0, kWidth, kHeight);
    CGRect contentViewFrame = CGRectMake(0, 88, self.frame.size.width, 212);
    contentView = [[UIView alloc] initWithFrame:contentViewFrame];
    contentView.backgroundColor = [UIColor grayColor];
    [self addSubview:contentView];
    for (int j=0; j<kNumRow; j++) {
        for (int i=0; i<kNumColumn; i++) {
            CGPoint origin = CGPointMake((kWidth + kInterval) * i,(kHeight + kInterval) * j);
            frame.origin = origin;
            UIImageView *imageView = [self generateUIImageViewWithFrame:frame];
            UILabel *label = [self generateUILabelWithFrame:CGRectMake(0, frame.size.height-20, kWidth, 20)];
            label.adjustsFontSizeToFitWidth = YES;
            [imageView addSubview:label];
            [contentView addSubview:imageView];
        }
    }
    if (isBtnReadmore) {
        [contentView setFrame:CGRectMake(contentView.frame.origin.x,
                                         contentView.frame.origin.y+200,
                                         contentView.frame.size.width,
                                         contentView.frame.size.height)];
    }
    
}
#pragma mark -------------------------------------------------------------------
#pragma mark Private

- (UIImageView *)generateUIImageViewWithFrame:(CGRect)frame {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.backgroundColor = [UIColor clearColor];
    imageView.image = [UIImage imageNamed:@"main_page1.png"];
    return imageView;
}

- (UILabel *)generateUILabelWithFrame:(CGRect)frame {
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.textAlignment = UITextAlignmentCenter;
    label.backgroundColor = [UIColor blackColor];
    label.alpha = 0.7;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"Futura-Medium" size:17.0f];
    //    label.text = @"SonNV";
    return label;
}

- (IBAction)readMore:(id)sender {
  [self.delegate didActivateReadMoreForCell:self];
}

@end
