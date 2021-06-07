//
//  PhotosModal.h
//  codeChallenge
//
//  Created by Astha yadav on 03/06/21.
//  Copyright © 2021 Fernando Suárez. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PhotosModal : NSObject


@property(strong,nonatomic) NSString * photoId;
@property(nonatomic,strong) NSString * title;
@property(nonatomic,strong) NSString * _content;
@property(nonatomic,strong) NSString * url_t;
@property(nonatomic,strong) NSString * url_l;
@property(nonatomic,strong) NSString * ownername;
@property(nonatomic,strong) NSString * dateupload;
@property(nonatomic,strong) NSString * lastupdate;
@property(nonatomic,strong) NSString * datetaken;
@property(nonatomic,strong) NSString * views;


- (instancetype)initWithJSONString:(NSDictionary *)dict;

- (nullable NSURL*)imageLogoUrl;
- (nullable NSURL*)imageLargeUrl;

@end

NS_ASSUME_NONNULL_END
