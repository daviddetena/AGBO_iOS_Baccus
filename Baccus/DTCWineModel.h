//
//  DTCWineModel.h
//  Baccus
//
//  Created by David de Tena on 03/07/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#define NO_RATING -1

@import Foundation;
@import UIKit;

@interface DTCWineModel : NSObject

#pragma mark - Properties
@property (nonatomic,copy) NSString *type;
@property (strong,nonatomic) UIImage *photo;
@property (strong,nonatomic) NSURL *wineCompanyWeb;
@property (nonatomic,copy) NSString *notes;
@property (nonatomic,copy) NSString *origin;
@property (nonatomic) int rating;       // 0-5
@property (strong,nonatomic) NSArray *grapes;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *wineCompanyName;


#pragma mark - Factory methods: Convenience constructors
// Convenience init
+(instancetype) wineWithName:(NSString *) aName
             wineCompanyName:(NSString *) aWineCompanyName
                        type:(NSString *) aType
                      origin:(NSString *) anOrigin
                      grapes:(NSArray *) arrayOfGrapes
              wineCompanyWeb:(NSURL *) aURL
                       notes:(NSString *) aNotes
                      rating:(int) aRating
                       photo:(UIImage *) aPhoto;

// Convenience init
+(instancetype) wineWithName:(NSString *) aName
             wineCompanyName:(NSString *) aWineCompanyName
                        type:(NSString *) aType
                      origin:(NSString *) anOrigin;



#pragma mark - Instance methods
// Designated
-(id) initWithName:(NSString *) aName
   wineCompanyName:(NSString *) aWineCompanyName
              type:(NSString *) aType
            origin:(NSString *) anOrigin
            grapes:(NSArray *) arrayOfGrapes
    wineCompanyWeb:(NSURL *) aURL
             notes:(NSString *) aNotes
            rating:(int) aRating
             photo:(UIImage *) aPhoto;


-(id) initWithName:(NSString *) aName
   wineCompanyName:(NSString *) aWineCompanyName
              type:(NSString *) aType
            origin:(NSString *) anOrigin;

@end
