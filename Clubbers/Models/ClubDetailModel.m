//
//  ClubModel.m
//  Fight
//
//  Created by Sonnv on 12/28/13.
//  Copyright (c) 2013 AnhKien. All rights reserved.
//

#import "ClubDetailModel.h"

@implementation ClubDetailModel
@synthesize clubId,
townId,
clubName,
clubPhone,
clubImage,
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


static ClubDetailModel* _instance = nil;
+(ClubDetailModel*) shareInstance {
    @synchronized(self) {
        if (_instance == nil) {
            _instance = [[ClubDetailModel alloc] init];
        }
    }
    return _instance;
}
- (ClubDetailModel*)parseJson:(NSDictionary*)jsonDict {
    if (!jsonDict)
        return nil;
    else {
        ClubDetailModel *clubModel = [[ClubDetailModel alloc]init];
        if (![[jsonDict objectForKey:@"club_id"] isKindOfClass:[NSNull class]])
            clubModel.clubId = [[jsonDict objectForKey:@"club_id"] intValue];
        if (![[jsonDict objectForKey:@"town_id"] isKindOfClass:[NSNull class]])
            clubModel.townId = [[jsonDict objectForKey:@"town_id"] intValue];
        if (![[jsonDict objectForKey:@"club_name"] isKindOfClass:[NSNull class]])
            clubModel.clubName = [jsonDict objectForKey:@"club_name"];
        if (![[jsonDict objectForKey:@"club_phone"] isKindOfClass:[NSNull class]])
            clubModel.clubPhone = [jsonDict objectForKey:@"club_phone"];
        if (![[jsonDict objectForKey:@"club_image"] isKindOfClass:[NSNull class]])
            clubModel.clubImage = [jsonDict objectForKey:@"club_image"];
        if (![[jsonDict objectForKey:@"thumb_image"] isKindOfClass:[NSNull class]])
            clubModel.thumbImage = [jsonDict objectForKey:@"thumb_image"];
        if (![[jsonDict objectForKey:@"club_description"] isKindOfClass:[NSNull class]])
            clubModel.clubDescription = [jsonDict objectForKey:@"club_description"];
        if (![[jsonDict objectForKey:@"club_lat"] isKindOfClass:[NSNull class]])
            clubModel.clubLat = [jsonDict objectForKey:@"club_lat"];
        if (![[jsonDict objectForKey:@"club_lon"] isKindOfClass:[NSNull class]])
            clubModel.clubLon = [jsonDict objectForKey:@"club_lon"];
        if (![[jsonDict objectForKey:@"short_overview"] isKindOfClass:[NSNull class]])
            clubModel.shortOverview = [jsonDict objectForKey:@"short_overview"];
        if (![[jsonDict objectForKey:@"full_overview"] isKindOfClass:[NSNull class]])
            clubModel.fullOverview = [jsonDict objectForKey:@"full_overview"];
        if (![[jsonDict objectForKey:@"club_features"] isKindOfClass:[NSNull class]])
            clubModel.clubFeatures = [jsonDict objectForKey:@"club_features"];
        if (![[jsonDict objectForKey:@"club_address"] isKindOfClass:[NSNull class]])
            clubModel.clubAddress = [jsonDict objectForKey:@"club_address"];
        if (![[jsonDict objectForKey:@"club_email"] isKindOfClass:[NSNull class]])
            clubModel.clubEmail = [jsonDict objectForKey:@"club_email"];
        if (![[jsonDict objectForKey:@"club_siteurl"] isKindOfClass:[NSNull class]])
            clubModel.clubSiteurl = [jsonDict objectForKey:@"club_siteurl"];
        if (![[jsonDict objectForKey:@"club_header_title"] isKindOfClass:[NSNull class]])
            clubModel.clubHeaderTitle = [jsonDict objectForKey:@"club_header_title"];
        if (![[jsonDict objectForKey:@"club_header_detail"] isKindOfClass:[NSNull class]])
            clubModel.clubHeaderDetail = [jsonDict objectForKey:@"club_header_detail"];
        
        return clubModel;
    }
    return nil;
}
@end
