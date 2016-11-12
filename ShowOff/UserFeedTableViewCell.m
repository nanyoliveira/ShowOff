//
//  UserFeedTableViewCell.m
//  ShowOff
//
//  Created by Matt Ariane Clarke on 11/11/2016.
//  Copyright © 2016 Matt&Nany. All rights reserved.
//

#import "UserFeedTableViewCell.h"

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
    
    @end
