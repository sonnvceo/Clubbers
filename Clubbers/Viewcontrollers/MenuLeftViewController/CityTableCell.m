//
//  EventTableCell.m
//  UFight5
//
//  Created by gilgameshvn on 12/1/13.
//  Copyright (c) 2013 gilgameshvn. All rights reserved.
//

#import "CityTableCell.h"

@implementation CityTableCell
@synthesize imgIcon,lblTitle,lbDetail;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void) configureCell {
    imgIcon.layer.cornerRadius = imgIcon.frame.size.width / 2;
    imgIcon.clipsToBounds = YES;
    self.lblTitle.adjustsFontSizeToFitWidth = NO;
//    self.lblTitle.lineBreakMode = UILineBreakModeTailTruncation;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
