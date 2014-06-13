//
//  ACAbbrev.h
//  Abbrev
//
//  Created by TomokiNakamaru on 12/12/13.
//  Copyright (c) 2013 TomokiNakamaru. All rights reserved.
//

#import <Accounts/Accounts.h>

@interface ACAccountStore (Abbrev)

- (void)getFacebookAccountWithAppID:(NSString *)appID
                            success:(void (^)(ACAccount *account))completion
                            failuer:(void (^)(NSError *error))failuer
                            finally:(void (^)(void))finally;
- (void)requestFacebook:(void (^)(ACAccount *account))callback
                  appId:(NSString *)appId
            permissions:(NSArray *)permissions
               audience:(NSString *)audience;
- (void)requestTwitter:(void (^)(NSArray *accounts))callback;

@end