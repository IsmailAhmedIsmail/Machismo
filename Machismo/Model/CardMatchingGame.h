//
//  CardMatchingGame.h
//  Machismo
//
//  Created by Ismail Ahmed on 6/18/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"
@interface CardMatchingGame : NSObject
//designated initializer
-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck*) deck;
-(void) chooseCardAtIndex:(NSUInteger) index;
-(Card*) cardAtIndex: (NSUInteger) index;
@property (nonatomic,readonly) NSInteger score;
@end
