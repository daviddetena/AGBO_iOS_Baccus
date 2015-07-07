//
//  DTCWineryModel.h
//  Baccus
//
//  Created by David de Tena on 07/07/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

@import Foundation;
@class DTCWineModel;

@interface DTCWineryModel : NSObject


#pragma mark - Properties
// With readonly the compiler only creates getters (with 0 as default value)
@property (readonly,nonatomic) int redWineCount;
@property (readonly,nonatomic) int whiteWineCount;
@property (readonly,nonatomic) int otherWineCount;


#pragma mark - Instance methods
-(DTCWineModel *) redWineAtIndex:(int) index;
-(DTCWineModel *) whiteWineAtIndex:(int) index;
-(DTCWineModel *) otherWineAtIndex:(int) index;

@end
