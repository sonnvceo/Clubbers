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

- (void)layoutSubviews {
}
- (void) creatSubviews {
    CGRect frame = CGRectMake(0, 0, kWidth, kHeight);
    for (int j=0; j<kNumRow; j++) {
        for (int i=0; i<kNumColumn; i++) {
            CGPoint origin = CGPointMake((kWidth + kInterval) * i, (kHeight + kInterval) * j);
            frame.origin = origin;
            UIImageView *imageView = [self generateUIImageViewWithFrame:frame];
            UILabel *label = [self generateUILabelWithFrame:CGRectMake(0, frame.size.height-20, kWidth, 20)];
            label.adjustsFontSizeToFitWidth = YES;
            [imageView addSubview:label];
        }
    }
}
#pragma mark -------------------------------------------------------------------
#pragma mark Private

- (UIImageView *)generateUIImageViewWithFrame:(CGRect)frame {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.backgroundColor = [UIColor clearColor];
    imageView.image = [UIImage imageNamed:@"main_page1.png"];
    [self addSubview:imageView];
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
