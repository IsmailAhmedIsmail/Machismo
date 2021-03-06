//
//  CardMatchingGame.m
//  Machismo
//
//  Created by Ismail Ahmed on 6/18/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic,strong) NSMutableArray* cards; //of Card
@end

@implementation CardMatchingGame
-(NSMutableArray*) cards
{
    if(!_cards)
        _cards= [[NSMutableArray alloc]init];
    return _cards;
}
-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    if(self)
    {
        for(int i=0; i<count; i++)
        {
            Card* card = [deck DrawRandomCard];
            if(card)
            {
                [self.cards addObject:card];
            }
            else
            {
                self = nil;
                break;
            }
        }
    }
    return self;
}
static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;
-(Card*) cardAtIndex:(NSUInteger)index
{
    return index<[self.cards count]? [self.cards objectAtIndex:index]: nil;
}

-(void) chooseCardAtIndex:(NSUInteger)index
{
    Card* card = [self cardAtIndex:index];
    if(!card.isMatched)
    {
        if(card.isChosen)
        {
            card.chosen=NO;
        }
        else
        {
            for(Card* otherCard in self.cards)
            {
                if(otherCard.isChosen && !otherCard.isMatched)
                {
                    int matchscore = [card match:@[otherCard]]*MATCH_BONUS;
                    if(matchscore)
                    {
                        self.score+=matchscore;
                        otherCard.matched = YES;
                        card.matched = YES;
                    }
                    else
                    {
                        self.score-=MISMATCH_PENALTY;
                        otherCard.chosen=NO;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen=YES;
        }
        
    }
    
}
@end
