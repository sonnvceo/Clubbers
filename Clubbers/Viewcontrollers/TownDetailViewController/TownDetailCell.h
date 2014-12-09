//
//  TownDetailCell.h
//  ReadMoreCell
//
//  Created by Camilo Castro on 04-06-14.
//  Copyright (c) 2014 Cervezapps. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TownDetailCellDelegate;

@interface TownDetailCell : UITableViewCell

@property (nonatomic) id<TownDetailCellDelegate> delegate;

@property (nonatomic) NSIndexPath * indexPath;
- (IBAction)readMore:(id)sender;
@end

@protocol TownDetailCellDelegate <NSObject>

- (void) didActivateReadMoreForCell : (TownDetailCell *) cell;

@end
