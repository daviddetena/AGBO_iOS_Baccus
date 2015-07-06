//
//  DTCWebViewController.m
//  Baccus
//
//  Created by David de Tena on 06/07/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import "DTCWebViewController.h"
#import "DTCWineModel.h"

@implementation DTCWebViewController

#pragma mark - Instance methods
-(id) initWithModel:(DTCWineModel *) aModel{
    if(self = [super initWithNibName:nil bundle:nil]){
        _model = aModel;
    }
    return self;
}


#pragma mark - Life cycle
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // Set as browser's delegate
    self.browser.delegate = self;
    
    [self displayURL: self.model.wineCompanyWeb];
}

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

@end
