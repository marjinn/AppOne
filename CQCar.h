//
//  CQCar.h
//  AppOne
//
//  Created by mar Jinn on 1/14/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import <Foundation/Foundation.h>
/*Protocol*/
@protocol CQCar <NSObject>

@required

@property(nonatomic,copy)NSArray* wheels;
@property(nonatomic,strong)UIColor* bodyColor;
@property(nonatomic,copy)NSArray* doors;

@end
