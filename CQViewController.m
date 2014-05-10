//
//  CQViewController.m
//  AppOne
//
//  Created by mar Jinn on 1/13/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import "CQViewController.h"
#import "CQStringReverseActivity.h"
#import "CQSecondViewController.h"

@interface CQViewController ()
<UIAlertViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate,
UIScrollViewDelegate>

-(NSString *)yesButtontitle;
-(NSString *)noButtontitle;

/*UI*/
@property(nonatomic,strong)UISwitch* mainSwitch;

@property(nonatomic,strong)UIPickerView *myPicker;

@property(nonatomic,strong)UIDatePicker* myDatePicker;

@property(nonatomic,strong)UISlider* slider;

@property(nonatomic,strong)UISegmentedControl* mySegementedControl;


//UIActivityViewController
@property(nonatomic,strong)UITextField* textField;
@property(nonatomic,strong)UIButton* buttomShare;
@property(nonatomic,strong)UIActivityViewController* activityViewController;


@property
(nonatomic,strong,readwrite)UIButton* displaySecondViewController;

@property(nonatomic,strong)UILabel* label;


@property(nonatomic,strong)UIScrollView* scrollView;
@property(nonatomic,strong)UIPageControl* pageControl;

-(void)addingUIComponents;

@end

@implementation CQViewController

#pragma mark
#pragma mark addAndCustomizeSwitch
-(void)addAndCustomizeSwitch
{
    //mainSWitch
    [self setMainSwitch:[[UISwitch alloc]
                         initWithFrame:
                         CGRectMake(100.0, 100.0, 0.0, 0.0)]];
    
    //Add Switch as Subview
    [[self view]addSubview:[self mainSwitch]];
    
    //Change default state to ON
    [[self mainSwitch]setOn:YES animated:YES];
    
    //To get notified when the switch gets turned on or off
    [[self mainSwitch]addTarget:self
                         action:@selector(switchIsChanged:)
               forControlEvents:UIControlEventValueChanged];
    
    //Cutomizing the switch UI
    
    //On/Off image 72w x 22h Only for iOS6
    /* Customize the switch */
    self.mainSwitch.onImage = [UIImage imageNamed:@"On"];
    self.mainSwitch.offImage = [UIImage imageNamed:@"Off"];
    
    //for iOS7
    /* Adjust the Off-mode tint Color */
    [[self mainSwitch]setTintColor:[UIColor redColor]];
    
    /* Adjust the on-mode tint color */
    [[self mainSwitch]setOnTintColor:[UIColor brownColor]];
    
    /* Adjust the knob's tint color */
    [[self mainSwitch]setThumbTintColor:[UIColor greenColor]];

}

/* ACTION METHOD FOR SWITCH */
/*Methods input parameter is UISwitch as
 that is what the run time passes as a parameter to this method*/
-(void)switchIsChanged:(UISwitch *)paramSender
{
    NSLog(@"Sender is = %@",paramSender);
    
    //Check if switch is ON
    if ([paramSender isOn])
    {
        NSLog(@"The switch is on.");
    }
    else
    {
        NSLog(@"The switch is off.");
    }
}

#pragma mark
#pragma mark addAndCustomizePicker
-(void)addAndCustomizePicker
{
    /* ADD A PICKERVIEW */
    //CREATE
    [self setMyPicker:[[UIPickerView alloc]init]];
    
    //set Coordinates
    [[self myPicker]setCenter:[[self view]center]];
    
    //Add it to the view
    [[self view]addSubview:[self myPicker]];
    
    //set its datasource
    [[self myPicker]setDataSource:self];
    
    //set its delegate
    [[self myPicker]setDelegate:self];
    
    //show selction Indicator
    [[self myPicker]setShowsSelectionIndicator:YES];
    
    
}

#pragma mark
#pragma mark addAndCustomizeDatePicker
-(void)addAndCustomizeDatePicker
{
    //Create datePicker
    [self setMyDatePicker:[[UIDatePicker alloc]init]];
     
     //Location
    [[self myDatePicker]setCenter:[[self view]center]];
    
    //set Picker mode
    //[[self myDatePicker]setDatePickerMode:UIDatePickerModeDate];
    /* Count Down Timer Mode*/
    [[self myDatePicker]setDatePickerMode:UIDatePickerModeCountDownTimer];
    
     //add it to the view
    [[self view]addSubview:[self myDatePicker]];
     
     //date picker notification
    [[self myDatePicker]addTarget:self
                           action:@selector(datePickerDateChanged:)
                 forControlEvents:UIControlEventValueChanged];
    
    //set Minimum and Maximum Date
    //Calculate minimum Date oneYearFromToday
    NSTimeInterval oneYearTime;
    oneYearTime = 365 * 24 * 60 * 60;
    
    NSDate* todayDate;
    todayDate = [NSDate date];
    
    NSDate* oneYearFromToday;
    oneYearFromToday = [todayDate
                        dateByAddingTimeInterval:oneYearTime];
    
    //Calculate Maximum Date
    NSDate* twoYearsFromToday;
    twoYearsFromToday = [todayDate
                         dateByAddingTimeInterval:2 * oneYearTime];
    
    /* setMinimumDate setMaximumDate  */
    /*
    [[self myDatePicker]setMinimumDate:oneYearFromToday];
    
    [[self myDatePicker]setMaximumDate:twoYearsFromToday];
     */
    
    /* Add TimeInterval*/
    NSTimeInterval twoMinutes;
    twoMinutes = 2 * 60;
    
    //set CountDown Duration
    [[self myDatePicker]setCountDownDuration:twoMinutes];
    
    
}

/* ACTION METHOD FOR DatePicker */
-(void)datePickerDateChanged:(UIDatePicker *)paramDatePicker
{
    if ([paramDatePicker isEqual:[self myDatePicker]])
    {
        NSLog(@"Selected date = %@",[paramDatePicker date]);
    }
}

#pragma mark
#pragma mark addAndCustomizeSlider

/*!
 * @function
 * -(void)addAndCustomizeSlider
 *
 * @abstract
 * addAndCustomizeSlider
 *
 * @discussion
 * creates and configures aSlider and add it as subview
 *
 * @param none
 *
 * @result
 * Returns (void)
 */

-(void)addAndCustomizeSlider
{
    /*Create the slider*/
    [self setSlider:[[UISlider alloc]
                      initWithFrame:CGRectMake(0.0f
                                               , 0.0f,
                                               200.0f,
                                               23.0f)]];
    //set center
    [[self slider]setCenter:[[self view]center]];
    
    //add slider to the view
    [[self view]addSubview:[self slider]];
    
    //set slider minimumvalue
    [[self slider]setMinimumValue:0.0f];
    
    //set slider maximumvalue
    [[self slider]setMaximumValue:100.0f];
    
    //set slider value - default
    [[self slider]setValue:(float)[[self slider]maximumValue]/2.0
                  animated:YES];
    
    //add target to check if the knob (slider) has moved
    
    //to get notfied as the slider moves
    //[[self slider]setContinuous:YES];
    
    //get notified only after the user has let
    //go off the thumb on the slider and let it settle
    [[self slider]setContinuous:NO];
    [[self slider]addTarget:self
                     action:@selector(sliderValueChanged:)
           forControlEvents:UIControlEventValueChanged];
    
    //Customize the Knob Image
    [[self slider]setThumbImage:[UIImage imageNamed:@"ThumbNormal.png"]
                       forState:UIControlStateNormal];
    
    [[self slider]setThumbImage:[UIImage imageNamed:@"ThumbHighlighted.png"]
                       forState:UIControlStateHighlighted];
    
    //set minimumTrackTintColor - minimum value track view on the left
    [[self slider]setMinimumTrackTintColor:[UIColor redColor]];
    
    //set maximumTrackTintColor - maximum value track view on the right
    [[self slider]setMaximumTrackTintColor:[UIColor greenColor]];
    
    //set Thumb tint value
    [[self slider]setThumbTintColor:[UIColor blackColor]];
    
    /*
     * More Slider Customization - adding images
     * adding
     *
     * Minimum value Image      23w x 23h
     * will be displayed to the outer-left side of the slider.
     *
     * MinimumTrackImage        11w x 9h
     * will be displayed for the slider’s track on the left side of the thumb
     *
     * Thumb Image              23w x 23h
     * The image for the thumb, the only moving component in the slider.
     *
     * MaximumTrackImage        11w x 9h
     * The image for the track of the slider to the right of the thumb
     *
     * Maximum value Image      23w x 23h
     * gets displayed on the outer-right side of the slider.
     *
     */
    
    /*
     * Change the minimum value image 
     */
    [[self slider] setMinimumValueImage:
     [UIImage imageNamed:@"MinimumValue"]];
    /*
     * Change the minimum track image
     */
    [[self slider] setMinimumTrackImage:[self minimumTrackImage]
                                forState:UIControlStateNormal];
    /*
     * Change the thumb image for both 
     * untouched and touched states
     */
    [[self slider]setThumbImage:[UIImage imageNamed:@"Thumb"]
                       forState:UIControlStateNormal];
    [[self slider]setThumbImage:[UIImage imageNamed:@"Thumb"]
                       forState:UIControlStateHighlighted];
    /* 
     * Change the maximum track image 
     */
    [self.slider setMaximumTrackImage:[self maximumTrackImage]
                             forState:UIControlStateNormal];
    /* 
     * Change the maximum value image 
     */
    [self.slider setMaximumValueImage:[UIImage imageNamed:@"MaximumValue"]];


}



/*!
 * @function
 * Method to resize an image for the
 * minmum track component of the slider
 *
 * @abstract
 *
 *
 * @discussion
 *
 *
 * @param none
 *
 * @result
 * Returns (void)
 */
-(UIImage *)minimumTrackImage
{
    /*
     * Get the image to be resized
     */
    UIImage* result;
    result = [UIImage imageNamed:@"MinimumTrack"];
    /*
     * edgeInsets for the image
     * to be set when resizing the image
     */
    UIEdgeInsets edgeInsets;
    edgeInsets.left   = 4.0f;
    edgeInsets.top    = 0.0f;
    edgeInsets.right  = 0.0f;
    edgeInsets.bottom = 0.0f;
    /*
     * Resize the image with edgeInsets
     * variable "result must be "autorelease"d if non-ARC
     */
    result = [result resizableImageWithCapInsets:edgeInsets
                                    resizingMode:UIImageResizingModeTile];
    /*
     * return the result
     */
    return result;
}

/*
 Similar to the previous method, this one returns the resizable maximum
 track image for the slider
 */
- (UIImage *) maximumTrackImage{
    UIImage *result = [UIImage imageNamed:@"MaximumTrack"]; UIEdgeInsets edgeInsets;
    edgeInsets.left = 0.0f;
    edgeInsets.top = 0.0f;
    edgeInsets.right = 3.0f;
    edgeInsets.bottom = 0.0f;
    result = [result resizableImageWithCapInsets:edgeInsets]; return result;
}

/* ACTION METHOD FOR Slider */
-(void)sliderValueChanged:(UISlider *)paramSender
{
    if ([paramSender isEqual:[self slider]])
    {
        //get the slider value
        NSLog(@"New Value =  %f",[paramSender value]);
    }
}


#pragma mark
#pragma mark addAndCustomizeSegemntedControl
/*!
 * @function
 * addAndCustomizeSegemntedControl
 *
 * @abstract
 *
 *
 * @discussion
 *
 *
 * @param none
 *
 * @result
 * Returns (void)
 */

-(void)addAndCustomizeSegemntedControl
{
    /*
     * Array of segments
     */
    NSArray* segments = nil;
    segments = [[NSArray alloc]initWithObjects:
                @"iPhone",
                @"iPad",
                @"iPod",
                @"iMac",nil];
    /*
     * Create 
     */
    [self setMySegementedControl:[[UISegmentedControl alloc]
                                  initWithItems:segments]];
    /*
     * setCenter
     */
    [[self mySegementedControl]setCenter:[[self view]center]];
    /*
     * add it to main view
     */
    [[self view] addSubview:[self mySegementedControl]];
    /*
     * segment control click action
     */
    [[self mySegementedControl]addTarget:self
                     action:@selector(segmentChanged:)
           forControlEvents:UIControlEventValueChanged];
    
    /*
     * If you want the user to be able to select an option but you would
     * like the button for that option to bounce back to its original
     * shape once it has been selected (just like a normal button
     * that bounces back up once it is tapped), you need to set
     * the momentary property of the segmented control to YES:
     */
    [[self mySegementedControl]setMomentary:YES];
    
    /*
     * Add Images to tabs
     */
    NSArray* segmentsWithImages = nil;
    segmentsWithImages = @[@"iPhone",
                           [UIImage imageNamed:@"iPad"],
                           @"iPod",
                           @"iMac",
                           ];
    
    /*
     * Now init the control with this array
     */
    

    
}

/*
 * Segmented control Action
 */
-(void)segmentChanged:(UISegmentedControl *)paramSender
{
    /*
     * Check if the segmented control changed is the one we want
     */
    if ([paramSender isEqual:[self mySegementedControl]])
    {
        /*
         * get selectedSegmentIndex
         *
         * If no item is selected, this method returns the value –1
         */
        NSInteger selectedSegmentIndex = 0;
        selectedSegmentIndex = [paramSender selectedSegmentIndex];
        
        /*
         * get selectedSegmentText
         */
        NSString* selectedSegmentText = nil;
        selectedSegmentText =
        [paramSender titleForSegmentAtIndex:selectedSegmentIndex];
        
        NSLog(@"Segment %ld with %@ text is selected",
              (long)selectedSegmentIndex,
              selectedSegmentText);
    }
}




#pragma mark
#pragma mark addAndCustomizeLabel

 -(void) addAndCustomizeLabel
{
    [self setLabel:[[UILabel alloc]init]];
    
    [[self label]setBackgroundColor:[UIColor clearColor]];
    
    [[self label]setText:@"iOS SDK"];
    
    [[self label]setFont:[UIFont boldSystemFontOfSize:70.0f]];
    
    [[self label]setTextColor:[UIColor blackColor]];
    
    [[self label]setShadowColor:[UIColor lightGrayColor]];
    
    [[self label]setShadowOffset:CGSizeMake(2.0f, 2.0f)];
    
    [[self label]sizeToFit];
    
    [[self label]setCenter:[[self view]center]];
    
    [[self view]addSubview:(UIView *)[self label]];
    
}


#pragma mark
#pragma mark addAndCustomizeScrollView

-(void)addAndCustomizeScrollView
{
    _scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    
    [_scrollView setPagingEnabled:YES];
    
    _pageControl = [[UIPageControl alloc]init];
    
    [[self view]addSubview:_scrollView];
    
    [[self scrollView]addSubview:_pageControl];
    
    NSArray* imageArray;
    imageArray = @[@"image1.jpg",@"image2.jpg",@"image3.jpg"];
    
    self.view.backgroundColor = [UIColor redColor];
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scroll.pagingEnabled = YES;
    NSInteger numberOfViews = 3;
    for (int i = 0; i < numberOfViews; i++) {
        CGFloat xOrigin = i * self.view.frame.size.width ;
        UIView *awesomeView = [[UIView alloc] initWithFrame:CGRectMake(xOrigin + 180 , 0, self.view.frame.size.width, self.view.frame.size.height)];
        awesomeView.backgroundColor = [UIColor colorWithRed:0.5/i green:0.5 blue:0.5 alpha:1];
        [scroll addSubview:awesomeView];
        awesomeView = nil;
    }
    scroll.contentSize = CGSizeMake(self.view.frame.size.width * numberOfViews, self.view.frame.size.height/2);
    [self.view addSubview:scroll];
    scroll = nil;
    
    
    //Set the content size of our scrollview according to the total width of our imageView objects.
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width * [imageArray count], _scrollView.frame.size.height);
    
    
     return;
}

#pragma mark - UIScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    // Update the page when more than 50% of the previous/next page is visible
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}



#pragma mark displaySecondViewController

-(void)performDisplaySecondViewController:(id)paramSender
{
    CQSecondViewController* secondViewController;
    secondViewController = [[CQSecondViewController alloc]initWithNibName:nil
                                                                   bundle:NULL];
    
    /*
     * Push
     */
    [[self navigationController]pushViewController:
     (UIViewController *)secondViewController animated:YES];
}


-(void)createAndConfigureButtonForCQSecondViewController
{
    /*
     * create button
     */
    [self setDisplaySecondViewController:
     [UIButton buttonWithType:UIButtonTypeSystem]];
    
    //setframe
    [[self displaySecondViewController]setCenter:[[self view]center]];
    //Set button title;
    [[self displaySecondViewController]
     setTitle:@"Display Second View Controller" forState:UIControlStateNormal];
    
    //Resizes and moves the receiver view so it just encloses its subviews.
    [[self displaySecondViewController]sizeToFit];
    
    //add target
    [[self displaySecondViewController]addTarget:self
                                          action:
     @selector(performDisplaySecondViewController:)
                                forControlEvents:UIControlEventTouchUpInside];
    
    //add button to the main view
    [[self view]addSubview:[self displaySecondViewController]];
    return;
}


#pragma mark
#pragma mark addingUIComponents

-(void)addingUIComponents
{
    NSLog(@"addingUIComponents");
    
    [self addAndCustomizeSwitch];
    
    //[self addAndCustomizePicker];
    
    //[self addAndCustomizeDatePicker];
    
    //[self addAndCustomizeSlider];
    
    //[self addAndCustomizeSegemntedControl];
    
    //[self createAndConfigureTextField];
    //[self createAndConfigureAButtonWithFrame:CGRectZero
       //                       andAddItToView:nil];
    
    //[self createAndConfigureButtonForCQSecondViewController];
    
    //[self addAndCustomizeLabel];
    
    [self  addAndCustomizeScrollView];
    
    return;
}


#pragma mark
#pragma mark Memory Management
-(void)dealloc
{
    [self setMainSwitch:nil];
    
    [self setMyPicker:nil];
    
    [self setMyDatePicker:nil];
    
    [self setSlider:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma mark View Load Methods
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self addingUIComponents];
    
    [self setTitle:@"First view controller"];
}

#pragma mark
#pragma mark UIAlertView

#pragma mark View Methods
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    //Set Views backGround Color
    //[[self view]setBackgroundColor:[UIColor orangeColor]];
    
    /* AlertView */
    
    /* ##############  */
    /*SIMPLE*/
    /*
    UIAlertView* alertVW;
    alertVW = [[UIAlertView alloc]initWithTitle:@"Alert"
                                        message:@"You have been delivered an alert"
                                       delegate:self
                              cancelButtonTitle:@"Cancel"
                              otherButtonTitles:@"OK", nil];
    //Show Alert
    [alertVW show];
    alertVW = nil;
     */
    
     /* ##############  */
    /*UIAlertView WITH CURRENT VIEW CONTROLLER AS UiAlertViewDelegate */
     /* ##############  */
/*
    NSString *message = @"Are you sure you want to open this link in Safari?";
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Open Link"
                              message:message
                              delegate:self
                              cancelButtonTitle:[self noButtontitle]
                              otherButtonTitles:[self yesButtontitle], nil];
    [alertView show];
    //alertView = nil;
*/
    
    /* ###############################  */
    /*AlertViewWith Plain Text Input*/
    /* ###############################  */
    
    /*
    UIAlertView* alertVW;
    alertVW = [[UIAlertView alloc]
               initWithTitle:@"Credit card number"
               message:@"Please Enter your credit card number:"
               delegate:self
               cancelButtonTitle:@"Cancel"
               otherButtonTitles:@"OK", nil];
    
    //Set alertView Style
    [alertVW setAlertViewStyle:UIAlertViewStylePlainTextInput];
    
    // Display a numerical keypad for this textfield
    UITextField* textField;
    textField = [alertVW textFieldAtIndex:0];
     // index ZERo as First text field
    
     // Set Keyboard type
    [textField setKeyboardType:UIKeyboardTypeNumberPad];
    [textField setKeyboardAppearance:UIKeyboardAppearanceDark];
    
    
    [alertVW show];
    alertVW = nil;
    */
    
    
    /* ###############################  */
    /*AlertViewWith SECURE Text Input*/
    /* ###############################  */
    
    /*
    UIAlertView* alertVW;
    alertVW = [[UIAlertView alloc]
               initWithTitle:@"Password"
               message:@"Please enter your password: "
               delegate:self
               cancelButtonTitle:@"Cancel"
               otherButtonTitles:@"OK", nil];
    
    //Set style are secure text
    [alertVW setAlertViewStyle:UIAlertViewStyleSecureTextInput];
    
    //show
    [alertVW show];
     */
    
    /* ###############################  */
    /*AlertViewWith Two Text Fields*/
    /* ###############################  */
    
    UIAlertView* alertVW;
    alertVW = [[UIAlertView alloc]
               initWithTitle:@"Password"
               message:@"Please enter ypur credentials:"
               delegate:self
               cancelButtonTitle:@"Cancel"
               otherButtonTitles:@"All Correct", nil];
    
    //Set Style Login and Password
    [alertVW setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
    
    //show
    //[alertVW show];
    
    
    
    /*
     * Testing ActibityViewController With data and Custom Activity class
     */
    NSArray* itemsToShare = nil;
    itemsToShare = @[@"Item 1",@"Item 2",@"Item 3"];
    
    UIActivityViewController *activityVC = nil;
    activityVC = [[UIActivityViewController alloc]
                  initWithActivityItems:itemsToShare
                  applicationActivities:
                  [NSArray arrayWithObjects:[CQStringReverseActivity new], nil]];
    
    [self presentViewController:activityVC
                       animated:YES
                     completion:^{
                         //
                     }];
    
    
}

-(NSString *)yesButtontitle
{
    return @"Yes";
}

-(NSString *)noButtontitle
{
    return @"No";
}

#pragma mark
#pragma mark UIAlertViewDelegate

-(void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString* buttonTitle;
    buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    
    if ([buttonTitle isEqualToString:[self yesButtontitle]])
    {
        NSLog(@"User pressed the Yes button");
    }
    else if([buttonTitle isEqualToString:[self noButtontitle]])
    {
        NSLog(@"User pressed the No button.");
    }
    
    //Accessing Login and Password Fields in the AlertView
    if ([alertView textFieldAtIndex:0])
    NSLog(@"string -%@",[[alertView textFieldAtIndex:0]text]);
    
    if ([alertView textFieldAtIndex:1])
    NSLog(@"string -%@",[[alertView textFieldAtIndex:1]text]);
}


#pragma mark
#pragma mark UIPickerViewDataSource
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    //Check if the picker view that called this deleaget is the one We want
    if ([pickerView isEqual:[self myPicker]])
    {
        return 1;
    }
    
    return 0;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if ([pickerView isEqual:[self myPicker]])
    {
        return 10;
    }

    return 0;
}

#pragma mark
#pragma mark UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if ([pickerView isEqual:[self myPicker]])
    {
      /* Row is zero-based and we want the first row (with index 0) 
       to be rendered as Row 1, so we have to +1 every row index */
        return [NSString stringWithFormat:@"Row %ld",(long)row + 1];
        
        
    }
    return nil;
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if ([pickerView isEqual:[self myPicker]])
    {
        NSLog(@"Selected Row - %ld",
              (long)[pickerView selectedRowInComponent:component]);
    }
}



#pragma mark
#pragma mark UIActivityViewController
-(void)createAndConfigureTextField
{
    /*
     * create
     */
    [self setTextField:[[UITextField alloc]initWithFrame:CGRectMake(20.0f,
                                                                    35.0f,
                                                                    280.0f,
                                                                    30.0f)]];
    
    [[self textField]setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [[self textField]setBorderStyle:UITextBorderStyleRoundedRect];
    
    [[self textField]setPlaceholder:@"Enter text to share..."];
    
    [[self textField]setDelegate:self];
    
    [[self view]addSubview:[self textField]];
}

-(void)createAndConfigureAButtonWithFrame:(CGRect)frame
                           andAddItToView:(UIView *)view
{
    /*
     * create
     */
    [self setButtomShare:[UIButton buttonWithType:UIButtonTypeRoundedRect]];
    /*
     * setTranslatesAutoresizingMaskIntoConstraints
     * no auto layout
     */
    [[self buttomShare]setTranslatesAutoresizingMaskIntoConstraints:NO];
    /*
     * set frame
     */
    [[self buttomShare]setFrame:CGRectMake(20.0f, 80.0f, 280.0f, 44.0f)];
    /*
     * set title
     */
    [[self buttomShare]setTitle:@"Share" forState:UIControlStateNormal];
    /*
     * add target
     */
    [[self buttomShare]addTarget:self
                          action:@selector(handleShare:)
                forControlEvents:UIControlEventTouchUpInside];
    /*
     * add as subview
     */
    [[self view]addSubview:[self buttomShare]];

}

/*
 * GEt an objects retain count
 */
-(CFIndex)getMyRetainCount:(id)iAmTheObject
{
    /*
     * Check if ARC is avaialable
     */
    if (__has_feature(objc_arc))
    {
        return CFGetRetainCount((__bridge CFTypeRef)iAmTheObject);
    }
    else
    {
        return CFGetRetainCount((CFTypeRef)iAmTheObject);
    }
}

-(void)handleShare:(id)senderParam
{
    /*
     * GEt an objects retain count
     */
    NSLog(@"%ld",CFGetRetainCount((__bridge CFTypeRef)senderParam));
    
    if ([self textField] && ([[[self textField]text] length] == 0) ) {
        
        NSString* message = nil;
        message = @"Please enter atext and ten press Share";
        
        /*
         * AlertView
         */
        UIAlertView * alertView = nil;
        alertView = [[UIAlertView alloc]initWithTitle:nil
                                              message:message
                                             delegate:self
                                    cancelButtonTitle:@"OK"
                                    otherButtonTitles:nil, nil];
        [alertView show];
        alertView = nil;
        
        return;
    }
    
    /*
     * Create activity ViewController
     * the application activities part of this function
     * Expects a subclass of UIActivity
     */
    [self setActivityViewController:[[UIActivityViewController alloc]initWithActivityItems:[NSArray arrayWithObjects:[[self textField]text], nil]
              applicationActivities:nil]];
    
    /*
     * Present UIACtivityViewController modally
     * for iPhone 
     * for Ipad - this has to happen on apop over view controller
     */
    [self presentViewController:(UIViewController *)[self activityViewController]
                       animated:YES
                     completion:^{
                         //Will add code later
                         NSLog(@"PresentedViewController %@\n",
                               [self presentedViewController]);
                         NSLog(@"presentingViewController %@\n",
                               [[self activityViewController]
                                presentingViewController]);
                     }];
    
    
}

#pragma mark UITextField
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField isEqual:[self textField]])
    {
        [textField resignFirstResponder];
        return YES;
    }
    return NO;
}
@end




