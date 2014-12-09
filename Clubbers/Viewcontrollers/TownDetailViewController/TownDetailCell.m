//
//  TownDetailCell.m
//  ReadMoreCell
//
//  Created by Camilo Castro on 04-06-14.
//  Copyright (c) 2014 Cervezapps. All rights reserved.
//

#import "TownDetailCell.h"

@implementation TownDetailCell

- (void)layoutSubviews
{

}
- (IBAction)readMore:(id)sender {
  [self.delegate didActivateReadMoreForCell:self];
}

@end
