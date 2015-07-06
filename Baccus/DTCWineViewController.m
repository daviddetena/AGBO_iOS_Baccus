//
//  DTCWineViewController.m
//  Baccus
//
//  Created by David de Tena on 06/07/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import "DTCWineViewController.h"
#import "DTCWineModel.h"
#import "DTCWebViewController.h"

@implementation DTCWineViewController

#pragma mark - Instance methods
// Designated initializer
-(id) initWithModel: (DTCWineModel *) aModel{
    if (self = [super initWithNibName:nil bundle:nil]) {
        _model = aModel;
        self.title = aModel.name;
    }
    return self;
}


#pragma mark - Life cycle
// Sync model and view
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // Make the VC appears below the status bar
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self syncModelWithView];
    
    // Violet-based color for bartint
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.5
                                                                           green:0
                                                                            blue:0.13
                                                                           alpha:1];
    // White color for links in navigation
    self.navigationController.navigationBar.tintColor = [UIColor colorWithWhite:1.0
                                                                          alpha:1];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Utils
-(void) syncModelWithView{
    self.nameLabel.text = self.model.name;
    self.wineryNameLabel.text = self.model.wineCompanyName;
    self.typeLabel.text = self.model.type;
    self.originLabel.text = self.model.origin;
    self.grapesLabel.text = [self arrayToString:self.model.grapes];
    self.notesLabel.text = self.model.notes;
    self.photoView.image = self.model.photo;
    
    // Rating
    [self displayRating: self.model.rating];
    
    
    // Notes with as much lines as needed
    [self.notesLabel setNumberOfLines:0];
    
}

// Concat in a string all elements in the array
-(NSString *) arrayToString:(NSArray *) anArray{
    NSString *repr = nil;
    if ([anArray count]==1) {
        repr = [@"100% " stringByAppendingString:[anArray lastObject]];
    }
    else{
        repr = [[anArray componentsJoinedByString:@", "] stringByAppendingString:@"."];
    }
    return repr;
}

// Display as many glasses as rating
-(void) displayRating:(int) aRating{
    // Clear rating, load image and display
    [self clearRating];
    UIImage *glass = [UIImage imageNamed:@"glass"];
    for (int i=0; i<aRating; i++) {
        [[self.ratingViews objectAtIndex:i] setImage:glass];
    }
}

// Clear rating
-(void) clearRating{
    for (UIImageView *imgView in self.ratingViews) {
        imgView.image = nil;
    }
}



#pragma mark - Actions
-(IBAction)displayWeb:(id)sender{
    
    // Create WebVC and push it
    DTCWebViewController *webVC = [[DTCWebViewController alloc]initWithModel:self.model];
    [self.navigationController pushViewController:webVC animated:YES];
}



@end
