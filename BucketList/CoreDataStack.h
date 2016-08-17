//
//  CoreDataStack.h
//  BucketList
//
//  Created by MDREZAUL KARIM on 8/16/16.
//  Copyright © 2016 Karim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BucketList.h"

@interface CoreDataStack : NSObject


@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
+(CoreDataStack*) coreDataStack;
-(void)addToList:(NSString*)item;

-(NSArray*)getAllItems;

-(void)updateItem:(NSString*)updatedName forItem:(BucketList*)blistItem;
@end
