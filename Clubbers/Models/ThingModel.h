//
//  ThingModel.h
//  Fight
//
//  Created by Sonnv on 12/28/13.
//  Copyright (c) 2013 AnhKien. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThingModel : NSObject

@property (assign,nonatomic) NSInteger townId;
@property (assign,nonatomic) NSInteger thingId;
@property (strong,nonatomic) NSString *thingName;
@property (strong,nonatomic) NSString *thingImage;
@property (strong,nonatomic) NSString *thumbImage;
@property (strong,nonatomic) NSString *thingDescription;
@property (strong,nonatomic) NSString *thingLat;
@property (strong,nonatomic) NSString *thingLon;

+(ThingModel*) shareInstance;
-(NSMutableArray*)parseJson:(NSArray*)listJson;
@end
