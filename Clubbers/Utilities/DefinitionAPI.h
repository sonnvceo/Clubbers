//
//  DefinitionAPI.h
//  Fight
//
//  Created by gilgameshvn on 12/6/13.
//  Copyright (c) 2013 AnhKien. All rights reserved.
//

#import <Foundation/Foundation.h>
// http://archive.org/download/WaltDisneyCartoons-MickeyMouseMinnieMouseDonaldDuckGoofyAndPluto/WaltDisneyCartoons-MickeyMouseMinnieMouseDonaldDuckGoofyAndPluto-HawaiianHoliday1937-Video.mp4

// @"http://video.nexttv.com.tw/e/w/20130312/10638792.mp4"
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)
//IOS Version
#define isiPhone5  ([[UIScreen mainScreen] bounds].size.height == 568)?TRUE:FALSE
#define verionIOS [[[UIDevice currentDevice] systemVersion] floatValue]


#pragma API

#define EVENTS_EVENTS @"http://www.ufightlive.tv/events/api_index"
#define CHANNELBYCATEGORIES @"http://www.ufightlive.tv/channels/api_channelsByCategory/%@/%@"
#define CATEGORIES_CATEGORIES @"http://www.ufightlive.tv/category/api_index/all"
#define EVENTSBYCATEGORIES @"http://www.ufightlive.tv/events/api_eventsBycategory/%@/%@"
#define SEARCH @"http://www.ufightlive.tv/search/api_searchChannelsByKeyword/%@"
#define MYACCOUNT @"http://www.ufightlive.tv/api_user/api_myAccount/%@"
#define MYFAVOURITE @"http://www.ufightlive.tv/api_user/api_favorites/%@"
#define VIDEO @"http://www.ufightlive.tv/videos/api_index"
#define NEWS  @"http://www.ufightlive.tv/news/api_index"
#define FOLLOWED @"http://www.ufightlive.tv/api_user/api_followed/%@"
#define MYCHANNEL @"http://www.ufightlive.tv/api_user/api_myChannels/%@" 
#define MYEVENT   @"http://www.ufightlive.tv/api_user/api_myEvents/%@"
#define MYVIDEO   @"http://www.ufightlive.tv/api_user/api_myVideos/%@"
#define MYINFO    @"http://www.ufightlive.tv/api_user/api_myInfo/%@"

#define LOGIN @"http://www.ufightlive.tv/home/api_login2/%@/%@"
#define LOGOUT @"http://www.ufightlive.tv/home/api_logout/%@"
#define SINGUP @"http://www.ufightlive.tv/register"

@interface DefinitionAPI : NSObject
@end
