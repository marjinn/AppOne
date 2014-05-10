//
//  CQJkvcdemo.m
//  AppOne
//
//  Created by mar Jinn on 2/11/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import "CQJkvcdemo.h"

@implementation CQJkvcdemo

static void *contxt = &contxt;

+ (id)sharedManager {
    static CQJkvcdemo *sharedMyManager = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    
    return sharedMyManager;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        //initializations
        //        KVOValueClass* nuValueClass;
        //        nuValueClass = [[KVOValueClass alloc]init];
        
//        [NSTimer scheduledTimerWithTimeInterval:5.0
//                                         target:self
//                                       selector:@selector(toBeImplementd)
//                                       userInfo:nil
//                                        repeats:YES];
//        
        //nukvoKlass = [[ KVOValueClass alloc]init];
        
        //        [nukvoKlass addObserver:self
        //               forKeyPath:@"firstValue"
        //                  options:NSKeyValueObservingOptionNew
        //                  context:(void *)contxt];
        
        
        [self addObserver:self
               forKeyPath:@"firstValue"
                  options:NSKeyValueObservingOptionNew
                  context:(void *)contxt];
        
        
//        while (true) {
//            [self toBeImplementd];
//        }
        
        
    }
    return self;
}

-(void)toBeImplementd
{
    // @autoreleasepool {
    //    KVOValueClass* nuValue_Class;
    //    nuValue_Class = [[KVOValueClass alloc]init];
    [self setFirstValue:[NSString stringWithFormat:@"%u", arc4random()]];
    NSLog(@"%@",[self firstValue]);
    //}
}

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context
{
    if (context == contxt)
    {
        // do stuff
        if ([keyPath isEqualToString:@"firstValue"])
        {
            //statements
            if ([[change objectForKey:NSKeyValueChangeNewKey]
                 isKindOfClass:[NSString class]])
            {
                //statements
                NSString *changedValue;
                changedValue = (NSString *)[change objectForKey:NSKeyValueChangeNewKey];
                NSLog(@"changedValue%@",changedValue);
                
                
            }
            
        }
        
    }
    else
    {
        [super observeValueForKeyPath:keyPath
                             ofObject:object
                               change:change
                              context:context];
    }
}


- (void)dealloc
{
    //deallocations
    [self removeObserver:self
              forKeyPath:@"firstValue"
                 context:(void *)contxt];
}


@end
