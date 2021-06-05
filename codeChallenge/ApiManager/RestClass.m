//
//  RestClass.m
//  codeChallenge
//
//  Created by Astha yadav on 03/06/21.
//  Copyright © 2021 Fernando Suárez. All rights reserved.
//

#import "RestClass.h"

@implementation RestClass

@synthesize delegate;

- (id)initWithDelegate:(id <APIDelegates>)del
{
    self = [super init];
    
    if (!self)
        return nil;
    [self setDelegate:del];
    return self;
}

#pragma mark: flickr Api
-(void)getFlickrPhotoApi:(NSInteger)perPage withPageNumber:(NSInteger)pageNo sortBy:(NSString*)sort{
    NSString *extra = @"date_taken,views,description,date_upload,date_taken,owner_name,icon_server,original_format,last_update,views,media,url_t,url_l";
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=%@&tags=%@&page=%ld&per_page=%ld&format=json&nojsoncallback=1&sort=%@&extras=%@",FlickrAPIKey,@"cooking",pageNo,(long)perPage,sort,extra];
    
    NSLog(@"%@",urlString);

    // Create NSURLSession object
    NSURLSession *session = [NSURLSession sharedSession];

    // Create a NSURL object.
    NSURL *url = [NSURL URLWithString:urlString];

    // Create NSURLSessionDataTask task object by url and session object.
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
         //   NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
            
            // Print response JSON data in the console.
            NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]);
            
            [self->delegate passRequestedArray:[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil] WithId:@"photos_list"];

        }
    }];

    // Begin task.
    [task resume];
    
    
}


@end
