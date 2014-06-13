//
//  NSAbbrev.h
//  Abbrev
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

/*
 * A
 */
@interface NSArray (Abbrev)
- (NSData *)toData;
- (NSString *)toJSONString;
- (NSString *)toString:(NSString *)glue;
- (NSMutableArray *)toMutable;
- (NSArray *)diff:(NSArray *)arr;
@end

@interface NSAttributedString (Abbrev)
@end


/*
 * B
 */
@interface NSBundle (Abbrev)
+ (NSString *)pathWithFileName:(NSString *)fName;
@end


/*
 * D
 */
@interface NSData (Abbrev)
- (UIImage *)toImage;
- (NSArray *)toArray;
- (NSString *)toString;
- (NSDictionary *)toDictionary;
- (NSMutableData *)toMutable;
@end

@interface NSDate (Abbrev)
- (NSString *)toString:(NSString *)fmt;
- (NSString *)toStringGMT:(NSString *)fmt;
@end

@interface NSDictionary (Abbrev)
- (NSString *)toJSONString;
- (NSData *)toData;
- (NSMutableDictionary *)toMutable;
- (BOOL)hasKey:(NSString *)key;
@end


/*
 * E
 */
@interface NSEntityDescription (Abbrev)
@end


/*
 * F
 */
@interface NSFileManager (Abbrev)
+ (BOOL)fileExists:(NSString *)path;
+ (NSString *)fileExists:(NSString *)path
               ext:(NSArray *)extensions;
+ (NSArray *)listInPath:(NSString *)path;
+ (BOOL)move:(NSString *)src
          to:(NSString *)dst;
+ (BOOL)copy:(NSString *)src
          to:(NSString *)dst;
+ (BOOL)remove:(NSString *)path;
+ (BOOL)makeDir:(NSString *)path;
@end

@interface NSFetchRequest (Abbrev)
+ (NSFetchRequest *)requestWithName:(NSString *)name
                               pred:(NSPredicate *)pred;
+ (NSFetchRequest *)requestWithName:(NSString *)name
                               pred:(NSPredicate *)pred
                               sort:(NSArray *)sorts;
+ (NSFetchRequest *)requestWithName:(NSString *)name
                               pred:(NSPredicate *)pred
                               sort:(NSArray *)sorts
                              limit:(NSUInteger)limit
                             offset:(NSUInteger)offset;
+ (NSFetchRequest *)requestOneWithName:(NSString *)name
                               pred:(NSPredicate *)pred;
+ (NSFetchRequest *)requestOneWithName:(NSString *)name
                               pred:(NSPredicate *)pred
                               sort:(NSArray *)sorts;
+ (NSFetchRequest *)requestOneWithName:(NSString *)name
                               pred:(NSPredicate *)pred
                               sort:(NSArray *)sorts
                             offset:(NSUInteger)offset;
@end

@interface NSFetchedResultsController (Abbrev)
+ (NSFetchedResultsController *)controllerWithRequest:(NSFetchRequest *)req
                                              context:(NSManagedObjectContext *)c;
@end


@interface NSHTTPCookieStorage (Abbrev)
+ (void)saveFromHeaderFields:(NSDictionary *)headerFields
                         url:(NSURL *)url;
+ (void)load;
+ (void)clear;
@end

/*
 * M
 */
@interface NSManagedObject (Abbrev)
- (void)fromDictionary:(NSDictionary *)dict;
- (NSDictionary *)toDictionary;
@end

@interface NSManagedObjectContext (Abbrev)
+ (NSManagedObjectContext *)writerContext:(NSPersistentStoreCoordinator *)coord;
+ (NSManagedObjectContext *)mainContext:(NSManagedObjectContext *)writer;

- (NSManagedObjectContext *)createWorkingContext;
- (BOOL)commitSync;
- (void)commitAsync:(void (^)(NSError *error))callback;
- (NSEntityDescription *)entityForName:(NSString *)name;

- (NSManagedObject *)create:(NSString *)entityName;
- (NSArray *)fetch:(NSFetchRequest *)req;
- (void)remove:(NSFetchRequest *)req;
- (NSManagedObject *)uniqueCreate:(NSString *)entityName
                             pred:(NSPredicate *)pred;
- (NSUInteger)count:(NSFetchRequest *)req;
@end

@interface NSManagedObjectModel (Abbrev)
+ (NSManagedObjectModel *)modelWithMOMDFileName:(NSString *)fileName;
@end


/*
 * N
 */
@interface NSNotificationCenter (Abbrev)
+ (void)addObserver:(NSObject *)observer
         forKeyPath:(NSString *)keyPath
            options:(NSKeyValueObservingOptions)options
            context:(void *)context;
+ (void)addObserver:(id)observer
           selector:(SEL)aSelector
               name:(NSString *)aName
             object:(id)anObject;
@end


/*
 * O
 */
@interface NSObject (Abbrev)
+ (void)replaceMethodWithOriginalSelector:(SEL)originalSelector
                           swizzledMethod:(SEL)swizzledSelector;
@end


/*
 * P
 */
@interface NSPersistentStoreCoordinator (Abbrev)
+ (NSPersistentStoreCoordinator *)coordinatorWithModel:(NSManagedObjectModel *)model
                                        sqliteFileName:(NSString *)fileName;
+ (NSPersistentStoreCoordinator *)coordinatorWithAppName:(NSString *)name;
@end

@interface NSPredicate (Abbrev)
@end


/*
 * S
 */
@interface NSSortDescriptor (Abbrev)
@end

@interface NSString (Abbrev)
+ (NSString *)generateUUID;
+ (NSString *)generateCheckableUUID;
- (NSURL *)toURL;
- (NSURL *)toFileURL;
- (NSData *)toData;
- (NSDate *)toDateWithDefaultFormat;
- (NSDate *)toDateWithFormat:(NSString *)fmt;
- (NSDate *)toDateWithFormatGMT:(NSString *)fmt;
- (NSArray *)toArray:(NSString *)delimiter;
- (id)toObjectAsJSONString;
- (NSMutableString *)toMutable;

- (NSString *)toUnderscoreCase;
- (NSString *)toLowerCamelCase;
- (NSString *)toUpperCamelCase;
- (NSString *)encryptWithKey:(NSString *)key;
- (NSString *)decryptWithKey:(NSString *)key;
- (NSString *)urlEncode;
- (NSString *)urlDecode;

- (BOOL)isValidEmail;

- (NSString *)joinedString:(NSString *)str;
- (NSString *)joinedPath:(NSString *)path;
- (NSString *)replacedString:(NSString *)q
                     replace:(NSString *)r;

- (BOOL)containsString:(NSString *)str;
@end


/*
 * T
 */

/*
 * U
 */
