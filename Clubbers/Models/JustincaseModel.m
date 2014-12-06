//
//  JustincaseModel.m
//  Fight
//
//  Created by Sonnv on 12/28/13.
//  Copyright (c) 2013 AnhKien. All rights reserved.
//

#import "JustincaseModel.h"

@implementation JustincaseModel
@synthesize townId,
justincaseId,
justincaseName,
justincaseImage,
thumbImage,
justincaseDescription,
justincaseLat,
justincaseLon;

static JustincaseModel* _instance = nil;
+(JustincaseModel*) shareInstance {
    @synchronized(self) {
        if (_instance == nil) {
            _instance = [[JustincaseModel alloc] init];
        }
    }
    return _instance;
}
-(NSMutableArray*)parseJson:(NSArray*)listJson {
    NSMutableArray *listJustincase = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in listJson) {
            JustincaseModel *justincaseModel = [[JustincaseModel alloc]init];
        if (![[dict objectForKey:@"town_id"] isKindOfClass:[NSNull class]])
            justincaseModel.townId = [[dict objectForKey:@"town_id"] intValue];
        if (![[dict objectForKey:@"justincase_id"] isKindOfClass:[NSNull class]])
            justincaseModel.justincaseId = [[dict objectForKey:@"justincase_id"] intValue];
        if (![[dict objectForKey:@"justincase_name"] isKindOfClass:[NSNull class]])
            justincaseModel.justincaseName = [[dict objectForKey:@"justincase_name"] stringValue];
        if (![[dict objectForKey:@"justincase_image"] isKindOfClass:[NSNull class]])
            justincaseModel.justincaseImage = [dict objectForKey:@"justincase_image"];
        if (![[dict objectForKey:@"thumb_image"] isKindOfClass:[NSNull class]])
            justincaseModel.thumbImage = [dict objectForKey:@"thumb_image"];
        if (![[dict objectForKey:@"justincase_description"] isKindOfClass:[NSNull class]])
            justincaseModel.justincaseDescription = [[dict objectForKey:@"justincase_description"] stringValue];
        if (![[dict objectForKey:@"justincase_lat"] isKindOfClass:[NSNull class]])
            justincaseModel.justincaseLat = [[dict objectForKey:@"justincase_lat"] stringValue];
        if (![[dict objectForKey:@"justincase_lon"] isKindOfClass:[NSNull class]])
            justincaseModel.justincaseLon = [[dict objectForKey:@"justincase_lon"] stringValue];
        
        if (justincaseModel) {
            [listJustincase addObject:justincaseModel];
        }
    }
    return listJustincase;
}
@end
