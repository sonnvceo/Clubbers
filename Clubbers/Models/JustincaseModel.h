//
//  JustincaseModel.h
//  Fight
//
//  Created by Sonnv on 12/28/13.
//  Copyright (c) 2013 AnhKien. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JustincaseModel : NSObject

@property (strong,nonatomic) NSString *townId;
@property (strong,nonatomic) NSString *justincaseId;
@property (strong,nonatomic) NSString *justincaseName;
@property (strong,nonatomic) NSString *justincaseImage;
@property (strong,nonatomic) NSString *thumbImage;
@property (strong,nonatomic) NSString *justincaseDescription;
@property (strong,nonatomic) NSString *justincaseLat;
@property (strong,nonatomic) NSString *justincaseLon;

+(JustincaseModel*) shareInstance;
-(JustincaseModel*)setValuesFromDictionary:(NSDictionary*)dict;
@end
