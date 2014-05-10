//
//  CQStringReverseActivity.h
//  AppOne
//
//  Created by mar Jinn on 1/26/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 * Uiactivity Subclass To be used while presenting UIActivityView
 */
@interface CQStringReverseActivity : UIActivity <UIAlertViewDelegate>
{
    
}

@property(nonatomic,strong)NSArray* activityItems;
@end