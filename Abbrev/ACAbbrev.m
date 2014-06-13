//
//  ACAbbrev.m
//  Abbrev
//
//  Created by TomokiNakamaru on 12/12/13.
//  Copyright (c) 2013 TomokiNakamaru. All rights reserved.
//

#import "ACAbbrev.h"

@implementation ACAccountStore (Abbrev)

- (void)getFacebookAccountWithAppID:(NSString *)appID
                            success:(void (^)(ACAccount *account))completion
                            failuer:(void (^)(NSError *error))failuer
                            finally:(void (^)(void))finally
{
    ACAccountType *accountType
    = [self accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierFacebook];
    NSDictionary *options = @{ACFacebookAppIdKey : appID,
                              ACFacebookAudienceKey : ACFacebookAudienceOnlyMe,
                              ACFacebookPermissionsKey : @[@"email"]};
    [self requestAccessToAccountsWithType:accountType
                                  options:options
                               completion:^(BOOL granted, NSError *error) {
                                   if (granted)
                                   {
                                       NSArray *accounts
                                       = [self accountsWithAccountType:accountType];
                                       completion(accounts.firstObject);
                                   }
                                   else
                                   {
                                       failuer(error);
                                   }
                                   if (finally) finally();
                               }];
}

- (void)requestFacebook:(void (^)(ACAccount *account))callback
                  appId:(NSString *)appId
            permissions:(NSArray *)permissions
               audience:(NSString *)audience
{
    ACAccountType *type
    = [self accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierFacebook];
    
    NSDictionary*opt = @{
                         ACFacebookAppIdKey: appId,
                         ACFacebookPermissionsKey: permissions,
                         ACFacebookAudienceKey: audience
                         };
    
    [self requestAccessToAccountsWithType:type
                                  options:opt
                               completion:^(BOOL granted,NSError*error){
                                   NSArray*accounts
                                   =[self accountsWithAccountType:type];
                                   
                                   if (granted)
                                   {
                                       callback([accounts firstObject]);
                                   }
                                   else
                                   {
                                       callback(nil);
                                   }
                               }];
    
}

- (void)requestTwitter:(void (^)(NSArray *accounts))callback
{
    ACAccountStore *store = [[ACAccountStore alloc] init];
    ACAccountType*type =
    [store accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    [store requestAccessToAccountsWithType:type
                                   options:nil
                                completion:^(BOOL granted, NSError *error){
                                    NSArray*accounts
                                    =[store accountsWithAccountType:type];
                                    
                                    if (granted)
                                    {
                                        callback(accounts);
                                    }
                                    else
                                    {
                                        callback(nil);
                                    }
                                }];
}

@end