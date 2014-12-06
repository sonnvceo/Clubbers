//
//  ThingModel.m
//  Fight
//
//  Created by Sonnv on 12/28/13.
//  Copyright (c) 2013 AnhKien. All rights reserved.
//

#import "ThingModel.h"

@implementation ThingModel
@synthesize townId,
thingId,
thingName,
thingImage,
thumbImage,
thingDescription,
thingLat,
thingLon;

static ThingModel* _instance = nil;
+(ThingModel*) shareInstance {
    @synchronized(self) {
        if (_instance == nil) {
            _instance = [[ThingModel alloc] init];
        }
    }
    return _instance;
}
-(NSMutableArray*)parseJson:(NSArray*)listJson {
    NSMutableArray *listThings = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in listJson) {
            ThingModel *thingModel = [[ThingModel alloc]init];
        if (![[dict objectForKey:@"town_id"] isKindOfClass:[NSNull class]])
            thingModel.townId = [[dict objectForKey:@"town_id"] intValue];
        if (![[dict objectForKey:@"thing_id"] isKindOfClass:[NSNull class]])
            thingModel.thingId = [[dict objectForKey:@"thing_id"] intValue];
        if (![[dict objectForKey:@"thing_name"] isKindOfClass:[NSNull class]])
            thingModel.thingName = [[dict objectForKey:@"thing_name"] stringValue];
        if (![[dict objectForKey:@"thing_image"] isKindOfClass:[NSNull class]])
            thingModel.thingImage = [dict objectForKey:@"thing_image"];
        if (![[dict objectForKey:@"thumb_image"] isKindOfClass:[NSNull class]])
            thingModel.thumbImage = [dict objectForKey:@"thumb_image"];
        if (![[dict objectForKey:@"thing_description"] isKindOfClass:[NSNull class]])
            thingModel.thingDescription = [[dict objectForKey:@"thing_description"] stringValue];
        if (![[dict objectForKey:@"thing_lat"] isKindOfClass:[NSNull class]])
            thingModel.thingLat = [[dict objectForKey:@"thing_lat"] stringValue];
        if (![[dict objectForKey:@"thing_lon"] isKindOfClass:[NSNull class]])
            thingModel.thingLon = [[dict objectForKey:@"thing_lon"] stringValue];
        
        if (thingModel) {
            [listThings addObject:thingModel];
        }
    }
    return listThings;
}
@end
