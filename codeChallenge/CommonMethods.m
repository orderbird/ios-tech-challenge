//
//  CommonMethods.m
//  codeChallenge
//
//  Created by Astha yadav on 05/06/21.
//  Copyright © 2021 Fernando Suárez. All rights reserved.
//

#import "CommonMethods.h"

@implementation CommonMethods

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

@end
