//
//  RestaurantModel.m
//  Fight
//
//  Created by Sonnv on 12/28/13.
//  Copyright (c) 2013 AnhKien. All rights reserved.
//

#import "RestaurantModel.h"

@implementation RestaurantModel
@synthesize townId,
restaurantId,
restaurantName,
restaurantImage,
thumbImage,
restaurantDescription,
restaurantLat,
restaurantLon;

static RestaurantModel* _instance = nil;
+(RestaurantModel*) shareInstance {
    @synchronized(self) {
        if (_instance == nil) {
            _instance = [[RestaurantModel alloc] init];
        }
    }
    return _instance;
}
-(NSMutableArray*)parseJson:(NSArray*)listJson {
    NSMutableArray *listRestaurant = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in listJson) {
            RestaurantModel *restaurantModel = [[RestaurantModel alloc] init];
        if (![[dict objectForKey:@"town_id"] isKindOfClass:[NSNull class]])
            restaurantModel.townId = [[dict objectForKey:@"town_id"] intValue];
        if (![[dict objectForKey:@"restaurant_id"] isKindOfClass:[NSNull class]])
            restaurantModel.restaurantId = [[dict objectForKey:@"restaurant_id"] intValue];
        if (![[dict objectForKey:@"restaurant_name"] isKindOfClass:[NSNull class]])
            restaurantModel.restaurantName = [dict objectForKey:@"restaurant_name"];
        if (![[dict objectForKey:@"restaurant_image"] isKindOfClass:[NSNull class]])
            restaurantModel.restaurantImage = [dict objectForKey:@"restaurant_image"];
        if (![[dict objectForKey:@"thumb_image"] isKindOfClass:[NSNull class]])
            restaurantModel.thumbImage = [dict objectForKey:@"thumb_image"];
        if (![[dict objectForKey:@"restaurant_description"] isKindOfClass:[NSNull class]])
            restaurantModel.restaurantDescription = [dict objectForKey:@"restaurant_description"];
        if (![[dict objectForKey:@"restaurant_lat"] isKindOfClass:[NSNull class]])
            restaurantModel.restaurantLat = [dict objectForKey:@"restaurant_lat"];
        if (![[dict objectForKey:@"restaurant_lon"] isKindOfClass:[NSNull class]])
            restaurantModel.restaurantLon = [dict objectForKey:@"restaurant_lon"];
        
        if (restaurantModel) {
            [listRestaurant addObject:restaurantModel];
        }
    }
    return listRestaurant;
}
@end
