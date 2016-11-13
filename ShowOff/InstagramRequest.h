//
//  InstagramRequest.h
//  ShowOff
//
//  Created by Matt Ariane Clarke on 11/11/2016.
//  Copyright © 2016 Matt&Nany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface InstagramRequest : NSObject

    -(NSString* )getAuthURL;
    -(NSString* )getRedirectURL;
    -(void)getAccessTokenByPostWithCode: (NSString *)code andCaller:(UIViewController *)caller ;
    -(void) getUserData ;
    -(void) getUserDataProfile;
    -(void)instagramLogOut;

@end
