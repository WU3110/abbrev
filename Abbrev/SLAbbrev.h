//
//  SLAbbrev.h
//  Abbrev
//
//  Created by TomokiNakamaru on 12/12/13.
//  Copyright (c) 2013 TomokiNakamaru. All rights reserved.
//

#import <Social/Social.h>
#import "AbbrevMacro.h"
#import "ACAbbrev.h"

@interface SLRequest (Abbrev)

+ (SLRequest *)postTwitter:(ACAccount *)account;
+ (SLRequest *)friendsTwitter:(ACAccount *)account;
+ (SLRequest *)profileTwitter:(ACAccount *)account;

+ (SLRequest *)postFacebook:(ACAccount *)account;
+ (SLRequest *)friendsFacebook:(ACAccount *)account;
+ (SLRequest *)profileFacebook:(ACAccount *)account param:(NSDictionary *)param;
+ (SLRequest *)appInstalledFriendsFacebook:(ACAccount *)account param:(NSDictionary *)param;

- (void)request:(void (^)(NSData *data, NSHTTPURLResponse *response))success
        failure:(void (^)(NSError *error))failure
        finally:(void (^)())finally;
- (void)request:(blockArg(NSData *data,
                          NSHTTPURLResponse *response,
                          NSError *error))callback;

@end

@interface SLComposeViewController (Abbrev)
- (instancetype)initForTwitterWithText:(NSString *)text url:(NSURL *)url;
- (instancetype)initForFacebookWithText:(NSString *)text url:(NSURL *)url;
@end