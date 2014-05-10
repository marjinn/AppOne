//
//  CQSecondViewController.m
//  AppOne
//
//  Created by mar Jinn on 1/29/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import "CQSecondViewController.h"

@interface CQSecondViewController ()

@property(nonatomic,retain) UISegmentedControl* segmentedControl;
@end

@implementation CQSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //set the view's title
        self.title = NSStringFromClass([self class]);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    
    UIBarButtonItem *rightBarBtn;
    rightBarBtn = [[UIBarButtonItem alloc]initWithTitle:@"Add"
                                                  style:UIBarButtonItemStylePlain
                                                 target:self
                                                 action:nil];
    
    [[self navigationItem]setRightBarButtonItem:rightBarBtn
                                       animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*!
 * @
 */
-(void)goBack
{
    // You can call this method inside any view controller in order to pop the
    // last view con‐ troller from the hierarchy of the navigation controller
    //associated with the current view controller.
    
    // Get the current array of View Controllers
    NSArray* currentControllers;
    currentControllers = [[self navigationController]viewControllers];
    
    // make  a mutable array from the previous one
    NSMutableArray *newController;
    newController = [NSMutableArray arrayWithArray:currentControllers];
    
    //remove last object from the array
    [newController removeLastObject];
    
    //Assign this array to the Navigation Controller
    [[self navigationController]setViewControllers:newController animated:YES];
    
    [[self navigationController]popViewControllerAnimated:YES];
    
    
}

/*!
 * @description
 * dismiss the view controller after 5.0 sec
 *
 * @abstract
 */
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self createAndConfigureSegmentedControl];
    
    [self performSelector:@selector(goBack)
               withObject:nil
               afterDelay:5.0f];
}


/*
 * create UI
 */

-(void)createAndConfigureSegmentedControl
{
    self->_segmentedControl = [[UISegmentedControl alloc]
                               initWithItems:@[@"UP",@"DOWN"]];
    
    [self->_segmentedControl setMomentary:YES];//no tracking
    
    [self->_segmentedControl addTarget:self
                                action:@selector(segmentedControlTapped:)
                      forControlEvents:UIControlEventValueChanged];
    
    [[self navigationItem]setRightBarButtonItem:
    [[UIBarButtonItem alloc]initWithCustomView:
     self->_segmentedControl]];
    
    
    
    return;
}

-(void)segmentedControlTapped:(UISegmentedControl *)paramSender
{
    switch ([paramSender selectedSegmentIndex]) {
        case 0:
            NSLog(@"UP");
            break;
        
        case 1:
            NSLog(@"DOWN");
            break;
    
        default:
            break;
    }
    return;
}

@end
