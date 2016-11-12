//
//  ViewController.m
//  ShowOff
//
//  Created by Matt Ariane Clarke on 11/11/2016.
//  Copyright © 2016 Matt&Nany. All rights reserved.
//

#import "ViewController.h"
#import "InstagramRequest.h"

@interface ViewController ()
@property(nonatomic,strong)  InstagramRequest * instagramRequest;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.webView.delegate = self;
    self.instagramRequest = [[InstagramRequest alloc]init];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    verify if the user is already logged in and open profile in case yes
}

- (IBAction)logInInstagram:(id)sender
{
    self.webView.hidden  = NO;
    self.webView.userInteractionEnabled = YES;
    NSURL * url = [NSURL URLWithString:self.instagramRequest.getAuthURL];
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:urlRequest];
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return [self getTokenFromCallBack:request];
}


-(BOOL)getTokenFromCallBack:(NSURLRequest *)request
{
    NSString * url = [[request URL] absoluteString];
    
    if([url hasPrefix: self.instagramRequest.getRedirectURL])
    {
        // extract and handle code
        NSRange range = [url rangeOfString: @"code="];
        [self accessTokenRequest:[url substringFromIndex: range.location+range.length]];
        return NO;
    }
    return YES;
}

-(void) accessTokenRequest:(NSString*)code
{
    [self.instagramRequest getAccessTokenByPostWithCode:code andCaller:self];
    self.webView.userInteractionEnabled = NO;
    self.webView.hidden = YES;
}

-(void)completeLogin
{
    [self performSegueWithIdentifier:@"profile" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
