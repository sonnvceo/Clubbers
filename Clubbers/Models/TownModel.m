//
//  TownModel.m
//  Fight
//
//  Created by Sonnv on 12/28/13.
//  Copyright (c) 2013 AnhKien. All rights reserved.
//

#import "TownModel.h"

@implementation TownModel
@synthesize townId;
@synthesize townName;
@synthesize townImage;
@synthesize thumbImage;
@synthesize townDescription;
@synthesize shortOverview;
@synthesize fullOverview;
@synthesize townHeaderTitle;
@synthesize townDeaderDetail;

static TownModel* _instance = nil;
+(TownModel*) shareInstance {
    @synchronized(self) {
        if (_instance == nil) {
            _instance = [[TownModel alloc] init];
        }
    }
    return _instance;
}
-(TownModel*)setValuesFromDictionary:(NSDictionary*)dict {
        TownModel *townModel = [[TownModel alloc]init];
    if (![[dict objectForKey:@"town_id"] isKindOfClass:[NSNull class]])
        townModel.townId = [[dict objectForKey:@"town_id"] stringValue];
    if (![[dict objectForKey:@"town_name"] isKindOfClass:[NSNull class]])
        townModel.townName = [dict objectForKey:@"town_name"];
    if (![[dict objectForKey:@"town_image"] isKindOfClass:[NSNull class]])
        townModel.townImage = [[dict objectForKey:@"town_image"] stringValue];
    if (![[dict objectForKey:@"thumb_image"] isKindOfClass:[NSNull class]])
        townModel.thumbImage = [dict objectForKey:@"thumb_image"];
    if (![[dict objectForKey:@"town_description"] isKindOfClass:[NSNull class]])
        townModel.townDescription = [dict objectForKey:@"town_description"];
    if (![[dict objectForKey:@"short_overview"] isKindOfClass:[NSNull class]])
        townModel.shortOverview = [[dict objectForKey:@"short_overview"] stringValue];
    if (![[dict objectForKey:@"full_overview"] isKindOfClass:[NSNull class]])
        townModel.fullOverview = [[dict objectForKey:@"full_overview"] stringValue];
    if (![[dict objectForKey:@"town_header_title"] isKindOfClass:[NSNull class]])
        townModel.townHeaderTitle = [[dict objectForKey:@"town_header_title"] stringValue];
    if (![[dict objectForKey:@"town_header_detail"] isKindOfClass:[NSNull class]])
        townModel.townDeaderDetail = [[dict objectForKey:@"town_header_detail"] stringValue];
    return townModel;
}
@end
