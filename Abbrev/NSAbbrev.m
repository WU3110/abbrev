//
//  NSAbbrev.m
//  Abbrev
//
//  Created by TomokiNakamaru on 11/12/13.
//  Copyright (c) 2013 TomokiNakamaru. All rights reserved.
//

#import "NSAbbrev.h"

#import "AbbrevMacro.h"
#import <CommonCrypto/CommonCrypto.h>
#import <CoreData/CoreData.h>
#import <objc/runtime.h>

//
// NSArray
//
@implementation NSArray (Abbrev)
- (NSString *)toJSONString {
    
    if([NSJSONSerialization isValidJSONObject:self]) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                                       options:0
                                                         error:nil];
        return [[NSString alloc] initWithData:data
                                     encoding:NSUTF8StringEncoding];
    }
    
    return nil;
}

- (NSArray *)diff:(NSArray *)arr {
    
    NSMutableOrderedSet* allSet
    = [NSMutableOrderedSet orderedSetWithArray:self];

    [allSet addObjectsFromArray:arr];
    
    NSMutableOrderedSet* duplicateSet
    = [NSMutableOrderedSet orderedSetWithArray:self];
    
    [duplicateSet intersectOrderedSet:[NSOrderedSet orderedSetWithArray:arr]];
    
    [allSet minusOrderedSet:duplicateSet];
    return [allSet array];
}

- (NSData *)toData {
    
    return [NSKeyedArchiver archivedDataWithRootObject:self];
}
@end


//
// NSAttributedString
//
@implementation NSAttributedString (Abbrev)

+ (NSAttributedString *)ab_attribtedStringWithString:(NSString *)string lineHeight:(CGFloat)lineHeight
{
    return [self ab_attribtedStringWithString:string
                                   lineHeight:lineHeight
                                lineBreakMode:NSLineBreakByTruncatingTail];
}

+ (NSAttributedString *)ab_attribtedStringWithString:(NSString *)string lineHeight:(CGFloat)lineHeight lineBreakMode:(NSLineBreakMode)lineBreakMode
{
    NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
    paragrahStyle.minimumLineHeight = lineHeight;
    paragrahStyle.maximumLineHeight = lineHeight;
    paragrahStyle.lineBreakMode = lineBreakMode;
    
    NSMutableAttributedString *attributedText
    = [[NSMutableAttributedString alloc] initWithString:string];
    [attributedText addAttribute:NSParagraphStyleAttributeName
                           value:paragrahStyle
                           range:NSMakeRange(0, attributedText.length)];
    return attributedText;
}

@end


//
// NSBundle
//
@implementation NSBundle (Abbrev)
+ (NSString *)pathWithFileName:(NSString *)fName {
    
    return [[NSBundle mainBundle] pathForResource:[fName stringByDeletingPathExtension]
                                           ofType:[fName pathExtension]];
}
@end


//
// NSData
//
@implementation NSData (Abbrev)
- (UIImage *)toImage {
    
    return [[UIImage alloc] initWithData:self];
}

- (NSArray *)toArray {
    
    return [NSKeyedUnarchiver unarchiveObjectWithData:self];
}

- (NSString *)toString {
    
    return [[NSString alloc] initWithData:self
                                 encoding:NSUTF8StringEncoding];
}

- (NSDictionary *)toDictionary {
    
    return [NSKeyedUnarchiver unarchiveObjectWithData:self];
}

- (NSMutableData *)toMutable {
    
    return [NSMutableData dataWithData:self];
}
@end


//
// NSDate
//
@implementation NSDate (Abbrev)

- (NSString *)toString:(NSString *)fmt {
    
    NSDateFormatter *dateFmt = [NSDateFormatter new];
    dateFmt.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    dateFmt.timeZone = [NSTimeZone systemTimeZone];
    dateFmt.dateFormat = fmt;

    return [dateFmt stringFromDate:self];
}

- (NSString *)toStringGMT:(NSString *)fmt {
    
    NSDateFormatter *dateFmt = [NSDateFormatter new];
    dateFmt.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    dateFmt.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    dateFmt.dateFormat = fmt;

    return [dateFmt stringFromDate:self];
}

- (BOOL)isAfter:(NSDate *)target {
    
    return [self compare:target] == NSOrderedDescending;
}

- (BOOL)isBefore:(NSDate *)target {
    
    return [self compare:target] == NSOrderedAscending;
}

@end


//
// NSDictionary
//
@implementation NSDictionary (Abbrev)
- (NSString *)toJSONString {
    
    if([NSJSONSerialization isValidJSONObject:self]) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                                       options:0
                                                         error:nil];
        return [[NSString alloc] initWithData:data
                                     encoding:NSUTF8StringEncoding];
    }
    
    return nil;
}

- (NSData *)toData {
    
    return [NSKeyedArchiver archivedDataWithRootObject:self];
}

- (BOOL)hasKey:(NSString *)key {
    
    return [[self allKeys] containsObject:key];
}
@end


//
// NSFileManager
//
@implementation NSFileManager (Abbrev)
+ (BOOL)fileExistsAtPath:(NSString *)path {
    
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

+ (NSString *)fileExistsAtPath:(NSString *)path extension:(NSArray *)extensions {
 
    NSString *pathWithoutExt = [path stringByDeletingPathExtension];
    for (NSString *ext in extensions) {
        NSString *joined = [pathWithoutExt stringByAppendingString:ext];
        if ([NSFileManager fileExistsAtPath:joined]) {
        
            return joined;
        }
    }
    
    return nil;
}


+ (NSArray *)filesInDirectoryAtPath:(NSString *)path {
    
    return [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path
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
// NSFetchResultsController
//
@implementation NSFetchedResultsController (Abbrev)
+ (NSFetchedResultsController *)controllerWithRequest:(NSFetchRequest *)request
                                              context:(NSManagedObjectContext *)context {
    
    return [self controllerWithRequest:request context:context];
}

+ (NSFetchedResultsController *)controllerWithRequest:(NSFetchRequest *)request
                                              context:(NSManagedObjectContext *)context
                                       sectionKeyPath:(NSString *)keyPath {
    
    return [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                               managedObjectContext:context
                                                 sectionNameKeyPath:keyPath
                                                          cacheName:nil];
}
@end


//
// NSHTTPCookieStorage
//
@implementation NSHTTPCookieStorage (Abbrev)
+ (void)saveFromHeaderFields:(NSDictionary *)headerFields
                         url:(NSURL *)url {
    
    NSArray * all
    = [NSHTTPCookie cookiesWithResponseHeaderFields:headerFields
                                             forURL:url];
    for (NSHTTPCookie *cookie in all) {
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:cookie];
        [[NSUserDefaults standardUserDefaults] setValue:data forKey:@"AbbrevCookie"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }

}

+ (void)load {
    
    NSData *data = [[NSUserDefaults standardUserDefaults] valueForKey:@"AbbrevCookie"];
    NSHTTPCookie *cookies = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    [cookieStorage setCookie:cookies];
}

+ (void)clear {
    
    NSData *data = [[NSUserDefaults standardUserDefaults] valueForKey:@"AbbrevCookie"];
    NSHTTPCookie *cookie = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    [cookieStorage deleteCookie:cookie];
}
@end


//
// NSString
//
@implementation NSString (Abbrev)

- (NSURL *)toURL {
    
    return [NSURL URLWithString:self];
}

- (NSURL *)toFileURL {
    
    return [NSURL fileURLWithPath:self];
}

- (NSData *)toData {
    
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSDate *)toDateWithDefaultFormat {
    
    return [self toDateWithFormat:@"yyyy/MM/dd HH:mm:ss"];
}

- (NSDate *)toDateWithFormat:(NSString *)format {
    
    return [self toDateWithFormat:format timezone:@"GMT"];
}

- (NSDate *)toGMTDateWithFormat:(NSString *)format {
    
    return [self toDateWithFormat:format timezone:@"GMT"];
}

- (NSDate *)toJSTDateWithFormat:(NSString *)format {
    
    return [self toDateWithFormat:format timezone:@"JST"];
}

- (NSDate *)toDateWithFormat:(NSString *)format timezone:(NSString *)timezone {
    
    NSDateFormatter* formatter = [NSDateFormatter new];
    formatter.calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    formatter.dateFormat = format;
    formatter.timeZone = [NSTimeZone timeZoneWithName:timezone];
    return [formatter dateFromString:self];
}


- (NSArray *)toArray:(NSString *)delimiter {
    
    return [self componentsSeparatedByString:delimiter];
}

- (NSString *)toUnderscoreCase {
    
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

- (NSString *)toLowerCamelCase {
    
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

- (NSString *)toUpperCamelCase {
    
    NSString *camel = [self toLowerCamelCase];
    NSString *upperHead = [[camel substringToIndex:1] uppercaseString];
    return [camel stringByReplacingCharactersInRange:NSMakeRange(0,1)
                                          withString:upperHead];
}

- (NSString *)encryptWithKey:(NSString *)key {
    
    return [self AES128:kCCEncrypt key:key];
}

- (NSString *)decryptWithKey:(NSString *)key {
    
    return [self AES128:kCCEncrypt key:key];
}

- (NSString *)AES128:(CCOperation)op key:(NSString *)key {
    
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
    if (cryptStatus == kCCSuccess) {
        // free() is not required NSData->dataWithBytesNoCopy
        NSData *resultData
        = [NSData dataWithBytesNoCopy:buffer length:numBytesCrypted];
        return [resultData toString];
    }
    else {
        free(buffer);
        return nil;
    }
}

- (NSString *)urlEncode {
    
    CFStringRef ref
    = CFURLCreateStringByAddingPercentEscapes(NULL,
                                              (CFStringRef)self,
                                              NULL,
                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                              kCFStringEncodingUTF8 );

    return (NSString *)CFBridgingRelease(ref);
}

- (NSString *)urlDecode {
    
    CFStringRef ref
    = CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                              (CFStringRef)self,
                                                              CFSTR(""),
                                                              kCFStringEncodingUTF8);
    return (NSString *)CFBridgingRelease(ref);

}

+ (NSString *)generateUUID {
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    NSString *uuidStr = (__bridge_transfer NSString *)CFUUIDCreateString(NULL, uuid);
    NSString *uuidReplaced = [uuidStr stringByReplacingOccurrencesOfString:@"-"
                                                                withString:@""];
    CFRelease(uuid);
    return uuidReplaced;
}

+ (NSString *)generateCheckableUUID {
    
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
    for (NSInteger i=0; i<[uuidStr length]; ++i) {
        [result appendString:[uuidStr substringWithRange:NSMakeRange(i, 1)]];
        [result appendString:[uuidStrReversedShift substringWithRange:NSMakeRange(i, 1)]];
    }
    
    return [result lowercaseString];
}

- (BOOL)isValidEmail {
    
    if (!IS_EMPTY_STRING(self)) {
        NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        NSPredicate *emailTest
        = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
        return [emailTest evaluateWithObject:self];
    }
    
    return NO;
}

- (BOOL)containsString:(NSString *)str {
    return [self rangeOfString:str].location != NSNotFound;
}

- (NSString *)transformHiraganaToKatakana {
    
    NSMutableString *str = [[NSMutableString alloc] initWithString:self];
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformHiraganaKatakana, false);
    return str;
}

- (NSString *)transformKatakanaToHiragana {
    
    NSMutableString *str = [[NSMutableString alloc] initWithString:self];
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformHiraganaKatakana, true);
    return str;
}

- (NSString *)transformFullWidthToHalfWidth {
    
    NSMutableString *retStr = [[NSMutableString alloc] initWithString:self];
    CFStringTransform((CFMutableStringRef)retStr, NULL, kCFStringTransformFullwidthHalfwidth, false);
    return retStr;
}
@end
