//
//  EventTableCell.h
//  UFight5
//
//  Created by gilgameshvn on 12/1/13.
//  Copyright (c) 2013 gilgameshvn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imgIcon;
@property (strong, nonatomic) IBOutlet UIImageView *imgContent;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblDate;
@property (strong, nonatomic) IBOutlet UITextView *texViewSumary;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end
