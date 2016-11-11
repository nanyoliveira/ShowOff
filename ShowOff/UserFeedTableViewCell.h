//
//  UserFeedTableViewCell.h
//  ShowOff
//
//  Created by Matt Ariane Clarke on 11/11/2016.
//  Copyright © 2016 Matt&Nany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserFeedTableViewCell : UITableViewCell
    @property (weak, nonatomic) IBOutlet UIImageView *userPicture;
    @property (weak, nonatomic) IBOutlet UILabel *userLoginName;
    @property (weak, nonatomic) IBOutlet UIImageView *postPicture;
    @property (weak, nonatomic) IBOutlet UILabel *numberLikes;
    @property (weak, nonatomic) IBOutlet UITextView *postStatus;

@end
