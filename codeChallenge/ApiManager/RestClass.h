//
//  RestClass.h
//  codeChallenge
//
//  Created by Astha yadav on 03/06/21.
//  Copyright © 2021 Fernando Suárez. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol APIDelegates

@optional
-(void)passRequestedArray:(NSMutableArray*)dataArray WithId:(NSString*)ID;
-(void)errorMessageWithRetry:(NSString*)errorMsg WithId:(NSString*)ID;
@end

@interface RestClass : NSObject

@property (nonatomic, weak) id <APIDelegates> delegate;

-(id)initWithDelegate:(id)del;

#pragma mark:flickr Api
-(void)getFlickrPhotoApi:(NSInteger)perPage withPageNumber:(NSInteger)pageNo sortBy:(NSString*)sort;

@end

NS_ASSUME_NONNULL_END
