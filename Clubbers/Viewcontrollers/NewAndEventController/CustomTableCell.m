//
//  EventTableCell.m
//  UFight5
//
//  Created by gilgameshvn on 12/1/13.
//  Copyright (c) 2013 gilgameshvn. All rights reserved.
//

#import "CustomTableCell.h"
#import "NSString+HTML.h"

@implementation CustomTableCell
@synthesize imgIcon, imgContent, lblTitle, lblDate, texViewSumary, tableView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void) configueCellWithTownDetai:(MWFeedItem *) feedItem {
    imgIcon.layer.cornerRadius = imgIcon.frame.size.width / 2;
    imgIcon.clipsToBounds = YES;
    //
    imgContent.layer.masksToBounds = YES;
    imgContent.layer.cornerRadius = 10.0;
    
    NSString *itemTitle = feedItem.content ? [feedItem.title stringByConvertingHTMLToPlainText] : @"N/A]";
    lblTitle.text = itemTitle;
    //
    NSString* str_imageUrl = [self getFirstImage:feedItem.content];
    NSURL * urlImageCell = [NSURL URLWithString:str_imageUrl];
    //
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    NSString *date = feedItem.date ? [formatter stringFromDate:feedItem.date] : @"N/A]";
    lblDate.text = date;
    //
    NSString *summary = feedItem.summary ? [feedItem.summary stringByConvertingHTMLToPlainText] : @"N/A]";
    texViewSumary.text = summary;
    [self downloadImageWithURL:urlImageCell completionBlock:^(BOOL succeeded, UIImage *image) {
        if (succeeded)
            [imgContent setImage:image];
    }];
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
- (NSString *)getFirstImage:(NSString *)htmlString{
    
    NSScanner *theScanner;
    NSString *text = nil;
    
    theScanner = [NSScanner scannerWithString: htmlString];
    
    // find start of tag
    [theScanner scanUpToString: @"src=\"" intoString: NULL];
    if ([theScanner isAtEnd] == NO) {
        NSInteger newLoc = [theScanner scanLocation] + 5;
        [theScanner setScanLocation: newLoc];
        
        // find end of tag
        [theScanner scanUpToString: @"\"" intoString: &text];
    }
    
    return text;
}
@end
