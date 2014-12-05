//
//  GetInitializeAreaOfExpertisesRequest.m
//  KloonTest
//
//  Created by Sonnv on 11/18/13.
//  Copyright (c) 2013 Kloon. All rights reserved.
//

#import "GetInitializeAreaOfExpertisesRequest.h"

#define URL_BASE                           @"http://php.kloon.net/hoangapp/bookingmobile/index.php"

@implementation GetInitializeAreaOfExpertisesRequest

- (id)initWithDelegate:(id <GetInitializeAreaOfExpertisesRequestDelegate>)del
{
	self = [super init];
	
	if (!self)
		return nil;
	[self setDelegate:del];
	return self;
}
// send request to the "Initialize_Area_of_Expertises" web service
-(void)getInitializeAreaOfExpertises
{
    
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:URL_BASE]];
    NSURLRequest *request = [client requestWithMethod:@"GET" path:@"?task=Initialize_Area_of_Expertises" parameters:nil];
    NSLog(@" %@", [request description]);
    AFHTTPRequestOperation *operation = [client HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *requestOperation, id responseObject) {
        
//        [self parseQueryAreaOfExpertisesResult:requestOperation.responseString];
    
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error while sending request to Google. %@", error);
    }];
    
    [client enqueueHTTPRequestOperation:operation];

}
// send request to the " Initialize_Doctor" web service
-(void)getInitializeDoctor
{
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:URL_BASE]];
    NSURLRequest *request = [client requestWithMethod:@"GET" path:@"?task=Initialize_Doctor" parameters:nil];
    NSLog(@" %@", [request description]);
    AFHTTPRequestOperation *operation = [client HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *requestOperation, id responseObject) {
        
//        [self parseQueryInitializeDoctor:requestOperation.responseString];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error while sending request to Google. %@", error);
    }];
    
    [client enqueueHTTPRequestOperation:operation];
}
/*
// send request to "Synchronize_Area_of_Expertises" webservice
-(void)getSynchronizeAreaOfExpertises
{
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:URL_BASE]];
    NSString* stringPath = [NSString stringWithFormat:@"?task=Synchronize_Area_of_Expertises&lastUpdate=%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"LastUpdate"]];
    NSURLRequest *request = [client requestWithMethod:@"GET" path:stringPath parameters:nil];
    NSLog(@" %@", [request description]);
    AFHTTPRequestOperation *operation = [client HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *requestOperation, id responseObject) {
        
        [self parseQuerySynchronizeAreaOfExpertises:requestOperation.responseString];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error while sending request to Google. %@", error);
    }];
    
    [client enqueueHTTPRequestOperation:operation];
}
- (void)parseQueryAreaOfExpertisesResult:(NSString *)responseString {

    NSDictionary* parsedJSON = [XMLReader dictionaryForXMLString:responseString error:nil];

    if (parsedJSON == nil) {
        NSLog(@"Cannot parse JSON result");
        return;
    }
    NSString* lastUpdate = [NSString stringWithFormat:@"%@",[[[parsedJSON objectForKey:@"results"] objectForKey:@"lastUpdate"] objectForKey:@"text"]];
   [self saveLastUpdateInformation:lastUpdate];
    
    NSString *status = [NSString stringWithFormat:@"%@",[[[parsedJSON objectForKey:@"results"] objectForKey:@"status"] objectForKey:@"text"]];
        if ([status isEqualToString:@"ok"]) {

            NSArray *results = [[parsedJSON objectForKey: @"results"] objectForKey:@"row"];
            for (NSDictionary *item in results) {
                AreaOfExpertises *doctor = [[AreaOfExpertises alloc] initWithNSDictionary:item];
                // save data to SQLite
                if ([[ExpertiseModal shareInstance] isLoaded] == FALSE) {
                    [[ExpertiseModal shareInstance] insertDataToSQLite:doctor.areaId andNameEng:doctor.nameEng nameGer:doctor.nameGer];
                }
            }
            [self getInitializeDoctor];
    }

    else
    {
        NSString *responseDetails = [NSString stringWithFormat:@"%@",[[[parsedJSON objectForKey:@"results"] objectForKey:@"status"] objectForKey:@"text"]];
        NSError *responseError = [NSError errorWithDomain:@"Domain"
                                                     code:500
                                                 userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseDetails,@"NSLocalizedDescriptionKey",nil]];
        
        NSLog(@"responseError : %@", responseError);
    }
}
- (void)parseQueryInitializeDoctor:(NSString *)responseString {
    
    NSDictionary* parsedJSON = [XMLReader dictionaryForXMLString:responseString error:nil];
    
    if (parsedJSON == nil) {
        NSLog(@"Cannot parse JSON result");
        return;
    }
    NSString *status = [NSString stringWithFormat:@"%@",[[[parsedJSON objectForKey:@"results"] objectForKey:@"status"] objectForKey:@"text"]];
    if ([status isEqualToString:@"ok"]) {

        NSArray *results = [[parsedJSON objectForKey: @"results"] objectForKey:@"row"];
        for (NSDictionary *item in results) {
            Doctor *doctor = [[Doctor alloc] initWithNSDictionary:item];

            if ([[ExpertiseModal shareInstance] isLoaded] == FALSE) {
                [[DoctorModal shareInstance] insertDataToSQLite:doctor.docId andDocName:doctor.docName areaId:doctor.docId];
           }

        }
        if (_delegate !=nil) {
            [_delegate GetInitializeAreaOfExpertisesRequest:self didFinishLoadingWithObject:[NSMutableArray arrayWithArray:[[ExpertiseModal shareInstance] getListDoctors]]];
        }
    }
    
    else
    {
        // no results
        NSString *responseDetails = [NSString stringWithFormat:@"%@",[[[parsedJSON objectForKey:@"results"] objectForKey:@"status"] objectForKey:@"text"]];
        NSError *responseError = [NSError errorWithDomain:@"Domain"
                                                     code:500
                                                 userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseDetails,@"NSLocalizedDescriptionKey",nil]];
        
        NSLog(@"responseError : %@", responseError);
    }
}
- (void)parseQuerySynchronizeAreaOfExpertises:(NSString *)responseString {
    
    NSDictionary* parsedJSON = [XMLReader dictionaryForXMLString:responseString error:nil];
    
    if (parsedJSON == nil) {
        NSLog(@"Cannot parse JSON result");
        return;
    }
    NSString *status = [NSString stringWithFormat:@"%@",[[[parsedJSON objectForKey:@"results"] objectForKey:@"status"] objectForKey:@"text"]];
    if ([status isEqualToString:@"ok"]) {
        NSMutableArray *arrExperties = [[NSMutableArray alloc] init];
        NSArray *results = [[parsedJSON objectForKey: @"results"] objectForKey:@"row"];
        for (NSDictionary *item in results) {
            AreaOfExpertises *expertie = [[AreaOfExpertises alloc] initWithNSDictionary:item];
            [arrExperties addObject:expertie];
        }
    }
    
    else
    {
        // no results
        NSString *responseDetails = [NSString stringWithFormat:@"%@",[[[parsedJSON objectForKey:@"results"] objectForKey:@"status"] objectForKey:@"text"]];
        NSError *responseError = [NSError errorWithDomain:@"Domain"
                                                     code:500
                                                 userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseDetails,@"NSLocalizedDescriptionKey",nil]];
        
        NSLog(@"responseError : %@", responseError);
    }
}
*/
// save the last update information to user default data with key “LastUpdate”
- (void) saveLastUpdateInformation:(NSString*) laseUpteInfo
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:laseUpteInfo forKey:@"LastUpdate”"];

    [defaults synchronize];

}
@end
