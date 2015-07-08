//
//  DTCWineViewController.h
//  Baccus
//
//  Created by David de Tena on 06/07/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

@import UIKit;
@class DTCWineModel;
#import "DTCWineryTableViewController.h"

@interface DTCWineViewController : UIViewController<UISplitViewControllerDelegate, WineryTableViewControllerDelegate>

#pragma mark - Properties
// Model
@property (strong,nonatomic) DTCWineModel *model;

// View
@property (weak,nonatomic) IBOutlet UILabel *nameLabel;
@property (weak,nonatomic) IBOutlet UILabel *wineryNameLabel;
@property (weak,nonatomic) IBOutlet UILabel *typeLabel;
@property (weak,nonatomic) IBOutlet UILabel *originLabel;
@property (weak,nonatomic) IBOutlet UILabel *grapesLabel;
@property (weak,nonatomic) IBOutlet UILabel *notesLabel;
@property (weak,nonatomic) IBOutlet UIImageView *photoView;

@property (strong,nonatomic) IBOutletCollection(UIImageView) NSArray *ratingViews;



#pragma mark - Instance methods
// Designated initializer
-(id) initWithModel: (DTCWineModel *) aModel;

#pragma mark - Actions
-(IBAction)displayWeb:(id)sender;

@end
