//
//  TownDetailModel.m
//  Fight
//
//  Created by Sonnv on 12/28/13.
//  Copyright (c) 2013 AnhKien. All rights reserved.
//

#import "TownDetailModel.h"

@implementation TownDetailModel
@synthesize townId;
@synthesize townName;
@synthesize townImage;
@synthesize thumbImage;
@synthesize townDescription;
@synthesize shortOverview;
@synthesize fullOverview;
@synthesize townHeaderTitle;
@synthesize townDeaderDetail;
@synthesize imageGallerys;

static TownDetailModel* _instance = nil;
+(TownDetailModel*) shareInstance {
    @synchronized(self) {
        if (_instance == nil) {
            _instance = [[TownDetailModel alloc] init];
        }
    }
    return _instance;
}
-(NSMutableArray*)parseJson:(NSArray*)listJson {
    NSMutableArray *listTownDetail = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in listJson) {
        TownDetailModel *townDetailModel = [[TownDetailModel alloc]init];
        if (![[dict objectForKey:@"town_id"] isKindOfClass:[NSNull class]])
            townDetailModel.townId = [[dict objectForKey:@"town_id"] intValue];
        if (![[dict objectForKey:@"town_name"] isKindOfClass:[NSNull class]])
            townDetailModel.townName = [dict objectForKey:@"town_name"];
        if (![[dict objectForKey:@"town_image"] isKindOfClass:[NSNull class]])
            townDetailModel.townImage = [dict objectForKey:@"town_image"];
        if (![[dict objectForKey:@"thumb_image"] isKindOfClass:[NSNull class]])
            townDetailModel.thumbImage = [dict objectForKey:@"thumb_image"];
        if (![[dict objectForKey:@"town_description"] isKindOfClass:[NSNull class]])
            townDetailModel.townDescription = [dict objectForKey:@"town_description"];
        if (![[dict objectForKey:@"short_overview"] isKindOfClass:[NSNull class]])
            townDetailModel.shortOverview = [dict objectForKey:@"short_overview"];
        if (![[dict objectForKey:@"full_overview"] isKindOfClass:[NSNull class]])
            townDetailModel.fullOverview = [dict objectForKey:@"full_overview"];
        if (![[dict objectForKey:@"town_header_title"] isKindOfClass:[NSNull class]])
            townDetailModel.townHeaderTitle = [dict objectForKey:@"town_header_title"];
        if (![[dict objectForKey:@"town_header_detail"] isKindOfClass:[NSNull class]])
            townDetailModel.townDeaderDetail = [dict objectForKey:@"town_header_detail"];
        if (![[dict objectForKey:@"image_gallery"] isKindOfClass:[NSArray class]])
            townDetailModel.imageGallerys = (NSArray*)[dict objectForKey:@"town_header_detail"];
        
        if (townDetailModel) {
            [listTownDetail addObject:townDetailModel];
        }
    }
    return listTownDetail;
}
@end
