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
- (NSArray *)diff:(NSArray *)arr;
@end

@interface NSAttributedString (Abbrev)

+ (NSAttributedString *)ab_attribtedStringWithString:(NSString *)string lineHeight:(CGFloat)lineHeight;
+ (NSAttributedString *)ab_attribtedStringWithString:(NSString *)string lineHeight:(CGFloat)lineHeight lineBreakMode:(NSLineBreakMode)lineBreakMode;

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
- (BOOL)isAfter:(NSDate *)target;
- (BOOL)isBefore:(NSDate *)target;
@end

@interface NSDictionary (Abbrev)
- (NSString *)toJSONString;
- (NSData *)toData;
- (BOOL)hasKey:(NSString *)key;
@end


/*
 * F
 */
@interface NSFileManager (Abbrev)
+ (BOOL)fileExistsAtPath:(NSString *)path;
+ (NSString *)fileExistsAtPath:(NSString *)path
                     extension:(NSArray *)extensions;
+ (NSArray *)filesInDirectoryAtPath:(NSString *)path;
+ (BOOL)makeDir:(NSString *)path;
@end


@interface NSFetchedResultsController (Abbrev)
+ (NSFetchedResultsController *)controllerWithRequest:(NSFetchRequest *)request
                                              context:(NSManagedObjectContext *)context;
+ (NSFetchedResultsController *)controllerWithRequest:(NSFetchRequest *)request
                                              context:(NSManagedObjectContext *)context
                                       sectionKeyPath:(NSString *)keyPath;

@end


@interface NSHTTPCookieStorage (Abbrev)
+ (void)saveFromHeaderFields:(NSDictionary *)headerFields
                         url:(NSURL *)url;
+ (void)load;
+ (void)clear;
@end


/*
 * S
 */
@interface NSString (Abbrev)
+ (NSString *)generateUUID;
+ (NSString *)generateCheckableUUID;
- (NSURL *)toURL;
- (NSURL *)toFileURL;
- (NSData *)toData;
- (NSDate *)toDateWithDefaultFormat;
- (NSDate *)toDateWithFormat:(NSString *)format;
- (NSDate *)toGMTDateWithFormat:(NSString *)format;
- (NSDate *)toJSTDateWithFormat:(NSString *)format;
- (NSDate *)toDateWithFormat:(NSString *)format timezone:(NSString *)timezone;
- (NSArray *)toArray:(NSString *)delimiter;

- (NSString *)toUnderscoreCase;
- (NSString *)toLowerCamelCase;
- (NSString *)toUpperCamelCase;
- (NSString *)encryptWithKey:(NSString *)key;
- (NSString *)decryptWithKey:(NSString *)key;
- (NSString *)urlEncode;
- (NSString *)urlDecode;

- (BOOL)isValidEmail;

- (BOOL)containsString:(NSString *)str;

- (NSString *)transformHiraganaToKatakana;
- (NSString *)transformKatakanaToHiragana;
- (NSString *)transformFullWidthToHalfWidth;

@end


/*
 * T
 */

/*
 * U
 */
