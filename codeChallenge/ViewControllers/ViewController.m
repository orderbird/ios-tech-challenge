//
//  ViewController.m
//  codeChallenge
//
//  Created by Nano Suarez on 18/04/2018.
//  Copyright © 2018 Fernando Suárez. All rights reserved.
//

#import "ViewController.h"


@interface ViewController (){
    NSMutableArray *photosArray;
    NSInteger pageNo,totalPage;
    BOOL isFirstLoad;
    NSString *sortKey;
    RestApi *restapi;
}

@property (nonatomic, readwrite) NSArray *photos;
@property (nonatomic) NSInteger imagePageOffset;
@property (nonatomic, copy) void (^ reloadBlock)(void);

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getJSON:) name:@"getJSON" object:nil];
    
    restapi = [[RestApi alloc] init];
    photosArray = [NSMutableArray new];
    
    [self uiSetUp];
    [self initialData];
    
    [self loadFlikerPhotos:pageNo sort:sortKey];
    
    
}

#pragma mark:- initialData
-(void)initialData{
    
    self.imagePageOffset = 20;
    pageNo = 1;
    sortKey = @"date-posted-desc";
    isFirstLoad = YES;
}

#pragma mark:- uiSetUp
-(void)uiSetUp{
    
    [_segmantControl addTarget:self action:@selector(segmentControlClick:) forControlEvents: UIControlEventValueChanged];
    
    UINib *cellNib = [UINib nibWithNibName:@"CustomCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"CustomCell"];
    
}

#pragma mark:- loadFlikerPhotos
-(void)loadFlikerPhotos:(NSInteger)pageNo sort:(NSString*)sortKey{
    if (pageNo == 1){
        if ([photosArray count] > 0){
            [photosArray removeAllObjects];
        }
    }
    [restapi getFlikerPhotosApiWithPageNo:pageNo perPageCount:self.imagePageOffset sort:sortKey];
}

#pragma mark:- getJSON
-(void)getJSON:(NSNotification*)notification {
    NSDictionary *dict = [notification userInfo];
    NSLog(@"JSON---%@",dict);
    NSDictionary * dictPhotos = [dict valueForKey:@"photos"];
    NSArray *arrPhoto = [dictPhotos valueForKey:@"photo"];
    totalPage = [[dictPhotos valueForKey:@"pages"] integerValue];
    pageNo++;
    isFirstLoad = NO;
    for (int i = 0; i < [arrPhoto count]; i++) {
        NSDictionary *json = [arrPhoto objectAtIndex: i];
        PhotosModal* p = [[PhotosModal alloc] initWithJSONString:json];
        [photosArray addObject:p];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
    
}

#pragma mark:- switchClick
- (IBAction)switchClick:(id)sender {
    
}

#pragma mark:-segmentControlClick
- (void)segmentControlClick:(UISegmentedControl *)segment
{
    //date-posted-asc, date-posted-desc, date-taken-asc, date-taken-desc, interestingness-desc, interestingness-asc, and relevance.
    pageNo = 1;
    if(segment.selectedSegmentIndex == 0)
    {
        sortKey = @"date-posted-desc";
    }
    else if(segment.selectedSegmentIndex == 1)
    {
        sortKey = @"date-taken-desc";
    }
    else if(segment.selectedSegmentIndex == 2)
    {
        sortKey = @"interestingness-desc";
    }
    
    [self loadFlikerPhotos:pageNo sort:sortKey];
    
}

#pragma mark:- UITableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return photosArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"CustomCell";
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    PhotosModal *objPhoto = [photosArray objectAtIndex:indexPath.row];
    [cell setDisplay:objPhoto];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PhotosModal *objPhoto = [photosArray objectAtIndex:indexPath.row];
    DetailViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    vc.photoDetail = objPhoto;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == photosArray.count-2) {
        if(pageNo <= totalPage && !isFirstLoad) {
            [self loadFlikerPhotos:pageNo sort:sortKey];
        }
    }
}

#pragma mark: API Response
-(void)passRequestedArray:(NSMutableArray *)dataArray WithId:(NSString *)ID {
    if([ID isEqualToString:@"photos_list"]) {
        NSDictionary * dictPhotos = [dataArray valueForKey:@"photos"];
        NSArray *arrPhoto = [dictPhotos valueForKey:@"photo"];
        totalPage = [[dictPhotos valueForKey:@"pages"] integerValue];
        pageNo++;
        isFirstLoad = NO;
        for (int i = 0; i < [arrPhoto count]; i++) {
            NSDictionary *json = [arrPhoto objectAtIndex: i];
            PhotosModal* p = [[PhotosModal alloc] initWithJSONString:json];
            [photosArray addObject:p];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }
}

-(void)errorMessageWithRetry:(NSString *)errorMsg WithId:(NSString *)ID {
    
}

@end
