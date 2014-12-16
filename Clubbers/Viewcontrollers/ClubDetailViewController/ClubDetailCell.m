//
//  ClubDetailCell.m
//  ReadMoreCell
//
//  Created by Camilo Castro on 04-06-14.
//  Copyright (c) 2014 Cervezapps. All rights reserved.
//

#import "ClubDetailCell.h"

#define kWidth      106
#define kHeight     106
#define kInterval   1
#define kNumRow     2
#define kNumColumn  3


@implementation ClubDetailCell
@synthesize textView;
@synthesize lblTitle;
@synthesize lblDescription;
@synthesize btnVote;
@synthesize btnCall;
@synthesize btnMap;

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
}
- (CGFloat)textViewHeightForAttributedText: (NSAttributedString*)text andWidth: (CGFloat)width {
    UITextView *calculationView = [[UITextView alloc] init];
    [calculationView setAttributedText:text];
    CGSize size = [calculationView sizeThatFits:CGSizeMake(width, FLT_MAX)];
    return size.height;
}
#pragma mark -------------------------------------------------------------------
#pragma mark Private

- (UIImageView *)generateUIImageViewWithFrame:(CGRect)frame atRow:(int)row column:(int)column{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.clipsToBounds = YES;

    imageView.backgroundColor = [UIColor redColor];
    NSString *stringUrlImageGallery = [NSString stringWithFormat:@"%@", [arrayImages objectAtIndex: row+column]] ;
    NSURL *urlImageGallery = [NSURL URLWithString:stringUrlImageGallery];
    [self downloadImageWithURL:urlImageGallery completionBlock:^(BOOL succeeded, UIImage *image) {
        if (succeeded) {
            UIImage *tempImage = [self scaleImage:image toSize:CGSizeMake(frame.size.width, frame.size.height)];
            if (tempImage)
                imageView.image = tempImage;
            else
                imageView.image = [UIImage imageNamed:@"main_page1.png"];
        }
    }];

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
- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock
{
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
  [self.delegate didActivateReadMoreForCell:self];
}
- (void) showContentOfCell:(BOOL) isShow withTownDetai:(TownDetailModel *) townDetail {
    if (isShow) {
        if (townDetail.townHeaderTitle)
            self.lblTitle.text = townDetail.townHeaderTitle;
        if (townDetail.townDeaderDetail)
            self.lblTitle.text = townDetail.townDeaderDetail;
        lblTitle.hidden = NO;
        lblDescription.hidden = NO;
        btnVote.hidden = NO;
        btnCall.hidden = NO;
        btnMap.hidden = NO;
    }
    else {
        lblTitle.hidden = YES;
        lblDescription.hidden = YES;
        lblTitle.hidden = YES;
        btnVote.hidden = YES;
        btnCall.hidden = YES;
        btnMap.hidden = YES;
    }
}
- (IBAction)btnVote:(id)sender {
    btnVote.enabled = NO;
    [sender setBackgroundImage:[UIImage imageNamed:@"ic_heart.png"] forState:UIControlStateDisabled];
}
- (IBAction)btnCall:(id)sender {

}
- (IBAction)btnMap:(id)sender {

}
- (UIImage*) scaleImage:(UIImage*)image toSize:(CGSize)newSize {
    CGSize scaledSize = newSize;
    float scaleFactor = 1.0;
    if( image.size.width > image.size.height ) {
        scaleFactor = image.size.width / image.size.height;
        scaledSize.width = newSize.width;
        scaledSize.height = newSize.height / scaleFactor;
    }
    else {
        scaleFactor = image.size.height / image.size.width;
        scaledSize.height = newSize.height;
        scaledSize.width = newSize.width / scaleFactor;
    }
    
    UIGraphicsBeginImageContextWithOptions( scaledSize, NO, 0.0 );
    CGRect scaledImageRect = CGRectMake( 0.0, 0.0, scaledSize.width, scaledSize.height );
    [image drawInRect:scaledImageRect];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
}
@end
