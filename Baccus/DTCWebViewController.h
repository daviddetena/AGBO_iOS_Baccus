//
//  DTCWebViewController.h
//  Baccus
//
//  Created by David de Tena on 06/07/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

@import UIKit;
@class DTCWineModel;

@interface DTCWebViewController : UIViewController<UIWebViewDelegate>

#pragma mark - Properties

// Model
@property (strong,nonatomic) DTCWineModel *model;
@property (weak,nonatomic) IBOutlet UIWebView *browser;
@property (weak,nonatomic) IBOutlet UIActivityIndicatorView *activityView;


#pragma mark - Instance methods
-(id) initWithModel:(DTCWineModel *) aModel;

@end
