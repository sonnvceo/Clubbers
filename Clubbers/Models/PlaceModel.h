//
//  PlaceModel.h
//  Fight
//
//  Created by Sonnv on 12/28/13.
//  Copyright (c) 2013 AnhKien. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlaceModel : NSObject

@property (assign,nonatomic) NSInteger townId;
@property (assign,nonatomic) NSInteger placeId;
@property (strong,nonatomic) NSString *placeName;
@property (strong,nonatomic) NSString *placeImage;
@property (strong,nonatomic) NSString *thumbImage;
@property (strong,nonatomic) NSString *placeDescription;
@property (strong,nonatomic) NSString *placeLat;
@property (strong,nonatomic) NSString *placeLon;

+(PlaceModel*) shareInstance;
-(NSMutableArray*)parseJson:(NSArray*)listJson;
@end
