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
- (TownDetailModel*)parseJson:(NSDictionary*)jsonDict {
    if (!jsonDict)
        return nil;
    else {
        TownDetailModel *townDetailModel = [[TownDetailModel alloc]init];
        if (![[jsonDict objectForKey:@"town_id"] isKindOfClass:[NSNull class]])
            townDetailModel.townId = [[jsonDict objectForKey:@"town_id"] intValue];
        if (![[jsonDict objectForKey:@"town_name"] isKindOfClass:[NSNull class]])
            townDetailModel.townName = [jsonDict objectForKey:@"town_name"];
        if (![[jsonDict objectForKey:@"town_image"] isKindOfClass:[NSNull class]])
            townDetailModel.townImage = [jsonDict objectForKey:@"town_image"];
        if (![[jsonDict objectForKey:@"thumb_image"] isKindOfClass:[NSNull class]])
            townDetailModel.thumbImage = [jsonDict objectForKey:@"thumb_image"];
        if (![[jsonDict objectForKey:@"town_description"] isKindOfClass:[NSNull class]])
            townDetailModel.townDescription = [jsonDict objectForKey:@"town_description"];
        if (![[jsonDict objectForKey:@"short_overview"] isKindOfClass:[NSNull class]])
            townDetailModel.shortOverview = [jsonDict objectForKey:@"short_overview"];
        if (![[jsonDict objectForKey:@"full_overview"] isKindOfClass:[NSNull class]])
            townDetailModel.fullOverview = [jsonDict objectForKey:@"full_overview"];
        if (![[jsonDict objectForKey:@"town_header_title"] isKindOfClass:[NSNull class]])
            townDetailModel.townHeaderTitle = [jsonDict objectForKey:@"town_header_title"];
        if (![[jsonDict objectForKey:@"town_header_detail"] isKindOfClass:[NSNull class]])
            townDetailModel.townDeaderDetail = [jsonDict objectForKey:@"town_header_detail"];
        if (![[jsonDict objectForKey:@"image_gallery"] isKindOfClass:[NSArray class]])
            townDetailModel.imageGallerys = (NSArray*)[jsonDict objectForKey:@"town_header_detail"];
        return townDetailModel;
    }
    return nil;
}
@end
