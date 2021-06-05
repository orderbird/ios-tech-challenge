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

/*
@property(strong,nonatomic) NSString * photoId;
@property(strong,nonatomic) NSString * owner;
@property(strong,nonatomic) NSString * secret;
@property(strong,nonatomic) NSString * server;
@property(strong,nonatomic) NSString * farm;
@property(strong,nonatomic) NSString * title;
@property(strong,nonatomic) NSString * ispublic;
@property(nonatomic) BOOL * isfriend;
@property(nonatomic) BOOL * isfamily;
@property(strong,nonatomic) NSString * url_t;
@property(nonatomic) NSInteger * height_t;
@property(nonatomic) NSInteger * width_t;
 */

@property(nonatomic,strong) NSString * title;
@property(nonatomic,strong) NSString * _content;
@property(nonatomic,strong) NSString * url_t;
@property(nonatomic,strong) NSString * url_l;
@property(nonatomic,strong) NSString * ownername;
@property(nonatomic,strong) NSString * dateupload;
@property(nonatomic,strong) NSString * lastupdate;
@property(nonatomic,strong) NSString * datetaken;


- (instancetype)initWithJSONString:(NSDictionary *)dict;

- (nullable NSURL*)imageLogoUrl;
- (nullable NSURL*)imageLargeUrl;

@end

NS_ASSUME_NONNULL_END

/*
 {"photos":{"page":1,"pages":44366,"perpage":20,"total":887316,"photo":[{"id":"51221328844","owner":"84904494@N00","secret":"259297038b","server":"65535","farm":66,"title":"scan0001","ispublic":1,"isfriend":0,"isfamily":0,"url_t":"https:\/\/live.staticflickr.com\/65535\/51221328844_259297038b_t.jpg","height_t":82,"width_t":100},{
 */
