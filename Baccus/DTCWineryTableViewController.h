//
//  DTCWineryTableViewController.h
//  Baccus
//
//  Created by David de Tena on 07/07/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#define RED_WINE_SECTION 0
#define WHITE_WINE_SECTION 1
#define OTHER_WINE_SECTION 2

@import UIKit;
@class DTCWineryModel;

@interface DTCWineryTableViewController : UITableViewController

#pragma mark - Properties
@property (strong,nonatomic) DTCWineryModel *model;


#pragma mark - Instance methods
// Designated initializer, with model and table style
-(id) initWithModel: (DTCWineryModel *) aModel
              style: (UITableViewStyle) aStyle;


#pragma mark - Actions

@end
