//
// ClubModel.h
//  Fight
//
//  Created by Sonnv on 12/28/13.
//  Copyright (c) 2013 AnhKien. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClubModel : NSObject

@property (strong,nonatomic) NSString *clubId;
@property (strong,nonatomic) NSString *townId;
@property (strong,nonatomic) NSString *clubName;
@property (strong,nonatomic) NSString *clubPhone;
@property (strong,nonatomic) NSString *thumbImage;
@property (strong,nonatomic) NSString *clubDescription;
@property (strong,nonatomic) NSString *clubLat;
@property (strong,nonatomic) NSString *clubLon;
@property (strong,nonatomic) NSString *shortOverview;
@property (strong,nonatomic) NSString *fullOverview;
@property (strong,nonatomic) NSString *clubFeatures;
@property (strong,nonatomic) NSString *clubAddress;
@property (strong,nonatomic) NSString *clubEmail;
@property (strong,nonatomic) NSString *clubSiteurl;
@property (strong,nonatomic) NSString *clubHeaderTitle;
@property (strong,nonatomic) NSString *clubHeaderDetail;
+(ClubModel*) shareInstance;
-(ClubModel*)setValuesFromDictionary:(NSDictionary*)dict;
@end
