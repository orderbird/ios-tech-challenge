//
//  CommonMethods.m
//  codeChallenge
//
//  Created by Astha yadav on 05/06/21.
//  Copyright © 2021 Fernando Suárez. All rights reserved.
//

#import "CommonMethods.h"

@implementation CommonMethods

UIActivityIndicatorView *indicator;

+ (NSString *)stringByStrippingHTML:(NSString *)inputString
{
    NSMutableString *outString;

    if (inputString)
    {
        outString = [[NSMutableString alloc] initWithString:inputString];

        if ([inputString length] > 0)
        {
            NSRange r;

            while ((r = [outString rangeOfString:@"<[^>]+>|&nbsp;" options:NSRegularExpressionSearch]).location != NSNotFound)
            {
                [outString deleteCharactersInRange:r];
            }
        }
    }

    return outString;
}

+(void)activityIndicatorStart:(UIView*)view{
    indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicator.hidesWhenStopped = YES;
    indicator.frame = CGRectMake((view.frame.size.width/2)-15, (view.frame.size.height/2)-100, 30, 30);
    
    [view addSubview:indicator];
    [view isUserInteractionEnabled];
    [indicator startAnimating];
    view.userInteractionEnabled = NO;
}

+(void)activityIndicatorStop:(UIView*)view{
    [indicator stopAnimating];
    view.userInteractionEnabled = YES;
}

@end
