//
//  CustomCell.m
//  codeChallenge
//
//  Created by Nano Suarez on 18/04/2018.
//  Copyright © 2018 Fernando Suárez. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setDisplay:(nullable PhotosModal *)display {

    [self.imageTitleCell setText:display.title];
    NSString*strContent =  [CommonMethods stringByStrippingHTML:display._content];
    [self.imageSubtitleCell setText:strContent];
    
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: display.imageLogoUrl];
        if ( data == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageCell.image = [UIImage imageWithData: data];
        });
       
    });
    
    // TODO load image
    [self.imageCell setBackgroundColor:UIColor.blueColor];
}

@end
