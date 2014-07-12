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
            
            
            x += _cellHeight;
        }
        y += _cellWidth;
    }
}

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    
    CGPoint touchLocation = [touch locationInNode:self];
    
    Creature *creature = [self creatureForTouchPosition:touchLocation];
    
    creature.isAlive = !creature.isAlive;
    
}

- (Creature *)creatureForTouchPosition:(CGPoint)touchPosition {
    int row = touchPosition.y / _cellHeight;
    int column = touchPosition.x / _cellWidth;
    
    return _gridArray[row][column];
    

}

-(void)evolveStep {
    
    [self countNeighbors];
    
    [self updateCreatures];
    
    _generation++;
    
}

-(void)countNeighbors {
    
    for (int i = 0; i < [_gridArray count]; i++) {
        for (int j = 0; j <[_gridArray[i] count]; j++) {    //iterates through whole grid
            Creature *currentCreature = _gridArray[i][j];   //instance of Creature at each cell
            
            currentCreature.livingNeighbors = 0;            //sets neighbors to 0
            
            for (int x = (i-1); x <= (i+1); x++) {
                for (int y = (j-1); y <= (j+1); y++) {      //iterate through 9 cells adjoined
                    
                    BOOL isIndexValid;
                    isIndexValid = [self isIndexValidForX:x andY:y]; //checks for valid locations.
                                                                     //(not outside due to sides).
                    if (!((x == i) && (y == j)) && isIndexValid){    //if it's not same or invalid
                        Creature *neighbor = _gridArray[x][y];       //instance of Creature to pinpoint
                        if (neighbor.isAlive) {                      //a neighboring cell
                            currentCreature.livingNeighbors += 1;    //if alive, add to count.
                        }
                    }
                }
            }
        }
    }
}

-(BOOL)isIndexValidForX:(int) x andY:(int) y {
    BOOL isIndexValid = YES;
    if (x < 0 || y < 0 || y >= GRID_COLUMNS || x >= GRID_ROWS) {
        isIndexValid = NO;
    }
    return isIndexValid;
}

-(void)updateCreatures {
    int numAlive = 0;
    for (int i = 0; i < [_gridArray count]; i++){
        for (int j = 0; j < [_gridArray[i] count]; j++){
            Creature *evolve = _gridArray[i][j];
            
            if ( evolve.livingNeighbors == 3) {
                evolve.isAlive = YES;
                numAlive += 1;
            }
            else {
                if (evolve.livingNeighbors <=1 || evolve.livingNeighbors >=4){
                    evolve.IsAlive = NO;
                }
            }
        }
    }
    _totalAlive = numAlive;
    
}





@end
