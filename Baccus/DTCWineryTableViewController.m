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
// Pass a message to the Table's delegate to let it know that a new wine has been selected
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DTCWineModel *wine = [self wineAtIndexPath:indexPath];
    
    [self.delegate wineryTableViewController:self
                               didSelectWine:wine];
    
    // Create and send a notification to note that the user did tap a new wine
    NSNotification *notification = [NSNotification notificationWithName:NEW_WINE_NOTIFICATION_NAME
                                                                 object:self
                                                               userInfo:@{WINE_KEY:wine}];
    
    [[NSNotificationCenter defaultCenter] postNotification:notification];
    
    // Save coords of the selected wine in NSUserDefaults
    [self saveLastSelectedWineAtSection:indexPath.section row:indexPath.row];
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

// Set default wine to display
- (NSDictionary *) setDefaults{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // First of red wine will be the default wine to display
    NSDictionary *defaultWineCoords = @{SECTION_KEY : @(RED_WINE_SECTION),
                                        ROW_KEY : @0};
    
    // Save these coords into NSUserDefaults
    [defaults setObject:defaultWineCoords
                 forKey:LAST_WINE_KEY];
    
    [defaults synchronize];
    
    [self displayNSUserDefaultsFolder];
    
    return defaultWineCoords;
}


#pragma mark - NSUserDefaults

- (void) displayNSUserDefaultsFolder{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *folder = [path objectAtIndex:0];
    NSLog(@"Your NSUserDefaults are stored in this folder: %@/Preferences", folder);
}

- (void) saveLastSelectedWineAtSection:(NSUInteger) section row:(NSUInteger) row{
    // Save coords in NSUserDefaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:@{
                          SECTION_KEY:@(section),
                          ROW_KEY:@(row)}
                 forKey:LAST_WINE_KEY];
    
    // Force to save
    [defaults synchronize];
    
    [self displayNSUserDefaultsFolder];
}


- (DTCWineModel *) lastSelectedWine{
    // Get data from NSUserDefault
    NSIndexPath *indexPath = nil;
    NSDictionary *coords = nil;
    
    coords = [[NSUserDefaults standardUserDefaults] objectForKey:LAST_WINE_KEY];
    if (coords == nil) {
        // No wine saved in NSUserDefaults, get the first of red wines
        coords = [self setDefaults];
    }
    
    // Turn the coords into an indexPath
    indexPath = [NSIndexPath indexPathForRow:[[coords objectForKey:ROW_KEY] integerValue]
                                   inSection:[[coords objectForKey:SECTION_KEY] integerValue]];
    
    [self displayNSUserDefaultsFolder];
    
    DTCWineModel *wine = [self wineAtIndexPath:indexPath];
    return wine;
}


@end
