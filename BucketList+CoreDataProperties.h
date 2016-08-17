//
//  BucketList+CoreDataProperties.h
//  BucketList
//
//  Created by MDREZAUL KARIM on 8/16/16.
//  Copyright © 2016 Karim. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "BucketList.h"

NS_ASSUME_NONNULL_BEGIN

@interface BucketList (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *item;

@end

NS_ASSUME_NONNULL_END
