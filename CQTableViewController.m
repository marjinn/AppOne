//
//  CQTableViewController.m
//  AppOne
//
//  Created by mar Jinn on 2/12/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import "CQTableViewController.h"

@interface CQTableViewController ()
@property UIImageView * imageView;
@end

@implementation CQTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _imageView = [[UIImageView alloc]init];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell;
    //[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
  
    
    NSArray* imageArray;
    imageArray = @[@"image1.jpg",@"image2.jpg",@"image3.jpg"];
    
    self.view.backgroundColor = [UIColor redColor];
    __block UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scroll.pagingEnabled = YES;
    NSInteger numberOfViews = 3;
    for (int i = 0; i < numberOfViews; i++) {
        CGFloat xOrigin = i * self.view.frame.size.width ;
        
        UIView *awesomeView = [[UIView alloc] initWithFrame:CGRectMake(xOrigin + 180 , 0, self.view.frame.size.width, self.view.frame.size.height)];
        
        awesomeView.backgroundColor = [UIColor colorWithRed:0.5/i green:0.5 blue:0.5 alpha:1];
        
        
        
        //NSURL* networkURL = [NSURL URLWithString:@"https://www.apple.com/iphone-5c/home/images/color_split_front.png"];
        //dispatch_queue_t downloadQueue = dispatch_queue_create("imageloader", NULL);
        
        //dispatch_async(downloadQueue, ^{
           // NSData *imageData = [NSData dataWithContentsOfURL:networkURL]; // long time!
            //dispatch_async(dispatch_get_main_queue(), ^ {
                UIImage *image = [UIImage imageNamed:@"color_split_front.png"];
                self.imageView.image = image;
                self.imageView.frame = CGRectMake(0,0, image.size.width, image.size.height);
                scroll.contentSize = image.size;
           // });
        //});
        //dispatch_release(downloadQueue);
        
        
        [awesomeView addSubview:self.imageView];
        [scroll addSubview:awesomeView];
        awesomeView = nil;
    }
    scroll.contentSize = CGSizeMake(self.view.frame.size.width * numberOfViews, self.view.frame.size.height/2);
    [cell.contentView addSubview:scroll];
    scroll = nil;
    
    }
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
