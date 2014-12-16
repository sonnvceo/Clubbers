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
@property(nonatomic, strong) IBOutlet UIButton *btnVote;
@property(nonatomic, strong) IBOutlet UIButton *btnCall;
@property(nonatomic, strong) IBOutlet UIButton *btnMap;

@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) UIView *contentSubView;
@property (nonatomic, assign) BOOL isBtnReadmore;
@property (nonatomic, assign) float realHeightOfTextView;
- (void) creatSubviews;
- (IBAction)btnVote:(id)sender;
- (IBAction)btnCall:(id)sender;
- (IBAction)btnMap:(id)sender;

- (void) configueCellAtIndexPath:(NSIndexPath*) indexPath withTownDetai:(TownDetailModel *) townDetail;
- (CGFloat)textViewHeightForAttributedText: (NSAttributedString*)text andWidth: (CGFloat)width;
@end

@protocol ClubDetailCellDelegate <NSObject>

- (void) didActivateReadMoreForCell : (ClubDetailCell *) cell;

@end
