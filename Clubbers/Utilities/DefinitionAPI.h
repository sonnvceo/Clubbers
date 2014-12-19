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
    kDetailViewController,
    KClubDetailViewController
} KTypeOfViewController;

@interface DefinitionAPI : NSObject
@end
/*
 <item name="item_white" type="color">#f9f9f9</item> [UIColor colorWithRed:0.976 green:0.976 blue:0.976 alpha:1]
 <item name="orange" type="color">#ffb400</item>    [UIColor colorWithRed:1 green:0.706 blue:0 alpha:1]
 <item name="yellow" type="color">#ffde00</item>    [UIColor colorWithRed:1 green:0.871 blue:0 alpha:1]
 <item name="green" type="color">#9edc6b</item>     [UIColor colorWithRed:0.62 green:0.863 blue:0.42 alpha:1]
 <item name="aqua" type="color">#6bcbdc</item>      [UIColor colorWithRed:0.42 green:0.796 blue:0.863 alpha:1]
 <item name="purple" type="color">#6b80dc</item>    [UIColor colorWithRed:0.42 green:0.502 blue:0.863 alpha:1]
 
 <item name="main_listing_bar_blue" type="color">#0072dc</item> [UIColor colorWithRed:0 green:0.447 blue:0.863 alpha:1]
 <item name="main_listing_bar_yellow" type="color">#ffb400</item> [UIColor colorWithRed:1 green:0.706 blue:0 alpha:1]
 <item name="main_listing_bar_green" type="color">#aeda38</item> [UIColor colorWithRed:0.682 green:0.855 blue:0.22 alpha:1]
 <item name="main_listing_bar_pink" type="color">#da3875</item>  [UIColor colorWithRed:0.855 green:0.22 blue:0.459 alpha:1]
 
 <item name="map_tab_bar_item1_normal_background" type="color">#80ffde00</item>  [UIColor colorWithRed:0.502 green:1 blue:0.871 alpha:1]
 <item name="map_tab_bar_item1_selected_background" type="color">#ffde00</item> [UIColor colorWithRed:1 green:0.871 blue:0 alpha:1]
 <item name="map_tab_bar_item2_normal_background" type="color">#80ffb400</item> [UIColor colorWithRed:0.502 green:1 blue:0.706 alpha:1]
 <item name="map_tab_bar_item2_selected_background" type="color">#ffb400</item> [UIColor colorWithRed:1 green:0.706 blue:0 alpha:1]
 <item name="map_tab_bar_item3_normal_background" type="color">#809edc6b</item> [UIColor colorWithRed:0.502 green:0.62 blue:0.863 alpha:1]
 <item name="map_tab_bar_item3_selected_background" type="color">#9edc6b</item> [UIColor colorWithRed:0.62 green:0.863 blue:0.42 alpha:1]
 <item name="map_tab_bar_item4_normal_background" type="color">#80d23ef2</item> [UIColor colorWithRed:0.502 green:0.824 blue:0.243 alpha:1]
 <item name="map_tab_bar_item4_selected_background" type="color">#d23ef2</item> [UIColor colorWithRed:0.824 green:0.243 blue:0.949 alpha:1]
 <item name="map_tab_bar_item5_normal_background" type="color">#806bcbdc</item> [UIColor colorWithRed:0.502 green:0.42 blue:0.796 alpha:1]
 <item name="map_tab_bar_item5_selected_background" type="color">#6bcbdc</item> [UIColor colorWithRed:0.42 green:0.796 blue:0.863 alpha:1]
 
 <color name="GrayLight">#eeeeee</color> [UIColor colorWithRed:0.933 green:0.933 blue:0.933 alpha:1]
 <color name="table_color_selected">#50ffffff</color> [UIColor colorWithRed:0.314 green:1 blue:1 alpha:1]
 */
