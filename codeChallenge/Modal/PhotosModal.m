//
//  PhotosModal.m
//  codeChallenge
//
//  Created by Astha yadav on 03/06/21.
//  Copyright © 2021 Fernando Suárez. All rights reserved.
//

#import "PhotosModal.h"

@implementation PhotosModal

- (instancetype)initWithJSONString:(NSDictionary *)dict;
{
    self = [super init];
    if (self) {
        self.photoId = [dict valueForKey:@"id"];
        self.title = [dict valueForKey:@"title"];
        self.url_t = [dict valueForKey:@"url_t"];
        self.url_l = [dict valueForKey:@"url_l"];
        self.ownername = [dict valueForKey:@"ownername"];
        self.dateupload = [dict valueForKey:@"dateupload"];
        self.lastupdate = [dict valueForKey:@"lastupdate"];
        self.datetaken = [dict valueForKey:@"datetaken"];
        self._content = [[dict valueForKey:@"description"] valueForKey:@"_content"];
        self.views = [dict valueForKey:@"views"];
    }
    return self;
}

- (nullable NSURL*)imageLogoUrl {
    return [NSURL URLWithString:self.url_t];
}

- (nullable NSURL*)imageLargeUrl {
    return [NSURL URLWithString:self.url_l];
}

@end

