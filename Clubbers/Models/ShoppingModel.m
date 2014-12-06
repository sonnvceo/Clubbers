//
//  ShoppingModel.m
//  Fight
//
//  Created by Sonnv on 12/28/13.
//  Copyright (c) 2013 AnhKien. All rights reserved.
//

#import "ShoppingModel.h"

@implementation ShoppingModel
@synthesize townId,
shoppingId,
shoppingName,
shoppingImage,
thumbImage,
shoppingDescription,
shoppingLat,
shoppingLon;

static ShoppingModel* _instance = nil;
+(ShoppingModel*) shareInstance {
    @synchronized(self) {
        if (_instance == nil) {
            _instance = [[ShoppingModel alloc] init];
        }
    }
    return _instance;
}
-(NSMutableArray*)parseJson:(NSArray*)listJson {
    NSMutableArray *listShopping = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in listJson) {
            ShoppingModel *shoppingModel = [[ShoppingModel alloc]init];
        if (![[dict objectForKey:@"town_id"] isKindOfClass:[NSNull class]])
            shoppingModel.townId = [[dict objectForKey:@"town_id"] intValue];
        if (![[dict objectForKey:@"shopping_id"] isKindOfClass:[NSNull class]])
            shoppingModel.shoppingId = [[dict objectForKey:@"shopping_id"] intValue];
        if (![[dict objectForKey:@"shopping_name"] isKindOfClass:[NSNull class]])
            shoppingModel.shoppingName = [dict objectForKey:@"shopping_name"];
        if (![[dict objectForKey:@"shopping_image"] isKindOfClass:[NSNull class]])
            shoppingModel.shoppingImage = [dict objectForKey:@"shopping_image"];
        if (![[dict objectForKey:@"thumb_image"] isKindOfClass:[NSNull class]])
            shoppingModel.thumbImage = [dict objectForKey:@"thumb_image"];
        if (![[dict objectForKey:@"shopping_description"] isKindOfClass:[NSNull class]])
            shoppingModel.shoppingDescription = [dict objectForKey:@"shopping_description"];
        if (![[dict objectForKey:@"shopping_lat"] isKindOfClass:[NSNull class]])
            shoppingModel.shoppingLat = [dict objectForKey:@"shopping_lat"];
        if (![[dict objectForKey:@"shopping_lon"] isKindOfClass:[NSNull class]])
            shoppingModel.shoppingLon = [dict objectForKey:@"shopping_lon"];
        
        if (shoppingModel) {
            [listShopping addObject:shoppingModel];
        }
    }
    return listShopping;
}
@end
