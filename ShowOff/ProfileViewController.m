//
//  ProfileViewController.m
//  ShowOff
//
//  Created by Matt Ariane Clarke on 11/11/2016.
//  Copyright © 2016 Matt&Nany. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()
    @property (weak, nonatomic) IBOutlet UIImageView *userImage;
    @property (weak, nonatomic) IBOutlet UILabel *userInstaName;
    @property (weak, nonatomic) IBOutlet UILabel *userName;
    @property (weak, nonatomic) IBOutlet UILabel *postNumers;
    @property (weak, nonatomic) IBOutlet UILabel *followersNumber;
    @property (weak, nonatomic) IBOutlet UILabel *followingNumbers;
    @property (weak, nonatomic) IBOutlet UITableView *tableFeed;
@end

@implementation ProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
    
- (IBAction)logOutButton:(id)sender
{
}
    
    

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender 
 {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
