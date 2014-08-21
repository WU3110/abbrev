//
//  NSAbbrev.m
//  Abbrev
//
//  Created by TomokiNakamaru on 11/12/13.
//  Copyright (c) 2013 TomokiNakamaru. All rights reserved.
//

#import "NSAbbrev.h"
#import <CommonCrypto/CommonCrypto.h>
#import <CoreData/CoreData.h>
#import <objc/runtime.h>

//
// NSArray
//
@implementation NSArray (Abbrev)
- (NSString *)toJSONString
{
    if([NSJSONSerialization isValidJSONObject:self])
    {
        NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                                       options:0
                                                         error:nil];
        return [[NSString alloc] initWithData:data
                                     encoding:NSUTF8StringEncoding];
    }
    else
    {
        return nil;
    }
}

- (NSString *)toString:(NSString *)glue
{
    NSString *str = @"";
    for (id obj in self)
    {
        if ([str length] != 0) str = [str joinedString:str];
        str = [str joinedString:[NSString stringWithFormat:@"%@", obj]];
    }

    return str;
}

- (NSMutableArray *)toMutable
{
    return [NSMutableArray arrayWithArray:self];
}

- (NSArray *)diff:(NSArray *)arr
{
    NSMutableOrderedSet* allSet
    = [NSMutableOrderedSet orderedSetWithArray:self];

    [allSet addObjectsFromArray:arr];
    
    NSMutableOrderedSet* duplicateSet
    = [NSMutableOrderedSet orderedSetWithArray:self];
    
    [duplicateSet intersectOrderedSet:[NSOrderedSet orderedSetWithArray:arr]];
    
    [allSet minusOrderedSet:duplicateSet];
    return [allSet array];
}

- (NSData *)toData
{
    return [NSKeyedArchiver archivedDataWithRootObject:self];
}
@end


//
// NSAttributedString
//
@implementation NSAttributedString (Abbrev)
@end


//
// NSBundle
//
@implementation NSBundle (Abbrev)
+ (NSString *)pathWithFileName:(NSString *)fName
{
    return [[NSBundle mainBundle] pathForResource:[fName stringByDeletingPathExtension]
                                           ofType:[fName pathExtension]];
}
@end


//
// NSData
//
@implementation NSData (Abbrev)
- (UIImage *)toImage
{
    return [[UIImage alloc] initWithData:self];
}

- (NSArray *)toArray
{
    return [NSKeyedUnarchiver unarchiveObjectWithData:self];
}

- (NSString *)toString
{
    return [[NSString alloc] initWithData:self
                                 encoding:NSUTF8StringEncoding];
}

- (NSDictionary *)toDictionary
{
    return [NSKeyedUnarchiver unarchiveObjectWithData:self];
}

- (NSMutableData *)toMutable
{
    return [NSMutableData dataWithData:self];
}
@end


//
// NSDate
//
@implementation NSDate (Abbrev)
- (NSString *)toString:(NSString *)fmt
{
    NSDateFormatter *dateFmt = [NSDateFormatter new];
    dateFmt.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    dateFmt.timeZone = [NSTimeZone systemTimeZone];
    dateFmt.dateFormat = fmt;

    return [dateFmt stringFromDate:self];
}

- (NSString *)toStringGMT:(NSString *)fmt
{
    NSDateFormatter *dateFmt = [NSDateFormatter new];
    dateFmt.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    dateFmt.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    dateFmt.dateFormat = fmt;

    return [dateFmt stringFromDate:self];
}
@end


//
// NSDictionary
//
@implementation NSDictionary (Abbrev)
- (NSString *)toJSONString
{
    if([NSJSONSerialization isValidJSONObject:self])
    {
        NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                                       options:0
                                                         error:nil];
        return [[NSString alloc] initWithData:data
                                     encoding:NSUTF8StringEncoding];
    }
    else
    {
        return nil;
    }
}

- (NSData *)toData
{
    return [NSKeyedArchiver archivedDataWithRootObject:self];
}

- (NSMutableDictionary *)toMutable;
{
    return [NSMutableDictionary dictionaryWithDictionary:self];
}

- (BOOL)hasKey:(NSString *)key
{
    return [[self allKeys] containsObject:key];
}
@end


//
// NSEntityDescription
//
@implementation NSEntityDescription (Abbrev)
@end


//
// NSFileManager
//
@implementation NSFileManager (Abbrev)
+ (BOOL)fileExists:(NSString *)path
{
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

+ (NSString *)fileExists:(NSString *)path
               ext:(NSArray *)extensions
{
    NSString *pathWithoutExt = [path stringByDeletingPathExtension];
    for (NSString *ext in extensions)
    {
        NSString *joined = [pathWithoutExt stringByAppendingString:ext];
        if ([NSFileManager fileExists:joined])
        {
            return joined;
        }
    }
    
    return nil;
}

+ (NSArray *)listInPath:(NSString *)path
{
    return [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path
                                                               error:nil];
}

+ (BOOL)move:(NSString *)src
          to:(NSString *)dst
{
    return [[NSFileManager defaultManager] moveItemAtPath:src
                                                   toPath:dst
                                                    error:nil];
}

+ (BOOL)copy:(NSString *)src
          to:(NSString *)dst
{
    return [[NSFileManager defaultManager] copyItemAtPath:src
                                                   toPath:dst
                                                    error:nil];
}

+ (BOOL)remove:(NSString *)path
{
    return [[NSFileManager defaultManager] removeItemAtPath:path
                                                      error:nil];
}

+ (BOOL)makeDir:(NSString *)path
{
    return [[NSFileManager defaultManager] createDirectoryAtPath:path
                                     withIntermediateDirectories:YES
                                                      attributes:nil
                                                           error:nil];
}
@end


//
// NSFetchRequest
//
@implementation NSFetchRequest (Abbrev)
+ (NSFetchRequest *)requestWithName:(NSString *)name
                               pred:(NSPredicate *)pred
{
    return [NSFetchRequest requestWithName:name
                                      pred:pred
                                      sort:nil
                                     limit:0
                                    offset:0];
}
+ (NSFetchRequest *)requestWithName:(NSString *)name
                               pred:(NSPredicate *)pred
                               sort:(NSArray *)sorts
{
    return [NSFetchRequest requestWithName:name
                                      pred:pred
                                      sort:sorts
                                     limit:0
                                    offset:0];
}

+ (NSFetchRequest *)requestWithName:(NSString *)name
                               pred:(NSPredicate *)pred
                               sort:(NSArray *)sorts
                              limit:(NSUInteger)limit
                             offset:(NSUInteger)offset
{
    NSFetchRequest *fetchRequest
    = [[NSFetchRequest alloc] initWithEntityName:name];
    
    if(pred) fetchRequest.predicate = pred;
    if(sorts) fetchRequest.sortDescriptors = sorts;
    if(limit > 0) fetchRequest.fetchLimit = limit;
    if(offset > 0) fetchRequest.fetchOffset = offset;
    
    return fetchRequest;
}

+ (NSFetchRequest *)requestOneWithName:(NSString *)name
                                  pred:(NSPredicate *)pred
{
    return [NSFetchRequest requestWithName:name
                                      pred:pred
                                      sort:nil
                                     limit:1
                                    offset:0];
}
+ (NSFetchRequest *)requestOneWithName:(NSString *)name
                                  pred:(NSPredicate *)pred
                                  sort:(NSArray *)sorts
{
    return [NSFetchRequest requestWithName:name
                                      pred:pred
                                      sort:sorts
                                     limit:1
                                    offset:0];
}
+ (NSFetchRequest *)requestOneWithName:(NSString *)name
                                  pred:(NSPredicate *)pred
                                  sort:(NSArray *)sorts
                                offset:(NSUInteger)offset
{
    return [NSFetchRequest requestWithName:name
                                      pred:pred
                                      sort:sorts
                                     limit:1
                                    offset:offset];
}
@end


//
// NSFetchResultsController
//
@implementation NSFetchedResultsController (Abbrev)
+ (NSFetchedResultsController *)controllerWithRequest:(NSFetchRequest *)req
                                              context:(NSManagedObjectContext *)c
{
    return [[NSFetchedResultsController alloc] initWithFetchRequest:req
                                               managedObjectContext:c
                                                 sectionNameKeyPath:nil
                                                          cacheName:nil];
}
@end


//
// NSHTTPCookieStorage
//
@implementation NSHTTPCookieStorage (Abbrev)
+ (void)saveFromHeaderFields:(NSDictionary *)headerFields
                         url:(NSURL *)url
{
    NSArray * all
    = [NSHTTPCookie cookiesWithResponseHeaderFields:headerFields
                                             forURL:url];
    for (NSHTTPCookie *cookie in all)
    {
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:cookie];
        [[NSUserDefaults standardUserDefaults] setValue:data forKey:@"AbbrevCookie"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }

}

+ (void)load
{
    NSData *data = [[NSUserDefaults standardUserDefaults] valueForKey:@"AbbrevCookie"];
    NSHTTPCookie *cookies = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    [cookieStorage setCookie:cookies];
}

+ (void)clear
{
    NSData *data = [[NSUserDefaults standardUserDefaults] valueForKey:@"AbbrevCookie"];
    NSHTTPCookie *cookie = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    [cookieStorage deleteCookie:cookie];
}
@end


//
// NSManagedObject
//
@implementation NSManagedObject (Abbrev)
- (void)fromDictionary:(NSDictionary *)dict
{
    [self setValuesForKeysWithDictionary:dict];
}

- (NSDictionary *)toDictionary
{
    NSArray *keys = [[self.entity attributesByName] allKeys];
    return [self dictionaryWithValuesForKeys:keys];
}
@end


//
// NSManagedObjectContext
//
@implementation NSManagedObjectContext (Abbrev)
+ (NSManagedObjectContext *)writerContext:(NSPersistentStoreCoordinator *)coord
{
    NSManagedObjectContext *context
    = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    context.persistentStoreCoordinator = coord;
    return context;
}

+ (NSManagedObjectContext *)mainContext:(NSManagedObjectContext *)writer
{
    NSManagedObjectContext *context
    = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    context.parentContext = writer;
    return context;
}

- (NSManagedObjectContext *)createWorkingContext;
{
    NSManagedObjectContext *context
    = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    context.parentContext = self;
    return context;
}

- (BOOL)commitSync
{
    NSError *error = nil;
    [self save:&error];
    if (error) return NO;
    return YES;
}

- (void)commitAsync:(void (^)(NSError *error))callback
{
    NSError *error = nil;
    [self save:&error];
    callback(error);
}

- (NSEntityDescription *)entityForName:(NSString *)name
{
    return [NSEntityDescription entityForName:name
                       inManagedObjectContext:self];
}

- (NSManagedObject *)create:(NSString *)entityName;
{
    NSManagedObject *mo
    = [NSEntityDescription insertNewObjectForEntityForName:entityName
                                    inManagedObjectContext:self];
    return mo;
}

- (NSArray *)fetch:(NSFetchRequest *)req
{
    NSError *error = nil;
    NSArray *res = [self executeFetchRequest:req
                                       error:&error];
    if (error) return nil;
    return res;
}

- (void)remove:(NSFetchRequest *)req
{
    NSArray *arr = [self fetch:req];
    for (NSManagedObject *mo in arr)
    {
        [self deleteObject:mo];
    }
}

- (NSManagedObject *)uniqueCreate:(NSString *)entityName
                             pred:(NSPredicate *)pred
{
    
    NSFetchRequest *req = [NSFetchRequest requestOneWithName:entityName
                                                        pred:pred];
    NSArray *arr = [self fetch:req];
    
    if ([arr count] > 0)
    {
        return [arr firstObject];
    }
    else
    {
        return [self create:entityName];
    }
}

- (NSUInteger)count:(NSFetchRequest *)req
{
    return [self countForFetchRequest:req
                                error:nil];
}
@end


//
// NSManagedObjectModel
//
@implementation NSManagedObjectModel (Abbrev)
+ (NSManagedObjectModel *)modelWithMOMDFileName:(NSString *)fileName
{
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:fileName
                                              withExtension:@"momd"];
    return [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
}
@end


//
// NSNotificationCenter
//
@implementation NSNotificationCenter (Abbrev)
+ (void)addObserver:(NSObject *)observer
         forKeyPath:(NSString *)keyPath
            options:(NSKeyValueObservingOptions)options
            context:(void *)context
{
    [[NSNotificationCenter defaultCenter] addObserver:observer
                                           forKeyPath:keyPath
                                              options:options
                                              context:context];
}

+ (void)addObserver:(id)observer
           selector:(SEL)aSelector
               name:(NSString *)aName
             object:(id)anObject
{
    [[NSNotificationCenter defaultCenter] addObserver:observer
                                             selector:aSelector
                                                 name:aName
                                               object:anObject];
}
@end


//
// NSObject
//
@implementation NSObject (Abbrev)

// http://nshipster.com/method-swizzling/
+ (void)replaceMethodWithOriginalSelector:(SEL)originalSelector
                           swizzledMethod:(SEL)swizzledSelector
{
    Class cls = [self class];
    Method originalMethod = class_getInstanceMethod(cls, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(cls, swizzledSelector);

    BOOL didAddMethod = class_addMethod(cls,
                                        originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod)
    {
        class_replaceMethod(cls,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    }
    else
    {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }

}
@end


//
// NSPersistentStoreCoordinator
//
@implementation NSPersistentStoreCoordinator (Abbrev)
+ (NSPersistentStoreCoordinator *)coordinatorWithModel:(NSManagedObjectModel *)model
                                        sqliteFileName:(NSString *)fileName
{
    NSString *sqliteFileName = [NSString stringWithFormat:@"%@.sqlite", fileName];
    NSString *storePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]stringByAppendingPathComponent:@"CoreData"];
    [NSFileManager makeDir:storePath];
    storePath = [storePath stringByAppendingPathComponent:sqliteFileName];
    
    NSDictionary *option = @{NSMigratePersistentStoresAutomaticallyOption:@YES,
                             NSInferMappingModelAutomaticallyOption:@YES};
    NSError *error = nil;
    NSPersistentStoreCoordinator *psc
    = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];

    if (![psc addPersistentStoreWithType:NSSQLiteStoreType
                           configuration:nil
                                     URL:[storePath toFileURL]
                                 options:option
                                   error:&error])
    {
        NSLog(@"CoreData migration error %@", error);
    }
    return psc;
}

+ (NSPersistentStoreCoordinator *)coordinatorWithAppName:(NSString *)name
{
    NSManagedObjectModel *model
    = [NSManagedObjectModel modelWithMOMDFileName:name];
    return [NSPersistentStoreCoordinator coordinatorWithModel:model
                                               sqliteFileName:name];
}
@end


//
// NSPredicate
//
@implementation NSPredicate (Abbrev)
@end

//
// NSSortDescriptor
//
@implementation NSSortDescriptor (Abbrev)
@end


//
// NSString
//
@implementation NSString (Abbrev)

- (NSURL *)toURL
{
    return [NSURL URLWithString:self];
}

- (NSURL *)toFileURL
{
    return [NSURL fileURLWithPath:self];
}

- (NSData *)toData
{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSDate *)toDateWithDefaultFormat
{
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    fmt.dateFormat = @"yyyy/MM/dd HH:mm:ss";
    
    return [fmt dateFromString:self];
}

- (NSDate *)toDateWithFormat:(NSString *)fmt
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.calendar
    = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    formatter.dateFormat = fmt;
    formatter.timeZone = [NSTimeZone systemTimeZone];
    return [formatter dateFromString:self];
}

- (NSDate *)toDateWithFormatGMT:(NSString *)fmt
{
    NSDateFormatter* formatter = [NSDateFormatter new];
    formatter.calendar
    = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    formatter.dateFormat = fmt;
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    return [formatter dateFromString:self];
}

- (NSArray *)toArray:(NSString *)delimiter
{
    return [self componentsSeparatedByString:delimiter];
}

- (id)toObjectAsJSONString
{
    NSError *error = nil;
    id data
    = [NSJSONSerialization JSONObjectWithData:[self toData]
                                      options:NSJSONReadingAllowFragments
                                        error:&error];
    return error? nil : data;
}

- (NSMutableString *)toMutable
{
    return [NSMutableString stringWithString:self];
}

- (NSString *)toUnderscoreCase
{
    NSScanner *scanner = [NSScanner scannerWithString:self];
    scanner.caseSensitive = YES;
    
    NSCharacterSet *uppercase = [NSCharacterSet uppercaseLetterCharacterSet];
    NSCharacterSet *lowercase = [NSCharacterSet lowercaseLetterCharacterSet];
    
    NSString *buffer = nil;
    NSMutableString *output = [NSMutableString string];
    
    while (scanner.isAtEnd == NO)
    {
        if ([scanner scanCharactersFromSet:uppercase intoString:&buffer])
        {
            [output appendString:[buffer lowercaseString]];
        }
        
        if ([scanner scanCharactersFromSet:lowercase intoString:&buffer])
        {
            [output appendString:buffer];
            if (!scanner.isAtEnd) [output appendString:@"_"];
        }
    }
    
    return [NSString stringWithString:output];
}

- (NSString *)toLowerCamelCase
{
    NSArray *components = [self componentsSeparatedByString:@"_"];
    NSMutableString *output = [NSMutableString string];
    
    for (NSUInteger i = 0; i < components.count; i++)
    {
        if (i == 0)
        {
            NSString *cmp = components[i];
            NSString *lowerHead = [[cmp substringToIndex:1] lowercaseString];
            NSString *result
            = [cmp stringByReplacingCharactersInRange:NSMakeRange(0,1)
                                           withString:lowerHead];
            [output appendString:result];
        }
        else
        {
            [output appendString:[components[i] capitalizedString]];
        }
    }
    
    return [NSString stringWithString:output];
}

- (NSString *)toUpperCamelCase
{
    NSString *camel = [self toLowerCamelCase];
    NSString *upperHead = [[camel substringToIndex:1] uppercaseString];
    return [camel stringByReplacingCharactersInRange:NSMakeRange(0,1)
                                          withString:upperHead];
}

- (NSString *)encryptWithKey:(NSString *)key
{
    return [self AES128:kCCEncrypt key:key];
}

- (NSString *)decryptWithKey:(NSString *)key
{
    return [self AES128:kCCEncrypt key:key];
}

- (NSString *)AES128:(CCOperation)op key:(NSString *)key
{
    // requires key length > 2
    NSInteger keyLength = [key length];
    if (keyLength < 2) abort();
    
    // make paired key
    NSString *key1 = [key substringToIndex:keyLength/2];
    NSString *key2 = [key substringFromIndex:keyLength/2];
    
    // make c string of key1 = AES128 key
    char keyPtr[kCCKeySizeAES128 + 1];
    memset(keyPtr, 0, sizeof(keyPtr));
    [key1 getCString:keyPtr
           maxLength:sizeof(keyPtr)
            encoding:NSUTF8StringEncoding];
    
    // make c string of key2 = AES128 initial vector
    char ivPtr[kCCBlockSizeAES128 + 1];
    memset(ivPtr, 0, sizeof(ivPtr));
    [key2 getCString:ivPtr
           maxLength:sizeof(ivPtr)
            encoding:NSUTF8StringEncoding];
    
    // result buffer
    NSUInteger dataLength = [[self toData] length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesCrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(op, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding, keyPtr,
                                          kCCBlockSizeAES128, ivPtr,
                                          [[self toData] bytes], dataLength,
                                          buffer, bufferSize, &numBytesCrypted);
    if (cryptStatus == kCCSuccess)
    {
        // free() is not required NSData->dataWithBytesNoCopy
        NSData *resultData
        = [NSData dataWithBytesNoCopy:buffer length:numBytesCrypted];
        return [resultData toString];
    }
    else
    {
        free(buffer);
        return nil;
    }
}

- (NSString *)urlEncode
{
    CFStringRef ref
    = CFURLCreateStringByAddingPercentEscapes(NULL,
                                              (CFStringRef)self,
                                              NULL,
                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                              kCFStringEncodingUTF8 );

    return (NSString *)CFBridgingRelease(ref);
}

- (NSString *)urlDecode
{
    CFStringRef ref
    = CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                              (CFStringRef)self,
                                                              CFSTR(""),
                                                              kCFStringEncodingUTF8);
    return (NSString *)CFBridgingRelease(ref);

}

+ (NSString *)generateUUID
{
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    NSString *uuidStr = (__bridge_transfer NSString *)CFUUIDCreateString(NULL, uuid);
    NSString *uuidReplaced = [uuidStr replacedString:@"-" replace:@""];
    CFRelease(uuid);
    return uuidReplaced;
}

+ (NSString *)generateCheckableUUID
{
    NSArray *letters = @[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7",
                         @"8", @"9", @"A", @"B", @"C", @"D", @"E", @"F"];
    NSString *uuidStr = [NSString generateUUID];
    
    // uuid str reverse
    __block NSMutableString *uuidStrReversedShift = [NSMutableString string];
    [uuidStr enumerateSubstringsInRange:NSMakeRange(0, [uuidStr length])
                                options:(NSStringEnumerationByComposedCharacterSequences | NSStringEnumerationReverse)
                             usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                 NSInteger n = [letters indexOfObject:substring];
                                 n = (n + 1)%[letters count];
                                 [uuidStrReversedShift appendString:letters[n]];
                             }];
    
    NSMutableString *result = [NSMutableString string];
    for (NSInteger i=0; i<[uuidStr length]; ++i)
    {
        [result appendString:[uuidStr substringWithRange:NSMakeRange(i, 1)]];
        [result appendString:[uuidStrReversedShift substringWithRange:NSMakeRange(i, 1)]];
    }
    
    return [result lowercaseString];
}

- (BOOL)isValidEmail
{
    if(self)
    {
        NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        NSPredicate *emailTest
        = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
        return [emailTest evaluateWithObject:self];
    }
    else
    {
        return NO;
    }
}

- (NSString *)joinedString:(NSString *)str
{
    return [self stringByAppendingString:str];
}

- (NSString *)joinedPath:(NSString *)path
{
    return [self stringByAppendingPathComponent:path];
}

- (NSString *)replacedString:(NSString *)q
                     replace:(NSString *)r
{
    return [self stringByReplacingOccurrencesOfString:q
                                           withString:r];
}

- (BOOL)containsString:(NSString *)str
{
    return [self rangeOfString:str].location != NSNotFound;
}

@end
