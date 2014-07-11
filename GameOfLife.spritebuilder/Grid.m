//
//  Grid.m
//  GameOfLife
//
//  Created by Federico Silva on 7/3/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Grid.h"
#import "Creature.h"

// global variables that cannot be changed
static const int GRID_ROWS = 8;
static const int GRID_COLUMNS = 10;

@implementation Grid {
    
    NSMutableArray *_gridArray;
    float _cellWidth;
    float _cellHeight;
    
}

-(void)onEnter{
    [super onEnter];
    
    [self setupGrid];
    
    self.userInteractionEnabled = YES;
    
}

-(void)setupGrid{
    //divide the grid by number of rows and columns to figure out width and height of each cell
    _cellWidth = self.contentSize.width / GRID_COLUMNS;
    _cellHeight = self.contentSize.height / GRID_ROWS;
    
    float x = 0;
    float y = 0;
    
    //initialize array as a blank NSMutableArray
    _gridArray = [NSMutableArray array];
    
    //initialize Creatures
    for (int i = 0; i  < GRID_ROWS; i++){
        _gridArray[i] = [NSMutableArray array];
        x = 0;
        
        for (int j = 0; j < GRID_COLUMNS; j++){
            Creature *creature = [[Creature alloc] initCreature];
            creature.anchorPoint = ccp(0, 0);
            creature.position = ccp(x, y);
            [self addChild:creature];
            
            _gridArray[i][j] = creature;
            
            creature.isAlive = NO;
            
            x += _cellHeight;
        }
        y += _cellWidth;
    }
}

@end
