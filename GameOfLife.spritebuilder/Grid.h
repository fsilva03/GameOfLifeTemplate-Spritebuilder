//
//  Grid.h
//  GameOfLife
//
//  Created by Federico Silva on 7/3/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCSprite.h"

@interface Grid : CCSprite

@property (nonatomic, assign) int totalAlive;
@property (nonatomic, assign) int generation;

-(void)onEnter;
-(void)setupGrid;
-(void)evolveStep;
-(void)countNeighbors;
-(void)updateCreatures;


@end
