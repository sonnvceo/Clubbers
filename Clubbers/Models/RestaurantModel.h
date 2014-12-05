//
//  RestaurantModel.h
//  Fight
//
//  Created by Sonnv on 12/28/13.
//  Copyright (c) 2013 AnhKien. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RestaurantModel : NSObject

@property (strong,nonatomic) NSString *townId;
@property (strong,nonatomic) NSString *restaurantId;
@property (strong,nonatomic) NSString *restaurantName;
@property (strong,nonatomic) NSString *restaurantImage;
@property (strong,nonatomic) NSString *thumbImage;
@property (strong,nonatomic) NSString *restaurantDescription;
@property (strong,nonatomic) NSString *restaurantLat;
@property (strong,nonatomic) NSString *restaurantLon;

+(RestaurantModel*) shareInstance;
-(RestaurantModel*)setValuesFromDictionary:(NSDictionary*)dict;
@end
