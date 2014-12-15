//
//  DefinitionAPI.h
//  Fight
//
//  Created by gilgameshvn on 12/6/13.
//  Copyright (c) 2013 AnhKien. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)
//IOS Version
#define isiPhone5  ([[UIScreen mainScreen] bounds].size.height == 568)?TRUE:FALSE
#define verionIOS [[[UIDevice currentDevice] systemVersion] floatValue]

#define IS_RETINA ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && ([UIScreen mainScreen].scale == 2.0))

#define IS_IPHONE6 ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] && fabs( ( double )[ [ UIScreen mainScreen ] nativeBounds ].size.height - ( double )1334 ) < DBL_EPSILON )
#define IS_IPHONE6_PLUS ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] && fabs( ( double )[ [ UIScreen mainScreen ] nativeBounds ].size.height - ( double )2208 ) < DBL_EPSILON )

/*
#pragma API
#define URL_BASE @"http://www.clubbersapptoibiza.com/api/"

#define URL_TOWN @"http://www.clubbersapptoibiza.com/api/sa_towns_list"

#define URL_TOWNDETAIL @"http://www.clubbersapptoibiza.com/api/sa_town_details/?town_id=1"

#define URL_CLUBS @"http://www.clubbersapptoibiza.com/api/"

#define URL_SHOPPING @"http://www.clubbersapptoibiza.com/api/sa_shoppings_list/?town_id=1"

#define URL_RESTAURANTS @"http://www.clubbersapptoibiza.com/api/sa_restaurants_list/?town_id=1"

#define URL_PLACES @"http://www.clubbersapptoibiza.com/api/sa_places_list/?town_id=1"

#define URL_THINGS @"http://www.ufightlive.tv/api_user/api_favorites/%@"

#define URL_JUSTINCASE @"http://www.clubbersapptoibiza.com/api/sa_justincases_list/?town_id=1"

#define URL_ALL_CLUBS  @"http://www.clubbersapptoibiza.com/api/sa_all_clubs"

#define URL_PHOTO_GALLERY @"http://www.clubbersapptoibiza.com/api/sa_photos_gallery"
 */

#define OFFICIAL_SERVER @"http://www.clubbersapptoibiza.com/api/"
#define RSS_SERVER @"http://www.clubbersapptoibiza.com/app/"
#define WEATHER_API_SERVER @"http://api.openweathermap.org/data/2.5/weather?lat=38.9088888889&lon=1.4327777778"

extern NSString* const SA_TOWNS_LIST;
extern NSString* const SA_TOWN_DETAILS ;
extern NSString* const SA_CLUBS_LIST ;
extern NSString* const SA_CLUB_DETAILS ;
extern NSString* const SA_PLACES_LIST ;
extern NSString* const SA_PLACE_DETAILS ;
extern NSString* const SA_THINGS_LIST ;
extern NSString* const SA_THING_DETAILS ;
extern NSString* const SA_RESTAURANTS_LIST ;
extern NSString* const SA_RESTAURANT_DETAILS ;
extern NSString* const SA_JUSTINCASES_LIST ;
extern NSString* const SA_JUSTINCASE_DETAILS ;
extern NSString* const SA_SHOPPINGS_LIST ;
extern NSString* const SA_SHOPPING_DETAILS ;
extern NSString* const SA_ALL_CLUBS ;
extern NSString* const SA_ALL_SHOPPINGS ;
extern NSString* const SA_ALL_RESTAURANTS ;
extern NSString* const SA_ALL_PLACES ;
extern NSString* const SA_ALL_THINGS ;
extern NSString* const SA_ALL_JUSTINCASES;
extern NSString* const SA_GET_RSS ;
extern NSString* const SA_GET_WEATHER ;
extern NSString* const PN_REGISTER_DEVICE ;
extern NSString* const SA_APP_URL ;
extern NSString* const SA_TOWN_GUIDE ;

extern NSString* const PARAM_TOWN_ID;
extern NSString* const PARAM_CLUB_ID;
extern NSString* const PARAM_PLACE_ID ;
extern NSString* const PARAM_THING_ID ;
extern NSString* const PARAM_RESTAURANT_ID ;
extern NSString* const PARAM_JUSTINCASE_ID;
extern NSString* const PARAM_SHOPPING_ID ;
extern NSString* const PARAM_DEVICE_TOKEN ;
extern NSString* const PARAM_DEVICE_TYPE ;

extern NSString* const PARAM_FEED;
extern NSString* const PARAM_CAT ;
extern NSString* const PARAM_PLATFORM;

enum {
    kCityViewController,
    kClubViewController,
    kLbizaMApViewController,
    kMyFavViewController,
    kNewsAndEventsViewController
} KKindOfViewController;

enum {
    kMasterViewController,
    kDetailViewController
} KTypeOfViewController;

@interface DefinitionAPI : NSObject
@end
