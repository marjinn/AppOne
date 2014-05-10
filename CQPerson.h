//
//  CQPerson.h
//  AppOne
//
//  Created by mar Jinn on 1/13/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
In order to support subscripting by key on your own classes, 
 you must implement the following two methods on your class 
 and put the method signatures in your class’s header file; 
 otherwise, the compiler won’t know that your class supports 
 subscripting by key.
 */

/* 
 We will use these as the keys to our firstName and lastName
 properties so that if our firstName and lastName properties' names
 change in the future in the implementation, we won't break anything
 and our class will still work, as we can simply change the value of
 these constants inside our implementation file 
 */
extern NSString* const kFirstNameKey;
extern NSString* const kLastNameKey;

@interface CQPerson : NSObject
{
    NSString* firtsName;
    NSString* lastName;
}

@property(nonatomic,copy)NSString* firstName;
@property(nonatomic,copy)NSString* lastname;

@property(nonatomic,assign)CGFloat currentHeight;

-(void)walkAtKilometersPerHour:(CGFloat)paramSpeedKilometeresPerHour;
-(void)runAt10KilometersPerhour;

+(CGFloat)maximumHeightInCentimeters;
+(CGFloat)minimumHeightInCentimeters;

/* To support subscripting by key ie something like this
    __unused NSString *firstName = dictionary[kFirstNameKey];
 */
- (id) objectForKeyedSubscript:(id<NSCopying>)paramKey;
- (void)setObject:(id)paramObject
 forKeyedSubscript:(id<NSCopying>)paramKey;

/* To support subscripting by Index ie something like this
    NSArray *array = @[@"Tim", @"Cook"];
    __unused NSString *firstItem = array[0];
    __unused NSString *secondObject = array[0];
 */
-(id)objectAtIndexedSubscript:(NSUInteger)paramIndex;
-(void)setObject:(id)paramObject
atIndexedSubscript:(NSUInteger)paramIndex;

@end
