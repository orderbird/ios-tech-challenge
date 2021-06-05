//
//  DetailViewController.h
//  codeChallenge
//
//  Created by Astha yadav on 03/06/21.
//  Copyright © 2021 Fernando Suárez. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIImageView *imageDetail;
@property (weak, nonatomic) IBOutlet UILabel *labelNoOfViews;
@property (weak, nonatomic) IBOutlet UILabel *labelNoOfFavourite;
@property (weak, nonatomic) IBOutlet UILabel *labelNumberOfComments;
@property (weak, nonatomic) IBOutlet UILabel *labelOwnarName;
@property (weak, nonatomic) IBOutlet UILabel *labelDescription;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@property(strong,nonatomic)PhotosModal* photoDetail;



@end

NS_ASSUME_NONNULL_END
