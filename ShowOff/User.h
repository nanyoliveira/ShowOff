//
//  User.h
//  ShowOff
//
//  Created by Matt Ariane Clarke on 13/11/2016.
//  Copyright © 2016 Matt&Nany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject


+ (User *) sharedManager;

-(void)setUser: (NSDictionary *)userDetails;


-(NSString *) getUsername;
-(NSString *) getFullName;
-(NSString *) getUserBio;
-(NSString *) getUserID;
-(NSString *) userAccessToken;
-(NSString *) getNumberPosts;
-(NSString *) getFollowinNumber;
-(NSString *) getFollowersNumber;
-(NSURL *) getUserProfilePicture;
-(void)setUserData : (NSDictionary *) data;
-(void)setUserProfileCounts: (NSDictionary *)userDetails;
-(NSArray*) userData;


@end
