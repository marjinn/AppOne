//
//  CQPerson.m
//  AppOne
//
//  Created by mar Jinn on 1/13/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import "CQPerson.h"

NSString* const kFirstNameKey = @"firstName";
NSString* const kLastNameKey = @"lastname";

@implementation CQPerson

@synthesize firstName;
@synthesize lastname;
@synthesize currentHeight;

-(void)walkAtKilometersPerHour:(CGFloat)paramSpeedKilometeresPerHour
{
    /* Write the codec  for this method there*/
    
    /* ARRAY and MutableArray */
    
    NSString* stringOne;
    stringOne = @"String 1";
    
    NSString* stringTwo;
    stringTwo = @"String 2";
    
    NSString* stringThree;
    stringThree = @"String 3";
    
    NSArray *immutableArray;
    immutableArray = @[stringOne,stringTwo,stringThree];
    
    NSMutableArray* mutableArray;
    mutableArray = [[NSMutableArray alloc]
                    initWithArray:immutableArray];
    
    /* exchangeObjectAtIndex
     */
    [mutableArray exchangeObjectAtIndex:0
                      withObjectAtIndex:1];
    
    /* removeObject 
     */
    [mutableArray removeObjectAtIndex:1];
    
    /* setObject 
     */
    [mutableArray setObject:(NSString *)stringOne
         atIndexedSubscript:0];
    
    NSLog(@"Immutable array = %@ ",immutableArray);
    NSLog(@"Mutable Array =  %@",mutableArray);
    
    /* Output
     Immutable array = ("String 1","String 2","String 3")
     Mutable Array = ("String 1","String 3")
     */
    
    /* NSDictionary and MutableDictionary */
    NSDictionary* personalInformation;
    personalInformation = @{
                            @"firstName" : @"Mark",
                            @"lastName"  : @"Tremonti",
                            @"age"       : @30,
                            @"sex"       : @"Male"
                            };
    
    __unused NSString* first_Name;
    firstName = personalInformation[@"firstName"];
    
    __unused NSString* last_Name;
    lastName = personalInformation[@"lastName"];
    
    NSNumber* age;
    age = personalInformation[@"age"];
    
    NSString* sex;
    sex = [personalInformation
                     objectForKey:(NSString *)@"sex"];
    
    NSLog(@"Full name = %@ %@",firstName,lastName);
    NSLog(@"Age = %@, Sex =  %@" , age,sex);
    
    /*
     The output of this program is:
     Full name = Mark Tremonti
     Age = 30, Sex = Male
     */
    
    NSMutableDictionary* mutablePersonalInformation;
    mutablePersonalInformation =
    [[NSMutableDictionary alloc]
     initWithDictionary:personalInformation];
    
    /* Add Object*/
    [mutablePersonalInformation
     setObject:(NSString *)@"32"
     forKey:@"age"];
    
    NSLog(@"Information = %@", mutablePersonalInformation);
    /*
    The output of this program is:
    Information = {
        age = 32;
        firstName = Mark;
        lastName = Tremonti;
        sex = Male;
    }
     */
    
    /* NSSet */
    /* 
     You can also take advantage of sets.
     Sets are like arrays but must contain a unique 
     set of objects. You cannot add the same instance 
     of an object twice to the same set
     */
    
    NSSet* shoppingList;
    shoppingList = [[NSSet alloc]
                    initWithObjects:
                    @"Milk",
                    @"Bananas",
                    @"Bread",
                    @"Milk",
                    nil];
    
    NSLog(@"Shopping list = %@", shoppingList);
    /*
     Shopping list = {(
     Milk,
     Bananas,
     Bread )}
     
     Milk was mentioned twice
     but added to the set only once
     That's the magic behind sets
     */
    
    NSMutableSet* mutableList;
    mutableList = [NSMutableSet
                   setWithSet:shoppingList];
    
    /* add Objects */
    [mutableList addObject:(NSString *)@"Yogurt"];
    
    /* remove Object */
    [mutableList removeObject:(NSString *)@"Bread"];
    
    NSLog(@"Original list = %@", shoppingList);
    NSLog(@"Mutable list = %@", mutableList);
    
    /* OUTPUT
    Original list = {(
                      Milk,
                      Bananas,
                      Bread )}
     
    Mutable list = {(
                     Milk,
                     Bananas,
                     Yogurt )}
     */
    
    /* 
     NSSET - by default do not keep the order in
     which objects were added to them 
     */
    NSSet* setOfNumbers;
    setOfNumbers = [NSSet
                    setWithArray:@[@3,@4,@1,@5,@10]];
    NSLog(@"Set of numbers = %@", setOfNumbers);
    /*
     What gets printed to the screen after you run this program is:
    Set of numbers = {(
                       5,
                       10, 3, 4, 1
                       )}
     */
    
    NSOrderedSet* set_OfNumbers;
    set_OfNumbers =
    [NSOrderedSet orderedSetWithArray:@[@3,@4,@1,@5,@10]];
    
    NSLog(@"Ordered set of numbers = %@", set_OfNumbers);
    /* */
    
    NSMutableOrderedSet* set_Of_Numbers;
    set_Of_Numbers =
    [NSMutableOrderedSet
     orderedSetWithArray:@[@3,@4,@1,@5,@10]];
    
    /* remove object*/
    [set_Of_Numbers removeObject:@5];
    
    /*add Object*/
    [set_Of_Numbers addObject:@0];
    
    /* exchange Objects */
    [set_Of_Numbers exchangeObjectAtIndex:1
                        withObjectAtIndex:2];
    
    NSLog(@"Set of numbers = %@",set_Of_Numbers);
    /* OUTPUT 
     Set of numbers = {(
     3,
     1, 4, 10, 0
     )}
     */
    
    /*NSCountedSet class is mutable
     
     The NSCountedSet class can hold a unique instance 
     of an object multiple times. However, the way 
     this is done is different from the way arrays 
     perform the same task. In an array, the same object
     can appear multiple times. But in a counted set,
     the object will appear only once, but the set 
     keeps a count of how many times the object was 
     added to the set and will decrement 
     that counter each time you remove an instance 
     of the object.
     
     */
    NSCountedSet* _setOfNumbers;
    _setOfNumbers = [NSCountedSet
                     setWithObjects:
                     @10,
                     @20,
                     @10,
                     @10,
                     @30, nil];
    
    /*add*/
    [_setOfNumbers addObject:@20];
    
    /*Remove*/
    [_setOfNumbers removeObject:@10];
    
    NSLog(@"Count for object @10 = %lu",
          (unsigned long)[_setOfNumbers
                          countForObject:@10]);
    
    NSLog(@"Count for object @10 = %lu",
          (unsigned long)[_setOfNumbers
                          countForObject:@20]);
    
    /* OUTPUT 
     Count for object @10 = 2
     Count for object @20 = 2
     */
    
    
    return;
}

-(void)runAt10KilometersPerhour
{
    /* 
     Call the walk method in our own class
     and pass the value of 10
     */
    [self walkAtKilometersPerHour:10.0f];
    return;
}

+(CGFloat)maximumHeightInCentimeters
{
    return 250.0f;
}

+(CGFloat)minimumHeightInCentimeters
{
    return 40.0f;
}

/* ###################### */
/*  subscripting by key   */
/* ###################### */

- (id) objectForKeyedSubscript:(id<NSCopying>)paramKey
{
    NSObject<NSCopying>* keyAsObject;
    keyAsObject = (NSObject<NSCopying> *)paramKey;
    
    if ([keyAsObject isKindOfClass:[NSString class]])
    {
        NSString* keyAsString;
        keyAsString = (NSString *)keyAsObject;
        
        if ([keyAsString isEqualToString:kFirstNameKey]
            ||
            [keyAsString isEqualToString:kLastNameKey])
        {
            return [self valueForKey:keyAsString];
        }
    }
    
    return nil;
    
}


- (void) setObject:(id)paramObject
 forKeyedSubscript:(id<NSCopying>)paramKey
{
    NSObject<NSCopying>* keyAsObject;
    keyAsObject = (NSObject<NSCopying> *)paramKey;
    
    if ([keyAsObject isKindOfClass:[NSString class]])
    {
        NSString* keyAsString;
        keyAsString = (NSString *)keyAsObject;
        
        if ([keyAsString isEqualToString:kFirstNameKey]
            ||
            [keyAsString isEqualToString:kLastNameKey])
        {
            [self setValue:paramObject forKey:keyAsString];
        }
    }

}


/*
 This is how we use a class that supports 
 subscripting by key ie something like this
 
 Person *person = [Person new];
 person[kFirstNameKey] = @"Tim";
 person[kLastNameKey] = @"Cook";
 __unused NSString *firstName = person[kFirstNameKey];
 __unused NSString *lastName = person[kLastNameKey];
 
 
 This is same as
 
 Person *person = [Person new];
 person.firstName = @"Tim";
 person.lastName = @"Cook";
 
 __unused NSString *firstName = person.firstName;
 __unused NSString *lastName = person.lastName;
 
 */



/* ###################### */
/*  subscripting by Index   */
/* ###################### */

-(id)objectAtIndexedSubscript:(NSUInteger)paramIndex
{
    switch (paramIndex)
    {
        case 0:
            return [self firstName];
            break;
            
        case 1:
            return [self lastname];
            break;
            
        default:
        {
            [NSException raise:@"Invalid Index" format:nil];
        }
            break;
    }
    return nil;
}

-(void)setObject:(id)paramObject
atIndexedSubscript:(NSUInteger)paramIndex
{
    switch (paramIndex)
    {
        case 0:
            [self setFirstName:paramObject];
            break;
            
        case 1:
            [self setLastname:paramObject];
            break;
            
        default:
        {
            [NSException raise:@"Invalid Index" format:nil];
        }
            break;
    }
    
}

/*
 Now we can test out what we’ve written so far, like so:
    Person *person = [Person new];
    person[kFirstNameKey] = @"Tim";
    person[kLastNameKey] = @"Cook";
    
 NSString *firstNameByKey = person[kFirstNameKey];
    NSString *lastNameByKey = person[kLastNameKey];
    
 NSString *firstNameByIndex = person[0];
    NSString *lastNameByIndex = person[1];
    
 if ([firstNameByKey isEqualToString:firstNameByIndex] && [lastNameByKey isEqualToString:lastNameByIndex]){ NSLog(@"Success");
 }else{
 NSLog(@"Something is not right");
 }
 */


@end
