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
@synthesize textView;
@synthesize contentSubView;
@synthesize isBtnReadmore;
@synthesize realHeightOfTextView;

- (void) configueCellAtIndexPath:(NSIndexPath*) indexPath withTownDetai:(TownDetailModel *) townDetail {
    switch (indexPath.row) {
        case 0:
            
            break;
        case 1:
            [self creatSubviews:(TownDetailModel *) townDetail];
            break;
        default:
            break;
    }
}
- (void) creatSubviews:(TownDetailModel *) townDetail {
    
    [self hideContentOfCell];
    CGRect textViewFrame = CGRectMake(10.0f, 15.0f, 280.0f, 50.0f);
    textView = [[UITextView alloc] initWithFrame:textViewFrame];
    textView.returnKeyType = UIReturnKeyDone;
    textView.userInteractionEnabled = NO;
    textView.showsHorizontalScrollIndicator = NO;
    textView.scrollEnabled = NO;
    if (townDetail.townDescription)
       textView.text = townDetail.shortOverview;
    [self addSubview:textView];
    // add buttons
     btnreadMore = [UIButton buttonWithType: UIButtonTypeCustom];
    [btnreadMore setFrame: CGRectMake(10.0f,
                                      textView.frame.origin.y + textView.frame.size.height,
                                      100.0f,
                                      20.0f)];
    [btnreadMore setTitle:@"Read more..." forState:UIControlStateNormal];
    btnreadMore.backgroundColor = [UIColor clearColor];
    [btnreadMore setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
    btnreadMore.titleLabel.font = [UIFont boldSystemFontOfSize:12];
    btnreadMore.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [btnreadMore addTarget:self action:@selector(readMore:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview: btnreadMore];
    
    CGRect frame = CGRectMake(0, 0, kWidth, kHeight);
    CGRect contentSubViewFrame = CGRectMake(0, 88, self.frame.size.width, 212);
    contentSubView = [[UIView alloc] initWithFrame:contentSubViewFrame];
    contentSubView.backgroundColor = [UIColor clearColor];
    [self addSubview:contentSubView];
    for (int j=0; j<kNumRow; j++) {
        for (int i=0; i<kNumColumn; i++) {
            CGPoint origin = CGPointMake((kWidth + kInterval) * i,(kHeight + kInterval) * j);
            frame.origin = origin;
            UIImageView *imageView = [self generateUIImageViewWithFrame:frame];
            UILabel *label = [self generateUILabelWithFrame:CGRectMake(0, frame.size.height-20, kWidth, 20)];
            label.adjustsFontSizeToFitWidth = YES;
            UIView *subView = [[UIView alloc] initWithFrame:label.frame];
            subView.backgroundColor = [UIColor blackColor];
            subView.alpha = 0.7;
            [imageView addSubview:subView];
            [imageView addSubview:label];
            [contentSubView addSubview:imageView];
        }
    }
    // add title lable
    UILabel *lbOverView = [[UILabel alloc] initWithFrame:CGRectMake(10, -5, 100, 30)];
    lbOverView.textColor = [UIColor blackColor];
    lbOverView.backgroundColor=[UIColor clearColor];
    lbOverView.textColor=[UIColor grayColor];
    lbOverView.userInteractionEnabled=NO;
    lbOverView.font = [UIFont boldSystemFontOfSize:13];
    lbOverView.numberOfLines = 1;
    lbOverView.text= @"Overview";
    [self addSubview:lbOverView];

    [self addSubview: btnreadMore];
    realHeightOfTextView = [self textViewHeightForAttributedText:textView.attributedText andWidth:textView.frame.size.width];
    if (isBtnReadmore) {
        [btnreadMore setFrame:CGRectMake(btnreadMore.frame.origin.x,
                                      realHeightOfTextView+5,
                                      btnreadMore.frame.size.width,
                                      btnreadMore.frame.size.height)];
        [textView setFrame:CGRectMake(textView.frame.origin.x,
                                      textView.frame.origin.y,
                                      textView.frame.size.width,
                                      realHeightOfTextView)];
        [contentSubView setFrame:CGRectMake(contentSubView.frame.origin.x,
                                         realHeightOfTextView + btnreadMore.frame.size.height +5,
                                         contentSubView.frame.size.width,
                                         contentSubView.frame.size.height)];
    }
    
}
- (CGFloat)textViewHeightForAttributedText: (NSAttributedString*)text andWidth: (CGFloat)width {
    UITextView *calculationView = [[UITextView alloc] init];
    [calculationView setAttributedText:text];
    CGSize size = [calculationView sizeThatFits:CGSizeMake(width, FLT_MAX)];
    return size.height;
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
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:12];//[UIFont fontWithName:@"Futura-Medium" size:13.0f];
    label.text = @"Town Guide";
    return label;
}

- (IBAction)readMore:(id)sender {
  [self.delegate didActivateReadMoreForCell:self];
}
- (void) hideContentOfCell {
    self.lblTitle.hidden = YES;
    self.lblTemperature.hidden = YES;
    self.lblDescription.hidden = YES;
    self.imgTemperature.hidden = YES;
    self.imgWeatherCloundly. hidden = YES;
}
@end
