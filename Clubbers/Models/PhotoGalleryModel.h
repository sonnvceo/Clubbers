//
//  PhotoGalleryModel.h
//  Fight
//
//  Created by Sonnv on 12/28/13.
//  Copyright (c) 2013 AnhKien. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoGalleryModel : NSObject

@property (assign,nonatomic) NSInteger photoId;
@property (strong,nonatomic) NSString *thumbImage;
@property (strong,nonatomic) NSString *largeImage;

+(PhotoGalleryModel*) shareInstance;
-(NSMutableArray*)parseJson:(NSArray*)listJson;
@end
