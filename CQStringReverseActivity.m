//
//  CQStringReverseActivity.m
//  AppOne
//
//  Created by mar Jinn on 1/26/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import "CQStringReverseActivity.h"



#pragma mark
#pragma mark UIActivity Subclass
@implementation CQStringReverseActivity
{
    
}

#pragma mark
#pragma mark UIAlertView
-(void)alertView:(UIAlertView *)alertView
didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self activityDidFinish:YES];
}


#pragma mark 
#pragma mark OverRidden methods
-(NSString *)activityType
{
    return [[NSBundle mainBundle]bundleIdentifier] ?
    [[[NSBundle mainBundle]bundleIdentifier]
     stringByAppendingFormat:@".%@",NSStringFromClass([self class])] :
    nil;
}

-(NSString *)activityTitle
{
    return @"Reverse String";
}

-(UIImage *)activityImage
{
    return [UIImage imageNamed:@"Reverse"] ?
    [UIImage imageNamed:@"Reverse"] :
    nil;
}

/*
 * This method shandles the array of objects passed to the activityViewController
 * through the following  method
 * [[UIActivityViewController alloc]initWithActivityItems:[NSArray arrayWithObjects:[[self textField]text], nil]
 applicationActivities:nil]]
 */
-(BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    /*
     * Type check for the object types included in the activity items array
     * as We Expect to work on only strings
     */
    
    for (id obj in activityItems)
    {
        if ([obj isKindOfClass:[NSString class]])
        {
            return YES;
        }
    }
    
    return NO;
}

/*
 * This method gets called if you returned YES from the canPerformWithActivityItems:
   method. You have to retain the given array for later use.
   You don’t really actually have to retain the whole array.
   You may choose to retain only the objects that you need in this array,
   such as the string objects.
 */
-(void)prepareWithActivityItems:(NSArray *)activityItems
{
    NSMutableArray* stringObjects = nil;
    stringObjects = [[NSMutableArray alloc]init];
    
    for (id obj in activityItems)
    {
        if ([obj isKindOfClass:[NSString class]])
        {
            [stringObjects addObject:obj];
        }
    }
    
    [self setActivityItems:[stringObjects copy]];
    stringObjects = nil;

}

/*
 * The method that actually reverses the string
 */
-(NSString *)reverseOfString:(NSString *)paramString
{
    NSMutableString* reversed = nil;
    reversed = [[NSMutableString alloc]
                initWithCapacity:[paramString length]];
    
    for (NSInteger counter = [paramString length] - 1; counter >= 0; counter--)
    {
        [reversed appendFormat:@"%c",[paramString characterAtIndex:counter]];
    }
    
    return [reversed copy];
}

/*
 * method over ridden
 * this will let us perform a custom defined action
 */
-(void)performActivity
{
    NSMutableString* reversedStrings = nil;
    reversedStrings = [[NSMutableString alloc]init];
    
    for (NSString* string in [self activityItems])
    {
        [reversedStrings appendString:[self reverseOfString:string]];
        [reversedStrings appendString:@"\n"];
    }
    
    UIAlertView* alertView = nil;
    alertView = [[UIAlertView alloc]initWithTitle:@"Reversed"
                                          message:reversedStrings
                                         delegate:self
                                cancelButtonTitle:@"OK"
                                otherButtonTitles:nil, nil];
    [alertView show];
    alertView = nil;
}
@end