//
//  PlaceModel.m
//  Fight
//
//  Created by Sonnv on 12/28/13.
//  Copyright (c) 2013 AnhKien. All rights reserved.
//

#import "PlaceModel.h"

@implementation PlaceModel
@synthesize townId,
placeId,
placeName,
placeImage,
thumbImage,
placeDescription,
placeLat,
placeLon;

static PlaceModel* _instance = nil;
+(PlaceModel*) shareInstance {
    @synchronized(self) {
        if (_instance == nil) {
            _instance = [[PlaceModel alloc] init];
        }
    }
    return _instance;
}
-(NSMutableArray*)parseJson:(NSArray*)listJson {
    NSMutableArray *listPlaces = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in listJson) {
            PlaceModel *placeModel = [[PlaceModel alloc]init];
        if (![[dict objectForKey:@"town_id"] isKindOfClass:[NSNull class]])
            placeModel.townId = [[dict objectForKey:@"town_id"] intValue];
        if (![[dict objectForKey:@"place_id"] isKindOfClass:[NSNull class]])
            placeModel.placeId = [[dict objectForKey:@"place_id"] intValue];
        if (![[dict objectForKey:@"place_name"] isKindOfClass:[NSNull class]])
            placeModel.placeName = [[dict objectForKey:@"place_name"] stringValue];
        if (![[dict objectForKey:@"place_image"] isKindOfClass:[NSNull class]])
            placeModel.placeImage = [dict objectForKey:@"place_image"];
        if (![[dict objectForKey:@"thumb_image"] isKindOfClass:[NSNull class]])
            placeModel.thumbImage = [dict objectForKey:@"thumb_image"];
        if (![[dict objectForKey:@"place_description"] isKindOfClass:[NSNull class]])
            placeModel.placeDescription = [[dict objectForKey:@"place_description"] stringValue];
        if (![[dict objectForKey:@"place_lat"] isKindOfClass:[NSNull class]])
            placeModel.placeLat = [[dict objectForKey:@"place_lat"] stringValue];
        if (![[dict objectForKey:@"place_lon"] isKindOfClass:[NSNull class]])
            placeModel.placeLon = [[dict objectForKey:@"place_lon"] stringValue];
        
        if (placeModel) {
            [listPlaces addObject:placeModel];
        }
    }
    return listPlaces;
}
@end
