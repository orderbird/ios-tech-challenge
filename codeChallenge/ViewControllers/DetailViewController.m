//
//  DetailViewController.m
//  codeChallenge
//
//  Created by Astha yadav on 03/06/21.
//  Copyright © 2021 Fernando Suárez. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize labelTitle,labelOwnarName,labelDescription,labelNoOfViews;
@synthesize photoDetail;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    [self setDetailInfo];
}


#pragma mark:- setDetailInfo
-(void)setDetailInfo{
    labelNoOfViews.text = [NSString stringWithFormat:@"Views : %@",photoDetail.views];
    labelOwnarName.text = [NSString stringWithFormat:@"Owner name : %@",photoDetail.ownername];
    labelTitle.text = photoDetail.title;
    NSString*strContent =  [CommonMethods stringByStrippingHTML:photoDetail._content];
    labelDescription.text = strContent;
    
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: self->photoDetail.imageLargeUrl];
        if ( data == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            // WARNING: is the cell still using the same data by this point??
            self.imageDetail.image = [UIImage imageWithData: data];
        });
       
    });
}


@end
