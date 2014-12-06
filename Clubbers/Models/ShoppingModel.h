//
//  ShoppingModel.h
//  Fight
//
//  Created by Sonnv on 12/28/13.
//  Copyright (c) 2013 AnhKien. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShoppingModel : NSObject

@property (assign,nonatomic) NSInteger townId;
@property (assign,nonatomic) NSInteger shoppingId;
@property (strong,nonatomic) NSString *shoppingName;
@property (strong,nonatomic) NSString *shoppingImage;
@property (strong,nonatomic) NSString *thumbImage;
@property (strong,nonatomic) NSString *shoppingDescription;
@property (strong,nonatomic) NSString *shoppingLat;
@property (strong,nonatomic) NSString *shoppingLon;

+(ShoppingModel*) shareInstance;
-(NSMutableArray*)parseJson:(NSArray*)listJson ;
@end
