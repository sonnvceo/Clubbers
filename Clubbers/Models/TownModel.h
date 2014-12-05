//
//  TownModel.h
//  Fight
//
//  Created by Sonnv on 12/28/13.
//  Copyright (c) 2013 AnhKien. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TownModel : NSObject

@property (strong,nonatomic) NSString *townId;
@property (strong,nonatomic) NSString *townName;
@property (strong,nonatomic) NSString *townImage;
@property (strong,nonatomic) NSString *thumbImage;
@property (strong,nonatomic) NSString *townDescription;
@property (strong,nonatomic) NSString *shortOverview;
@property (strong,nonatomic) NSString *fullOverview;
@property (strong,nonatomic) NSString *townHeaderTitle;
@property (strong,nonatomic) NSString *townDeaderDetail;
+(TownModel*) shareInstance;
-(TownModel*)setValuesFromDictionary:(NSDictionary*)dict;
@end
