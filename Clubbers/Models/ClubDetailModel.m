//
//  ClubModel.m
//  Fight
//
//  Created by Sonnv on 12/28/13.
//  Copyright (c) 2013 AnhKien. All rights reserved.
//

#import "ClubDetailModel.h"

@implementation ClubDetailModel
@synthesize clubId,
townId,
clubName,
clubPhone,
clubImage,
thumbImage,
clubDescription,
clubLat,
clubLon,
shortOverview,
fullOverview,
clubFeatures,
clubAddress,
clubEmail,
clubSiteurl,
clubHeaderTitle,
clubHeaderDetail;


static ClubDetailModel* _instance = nil;
+(ClubDetailModel*) shareInstance {
    @synchronized(self) {
        if (_instance == nil) {
            _instance = [[ClubDetailModel alloc] init];
        }
    }
    return _instance;
}
- (ClubDetailModel*)parseJson:(NSDictionary*)jsonDict {
    if (!jsonDict)
        return nil;
    else {
        ClubDetailModel *clubModel = [[ClubDetailModel alloc]init];
        if (![[jsonDict objectForKey:@"club_id"] isKindOfClass:[NSNull class]])
            clubModel.clubId = [[jsonDict objectForKey:@"club_id"] intValue];
        if (![[jsonDict objectForKey:@"town_id"] isKindOfClass:[NSNull class]])
            clubModel.townId = [[jsonDict objectForKey:@"town_id"] intValue];
        if (![[jsonDict objectForKey:@"club_name"] isKindOfClass:[NSNull class]])
            clubModel.clubName = [jsonDict objectForKey:@"club_name"];
        if (![[jsonDict objectForKey:@"club_phone"] isKindOfClass:[NSNull class]])
            clubModel.clubPhone = [jsonDict objectForKey:@"club_phone"];
        if (![[jsonDict objectForKey:@"club_image"] isKindOfClass:[NSNull class]])
            clubModel.clubImage = [jsonDict objectForKey:@"club_image"];
        if (![[jsonDict objectForKey:@"thumb_image"] isKindOfClass:[NSNull class]])
            clubModel.thumbImage = [jsonDict objectForKey:@"thumb_image"];
        if (![[jsonDict objectForKey:@"club_description"] isKindOfClass:[NSNull class]])
            clubModel.clubDescription = [jsonDict objectForKey:@"club_description"];
        if (![[jsonDict objectForKey:@"club_lat"] isKindOfClass:[NSNull class]])
            clubModel.clubLat = [jsonDict objectForKey:@"club_lat"];
        if (![[jsonDict objectForKey:@"club_lon"] isKindOfClass:[NSNull class]])
            clubModel.clubLon = [jsonDict objectForKey:@"club_lon"];
        if (![[jsonDict objectForKey:@"short_overview"] isKindOfClass:[NSNull class]])
            clubModel.shortOverview = [jsonDict objectForKey:@"short_overview"];
        if (![[jsonDict objectForKey:@"full_overview"] isKindOfClass:[NSNull class]])
            clubModel.fullOverview = [jsonDict objectForKey:@"full_overview"];
        if (![[jsonDict objectForKey:@"club_features"] isKindOfClass:[NSNull class]])
            clubModel.clubFeatures = [jsonDict objectForKey:@"club_features"];
        if (![[jsonDict objectForKey:@"club_address"] isKindOfClass:[NSNull class]])
            clubModel.clubAddress = [jsonDict objectForKey:@"club_address"];
        if (![[jsonDict objectForKey:@"club_email"] isKindOfClass:[NSNull class]])
            clubModel.clubEmail = [jsonDict objectForKey:@"club_email"];
        if (![[jsonDict objectForKey:@"club_siteurl"] isKindOfClass:[NSNull class]])
            clubModel.clubSiteurl = [jsonDict objectForKey:@"club_siteurl"];
        if (![[jsonDict objectForKey:@"club_header_title"] isKindOfClass:[NSNull class]])
            clubModel.clubHeaderTitle = [jsonDict objectForKey:@"club_header_title"];
        if (![[jsonDict objectForKey:@"club_header_detail"] isKindOfClass:[NSNull class]])
            clubModel.clubHeaderDetail = [jsonDict objectForKey:@"club_header_detail"];
        
        return clubModel;
    }
    return nil;
}
#pragma mark - SQLite Manager Methods
- (void)createEditableCopyOfDatabaseIfNeeded
{
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"testdb.sqlite"];
    NSLog(@"Path: %@", writableDBPath);
    success = [fileManager fileExistsAtPath:writableDBPath];
    if (success) {
        NSLog(@"DB File already present in the documents :)");
        return ;
    }
    //The writable database does not exist, so copy the default to the appropriate location.
    NSString *defaultDBPath = [[NSBundle mainBundle] pathForResource:@"testdb" ofType:@"sqlite"];;
    success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
    if (!success)
    {
        NSLog(@"Failed to create writable database file :(");
    }
    else
    {
        NSLog(@"DB File copied to documents Successfully :)");
    }
}
- (sqlite3 *) getNewDBConnection
{
    sqlite3 *newDBconnection;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"testdb.sqlite"];
    
    //Open the database. The database was prepared outside the application.
    if (sqlite3_open([path UTF8String], &newDBconnection) == SQLITE_OK)
    {
        NSLog(@"Database Successfully Opened :)");
    }
    else
    {
        NSLog(@"Error in opening database :(");
    }
    return newDBconnection;
}

-(NSArray*)getDataFromSQLite
{
    sqlite3 * db=[self getNewDBConnection];
    sqlite3_stmt * stmt=nil;
    const char * sql="select * from tblClub";
    
    if(sqlite3_prepare_v2(db,sql,-1,&stmt,NULL)!=SQLITE_OK)
    {
        NSLog(@"ERROR PREPARING STATEMENT");
    }
    else
    {
        self.arrayClubFav = nil;
        self.arrayClubFav = [[NSMutableArray alloc] init];
        
        while(sqlite3_step(stmt)==SQLITE_ROW)
        {
            NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] init];
            
            [dataDictionary setObject:[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(stmt,0)] forKey:@"club_id"];
            [dataDictionary setValue:[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(stmt,1)] forKey:@"town_id"];
            [dataDictionary setValue:[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(stmt,2)] forKey:@"club_name"];
            [dataDictionary setValue:[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(stmt,3)] forKey:@"club_phone"];
            [dataDictionary setValue:[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(stmt,4)] forKey:@"club_image"];
            [dataDictionary setValue:[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(stmt,5)] forKey:@"thumb_image"];
            [dataDictionary setValue:[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(stmt,6)] forKey:@"club_description"];
            [dataDictionary setValue:[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(stmt,7)] forKey:@"club_lat"];
            [dataDictionary setValue:[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(stmt,8)] forKey:@"club_lon"];
            [dataDictionary setValue:[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(stmt,9)] forKey:@"short_overview"];
            [dataDictionary setValue:[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(stmt,10)] forKey:@"club_features"];
            [dataDictionary setValue:[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(stmt,11)] forKey:@"club_address"];
            [dataDictionary setValue:[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(stmt,12)] forKey:@"club_email"];
            [dataDictionary setValue:[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(stmt,13)] forKey:@"club_siteurl"];
            [dataDictionary setValue:[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(stmt,14)] forKey:@"club_header_title"];
            [dataDictionary setValue:[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(stmt,15)] forKey:@"club_header_title"];
            [dataDictionary setValue:[NSString stringWithFormat:@"%s",(char *)sqlite3_column_text(stmt,16)] forKey:@"club_header_detail"];
            
            [self.arrayClubFav addObject:dataDictionary];
        }
    }
    sqlite3_close(db);
    return self.arrayClubFav;
}

#pragma mark - Button Actions
- (void)insertDataToSQLite:(ClubDetailModel*) clubDetailModel
{
    NSLog(@"+++ %d", clubDetailModel.clubId);
    NSLog(@"+++ %d", clubDetailModel.townId);
    NSLog(@"+++ %@", clubDetailModel.clubName);
    NSLog(@"+++ %@", clubDetailModel.clubPhone);
    NSLog(@"+++ %@", clubDetailModel.clubImage);
    NSLog(@"+++ %@", clubDetailModel.thumbImage);
    NSLog(@"+++ %@", clubDetailModel.clubDescription);
    NSLog(@"+++ %@", clubDetailModel.clubLat);
    NSLog(@"+++ %@", clubDetailModel.clubLon);
    NSLog(@"+++ %@", clubDetailModel.shortOverview);
    NSLog(@"+++ %@", clubDetailModel.fullOverview);
    NSLog(@"+++ %@", clubDetailModel.clubFeatures);
    NSLog(@"+++ %@", clubDetailModel.clubAddress);
    NSLog(@"+++ %@", clubDetailModel.clubEmail);
    NSLog(@"+++ %@", clubDetailModel.clubSiteurl);
    NSLog(@"+++ %@", clubDetailModel.clubHeaderTitle);
    NSLog(@"+++ %@", clubDetailModel.clubHeaderDetail);
//    if([areaId isEqualToString:@""] || [nameEng isEqualToString:@""] || [nameGer isEqualToString:@""])
//    {
//
//    }
//    else
//    {
        sqlite3 *db=[self getNewDBConnection];
        sqlite3_stmt *stmt=nil;
        const char *sql=[[NSString stringWithFormat:@"insert into tblClub values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')",
                          [NSString stringWithFormat:@"%d", clubDetailModel.clubId],
                          [NSString stringWithFormat:@"%d", clubDetailModel.townId],
                          clubDetailModel.clubName,
                          clubDetailModel.clubPhone,
                          clubDetailModel.clubImage,
                          clubDetailModel.thumbImage,
                          clubDetailModel.clubDescription,
                          clubDetailModel.clubLat,
                          clubDetailModel.clubLon,
                          clubDetailModel.shortOverview,
                          clubDetailModel.fullOverview,
                          clubDetailModel.clubFeatures,
                          clubDetailModel.clubAddress,
                          clubDetailModel.clubEmail,
                          clubDetailModel.clubSiteurl,
                          clubDetailModel.clubHeaderTitle,
                          clubDetailModel.clubHeaderDetail] UTF8String];
        
        int status = sqlite3_exec(db, sql, nil, nil, nil);
        NSLog(@"SQLITE Querry Status: %d", status);
        
        if(status != SQLITE_OK)
        {
        }
        else
        {
            sqlite3_finalize(stmt);
        }
        sqlite3_close(db);
//    }
}
- (BOOL) checkFavTownExists:(NSInteger) kClubId {
    BOOL isCheckExitst = NO;
    sqlite3 *db=[self getNewDBConnection];
    sqlite3_stmt *stmt=nil;
    const char *sql=[[NSString stringWithFormat:@"SELECT EXISTS(SELECT 1 FROM tblClub WHERE clubID='%@')", [NSString stringWithFormat:@"%d", kClubId]] UTF8String];
    if(sqlite3_prepare_v2(db,sql,-1,&stmt,NULL)!=SQLITE_OK) {
        NSLog(@"ERROR PREPARING STATEMENT");
    }
    else {
        while(sqlite3_step(stmt)==SQLITE_ROW) {
            isCheckExitst = (int)sqlite3_column_int(stmt, 0)?YES:NO;
        }
    }
    sqlite3_close(db);
    return isCheckExitst;
}
#pragma mark - Button Actions
- (void)updateDataToSQLite:(NSString*) name andNote:(NSString*) note {
    if(![note isEqualToString:@""]) {
        sqlite3 *db=[self getNewDBConnection];
        sqlite3_stmt *stmt=nil;
        const char *sql=[[NSString stringWithFormat:@"UPDATE Notes SET Note='%@' WHERE SubmittedBy='%@'", note, name] UTF8String];
        
        int status = sqlite3_exec(db, sql, nil, nil, nil);
        NSLog(@"SQLITE Querry Status: %d", status);
        
        if(status != SQLITE_OK)
        {
        }
        else
        {
            sqlite3_finalize(stmt);
            
        }
        sqlite3_close(db);
    }
    else
    {

    }
}
/*
- (void)deleteDataFormSQLite:(NSIndexPath*) indexPath
{
    sqlite3 *db=[self getNewDBConnection];
    sqlite3_stmt *stmt=nil;
    const char *sql=[[NSString stringWithFormat:@"DELETE FROM Notes WHERE SubmittedBy='%@'", [[self.arrayClubFav objectAtIndex:indexPath.row] objectForKey:@"SubmittedBy"]] UTF8String];
    
    int status = sqlite3_exec(db, sql, nil, nil, nil);
    NSLog(@"SQLITE Querry Status: %d", status);
    
    if(status != SQLITE_OK)
    {
        UIAlertView *errAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Error Preparing statement, try again later." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        if(status == SQLITE_CONSTRAINT)
        {
            errAlert.message = @"Cannot add multiple notes for same user, try editing old one of yours.";
        }
        [errAlert show];
    }
    else
    {
        sqlite3_finalize(stmt);
    }
    sqlite3_close(db);
    
}
*/
@end
