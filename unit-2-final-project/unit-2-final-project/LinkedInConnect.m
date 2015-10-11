//
//  LinkedInConnect.m
//  unit-2-final-project
//
//  Created by Chris David on 10/11/15.
//  Copyright © 2015 Charles Kang. All rights reserved.
//

#import "LinkedInConnect.h"
#import "AFHTTPRequestOperation.h"
#import "LIALinkedInHttpClient.h"
#import "LIALinkedInApplication.h"

@interface LinkedInConnect ()

@end
@implementation LinkedInConnect{
LIALinkedInHttpClient *_client;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _client = [self client];
}


- (IBAction)didTapConnectWithLinkedIn:(id)sender {
    [self.client getAuthorizationCode:^(NSString *code) {
        [self.client getAccessToken:code success:^(NSDictionary *accessTokenData) {
            NSString *accessToken = [accessTokenData objectForKey:@"access_token"];
            [self requestMeWithToken:accessToken];
        }                   failure:^(NSError *error) {
            NSLog(@"Quering accessToken failed %@", error);
        }];
    }                      cancel:^{
        NSLog(@"Authorization was cancelled by user");
    }                     failure:^(NSError *error) {
        NSLog(@"Authorization failed %@", error);
    }];
}


- (void)requestMeWithToken:(NSString *)accessToken {
    [self.client GET:[NSString stringWithFormat:@"https://api.linkedin.com/v1/people/~?oauth2_access_token=%@&format=json", accessToken] parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary *result) {
        NSLog(@"current user %@", result);
    }        failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"failed to fetch current user %@", error);
    }];
}

- (LIALinkedInHttpClient *)client {
    LIALinkedInApplication *application = [LIALinkedInApplication applicationWithRedirectURL:@"http://www.c4q.nyc"
                                                                                    clientId:@"77p7yuwoozuy1k"
                                                                                clientSecret:@"W7uDaQYAP59LGChk"
                                                                                       state:@"DCEEFWF45453sdffef424"
                                                                               grantedAccess:@[/*Stuff here*/]];
    return [LIALinkedInHttpClient clientForApplication:application presentingViewController:nil];
}
@end
