//
//  PlayingCard.m
//  Machismo
//
//  Created by Ismail Ahmed on 6/17/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;

-(NSString*) contents
{
    NSArray* rankStrings = [PlayingCard rankStrings];
    return [ rankStrings[self.rank] stringByAppendingString : self.suit];
}
-(int)match:(NSArray *)othercards
{
    int matchscore= 0;
    
    if([othercards count]==1)
    {
        PlayingCard* otherCard = [othercards firstObject];
        if( otherCard.rank == self.rank)
            matchscore = 4;
        else if ([otherCard.suit isEqualToString:self.suit])
            matchscore = 1;
    }
    return matchscore;
}
+(NSArray*) validSuits
{
    return @[@"❤️",@"♦",@"♠",@"♣"];
}
+ (NSArray *)rankStrings
{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}
+(NSUInteger) maxRank
{
    return [[PlayingCard rankStrings] count ] -1;
}
-(void) setSuit:(NSString *)suit
{
    if([ [PlayingCard validSuits] containsObject:suit])
        _suit=suit;
}
-(NSString *) suit
{
    return _suit? _suit: @"?";
}
-(void) setRank:(NSUInteger)rank
{
    if(rank <= [PlayingCard maxRank])
        _rank=rank;
}
@end
