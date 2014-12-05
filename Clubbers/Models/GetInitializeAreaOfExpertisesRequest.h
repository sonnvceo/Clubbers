//
//  GetInitializeAreaOfExpertisesRequest.h
//  KloonTest
//
//  Created by Sonnv on 11/18/13.
//  Copyright (c) 2013 Kloon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@protocol GetInitializeAreaOfExpertisesRequestDelegate;

@interface GetInitializeAreaOfExpertisesRequest : NSObject<NSXMLParserDelegate>

@property (nonatomic, assign) id <GetInitializeAreaOfExpertisesRequestDelegate> delegate;

-(id)initWithDelegate:(id)del;
-(void)getInitializeAreaOfExpertises;
-(void)getInitializeDoctor;
-(void)getSynchronizeAreaOfExpertises;
@end

@protocol GetInitializeAreaOfExpertisesRequestDelegate
// delegate parser data to MainViewController

- (void) GetInitializeAreaOfExpertisesRequest:(GetInitializeAreaOfExpertisesRequest *)conn didFinishLoadingWithObject:(NSMutableArray *)arrDoctor;
- (void) GetInitializeAreaOfExpertisesRequest:(GetInitializeAreaOfExpertisesRequest *)conn didFailWithError:(NSError *)error;
@end