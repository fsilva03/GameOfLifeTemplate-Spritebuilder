//
//  Creature.h
//  GameOfLife
//
//  Created by Federico Silva on 7/3/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCSprite.h"

@interface Creature : CCSprite

// stores the current state of the creature
@property (nonatomic, assign) BOOL isAlive;

// stores the number of living organisms around it
@property (nonatomic, assign) NSInteger livingNeighbors;

-(id)initCreature;



@end