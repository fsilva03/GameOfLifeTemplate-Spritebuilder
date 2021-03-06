//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"
#import "Grid.h"

@implementation MainScene {

    Grid *_grid;
    CCTimer *_timer;
    CCLabelTTF *_populationLabel;
    CCLabelTTF *_generationLabel;
    
}

-(id)init {
    self = [super init];
    
    if (self){
        _timer = [[CCTimer alloc] init];
    }
    
    return self;
    
}

-(void)play {
    
    [self schedule:@selector(step) interval:0.1f];
    
}

-(void)pause {
    [self unschedule:@selector(step)];
}

-(void)step {
    
    [_grid evolveStep];
    _generationLabel.string = [NSString stringWithFormat:@"%d", _grid.generation];
    _populationLabel.string = [NSString stringWithFormat:@"%d", _grid.totalAlive];
    
    
}








@end
