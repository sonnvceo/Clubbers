//
//  TownDetailCell.m
//  ReadMoreCell
//
//  Created by Camilo Castro on 04-06-14.
//  Copyright (c) 2014 Cervezapps. All rights reserved.
//

#import "TownDetailCell.h"
#import "DefinitionAPI.h"

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
            [self showContentOfCell: YES withTownDetai:townDetail];
            break;
        case 1:
            [self creatSubviews:(TownDetailModel *) townDetail];
            break;
        default:
            break;
    }
}
- (void) creatSubviews:(TownDetailModel *) townDetail {
    
    [self showContentOfCell: NO withTownDetai:townDetail];
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
    
    CGRect textViewFrame = CGRectMake(10.0f, 15.0f, 280.0f, 50.0f);
    textView = [[UITextView alloc] initWithFrame:textViewFrame];
    textView.returnKeyType = UIReturnKeyDone;
    textView.userInteractionEnabled = NO;
    textView.showsHorizontalScrollIndicator = NO;
    textView.scrollEnabled = NO;
    textView.text = @"N/A";
    textView.backgroundColor = [UIColor clearColor];
    // uiview fullOverview
    UITextView *textViewFullOverview = [[UITextView alloc] initWithFrame:textViewFrame];
    textViewFullOverview.text = townDetail.fullOverview;
    float heightTextViewFullOverview = [self textViewHeightForAttributedText:textViewFullOverview.attributedText andWidth:textView.frame.size.width];
    if (townDetail.shortOverview)
       textView.text = townDetail.shortOverview;
    realHeightOfTextView = [self textViewHeightForAttributedText:textView.attributedText andWidth:textView.frame.size.width];
    heightCellExpanding = heightTextViewFullOverview - realHeightOfTextView;
    [textView setFrame:CGRectMake(textView.frame.origin.x,
                                  textView.frame.origin.y,
                                  textView.frame.size.width,
                                  realHeightOfTextView)];
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
    btnreadMore.titleLabel.font = [UIFont systemFontOfSize:12];
    btnreadMore.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [btnreadMore addTarget:self action:@selector(readMore:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview: btnreadMore];
    
    CGRect frame = CGRectMake(0, 0, kWidth, kHeight);
    CGRect contentSubViewFrame = CGRectMake(0, 88, self.frame.size.width, 212);
    contentSubView = [[UIView alloc] initWithFrame:contentSubViewFrame];
    contentSubView.backgroundColor = [UIColor clearColor];
    [self addSubview:contentSubView];
    if ([townDetail.imageGallerys isKindOfClass:[NSArray class]]) {
        arrayImages = townDetail.imageGallerys;
    }
    
    for (int j=0; j<kNumRow; j++) {
        for (int i=0; i<kNumColumn; i++) {
            CGPoint origin = CGPointMake((kWidth + kInterval) * i,(kHeight + kInterval) * j);
            frame.origin = origin;
            UIImageView *imageView = [self generateUIImageViewWithFrame:frame atRow:j column:i];
            UILabel *label = [self generateUILabelWithFrame:CGRectMake(0, frame.size.height-20, kWidth, 20)];
            label.adjustsFontSizeToFitWidth = YES;
            // add button
            
            UIView *subView = [[UIView alloc] initWithFrame:label.frame];
            subView.backgroundColor = [UIColor blackColor];
            subView.alpha = 0.7;
            [imageView addSubview:subView];
            [imageView addSubview:label];
            //
            UIButton *button = [self generateUIButtonWithFrame:frame atRow:j column:i];
            
            [contentSubView addSubview:imageView];
            [contentSubView addSubview:button];
        }
    }

    if (isBtnReadmore) {
        if (townDetail.fullOverview)
            textView.text = townDetail.fullOverview;
        realHeightOfTextView = [self textViewHeightForAttributedText:textView.attributedText andWidth:textView.frame.size.width];
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
    // ic_arrow.png
    UIImageView *imgArrow = [[UIImageView alloc] initWithFrame:CGRectMake(290,
                                                                          textView.center.y,
                                                                          20,
                                                                          20)];
    imgArrow.image = [UIImage imageNamed:@"ic_arrow.png"];
    [self addSubview:imgArrow];
}
- (CGFloat)textViewHeightForAttributedText: (NSAttributedString*)text andWidth: (CGFloat)width {
    UITextView *calculationView = [[UITextView alloc] init];
    [calculationView setAttributedText:text];
    CGSize size = [calculationView sizeThatFits:CGSizeMake(width, FLT_MAX)];
    return size.height;
}
#pragma mark -------------------------------------------------------------------
#pragma mark Private

- (UIImageView *)generateUIImageViewWithFrame:(CGRect)frame atRow:(int)row column:(int)column {
    NSArray *arrayMainPages = [NSArray arrayWithObjects:    @"main_page1.png",
                                                            @"main_page2.png",
                                                            @"main_page3.png",
                                                            @"main_page4.png",
                                                            @"main_page5.png",
                                                            @"main_page6.png", nil];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.clipsToBounds = YES;
//    NSString *stringUrlImageGallery = nil;
    imageView.backgroundColor = [UIColor clearColor];
    /*
    if (arrayImages.count > 0)
        stringUrlImageGallery = [NSString stringWithFormat:@"%@", [arrayImages objectAtIndex: row+column]];
    if (stringUrlImageGallery) {
        NSURL *urlImageGallery = [NSURL URLWithString:stringUrlImageGallery];
        [self downloadImageWithURL:urlImageGallery completionBlock:^(BOOL succeeded, UIImage *image) {
            if (succeeded) {
                UIImage *tempImage = [self imageWithImage:image scaledToSize:CGSizeMake(frame.size.width, frame.size.height)];
                if (tempImage)
                    imageView.image = tempImage;
                else
                    imageView.image = [UIImage imageNamed:(NSString*)[arrayMainPages objectAtIndex:row*3 +column]];
            }
        }];
    }
    else {
     */
        NSString *defaultImage = [arrayMainPages objectAtIndex:row*3 +column];
        imageView.image = [UIImage imageNamed:defaultImage];
//    }
    return imageView;
}
- (UIButton *)generateUIButtonWithFrame:(CGRect)frame atRow:(int)row column:(int)column{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.tag = row*3 + column;
    button.backgroundColor = [UIColor clearColor];
    [button addTarget:self action:@selector(switchClickedButtonr:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}
- (IBAction)switchClickedButtonr:(id)sender {
    NSLog(@"---------%ld", [sender tag]);
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
- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               if ( !error )
                               {
                                   UIImage *image = [[UIImage alloc] initWithData:data];
                                   completionBlock(YES,image);
                               } else{
                                   completionBlock(NO,nil);
                               }
                           }];
}
- (IBAction)readMore:(id)sender {
  [self.delegate didActivateReadMoreForCell:self withHeightOfRow:heightCellExpanding];
}
- (void) showContentOfCell:(BOOL) isShow withTownDetai:(TownDetailModel *) townDetail{
    if (isShow) {
        if (townDetail.townName)
            self.lblTitle.text = townDetail.townName;
        if (townDetail.description) {
            self.lblDescription.text = townDetail.townDescription;
            float heightTxtDescription = [self textViewHeightForAttributedText:self.lblDescription.attributedText andWidth:textView.frame.size.width];
            [self.lblDescription setFrame: CGRectMake(self.lblDescription.frame.origin.x,
                                                      self.lblDescription.frame.origin.y,
                                                      heightTxtDescription,
                                                      self.lblDescription.frame.origin.x)];
        }
        self.lblTitle.hidden = NO;
        self.lblTemperature.hidden = NO;
        self.lblDescription.hidden = NO;
        self.imgTemperature.hidden = NO;
        self.imgWeatherCloundly. hidden = NO;
    }
    else {
        self.lblTitle.hidden = YES;
        self.lblTemperature.hidden = YES;
        self.lblDescription.hidden = YES;
        self.imgTemperature.hidden = YES;
        self.imgWeatherCloundly. hidden = YES;
    }
}
- (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
@end
