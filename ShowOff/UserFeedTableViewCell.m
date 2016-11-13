//
//  UserFeedTableViewCell.m
//  ShowOff
//
//  Created by Matt Ariane Clarke on 11/11/2016.
//  Copyright © 2016 Matt&Nany. All rights reserved.
//

#import "UserFeedTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "User.h"


#define nilOrJSONObjectForKey(JSON_, KEY_) [[JSON_ objectForKey:KEY_] isKindOfClass:[NSNull class]] ? nil : [JSON_ objectForKey:KEY_]

@interface UserFeedTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *userPicture;
@property (weak, nonatomic) IBOutlet UILabel *userLoginName;
@property (weak, nonatomic) IBOutlet UIImageView *postPicture;
@property (weak, nonatomic) IBOutlet UILabel *numberLikes;
@property (weak, nonatomic) IBOutlet UITextView *postStatus;

@end


@implementation UserFeedTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


-(void)updateCellWithData: (NSDictionary *)cellData
{
    
    NSDictionary* caption = nilOrJSONObjectForKey(cellData, @"caption");
    if( caption)
    {
        [self setCaption: caption];
    }
    else{
        //user picture
        [self setUserProfileWithURLString:[[User sharedManager] getUserProfilePicture].absoluteString];
        
        //user Login Name
        self.userLoginName.text = @"";
        
        //post status
        self.postStatus.text = @"";
    }
    
    //post picture
    NSString * postPicture = cellData[@"images"][@"standard_resolution"][@"url"];
    NSURL * postPictureURL = [NSURL URLWithString: postPicture];
    [self.postPicture sd_setImageWithURL:postPictureURL placeholderImage:[UIImage imageNamed:@"landscape"]];

    //number of likes
    self.numberLikes.text = [NSString stringWithFormat:@"%@ Like(s)", cellData[@"likes"][@"count"]] ;
    

}

-(void)setCaption: (NSDictionary *)caption
{
    
    NSDictionary* from = nilOrJSONObjectForKey(caption, @"from");
    if( from)
    {
        //user picture
        NSString * userPicture = nilOrJSONObjectForKey(from, @"profile_picture");
        if(userPicture)
        [self setUserProfileWithURLString:userPicture];
        
        
        
        //user Login Name
        self.userLoginName.text = nilOrJSONObjectForKey(from, @"username");
    }
    
    
    //post status
    self.postStatus.text = nilOrJSONObjectForKey(caption, @"text");
}


-(void) setUserProfileWithURLString: (NSString *)url
{
    NSURL * userPictureURL = [NSURL URLWithString:url];
    [self.userPicture sd_setImageWithURL:userPictureURL placeholderImage:[UIImage imageNamed:@"avatar"]];
    self.userPicture.layer.cornerRadius = self.userPicture.frame.size.width/2;
    self.userPicture.layer.masksToBounds = YES;
}

@end
