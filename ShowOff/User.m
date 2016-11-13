//
//  User.m
//  ShowOff
//
//  Created by Matt Ariane Clarke on 13/11/2016.
//  Copyright © 2016 Matt&Nany. All rights reserved.
//

#import "User.h"
@interface User ()
@property (strong, nonatomic) NSString * userName;
@property (strong, nonatomic) NSString * fullName;
@property (strong, nonatomic) NSString * bio;
@property (strong, nonatomic) NSString * access_token;
@property (strong, nonatomic) NSString * user_id;
@property (strong, nonatomic) NSString * profilePictureURL;
@property (strong, nonatomic) NSArray * _userData;
@property (strong, nonatomic) NSString * postsNumber;
@property (strong, nonatomic) NSString * followingNumber;
@property (strong, nonatomic) NSString * followersNumber;


@end



@implementation User

+ (User *) sharedManager
{
    
    static User *sharedUser = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedUser = [[User alloc] init];
    });
    return sharedUser;
}



-(void)setUserProfileCounts: (NSDictionary *)userDetails
{
    NSDictionary * counts = userDetails[@"data"][@"counts"];
    self.postsNumber = [NSString stringWithFormat:@"%@", counts[@"media"]] ;
    self.followingNumber = [NSString stringWithFormat:@"%@", counts[@"follows"]] ;
    self.followersNumber = [NSString stringWithFormat:@"%@", counts[@"followed_by"]] ;
}

-(void)setUser: (NSDictionary *)userDetails
{
    
    self.userName = userDetails[@"user"][@"username"];
    self.fullName = userDetails[@"user"][@"full_name"];
    self.profilePictureURL = userDetails[@"user"][@"profile_picture"];
    self.user_id = userDetails[@"user"][@"id"];
    self.bio = userDetails[@"user"][@"bio"];
    self.access_token = userDetails[@"access_token"];
    
}

-(NSString *) getUsername
{
    return self.userName;
}

-(NSString *) getFullName
{
    return self.fullName;
}

-(NSString *) getUserBio
{
    return self.bio;
}

-(NSString *) getUserID
{
    return self.user_id;
}

-(NSString *) userAccessToken
{
    return self.access_token;
}

-(NSString *) getNumberPosts
{
    return self.postsNumber;
}

-(NSString *) getFollowinNumber
{
    return self.followingNumber;
}

-(NSString *) getFollowersNumber
{
    return self.followersNumber;
}

-(NSURL *) getUserProfilePicture
{
    return [[NSURL alloc] initWithString:self.profilePictureURL];
}

-(void)setUserData : (NSDictionary *) data
{
    self._userData= data [@"data"];
}

-(NSArray*) userData
{
    if(self._userData)
    {
        return self._userData;
    }else{
        return @[];
    }
}


@end
