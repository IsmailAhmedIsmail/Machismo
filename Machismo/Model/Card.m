//
//  Card.m
//  Machismo
//
//  Created by Ismail Ahmed on 6/17/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

#import "Card.h"

@interface Card()
@end

@implementation Card

-(int) match:(NSArray *)othercards
{
    int score = 0;
    for( Card* card in othercards)
    {
        if([card.contents isEqualToString: self.contents] )
            score = 1;
    }
    return score;
}

@end
