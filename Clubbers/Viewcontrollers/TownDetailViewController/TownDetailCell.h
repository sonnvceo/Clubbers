//
//  TownDetailCell.h
//  ReadMoreCell
//
//  Created by Camilo Castro on 04-06-14.
//  Copyright (c) 2014 Cervezapps. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TownDetailCellDelegate;

@interface TownDetailCell : UITableViewCell {
    UIButton* btnreadMore;
}

@property (nonatomic) id<TownDetailCellDelegate> delegate;
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
- (void) configueCellAtIndexPath:(NSIndexPath*) indexPath;
@end

@protocol TownDetailCellDelegate <NSObject>

- (void) didActivateReadMoreForCell : (TownDetailCell *) cell;

@end
