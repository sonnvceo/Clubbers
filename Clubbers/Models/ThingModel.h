//
//  ThingModel.h
//  Fight
//
//  Created by Sonnv on 12/28/13.
//  Copyright (c) 2013 AnhKien. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThingModel : NSObject

@property (strong,nonatomic) NSString *townId;
@property (strong,nonatomic) NSString *thingId;
@property (strong,nonatomic) NSString *thingName;
@property (strong,nonatomic) NSString *thingImage;
@property (strong,nonatomic) NSString *thumbImage;
@property (strong,nonatomic) NSString *thingDescription;
@property (strong,nonatomic) NSString *thingLat;
@property (strong,nonatomic) NSString *thingLon;

+(ThingModel*) shareInstance;
-(ThingModel*)setValuesFromDictionary:(NSDictionary*)dict;
@end
