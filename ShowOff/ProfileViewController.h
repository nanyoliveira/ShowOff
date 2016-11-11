//
//  ProfileViewController.h
//  ShowOff
//
//  Created by Matt Ariane Clarke on 11/11/2016.
//  Copyright © 2016 Matt&Nany. All rights reserved.
//

#import "ViewController.h"

@interface ProfileViewController : ViewController
    @property (weak, nonatomic) IBOutlet UIImageView *userImage;
    @property (weak, nonatomic) IBOutlet UILabel *userInstaName;
    @property (weak, nonatomic) IBOutlet UILabel *userName;
    @property (weak, nonatomic) IBOutlet UILabel *postNumers;
    @property (weak, nonatomic) IBOutlet UILabel *followersNumber;
    @property (weak, nonatomic) IBOutlet UILabel *followingNumbers;
    @property (weak, nonatomic) IBOutlet UITableView *tableFeed;

@end
