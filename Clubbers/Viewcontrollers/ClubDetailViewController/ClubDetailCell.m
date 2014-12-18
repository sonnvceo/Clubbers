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

- (void) configueCellAtIndexPath:(NSIndexPath*) indexPath withClubDetai:(ClubDetailModel *) clubDetail {
    clubDetailModel =clubDetail;
    switch (indexPath.row) {
        case 0:
            [self showContentOfCell: YES withClubDetai:clubDetail];
            break;
        case 1:
            [self creatSubviews: clubDetail];
            break;
        default:
            break;
    }
}
- (void) creatSubviews:(ClubDetailModel *) clubDetail {
    
    [self showContentOfCell: NO withClubDetai:clubDetail];
    // add title lable
    UILabel *lblOverView = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 20)];
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
                                      lblOverView.frame.origin.y + lblOverView.frame.size.height,
                                      280.0f,
                                      50.0f);
    UITextView *txtOverView = [[UITextView alloc] initWithFrame:textViewFrame];
    txtOverView.returnKeyType = UIReturnKeyDone;
    txtOverView.userInteractionEnabled = NO;
    txtOverView.showsHorizontalScrollIndicator = NO;
    txtOverView.scrollEnabled = NO;
    if (clubDetail.shortOverview)
        txtOverView.text = clubDetail.shortOverview;
    else
        txtOverView.text = @"N/A";
    txtOverView.backgroundColor = [UIColor clearColor];
    [self addSubview:txtOverView];
    // add lable
    UILabel *lblKeyFeatures = [[UILabel alloc] initWithFrame:CGRectMake(10.0f,
                                                                        txtOverView.frame.origin.y + txtOverView.frame.size.height,
                                                                        100.0f,
                                                                        20.0f)];
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
                                                                               lblKeyFeatures.frame.origin.y + lblKeyFeatures.frame.size.height,
                                                                               280.0f,
                                                                               50.0f)];
    txtKeyFeadtures.returnKeyType = UIReturnKeyDone;
    txtKeyFeadtures.userInteractionEnabled = NO;
    txtKeyFeadtures.showsHorizontalScrollIndicator = NO;
    txtKeyFeadtures.scrollEnabled = NO;
    if (clubDetail.clubFeatures)
        txtKeyFeadtures.text = clubDetail.clubFeatures;
    else
        txtKeyFeadtures.text = @"N/A";
    txtKeyFeadtures.backgroundColor = [UIColor clearColor];
    [self addSubview:txtKeyFeadtures];

    // add view Details
    UIView *viewDetails = [[UIView alloc] initWithFrame:CGRectMake(10.0f,
                                                                   txtKeyFeadtures.frame.origin.y + txtKeyFeadtures.frame.size.height,
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
                                                                  imgVAddress.frame.origin.y - 3,
                                                                  100.0f,
                                                                  20.0f)];
    lblTitleAddress.textColor = [UIColor blackColor];
    lblTitleAddress.backgroundColor=[UIColor clearColor];
    lblTitleAddress.userInteractionEnabled=NO;
    lblTitleAddress.font = [UIFont boldSystemFontOfSize:11];
    lblTitleAddress.numberOfLines = 1;
    lblTitleAddress.text= @"Address:";
    [viewDetails addSubview:lblTitleAddress];
    
    UILabel *lblTitleDescription= [[UILabel alloc] initWithFrame:CGRectMake(lblTitleAddress.frame.origin.x,
                                                                       lblTitleAddress.frame.origin.y+7 ,
                                                                       250.0f,
                                                                       30.0f)];
    lblTitleDescription.textColor = [UIColor grayColor];
    lblTitleDescription.backgroundColor=[UIColor clearColor];
    lblTitleDescription.userInteractionEnabled=NO;
    lblTitleDescription.font = [UIFont systemFontOfSize:9];
    lblTitleDescription.numberOfLines = 1;
    if (clubDetail.clubName)
        lblTitleDescription.text = clubDetail.clubName;
    else
        lblTitleDescription.text= @"N/A:";
    [viewDetails addSubview:lblTitleDescription];
    //
    
    // add Telephone
    UIImageView *imgVPhone = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f,
                                                                           imgVAddress.frame.origin.y + imgVAddress.frame.size.height +5,
                                                                            25,
                                                                            25)];
    imgVPhone.image = [UIImage imageNamed:@"ic_phone_green.png"];
    [viewDetails addSubview:imgVPhone];
    //
    UILabel *lblTitlePhone = [[UILabel alloc] initWithFrame:CGRectMake(imgVPhone.frame.origin.x + imgVPhone.frame.size.width + 5,
                                                                         imgVPhone.frame.origin.y - 3,
                                                                         100.0f,
                                                                         20.0f)];
    lblTitlePhone.textColor = [UIColor blackColor];
    lblTitlePhone.backgroundColor=[UIColor clearColor];
    lblTitlePhone.userInteractionEnabled=NO;
    lblTitlePhone.font = [UIFont boldSystemFontOfSize:11];
    lblTitlePhone.numberOfLines = 1;
    lblTitlePhone.text= @"Phone:";
    [viewDetails addSubview:lblTitlePhone];
    
    UILabel *lblPhoneNumber = [[UILabel alloc] initWithFrame:CGRectMake(lblTitlePhone.frame.origin.x,
                                                                        lblTitlePhone.frame.origin.y+7 ,
                                                                        250.0f,
                                                                        30.0f)];
    lblPhoneNumber.textColor = [UIColor grayColor];
    lblPhoneNumber.backgroundColor=[UIColor clearColor];
    lblPhoneNumber.userInteractionEnabled=NO;
    lblPhoneNumber.font = [UIFont systemFontOfSize:9];
    lblPhoneNumber.numberOfLines = 1;
    if (clubDetail.clubPhone)
        lblPhoneNumber.text = clubDetail.clubPhone;
    else
        lblPhoneNumber.text= @"N/A:";
    [viewDetails addSubview:lblPhoneNumber];
    // add email
    UIImageView *imgEmail = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f,
                                                                           imgVPhone.frame.origin.y + imgVPhone.frame.size.height +5,
                                                                           25,
                                                                           25)];
    imgEmail.image = [UIImage imageNamed:@"ic_email.png"];
    [viewDetails addSubview:imgEmail];
    //
    UILabel *lblTitleMail = [[UILabel alloc] initWithFrame:CGRectMake(imgEmail.frame.origin.x + imgEmail.frame.size.width + 5,
                                                                       imgEmail.frame.origin.y - 3,
                                                                       100.0f,
                                                                       20.0f)];
    lblTitleMail.textColor = [UIColor blackColor];
    lblTitleMail.backgroundColor=[UIColor clearColor];
    lblTitleMail.userInteractionEnabled=NO;
    lblTitleMail.font = [UIFont boldSystemFontOfSize:11];
    lblTitleMail.numberOfLines = 1;
    lblTitleMail.text= @"Mail:";
    [viewDetails addSubview:lblTitleMail];
    
    UILabel *lblMail = [[UILabel alloc] initWithFrame:CGRectMake(lblTitleMail.frame.origin.x,
                                                                 lblTitleMail.frame.origin.y+7 ,
                                                                 250.0f,
                                                                 30.0f)];
    lblMail.textColor = [UIColor grayColor];
    lblMail.backgroundColor=[UIColor clearColor];
    lblMail.userInteractionEnabled=NO;
    lblMail.font = [UIFont systemFontOfSize:9];
    lblMail.numberOfLines = 1;
    if (clubDetail.clubEmail)
        lblMail.text = clubDetail.clubEmail;
    else
        lblMail.text= @"N/A:";
    [viewDetails addSubview:lblMail];
    // add website
    UIImageView *imgVWebsite = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f,
                                                                           imgEmail.frame.origin.y + imgEmail.frame.size.height +5,
                                                                           25,
                                                                           25)];
    imgVWebsite.image = [UIImage imageNamed:@"ic_website.png"];
    [viewDetails addSubview:imgVWebsite];
    //
    UILabel *lblTitleWebsite = [[UILabel alloc] initWithFrame:CGRectMake(imgVWebsite.frame.origin.x + imgVWebsite.frame.size.width + 5,
                                                                         imgVWebsite.frame.origin.y - 3,
                                                                         100.0f,
                                                                         20.0f)];
    lblTitleWebsite.textColor = [UIColor blackColor];
    lblTitleWebsite.backgroundColor=[UIColor clearColor];
    lblTitleWebsite.userInteractionEnabled=NO;
    lblTitleWebsite.font = [UIFont boldSystemFontOfSize:11];
    lblTitleWebsite.numberOfLines = 1;
    lblTitleWebsite.text= @"Website:";
    [viewDetails addSubview:lblTitleWebsite];
    
    UILabel *lblWebsite = [[UILabel alloc] initWithFrame:CGRectMake(lblTitleWebsite.frame.origin.x,
                                                                    lblTitleWebsite.frame.origin.y+7 ,
                                                                    250.0f,
                                                                    30.0f)];
    lblWebsite.textColor = [UIColor grayColor];
    lblWebsite.backgroundColor=[UIColor clearColor];
    lblWebsite.userInteractionEnabled=NO;
    lblWebsite.font = [UIFont systemFontOfSize:9];
    lblWebsite.numberOfLines = 1;
    if (clubDetail.clubSiteurl)
        lblWebsite.text = clubDetail.clubName;
    else
        lblWebsite.text= @"N/A:";
    [viewDetails addSubview:lblWebsite];
    
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
- (void) showContentOfCell:(BOOL) isShow withClubDetai:(ClubDetailModel *) clubDetail {
    if (isShow) {
        if (clubDetail.clubName)
            self.lblTitle.text = clubDetail.clubName;
        if (clubDetail.clubDescription)
            self.lblTitle.text = clubDetail.clubDescription;
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
//    if (clubDetailModel) {
//        [[ClubDetailModel shareInstance] insertDataToSQLite:clubDetailModel];
//    }
    NSArray *arrClubs = [[ClubDetailModel shareInstance] getDataFromSQLite];
    NSDictionary *dataDict = [arrClubs objectAtIndex:0];
    ClubDetailModel *_clubDetailModel = [[ClubDetailModel shareInstance] parseJson:dataDict];
    NSLog(@"++%@", _clubDetailModel.clubName);
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
