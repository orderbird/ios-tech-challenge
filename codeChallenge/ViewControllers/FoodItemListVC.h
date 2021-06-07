//
//  ViewController.h
//  codeChallenge
//
//  Created by Nano Suarez on 18/04/2018.
//  Copyright © 2018 Fernando Suárez. All rights reserved.
//

@import UIKit;

@interface FoodItemListVC : UITableViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmantControl;
@property (weak, nonatomic) IBOutlet UISwitch *switchLatestOldest;


@end

