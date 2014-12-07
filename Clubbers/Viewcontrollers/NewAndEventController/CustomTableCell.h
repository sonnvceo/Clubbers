//
//  EventTableCell.h
//  UFight5
//
//  Created by gilgameshvn on 12/1/13.
//  Copyright (c) 2013 gilgameshvn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imgEvent;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UILabel *lbDetail;
@property (strong, nonatomic) IBOutlet UILabel *lblView;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end
