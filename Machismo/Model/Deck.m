//
//  Deck.m
//  Machismo
//
//  Created by Ismail Ahmed on 6/17/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

#import "Deck.h"

@interface Deck()

@property (strong, nonatomic) NSMutableArray* cards;

@end
@implementation Deck

-(NSMutableArray*) cards
{
    if(!_cards)
        _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(void) addCard:(Card *)card atTop: (BOOL) atTop
{
    if(atTop)
    {
        [self.cards insertObject: card atIndex: 0];
    }
    else
    {
        [self.cards addObject: card];
    }
}
-(void) addCard:(Card *)card
{
    [self addCard:card atTop:NO];
}

-(Card*) DrawRandomCard
{
    Card* card = nil;
    if([self.cards count])
    {
        unsigned index = arc4random() % [self.cards count];
        card = [self.cards objectAtIndex:index];
        [self.cards removeObjectAtIndex:index];
    }
    return card;
}
@end
