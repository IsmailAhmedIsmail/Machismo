//
//  Card.h
//  Machismo
//
//  Created by Ismail Ahmed on 6/17/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong,nonatomic) NSString* contents;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

-(int) match: (NSArray*) othercards;

@end
