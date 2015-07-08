//
//  DTCWebViewController.m
//  Baccus
//
//  Created by David de Tena on 06/07/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import "DTCWebViewController.h"
#import "DTCWineModel.h"
#import "DTCWineryTableViewController.h"

@implementation DTCWebViewController

#pragma mark - Instance methods
-(id) initWithModel:(DTCWineModel *) aModel{
    if(self = [super initWithNibName:nil bundle:nil]){
        _model = aModel;
        self.title = [@"Web de " stringByAppendingString:aModel.name];
    }
    return self;
}


#pragma mark - Life cycle
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // Set self as browser's delegate
    self.browser.delegate = self;
    
    [self displayURL: self.model.wineCompanyWeb];
    
    // Suscribe to notifications from table
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self
               selector:@selector(wineDidChange:)
                   name:NEW_WINE_NOTIFICATION_NAME
                 object:nil];
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    // Unsuscribe from notifications
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - Memory
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Utils
-(void) displayURL:(NSURL *) aURL{
    self.activityView.hidden = NO;
    [self.activityView startAnimating];
    
    // Browser loads model's url
    [self.browser loadRequest:[NSURLRequest requestWithURL:aURL]];
}


#pragma mark - UIWebViewDelegate
// Hide activity view when loading the url
-(void) webViewDidFinishLoad:(UIWebView *)webView{
    self.activityView.hidden = YES;
    [self.activityView stopAnimating];
}


#pragma mark - Notifications
// Catch the new wine from extraInfo in the notification
-(void) wineDidChange: (NSNotification *) notification{
    DTCWineModel *newWine = [notification.userInfo objectForKey:WINE_KEY];
    
    // Update model
    self.model = newWine;
    self.title = [@"Web de " stringByAppendingString:self.model.name];
    [self displayURL:self.model.wineCompanyWeb];
}
@end
