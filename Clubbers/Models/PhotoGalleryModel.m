//
//  PhotoGalleryModel.m
//  Fight
//
//  Created by Sonnv on 12/28/13.
//  Copyright (c) 2013 AnhKien. All rights reserved.
//

#import "PhotoGalleryModel.h"

@implementation PhotoGalleryModel
@synthesize photoId,
thumbImage,
largeImage;

static PhotoGalleryModel* _instance = nil;
+(PhotoGalleryModel*) shareInstance {
    @synchronized(self) {
        if (_instance == nil) {
            _instance = [[PhotoGalleryModel alloc] init];
        }
    }
    return _instance;
}
-(PhotoGalleryModel*)setValuesFromDictionary:(NSDictionary*)dict {
        PhotoGalleryModel *photoGalleryModel = [[PhotoGalleryModel alloc]init];
    if (![[dict objectForKey:@"id"] isKindOfClass:[NSNull class]])
        photoGalleryModel.photoId = [[dict objectForKey:@"id"] stringValue];
    if (![[dict objectForKey:@"thumb_image"] isKindOfClass:[NSNull class]])
        photoGalleryModel.thumbImage = [dict objectForKey:@"thumb_image"];
    if (![[dict objectForKey:@"large_image"] isKindOfClass:[NSNull class]])
        photoGalleryModel.largeImage = [[dict objectForKey:@"large_image"] stringValue];
        return photoGalleryModel;
}
@end