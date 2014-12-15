//
//  ClubDetailCell.h
//  ReadMoreCell
//
//  Created by Camilo Castro on 04-06-14.
//  Copyright (c) 2014 Cervezapps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TownDetailModel.h"
@protocol ClubDetailCellDelegate;

@interface ClubDetailCell : UITableViewCell {
    UIButton* btnreadMore;
    NSArray *arrayImages;
}

@property (nonatomic) id<ClubDetailCellDelegate> delegate;
@property(nonatomic, strong) IBOutlet UITextView *textView;
@property(nonatomic, strong) IBOutlet UILabel *lblTitle;
@property(nonatomic, strong) IBOutlet UILabel *lblDescription;
@property(nonatomic, strong) IBOutlet UILabel *lblTemperature;
@property(nonatomic, strong) IBOutlet UIImageView *imgTemperature;
@property(nonatomic, strong) IBOutlet UIImageView *imgWeatherCloundly;

@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) UIView *contentSubView;
@property (nonatomic, assign) BOOL isBtnReadmore;
@property (nonatomic, assign) float realHeightOfTextView;
- (void) creatSubviews;
- (IBAction)readMore:(id)sender;
- (void) configueCellAtIndexPath:(NSIndexPath*) indexPath withTownDetai:(TownDetailModel *) townDetail;
- (CGFloat)textViewHeightForAttributedText: (NSAttributedString*)text andWidth: (CGFloat)width;
@end

@protocol ClubDetailCellDelegate <NSObject>

- (void) didActivateReadMoreForCell : (ClubDetailCell *) cell;

@end
