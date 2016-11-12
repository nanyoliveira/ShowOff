//
//  InstagramRequest.m
//  ShowOff
//
//  Created by Matt Ariane Clarke on 11/11/2016.
//  Copyright © 2016 Matt&Nany. All rights reserved.
//

#import "InstagramRequest.h"
#import <AFNetworking.h>
#import "ViewController.h"

@interface InstagramRequest ()

@end

@implementation InstagramRequest

NSString * const clientID = @"6212fe4654b8415daad7efa5b659a3a3";
NSString * const secret = @"717185a36e2f42628adc6143e851e604";
NSString * const redirect = @"https://itsminehome.wordpress.com/";
NSString * const authURL = @"https://api.instagram.com/oauth/authorize/";
NSString * const tokenURL = @"https://api.instagram.com/oauth/access_token";


-(NSString* )getAuthURL
{
    return  [NSString stringWithFormat:@"%@?client_id=%@&redirect_uri=%@&response_type=code",
             authURL,
             clientID,
             redirect];
    
}

-(NSString* )getRedirectURL
{
    return  redirect;
}

-(void)getAccessTokenByPostWithCode: (NSString *)code andCaller:(ViewController *)caller
{
    
    NSDictionary * parametersDictionary = @{@"client_id":clientID,
                                            @"client_secret":secret,
                                            @"grant_type": @"authorization_code",
                                            @"redirect_uri": redirect,
                                            @"code": code};
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain",nil];
    
    
    [manager POST:tokenURL parameters:parametersDictionary progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSDictionary *response;
        
        if([responseObject isKindOfClass:[NSDictionary class]]) {
            response = responseObject;
        }
        else {
            response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            
        }
        
        [caller completeLogin];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"error post: %@", error);
        
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Oops..!"
                                      message:@"Sorry, something went wrong with your login, please try again"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        
        [caller presentViewController:alert animated:YES completion:nil];
    }];
    
    
}


@end
