//
//  main.m
//  AppOne
//
//  Created by mar Jinn on 1/13/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CQAppDelegate.h"
#import "CQJkvcdemo.h"

#import <AssetsLibrary/AssetsLibrary.h>

ALAssetsLibrary*
getSharedAssetLibInstance
(
    void
);

ALAssetsLibrary*
getSharedAssetLibInstance
(
    void
)
{
    static ALAssetsLibrary* assetsLibrarySharedInstance = nil;
    static dispatch_once_t predicate = 0;
    
    dispatch_once(&predicate, ^
    {
        if (assetsLibrarySharedInstance == nil)
        {
             assetsLibrarySharedInstance = [ALAssetsLibrary new];
        }
       
    });
    
    return assetsLibrarySharedInstance;
}

ALAsset*
writeImageToAlbumAndReturnAsset
(
    UIImage* ,
    NSError* __autoreleasing * ,
    ALAssetsLibrary* __autoreleasing *
 );

ALAsset*
writeImageToAlbumAndReturnAsset
(
    UIImage* image,
    NSError* __autoreleasing * errorSavingAsset,
    ALAssetsLibrary* __autoreleasing * assetLibrary
)
{
    __block BOOL shouldKeepRunning      = YES;
    __block NSError* errorSaving        = nil;
    __block ALAsset* assetSought        = nil;
    __block ALAssetsLibrary* assetLib   = nil;
    /**
     *  get The AssetLibrary
     */
    
    assetLib = getSharedAssetLibInstance();
    
    /**
     *  Asset Enumeration Q
     */
    dispatch_queue_t thisConcurrentQ = 0;
    thisConcurrentQ =
    dispatch_queue_create("this.Concurrent.QQ", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(thisConcurrentQ, ^{
    
    [assetLib writeImageToSavedPhotosAlbum:(CGImageRef)[image CGImage]
                               orientation:
     (ALAssetOrientation)[image imageOrientation]
                           completionBlock:
     ^(NSURL *assetURL, NSError *error)
     {
         if (assetURL)
         {
             /**
              *  get the assetFrom url
              */
             [assetLib assetForURL:assetURL
                       resultBlock:
              ^(ALAsset *asset)
             {
                 assetSought = asset;
                 
                 BOOL createAssetGroupAndAddAsset(ALAsset* asset);
                 
                 //NSLog(@"createAssetGroupAndAddAsset %@",createAssetGroupAndAddAsset(assetSought) ? @"YES" : @"NO");
                 
//                 [getSharedAssetLibInstance() addAssetsGroupAlbumWithName:@"BOOYAH" resultBlock:
//                  ^(ALAssetsGroup *group)
//                  {
//                      NSLog(@"group %@",group);
//                      
//                      if (group == nil)
//                      {
//                          [getSharedAssetLibInstance() enumerateGroupsWithTypes:ALAssetsGroupAlbum
//                                                                     usingBlock:
//                           ^(ALAssetsGroup *group, BOOL *stop)
//                           {
//                               
//                               if ([[group valueForProperty:ALAssetsGroupPropertyName]  isEqualToString: @"BOOYAH"])
//                               {
//                                   NSLog(@"%@" ,[group isEditable] ? @YES : @NO);
//                                   NSLog(@"%@" ,[group addAsset:assetSought] ? @YES : @NO);
//                                   
//                                   *stop = YES;
//                                   shouldKeepRunning = NO;
//                                   
//                               }
//                           }
//                                                                   failureBlock:
//                           ^(NSError *error)
//                           {
//                               NSLog(@"enumerateGroupsWithTypes error %@",error);
//                               shouldKeepRunning = NO;
//                               
//                           }];//enumerateGroupsWithTypes
//                      }
//                      else
//                      {
//                          NSLog(@"%@" ,[group addAsset:assetSought] ? @YES : @NO);
//                          
//                          shouldKeepRunning = NO;
//                      
//                      }//group
//                      
//                      
//                      
//                  }
//                                                             failureBlock:
//                  ^(NSError *error)
//                  {
//                      NSLog(@"error %@",error);
//                      
//                      shouldKeepRunning = NO;
//                      
//                  }]; //addAssetsGroupAlbumWithName
                 
                 shouldKeepRunning = NO;
             }
                      failureBlock:
              ^(NSError *error)
             {
                 errorSaving = error;
                 
                 shouldKeepRunning = NO;
                 
             }];//assetForURL
         }
         else
         {
             errorSaving = error;
             
             shouldKeepRunning = NO;
         }
         
     }];//writeImageToSavedPhotosAlbum
    
       
    });//dispatch_async new Q
    
    /**
     *  Wait on the current(main) runloop (thread from which this function was called) as asset operations happen asynchronously
     *  Start the infinite loop with a bool condition check
     *  Runs the loop once, blocking for input in the specified mode until a given date.
     * Run loop wil block all other inputs
     *
     * Can also be done in one step like this this will make the runlopp wiat for 5 sec
     
     [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
     beforeDate:
     [NSDate dateWithTimeInterval:5 sinceDate:[NSDate date]]];
     
     */
    
    
    /**
     *  main threads run loop
     */
    NSRunLoop* currentRunLoop;
    currentRunLoop = [NSRunLoop currentRunLoop];
    
    /**
     *  Get Thread Name
     */
    NSLog(@"%s %@",__func__,[NSThread currentThread]);
    
    int count = 0;
    while (shouldKeepRunning)
    {
        NSLog(@"runloopCycle#: %d",count ++);
        if ([currentRunLoop runMode:NSDefaultRunLoopMode
                         beforeDate:[NSDate distantFuture]])
        {
            continue;
        }
        else
        {
            break;
        }
    }

    
    
    if (errorSavingAsset != NULL)
    {
        *errorSavingAsset = errorSaving;
    }
    
    thisConcurrentQ = 0;
    return assetSought;
    
}//writeImageToAlbumAndReturnAsset




BOOL createAssetGroupAndAddAsset(ALAsset* asset)
{
    __block BOOL shouldKeepRunning      = YES;
    
    __block BOOL addAssetSuccess = NO;
    
    dispatch_queue_t that_ConcurrentQ = 0;
    that_ConcurrentQ =
    dispatch_queue_create("that.Concurrent.QQ", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(that_ConcurrentQ, ^{

    [getSharedAssetLibInstance() addAssetsGroupAlbumWithName:@"BOOYAH" resultBlock:
     ^(ALAssetsGroup *group)
     {
         NSLog(@"group %@",group);
         
         if (group == nil)
         {
             [getSharedAssetLibInstance() enumerateGroupsWithTypes:ALAssetsGroupAlbum
                                                        usingBlock:
              ^(ALAssetsGroup *group, BOOL *stop)
              {
                  
                  if ([[group valueForProperty:ALAssetsGroupPropertyName]
                       isEqualToString: @"BOOYAH"])
                  {
                      NSLog(@"%@" ,[group isEditable] ? @YES : @NO);
                      //NSLog(@"%@" ,[group addAsset:asset] ? @YES : @NO);
                      
                      addAssetSuccess = [group addAsset:asset] ? YES : NO;
                      
                      
                      
                      
                      *stop = YES;
                      
                      shouldKeepRunning = NO;
                      
                  }
              }
                                                      failureBlock:
              ^(NSError *error)
              {
                  NSLog(@"enumerateGroupsWithTypes error %@",error);
                  
                  shouldKeepRunning = NO;
                  
              }];//enumerateGroupsWithTypes
         }
         else
         {
             addAssetSuccess = [group addAsset:asset] ? YES : NO;
             
             shouldKeepRunning = NO;
         
         }//group created
         
         
         
     }
                                                failureBlock:
     ^(NSError *error)
     {
         NSLog(@"error %@",error);
         
         shouldKeepRunning = NO;
         
     }]; //addAssetsGroupAlbumWithName
    
        
    });//dispatch_async(that_ConcurrentQ
    
    
    /**
     *  main threads
     *  or caller thread
     */
    NSRunLoop* currentRunLoop;
    currentRunLoop = [NSRunLoop currentRunLoop];
    
    /**
     *  Get Thread Name
     */
    NSLog(@"%s %@",__func__,[NSThread currentThread]);
    
    int count = 0;
    while (shouldKeepRunning)
    {
        NSLog(@"runloopCycle for %s #: %d",__func__ ,count ++);
        if ([currentRunLoop runMode:NSDefaultRunLoopMode
                         beforeDate:[NSDate distantFuture]])
        {
            continue;
        }
        else
        {
            break;
        }
    }
    

    
    
    return addAssetSuccess;

}//createAssetGroupAndAddAsset





int main(int argc, char * argv[])
{
    CQJkvcdemo* dmo;
    //dmo = [[CQJkvcdemo alloc]init];
    dmo = [CQJkvcdemo sharedManager];
    
    //[dmo setFirstValue:[NSString stringWithFormat:@"%u", arc4random()]];
    //NSLog(@"%@",[dmo firstValue]);
    
    dmo.firstValue = [NSString stringWithFormat:@"%u", arc4random()];
    
    ///*
    NSError* __autoreleasing error              = nil;
    ALAssetsLibrary* __autoreleasing assetsLib  = nil;
    ALAsset* assetReturned                      = nil;
    
    assetReturned =
    writeImageToAlbumAndReturnAsset
    (
     [UIImage imageNamed:@"punch.jpg"],
     (NSError *__autoreleasing *)&error,
     (ALAssetsLibrary *__autoreleasing *)&assetsLib
     );
    
    NSLog(@"assetReturned %@",assetReturned);
    NSLog(@ "error O %@",error);
    
    NSLog(@"createAssetGroupAndAddAsset %@",
          createAssetGroupAndAddAsset(assetReturned) ? @"YES" : @"NO");
    

    
    
    
    /*
    [getSharedAssetLibInstance() addAssetsGroupAlbumWithName:@"BOOYAH" resultBlock:
     ^(ALAssetsGroup *group)
     {
         NSLog(@"group %@",group);
         
         if (group == nil)
         {
             [getSharedAssetLibInstance() enumerateGroupsWithTypes:ALAssetsGroupAlbum
                                                        usingBlock:
              ^(ALAssetsGroup *group, BOOL *stop)
             {
                 
                 if ([[group valueForProperty:ALAssetsGroupPropertyName]  isEqualToString: @"BOOYAH"])
                 {
                      NSLog(@"%@" ,[group isEditable] ? @YES : @NO);
                      NSLog(@"%@" ,[group addAsset:assetReturned] ? @YES : @NO);
                    
                 }
             }
                                                      failureBlock:
              ^(NSError *error)
             {
                  NSLog(@"enumerateGroupsWithTypes error %@",error);
                  
             }];//enumerateGroupsWithTypes
         }
         
         
         
     }
                              failureBlock:
     ^(NSError *error)
    {
         NSLog(@"error %@",error);
     
    }]; //addAssetsGroupAlbumWithName
    
    */
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([CQAppDelegate class]));
    }
}
