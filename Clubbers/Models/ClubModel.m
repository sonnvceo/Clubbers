//
//  ClubModel.m
//  Fight
//
//  Created by Sonnv on 12/28/13.
//  Copyright (c) 2013 AnhKien. All rights reserved.
//

#import "ClubModel.h"

@implementation ClubModel
@synthesize clubId,
townId,
clubName,
clubPhone,
thumbImage,
clubDescription,
clubLat,
clubLon,
shortOverview,
fullOverview,
clubFeatures,
clubAddress,
clubEmail,
clubSiteurl,
clubHeaderTitle,
clubHeaderDetail;


static ClubModel* _instance = nil;
+(ClubModel*) shareInstance {
    @synchronized(self) {
        if (_instance == nil) {
            _instance = [[ClubModel alloc] init];
        }
    }
    return _instance;
}
-(ClubModel*)setValuesFromDictionary:(NSDictionary*)dict {
        ClubModel *clubModel = [[ClubModel alloc]init];
    if (![[dict objectForKey:@"club_id"] isKindOfClass:[NSNull class]])
        clubModel.clubId = [[dict objectForKey:@"club_id"] stringValue];
    if (![[dict objectForKey:@"town_id"] isKindOfClass:[NSNull class]])
        clubModel.townId = [[dict objectForKey:@"town_id"] stringValue];
    if (![[dict objectForKey:@"club_name"] isKindOfClass:[NSNull class]])
        clubModel.clubName = [dict objectForKey:@"club_name"];
    if (![[dict objectForKey:@"club_phone"] isKindOfClass:[NSNull class]])
        clubModel.clubPhone = [[dict objectForKey:@"club_phone"] stringValue];
    if (![[dict objectForKey:@"club_image"] isKindOfClass:[NSNull class]])
        clubModel.thumbImage = [dict objectForKey:@"club_image"];
    if (![[dict objectForKey:@"club_description"] isKindOfClass:[NSNull class]])
        clubModel.clubDescription = [dict objectForKey:@"club_description"];
    if (![[dict objectForKey:@"club_lat"] isKindOfClass:[NSNull class]])
        clubModel.clubLat = [[dict objectForKey:@"club_lat"] stringValue];
    if (![[dict objectForKey:@"club_lon"] isKindOfClass:[NSNull class]])
        clubModel.clubLon = [[dict objectForKey:@"club_lon"] stringValue];
    if (![[dict objectForKey:@"short_overview"] isKindOfClass:[NSNull class]])
        clubModel.shortOverview = [[dict objectForKey:@"short_overview"] stringValue];
    if (![[dict objectForKey:@"full_overview"] isKindOfClass:[NSNull class]])
        clubModel.fullOverview = [[dict objectForKey:@"full_overview"] stringValue];
    if (![[dict objectForKey:@"club_features"] isKindOfClass:[NSNull class]])
        clubModel.clubFeatures = [[dict objectForKey:@"club_features"] stringValue];
    if (![[dict objectForKey:@"club_address"] isKindOfClass:[NSNull class]])
        clubModel.clubAddress = [[dict objectForKey:@"club_address"] stringValue];
    if (![[dict objectForKey:@"club_email"] isKindOfClass:[NSNull class]])
        clubModel.clubEmail = [[dict objectForKey:@"club_email"] stringValue];
    if (![[dict objectForKey:@"club_siteurl"] isKindOfClass:[NSNull class]])
        clubModel.clubSiteurl = [[dict objectForKey:@"club_siteurl"] stringValue];
    if (![[dict objectForKey:@"club_header_title"] isKindOfClass:[NSNull class]])
        clubModel.clubHeaderTitle = [[dict objectForKey:@"club_header_title"] stringValue];
    if (![[dict objectForKey:@"club_header_detail"] isKindOfClass:[NSNull class]])
        clubModel.clubHeaderDetail = [[dict objectForKey:@"club_header_detail"] stringValue];
    return clubModel;
}
@end
