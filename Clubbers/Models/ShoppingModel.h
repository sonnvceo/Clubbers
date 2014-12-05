//
//  ShoppingModel.h
//  Fight
//
//  Created by Sonnv on 12/28/13.
//  Copyright (c) 2013 AnhKien. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShoppingModel : NSObject

@property (strong,nonatomic) NSString *townId;
@property (strong,nonatomic) NSString *shoppingId;
@property (strong,nonatomic) NSString *shoppingName;
@property (strong,nonatomic) NSString *shoppingImage;
@property (strong,nonatomic) NSString *thumbImage;
@property (strong,nonatomic) NSString *shoppingDescription;
@property (strong,nonatomic) NSString *shoppingLat;
@property (strong,nonatomic) NSString *shoppingLon;

+(ShoppingModel*) shareInstance;
-(ShoppingModel*)setValuesFromDictionary:(NSDictionary*)dict;
@end
