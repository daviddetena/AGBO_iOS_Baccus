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
@class DTCWineModel;
@class DTCWineryModel;
@class DTCWineryTableViewController;


#pragma mark - WineryTableViewControllerDelegate
@protocol WineryTableViewControllerDelegate <NSObject>

// Messages that the delegate of this class will implement
- (void) wineryTableViewController: (DTCWineryTableViewController *) wineryVC didSelectWine: (DTCWineModel *) aWine;

@end



@interface DTCWineryTableViewController : UITableViewController

#pragma mark - Properties

// Model
@property (strong,nonatomic) DTCWineryModel *model;

// Delegate for the protocol
@property (weak,nonatomic) id<WineryTableViewControllerDelegate> delegate;


#pragma mark - Instance methods
// Designated initializer, with model and table style
-(id) initWithModel: (DTCWineryModel *) aModel
              style: (UITableViewStyle) aStyle;


#pragma mark - Actions

@end
