//
//  SLAbbrev.m
//  Abbrev
//
//  Created by TomokiNakamaru on 12/12/13.
//  Copyright (c) 2013 TomokiNakamaru. All rights reserved.
//

#import "SLAbbrev.h"

@implementation SLRequest (Abbrev)

//
// Twitter
//
+ (SLRequest *)postTwitter:(ACAccount *)account
{
    NSString *urlString = @"https://api.twitter.com/1.1/statuses/update.json";
    
    SLRequest*request
    = [SLRequest requestForServiceType:SLServiceTypeTwitter
                         requestMethod:SLRequestMethodPOST
                                   URL:[NSURL URLWithString:urlString]
                            parameters:nil];
    request.account = account;
    return request;
}

+ (SLRequest *)friendsTwitter:(ACAccount *)account
{
    NSString *userId = [account valueForKeyPath:@"properties.user_id"];
    NSString *urlString
    = string(@"https://api.twitter.com/1.1/friends/ids.json?cursor=-1&user_id=%@",userId);

    SLRequest*request
    = [SLRequest requestForServiceType:SLServiceTypeTwitter
                         requestMethod:SLRequestMethodGET
                                   URL:[NSURL URLWithString:urlString]
                            parameters:nil];
    request.account = account;
    return request;
}

+ (SLRequest *)profileTwitter:(ACAccount *)account
{
    NSString *urlString
    = @"http://api.twitter.com/1.1/account/verify_credentials.json";
    
    SLRequest*request
    = [SLRequest requestForServiceType:SLServiceTypeTwitter
                         requestMethod:SLRequestMethodGET
                                   URL:[NSURL URLWithString:urlString]
                            parameters:nil];
    request.account = account;
    return request;
}


//
// Facebook
//
+ (SLRequest *)postFacebook:(ACAccount *)account
{
    NSString *urlString
    = string(@"https://graph.facebook.com/%@/feed",
             [account valueForKey:@"properties.uid"]);
    
    SLRequest *request
    = [SLRequest requestForServiceType:SLServiceTypeFacebook
                         requestMethod:SLRequestMethodPOST
                                   URL:[NSURL URLWithString:urlString]
                            parameters:nil];
    return request;
}

+ (SLRequest *)friendsFacebook:(ACAccount *)account
{
    NSString *urlString
    = @"https://graph.facebook.com/me/friends";
    
    SLRequest*request
    = [SLRequest requestForServiceType:SLServiceTypeFacebook
                         requestMethod:SLRequestMethodGET
                                   URL:[NSURL URLWithString:urlString]
                            parameters:nil];
    request.account = account;
    return request;
}

+ (SLRequest *)profileFacebook:(ACAccount *)account param:(NSDictionary *)param
{
    NSString *urlString
    = @"https://graph.facebook.com/me/";
    
    SLRequest*request
    = [SLRequest requestForServiceType:SLServiceTypeFacebook
                         requestMethod:SLRequestMethodGET
                                   URL:[NSURL URLWithString:urlString]
                            parameters:param];
    request.account = account;
    return request;
}

+ (SLRequest *)appInstalledFriendsFacebook:(ACAccount *)account param:(NSDictionary *)param
{
    NSString *urlString = @"https://graph.facebook.com/me/friends";
    
    SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeFacebook
                                            requestMethod:SLRequestMethodGET
                                                      URL:[NSURL URLWithString:urlString
                                                           ] parameters:param];
    request.account = account;
    return request;
}

//
// common
//
- (void)request:(void (^)(NSData *, NSHTTPURLResponse *, NSError *))callback
{
    [self performRequestWithHandler:callback];
}

- (void)request:(void (^)(NSData *data, NSHTTPURLResponse *response))success
        failure:(void (^)(NSError *error))failure
        finally:(void (^)())finally
{
    [self performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
        if (!error)
        {
            success(responseData, urlResponse);
        }
        else
        {
            failure(error);
        }
        
        finally();
    }];
}

@end

@implementation SLComposeViewController (Abbrev)
- (instancetype)initForTwitterWithText:(NSString *)text url:(NSURL *)url
{
    self = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    if (self)
    {
        [self setInitialText:text];
        [self addURL:url];
    }
    
    return self;
}

- (instancetype)initForFacebookWithText:(NSString *)text url:(NSURL *)url
{
    self = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    if (self)
    {
        [self setInitialText:text];
        [self addURL:url];
    }
    
    return self;
}
@end