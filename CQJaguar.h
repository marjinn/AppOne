//
//  CQJaguar.h
//  AppOne
//
//  Created by mar Jinn on 1/14/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CQCar.h"

@interface CQJaguar : NSObject <CQCar>

@property(nonatomic,copy)NSArray* wheels;
@property(nonatomic,strong)UIColor* bodyColor;
@property(nonatomic,copy)NSArray* doors;

@end
