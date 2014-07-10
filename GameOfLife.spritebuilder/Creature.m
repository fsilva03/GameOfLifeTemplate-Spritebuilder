//
//  Creature.m
//  GameOfLife
//
//  Created by Federico Silva on 7/3/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Creature.h"

@implementation Creature

-(instancetype)initCreature {
    // since we made Creature inherit from CCSprite, super (below) refers to CCSprite
    self = [super initWithImageNamed:@"GameOfLifeAssets/Assets/bubble.png"];
    
    if (self) {
        self.isAlive = NO;
        
    }
    return self;
}

-(void)setIsAlive:(BOOL)newState {
    
    _isAlive = newState;
    
    //'visible' is a property of any class that inherits from CCNode. CCSprite is a subclass from CCNode. ...
    
    self.visible = _isAlive;
}


@end
