//
//  CustomCell.h
//  codeChallenge
//
//  Created by Nano Suarez on 18/04/2018.
//  Copyright © 2018 Fernando Suárez. All rights reserved.
//

@import UIKit;

@interface CustomCell : UITableViewCell
NS_ASSUME_NONNULL_BEGIN

@property (weak, nonatomic) IBOutlet UIImageView *imageCell;
@property (weak, nonatomic) IBOutlet UILabel *imageTitleCell;
@property (weak, nonatomic) IBOutlet UILabel *imageSubtitleCell;

- (void)setDisplay:(nullable PhotosModal *)display;

NS_ASSUME_NONNULL_END

@end
