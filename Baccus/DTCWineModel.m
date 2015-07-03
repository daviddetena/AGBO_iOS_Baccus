//
//  DTCWineModel.m
//  Baccus
//
//  Created by David de Tena on 03/07/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import "DTCWineModel.h"

@implementation DTCWineModel

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
                       photo:(UIImage *) aPhoto{
    
    return [[self alloc] initWithName:aName
                      wineCompanyName:aWineCompanyName
                                 type:aType
                               origin:anOrigin
                               grapes:arrayOfGrapes
                       wineCompanyWeb:aURL
                                notes:aNotes
                               rating:aRating
                                photo:aPhoto];

}
// Convenience init
+(instancetype) wineWithName:(NSString *) aName
             wineCompanyName:(NSString *) aWineCompanyName
                        type:(NSString *) aType
                      origin:(NSString *) anOrigin{

    return [[self alloc] initWithName:aName
                      wineCompanyName:aWineCompanyName
                                 type:aType
                               origin:anOrigin];
}


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
             photo:(UIImage *) aPhoto{
    
    if(self = [super init]){
        // Assign params to instance variables instead of self.variable
        _name = aName;
        _wineCompanyName = aWineCompanyName;
        _type = aType;
        _origin = anOrigin;
        _grapes = arrayOfGrapes;
        _wineCompanyWeb = aURL;
        _notes = aNotes;
        _rating = aRating;
        _photo = aPhoto;
    }
    return self;
}

-(id) initWithName:(NSString *) aName
   wineCompanyName:(NSString *) aWineCompanyName
              type:(NSString *) aType
            origin:(NSString *) anOrigin{
    return [self initWithName:aName
              wineCompanyName:aWineCompanyName
                         type:aType
                       origin:anOrigin
                       grapes:nil
               wineCompanyWeb:nil
                        notes:nil
                       rating:NO_RATING
                        photo:nil];
}

@end
