//
//  Deck.h
//  Machismo
//
//  Created by Ismail Ahmed on 6/17/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface Deck : NSObject

-(void) addCard: (Card*) card atTop: (BOOL) atTop;
-(void) addCard: (Card*) card;
-(Card*) DrawRandomCard;

@end
