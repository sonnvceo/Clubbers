//
//  TownDetailModel.h
//  Fight
//
//  Created by Sonnv on 12/28/13.
//  Copyright (c) 2013 AnhKien. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TownDetailModel : NSObject

@property (assign,nonatomic) NSInteger townId;
@property (strong,nonatomic) NSString *townName;
@property (strong,nonatomic) NSString *townImage;
@property (strong,nonatomic) NSString *thumbImage;
@property (strong,nonatomic) NSString *townDescription;
@property (strong,nonatomic) NSString *shortOverview;
@property (strong,nonatomic) NSString *fullOverview;
@property (strong,nonatomic) NSString *townHeaderTitle;
@property (strong,nonatomic) NSString *townDeaderDetail;
@property (strong,nonatomic) NSArray  *imageGallerys;
+(TownDetailModel*) shareInstance;
-(NSMutableArray*)parseJson:(NSArray*)listJson;
@end
