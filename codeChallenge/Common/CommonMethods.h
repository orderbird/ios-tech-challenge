//
//  CommonMethods.h
//  codeChallenge
//
//  Created by Astha yadav on 05/06/21.
//  Copyright © 2021 Fernando Suárez. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommonMethods : NSObject

+ (NSString *)stringByStrippingHTML:(NSString *)inputString;
+(void)activityIndicatorStart:(UIView*)view;
+(void)activityIndicatorStop:(UIView*)view;

@end

NS_ASSUME_NONNULL_END
