//
//  ProfileViewController.m
//  ShowOff
//
//  Created by Matt Ariane Clarke on 11/11/2016.
//  Copyright © 2016 Matt&Nany. All rights reserved.
//

#import "ProfileViewController.h"
#import "User.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "InstagramRequest.h"
#import "UserFeedTableViewCell.h"

@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *userInstaName;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *postNumers;
@property (weak, nonatomic) IBOutlet UILabel *followersNumber;
@property (weak, nonatomic) IBOutlet UILabel *followingNumbers;
@property (weak, nonatomic) IBOutlet UITableView *tableFeed;
@property (strong, nonatomic) InstagramRequest * instagramRequest;
@end

@implementation ProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.instagramRequest = [[InstagramRequest alloc]init];
    self.tableFeed.delegate = self;
    self.tableFeed.dataSource = self;
    
}

-(void) viewWillAppear:(BOOL)animated
{
    NSString * userNameBio ;
    if([[User sharedManager] getUserBio].length > 1)
    {
        userNameBio = [NSString stringWithFormat:@"%@ - %@", [[User sharedManager] getFullName], [[User sharedManager] getUserBio] ]  ;
    }
    else {
        userNameBio = [[User sharedManager] getFullName];
    }
    self.userName.text = userNameBio;
    
    self.userInstaName.text = [[User sharedManager] getUsername];
    [self.userImage sd_setImageWithURL:[[User sharedManager] getUserProfilePicture]
                      placeholderImage:[UIImage imageNamed:@"avatar"]];
    self.userImage.layer.cornerRadius = self.userImage.frame.size.width/2;
    self.userImage.layer.masksToBounds = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateFeed:)
                                                 name:@"UserDataReady"
                                               object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateFeed:)
                                                 name:@"UserProfileReady"
                                               object:nil];

    [self.instagramRequest getUserDataProfile];
    [self.instagramRequest getUserData];
}

- (void) updateFeed:(NSNotification *) notification
{
    if ([[notification name] isEqualToString:@"UserDataReady"])
    {
        [self.tableFeed reloadData];
    }
    else if([[notification name] isEqualToString:@"UserProfileReady"])
    {
        self.postNumers.text = [NSString stringWithFormat:@"%@ post(s)", [[User sharedManager] getNumberPosts]];
        self.followersNumber.text = [NSString stringWithFormat:@"%@ follower(s)", [[User sharedManager] getFollowersNumber]];
        self.followingNumbers.text = [NSString stringWithFormat:@"%@ following", [[User sharedManager] getFollowinNumber]];
    }
    
}

- (IBAction)logOutButton:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"logged_in"];
    [self.instagramRequest instagramLogOut];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark - Table view

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[User sharedManager] userData] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserFeedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell" forIndexPath:indexPath];
    [cell updateCellWithData:[[User sharedManager] userData][indexPath.row]];
    
    return cell;
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
