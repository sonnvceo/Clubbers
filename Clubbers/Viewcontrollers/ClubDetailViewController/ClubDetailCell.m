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
    // add title lable
    UILabel *lblOverView = [[UILabel alloc] initWithFrame:CGRectMake(10, -5, 100, 30)];
    lblOverView.textColor = [UIColor blackColor];
    lblOverView.backgroundColor=[UIColor clearColor];
    lblOverView.textColor=[UIColor grayColor];
    lblOverView.userInteractionEnabled=NO;
    lblOverView.font = [UIFont boldSystemFontOfSize:13];
    lblOverView.numberOfLines = 1;
    lblOverView.text= @"Overview";
    [self addSubview:lblOverView];
    // add textView
    CGRect textViewFrame = CGRectMake(10.0f,
                                      lblOverView.frame.origin.y + lblOverView.frame.size.height +20,
                                      280.0f,
                                      50.0f);
    UITextView *txtOverView = [[UITextView alloc] initWithFrame:textViewFrame];
    txtOverView.returnKeyType = UIReturnKeyDone;
    txtOverView.userInteractionEnabled = NO;
    txtOverView.showsHorizontalScrollIndicator = NO;
    txtOverView.scrollEnabled = NO;
    txtOverView.text = @"N/A";
    txtOverView.backgroundColor = [UIColor clearColor];
    [self addSubview:txtOverView];
    // add lable
    UILabel *lblKeyFeatures = [[UILabel alloc] initWithFrame:CGRectMake(10.0f,
                                                                        textView.frame.origin.y + textView.frame.size.height +20,
                                                                        100.0f,
                                                                        30.0f)];
    lblKeyFeatures.textColor = [UIColor blackColor];
    lblKeyFeatures.backgroundColor=[UIColor clearColor];
    lblKeyFeatures.textColor=[UIColor grayColor];
    lblKeyFeatures.userInteractionEnabled=NO;
    lblKeyFeatures.font = [UIFont boldSystemFontOfSize:13];
    lblKeyFeatures.numberOfLines = 1;
    lblKeyFeatures.text= @"Key features";
    [self addSubview:lblKeyFeatures];
    //
    UITextView *txtKeyFeadtures = [[UITextView alloc] initWithFrame:CGRectMake(10.0f,
                                                                               lblKeyFeatures.frame.origin.y + lblKeyFeatures.frame.size.height +20,
                                                                               280.0f,
                                                                               50.0f)];
    txtKeyFeadtures.returnKeyType = UIReturnKeyDone;
    txtKeyFeadtures.userInteractionEnabled = NO;
    txtKeyFeadtures.showsHorizontalScrollIndicator = NO;
    txtKeyFeadtures.scrollEnabled = NO;
    txtKeyFeadtures.text = @"N/A";
    txtKeyFeadtures.backgroundColor = [UIColor clearColor];
    [self addSubview:txtKeyFeadtures];

    // add view Details
    UIView *viewDetails = [[UIView alloc] initWithFrame:CGRectMake(10.0f,
                                                                   txtKeyFeadtures.frame.origin.y + txtKeyFeadtures.frame.size.height +20,
                                                                   self.frame.size.width-10.f,
                                                                   100.0f)];
    viewDetails.backgroundColor = [UIColor clearColor];
 ;
    // lblDetais
    UILabel *lblDetais= [[UILabel alloc] initWithFrame:CGRectMake(0.0f,
                                                                  0.0f,
                                                                  100.0f,
                                                                  30.0f)];
    lblDetais.textColor = [UIColor blackColor];
    lblDetais.backgroundColor=[UIColor clearColor];
    lblDetais.textColor=[UIColor grayColor];
    lblDetais.userInteractionEnabled=NO;
    lblDetais.font = [UIFont boldSystemFontOfSize:13];
    lblDetais.numberOfLines = 1;
    lblDetais.text= @"Details:";
    [viewDetails addSubview:lblDetais];
    // add address
    UIImageView *imgVAddress = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f,
                                                                            lblDetais.frame.origin.y + lblDetais.frame.size.height ,
                                                                            25,
                                                                            25)];
    imgVAddress.image = [UIImage imageNamed:@"ic_compass_pink.png"];
    [viewDetails addSubview:imgVAddress];
    //
    UILabel *lblTitleAddress = [[UILabel alloc] initWithFrame:CGRectMake(imgVAddress.frame.origin.x + imgVAddress.frame.size.width + 5,
                                                                  imgVAddress.frame.origin.y - 7,
                                                                  100.0f,
                                                                  30.0f)];
    lblTitleAddress.textColor = [UIColor blackColor];
    lblTitleAddress.backgroundColor=[UIColor clearColor];
    lblTitleAddress.userInteractionEnabled=NO;
    lblTitleAddress.font = [UIFont boldSystemFontOfSize:11];
    lblTitleAddress.numberOfLines = 1;
    lblTitleAddress.text= @"Address:";
    [viewDetails addSubview:lblTitleAddress];
    
    UILabel *lblTitleDescription= [[UILabel alloc] initWithFrame:CGRectMake(lblTitleAddress.frame.origin.x,
                                                                       lblTitleAddress.frame.origin.y + lblTitleAddress.frame.size.height +5,
                                                                       100.0f,
                                                                       30.0f)];
    lblTitleDescription.textColor = [UIColor blackColor];
    lblTitleDescription.backgroundColor=[UIColor clearColor];
    lblTitleDescription.userInteractionEnabled=NO;
    lblTitleDescription.font = [UIFont systemFontOfSize:10];
    lblTitleDescription.numberOfLines = 1;
    lblTitleDescription.text= @"AddressAddressAddressAddressAddressAddressAddressAddress:";
    [viewDetails addSubview:lblTitleDescription];
    //
    
    // add Telephone
    UIImageView *imgVPhone = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f,
                                                                           imgVAddress.frame.origin.y + imgVAddress.frame.size.height +5,
                                                                            25,
                                                                            25)];
    imgVPhone.image = [UIImage imageNamed:@"ic_phone_green.png"];
    [viewDetails addSubview:imgVPhone];
    
    // add email
    UIImageView *imgEmail = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f,
                                                                           imgVPhone.frame.origin.y + imgVPhone.frame.size.height +5,
                                                                           25,
                                                                           25)];
    imgEmail.image = [UIImage imageNamed:@"ic_email.png"];
    [viewDetails addSubview:imgEmail];
    
    // add website
    UIImageView *imgVWebsite = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f,
                                                                           imgEmail.frame.origin.y + imgEmail.frame.size.height +5,
                                                                           25,
                                                                           25)];
    imgVWebsite.image = [UIImage imageNamed:@"ic_website.png"];
    [viewDetails addSubview:imgVWebsite];
    
    
    [self addSubview:viewDetails];
    
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
