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
@synthesize labelTitle,labelOwnarName,labelDescription,labelNoOfViews,labelNoOfFavourite,labelNumberOfComments;
@synthesize photoDetail;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
   
    [self setDetailInfo];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:true];
    
    NSLog(@"Astha%f",_scrollView.frame.size.height);
  //  _scrollView.scrollEnabled=YES;
    _scrollView.contentSize=CGSizeMake(self.contentView.frame.size.width, 2000);
    
    NSLog(@"Yadav%f",_scrollView.frame.size.height);
    NSLog(@"Yadav%f",_contentView.frame.size.height);
}

-(void)setDetailInfo{
    
    labelOwnarName.text = [NSString stringWithFormat:@"Owner name: %@",photoDetail.ownername];
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
