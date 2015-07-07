//
//  DTCWineryTableViewController.m
//  Baccus
//
//  Created by David de Tena on 07/07/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import "DTCWineryTableViewController.h"
#import "DTCWineryModel.h"
#import "DTCWineModel.h"
#import "DTCWineViewController.h"

@interface DTCWineryTableViewController ()

@end

@implementation DTCWineryTableViewController


#pragma mark - Init
-(id) initWithModel: (DTCWineryModel *) aModel
              style: (UITableViewStyle) aStyle{
    
    if(self = [super initWithStyle:aStyle]){
        _model = aModel;
        self.title = @"Baccus";
    }
    return self;
}


#pragma mark - Life cycle

// The view is already created and is about to be displayed
- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // Violet-based color for bartint
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.5
                                                                           green:0
                                                                            blue:0.13
                                                                           alpha:1];
    // White color for links in navigation
    self.navigationController.navigationBar.tintColor = [UIColor colorWithWhite:1.0
                                                                          alpha:1];
}



#pragma mark - Memory
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

// Three types of wine
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

// Number of wines for each type
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==RED_WINE_SECTION) {
        return [self.model redWineCount];
    }
    else if (section==WHITE_WINE_SECTION){
        return [self.model whiteWineCount];
    }
    else{
        return [self.model otherWineCount];
    }
}

// NSIndexPath.section and NSIndexPath.row are the one we need to display the proper cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        // There is no cell with the id - Create one
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    // Sync cell with model
    DTCWineModel *wine = [self wineAtIndexPath:indexPath];
    
    cell.imageView.image = wine.photo;
    cell.textLabel.text = wine.name;
    cell.detailTextLabel.text = wine.wineCompanyName;
    
    return cell;
}

// Header for each section
- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section==RED_WINE_SECTION) {
        return @"Red wines";
    }
    else if (section==WHITE_WINE_SECTION){
        return @"White wines";
    }
    else{
        return @"Other wines";
    }
}




#pragma mark - Table view delegate
// Present selected wine by pushing VC
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DTCWineModel *wine = [self wineAtIndexPath:indexPath];
    DTCWineViewController *wineVC = [[DTCWineViewController alloc] initWithModel:wine];
    
    [self.navigationController pushViewController:wineVC animated:YES];
}


#pragma mark - Utils
- (DTCWineModel *) wineAtIndexPath:(NSIndexPath *) indexPath{
    DTCWineModel *model = nil;
    
    if (indexPath.section==RED_WINE_SECTION) {
        model = [self.model redWineAtIndex:indexPath.row];
    }
    else if (indexPath.section==WHITE_WINE_SECTION){
        model = [self.model whiteWineAtIndex:indexPath.row];
    }
    else{
        model = [self.model otherWineAtIndex:indexPath.row];
    }
    return model;
}


@end
